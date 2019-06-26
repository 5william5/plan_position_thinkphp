<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use think\auth\Auth;
use app\index\model\AirportCode;
use app\index\model\AuthGroupAccess;
use app\index\model\AirLineTable;
use app\index\model\PlanPosition;
use app\index\model\ReserveRecord;
use app\index\model\DefiniteRecord;
use app\index\model\DefinitePassTable;
use app\index\model\PlanLog;

class SelfPlanManage extends Base
{
	protected $beforeActionList = [
        'isLogin',
		'isCall'	
    ];
	
	//判断是否有对本控制器的访问权限
	protected function isCall()
	{
		$menuAuth = 'menu-0-1';
		$request = Request::instance();
		$uid = $request->session('user_id');
		$auth = new Auth;
		if($uid!=1)
		{
			if(!($auth->check($menuAuth,$uid))){
				$this->error('无访问权限',url('index/index'));
			}
		}
	}
    public function index()
    {
        $token = $this->request->token(); //表单令牌
		$this->assign('token', $token);//表单令牌
		if(ismobile())
		{
			return $this -> fetch('self_plan_manage/mobile/index_m');
		}else
		{
			return $this -> fetch();
		}
    }
	//航线表格输出数据
	public function TeamAirLineData(Request $request)
	{	
		//接收到的请求页码和每页条数
		$page = $request->param('page');
		$limit = $request->param('limit');
		$uid = $request->session('user_id');
		
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		//本部航线数据输出
		$count = AirLineTable::where('group_id', 'in', $groups)->count();
		$airLines  = AirLineTable::where('group_id', 'in', $groups)->order('id desc')->page($page,$limit)->select();
		
		return ['code'=>'0','msg'=>'','count'=>$count,'data'=>$airLines];
		
	}
	//点击航线表格通过航线ID,和第一程的日期获取计划位表格数据并输出
	public function TeamPLanPositionData(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$airLineId = $request->param('airLineId');
		$leftDate = $request->param('leftDate');
		$rightDate = $request->param('rightDate');
		$uid = $request->session('user_id');
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		$map = [];
		$map['group_id'] = ['in',$groups];
		$map['air_line_id'] = ['=',$airLineId];
		if(!empty($leftDate) && !empty($rightDate))
		{
			$map['departure_date_1'] = ['between time',[$leftDate,$rightDate]];
		}
		$cuont = PlanPosition::where($map)->count();
		$plans = PlanPosition::with('airLine,groupName,reserveRecord,definitePass')->where($map)->order('departure_date_1 asc')->page($page,$limit)->select();
		
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$plans];		
	}
	//搜索航线表格重载
	public function TeamAirLineSearchData(Request $request)
	{	
		//接收到的请求页码和每页条数及各项查询条件
		$page = $request->param('page');
		$limit = $request->param('limit');
		$searchAirLine = $request->param('air_line_code');
		$searchMonth = $request->param('month');
		$uid = $request->session('user_id');
		
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		//生成查询条件
		$map = [];
		$map['group_id'] = ['in',$groups];
		if(!empty($searchAirLine))
		{
			$map['air_line_code'] = ['like',$searchAirLine.'%'];
		}
		if(!empty($searchMonth))
		{
			$map['month'] = ['=',$searchMonth];
		}
		
		//数据输出
		$airLinesCount  = AirLineTable::where($map)->count();
		if($airLinesCount==0)
		{
			return ['code'=>'0','msg'=>'','count'=>$airLinesCount,'data'=>''];
		}elseif($airLinesCount>0)
		{
			$airLines = AirLineTable::where($map)->order('id desc')->page($page,$limit)->select();
			//$orderdata = collection($ordersResult)->hidden(['cstmr_id','trip'=>['pass'=>['id','order_id','trip_id'],'id','order_id']])->toArray();
			return ['code'=>'0','msg'=>'','count'=>$airLinesCount,'data'=>$airLines];
		}
			
	}
	//单击新增计划按钮
	public function AddPlanPosition(Request $request)
	{
		$airportCodeData = AirportCode::all();
		$token = $this->request->token(); //表单令牌
		$this->assign('airportCodeData', json_encode($airportCodeData));//机场三字码
		$this->assign('token', $token);//表单令牌
		return $this -> fetch();
	}
	//新增录入保存计划数据
	public function AddPlanData(Request $request)
	{
		$data = $request->param();
		$uid = $request->session('user_id');
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		if( count($groups)==1)
		{
			$resultAirLine = $this->validate($data,'PlanValidate.addAirLineTable');
			if(true !== $resultAirLine)
			{
				$this->request->token();
				// 验证失败 输出错误信息
				return ['status'=>0,'message'=>$resultAirLine];
			}
			else
			{	
				if(empty($data['plan_table']))
				{
					$this->request->token();
					return ['status'=>0,'message'=>'至少提交一个计划'];	
				}
				else
				{
					foreach($data['plan_table'] as $plandata)
					{
						$resultPlan = $this->validate($plandata,'PlanValidate.addPlanPositionTable');
						if(true !== $resultPlan)
						{
							$this->request->token();
							return ['status'=>0,'message'=>$resultPlan];
						}
					}
					
					$AirLineTableModel = new AirLineTable;
					$AirLineTableModel->startTrans();//开启事务
					//关于事务特别说明  commit()， 经过个人测试，没有执行到提交事务发生错误，那在开启事务到提交事务中间的有关数据的写入都没有执行，关于事务的理解目前还有的模糊
					try
					{
						//AirLineTable字段对应数据
						$AirLineTableModel->data([
							'air_line_code'   => $data['air_line_code'],
							'air_line_text'   => $data['air_line_text'],
							'flight'          => $data['flight'],
							//'air_time'        => $data['air_time'],
							'differ_days'     => $data['differ_days'],
							'month'           => $data['month'],
							'manager'         => empty($data['manager'])?'':$data['manager'],
							'group_id'        => $groups[0],
						]);
						$AirLineTableModel->save();//写入数据
						$planLogM = new PlanLog;
						$planLogM->data([
							'air_line_id'  => $AirLineTableModel['id'],
							'type'         => 'air_line',
							'action'       =>  'add',
							'submiter'     =>  $request->session('user_info.name'),
							'create_time'  =>  date("Y-m-d H:i:s", time()),
						]);
						$planLogM->save();
						//循环行程数据
						foreach($data['plan_table'] as $planData)
						{
							$PlanPositionModel = new PlanPosition;
							//PlanPosition字段对应数据
							$PlanPositionModel->data([
								'air_line_id'        => $AirLineTableModel->id,
								'policy_state'       => null,
								'departure_date_1'   => $planData['departure_date_1'],
								'departure_date_2'   => empty($planData['departure_date_2'])?null:$planData['departure_date_2'],
								'departure_date_3'   => empty($planData['departure_date_3'])?null:$planData['departure_date_3'],
								'departure_date_4'   => empty($planData['departure_date_4'])?null:$planData['departure_date_4'],
								'air_time'           => $planData['air_time'],
								'seat_number'        => $planData['seat_number'],
								'selling_price'      => $planData['selling_price'],
								'reserve_price'      => $planData['reserve_price'],
								'time_limit'         => $planData['time_limit'],   
								'group_id'           => $groups[0],
							]);
							$PlanPositionModel->save();//写入数据	
							$planLogM = new PlanLog;
							$planLogM->data([
								'air_line_id'        => $PlanPositionModel['air_line_id'],
								'plan_position_id'   => $PlanPositionModel['id'],
								'type'               => 'plan_position',
								'action'             =>  'add',
								'submiter'           =>  $request->session('user_info.name'),
								'create_time'        =>  date("Y-m-d H:i:s", time()),
							]);
							$planLogM->save();
						}
						$AirLineTableModel->commit();//提交事务
						$this->request->token();
						return ['status'=>1,'message'=>'提交成功'];
							
					}catch (\Exception $e) //发生错误
					{
						$AirLineTableModel->rollback();//回滚
						$this->request->token();
						return ['status'=>0,'message'=>'提交失败'];
					}
				}
			}
		}else
		{
			$this->request->token();
			return ['status'=>0,'message'=>'当前用户在多个部分或者没有部门'];	
		}
	}
	//修改编辑航线信息页面
	public function EditAirLineInfo(Request $request)
	{
		$airLineId = $request->param('id');
		$airportCodeData = AirportCode::all();
		$token = $this->request->token(); //表单令牌
		$airLineData = AirLineTable::get($airLineId);
		
		$this->assign('airportCodeData', json_encode($airportCodeData));//机场三字码
		$this->assign('token', $token);//表单令牌
		$this->assign('airLineData', $airLineData);
		return $this -> fetch();
	}
	//修改保存航线信息
	public function EditAirLineData(Request $request)
	{
		$status = 0;
		$result='';
		$airLineData = $request->param();
		$airLineId = $airLineData['airLineId'];
		$uid = $request->session('user_id');
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		
		$resultAirLine = $this->validate($airLineData,'PlanValidate.addAirLineTable');
		if(true !== $resultAirLine)
		{
			$this->request->token();
			// 验证失败 输出错误信息
			return ['status'=>0,'message'=>$resultAirLine];
		}
		else
		{
			$airLineM = AirLineTable::get($airLineId);
			if($airLineM->group_id==$groups[0])
			{
				unset($airLineData['airLineId']);
				unset($airLineData['__token__']);
				$airLineM->startTrans();//开启事务
				//关于事务特别说明  commit()， 经过个人测试，没有执行到提交事务发生错误，那在开启事务到提交事务中间的有关数据的写入都没有执行，关于事务的理解目前还有的模糊
				try
				{
					$diffInfo = array_diff_assoc($airLineData,$airLineM->toArray());
					foreach($diffInfo as $k => $v){
						$planLogM = new PlanLog;
						$planLogM->data([
							'air_line_id'  => $airLineM['id'],
							'type'         => 'air_line',
							'action'       => 'updata',
							'action_field' => $k,
							'before_value' => $airLineM[$k],
							'after_value'  => $v,
							'submiter'     => $request->session('user_info.name'),
							'create_time'  => date("Y-m-d H:i:s", time()),
						]);
						$planLogM->save();
					}
					//AirLineTable字段对应数据
					$airLineM->data([
						'air_line_code'   => $airLineData['air_line_code'],
						'air_line_text'   => $airLineData['air_line_text'],
						'flight'          => $airLineData['flight'],
						'differ_days'     => $airLineData['differ_days'],
						'month'           => $airLineData['month'],
						'manager'         => empty($airLineData['manager'])?'':$airLineData['manager']
					]);
					$airLineM->save();//写入数据
					$airLineM->commit();//提交事务
					$this->request->token();
					return ['status'=>1,'message'=>'保存成功'];
						
				}catch (\Exception $e) //发生错误
				{
					$airLineM->rollback();//回滚
					$this->request->token();
					return ['status'=>0,'message'=>'保存失败'];
				}
			}else
			{
				$status = 0;
				$result ='不是创建部门';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//查询当前航线信息，给当前航线下增加计划位使用
	public function GetAirLineInfo(Request $request)
	{
		$status = 0;
		$result='';
		$airLineId = $request->param('airLineId');
		$airLineM = AirLineTable::get($airLineId);
		if(!empty($airLineM))
		{
			return ['status'=>1,'message'=>'查询成功','data'=>$airLineM];
		}else
		{
			return ['status'=>0,'message'=>'查询失败','data'=>$airLineM];
		}
	}
	//当前航线新增计划位提交数据
	public function AddThatAirLinePlanData(Request $request)
	{
		$status = 0;
		$result='';
		$addPlanData = $request->param();
		$uid = $request->session('user_id');
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		$result=$this->validate($addPlanData,'PlanValidate.editPlanPostion');
		if($result===true)
		{
			$airLineM = AirLineTable::get($addPlanData['airLineId']);
			if($airLineM->group_id==$groups[0])
			{
				$planPositionM = new PlanPosition;
				$planPositionM->startTrans();
				try{
					$planPositionM->data([
						'air_line_id'       => $addPlanData['airLineId'],
						'departure_date_1'  => $addPlanData['departure_date_1'],
						'departure_date_2'  => empty($addPlanData['departure_date_2'])?null:$addPlanData['departure_date_2'],
						'departure_date_3'  => empty($addPlanData['departure_date_3'])?null:$addPlanData['departure_date_3'],
						'departure_date_4'	=> empty($addPlanData['departure_date_4'])?null:$addPlanData['departure_date_4'],
						'air_time'          => $addPlanData['air_time'],
						'seat_number'       => $addPlanData['seat_number'],
						'selling_price'     => $addPlanData['selling_price'],
						'reserve_price'     => $addPlanData['reserve_price'],
						'time_limit'        => $addPlanData['time_limit'],
						'group_id'          => $groups[0],
					]);
					$planPositionM->save();
					$planLogM = new PlanLog;
					$planLogM->data([
						'air_line_id'        => $planPositionM['air_line_id'],
						'plan_position_id'   => $planPositionM['id'],
						'type'               => 'plan_position',
						'action'             => 'add',
						'submiter'           => $request->session('user_info.name'),
						'create_time'        => date("Y-m-d H:i:s", time()),
					]);
					$planLogM->save();	
					$planPositionM->commit();
					$status = 1;
					$result ='提交成功';
				}catch (\Exception $e)
				{
					$planPositionM->rollback();
					$status = 0;
					$result ='提交失败';
				}
			}else
			{
				$status = 0;
				$result ='不是创建部门';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
	}
	//删除航线记录
	public function DeleAirLineData(Request $request)
	{
		$status = 0;
		$result='';
		$airLineData = $request->param();
		$uid = $request->session('user_id');
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		$airLineM = AirLineTable::get($airLineData['id']);
		if($airLineM->group_id==$groups[0])
		{
			$planLogM = new PlanLog;
			$planLogM->startTrans();
			try
			{
				$airLineM->delete();
				$planPositionM = PlanPosition::where('air_line_id','=',$airLineData['id'])->column('id');
				DefinitePassTable::where('plan_position_id','in',$planPositionM)->update(['delete_time'=>time()]);
				DefiniteRecord::where('plan_position_id','in',$planPositionM)->update(['delete_time'=>time()]);
				ReserveRecord::where('plan_position_id','in',$planPositionM)->update(['delete_time'=>time()]);
				PlanPosition::where('air_line_id','=',$airLineData['id'])->update(['delete_time'=>time()]);
				$planLogM->data([
					'air_line_id' =>  $airLineData['id'],
					'type'        =>  'air_line',
					'action'      =>  'delete',
					'submiter'    =>  $request->session('user_info.name'),
					'create_time' =>  date("Y-m-d H:i:s", time()),
				]);
				$planLogM->save();
				$planLogM->commit();
				$status = 1;
				$result = '删除成功';
			}catch(\Exception $e)
			{
				$planLogM->rollback();
				$status = 0;
				$result = '删除失败';
			}
		}else
		{
			$status = 0;
			$result ='不是创建部门';
		}
		
		return ['status'=>$status,'message'=>$result];
	}
	//编辑保存计划位数据
	public function EditPlanData(Request $request)
	{
		$status = 0;
		$result='';
		$editPlanData = $request->param();
		$uid = $request->session('user_id');
		$groups = AuthGroupAccess::where('uid','=',$uid)->column('group_id');
		
		$result=$this->validate($editPlanData,'PlanValidate.editPlanPostion');
		if($result===true)
		{
			$planPositionM = PlanPosition::get($editPlanData['id']);
			if($planPositionM->group_id==$groups[0])
			{
				unset($editPlanData['id']);
				unset($editPlanData['__token__']);
				$planPositionM->startTrans();
				try
				{
					$diffInfo = array_diff_assoc($editPlanData,$planPositionM->toArray());
					foreach($diffInfo as $k => $v){
						$planLogM = new PlanLog;
						$planLogM->data([
							'air_line_id'        => $planPositionM['air_line_id'],
							'plan_position_id'   => $planPositionM['id'],
							'type'               => 'plan_position',
							'action'             => 'updata',
							'action_field'       => $k,
							'before_value'       => $planPositionM[$k],
							'after_value'        => $v,
							'submiter'           => $request->session('user_info.name'),
							'create_time'        => date("Y-m-d H:i:s", time()),
						]);
						$planLogM->save();
					}
					$planPositionM->data([
						'departure_date_1'  => $editPlanData['departure_date_1'],
						'departure_date_2'  => empty($editPlanData['departure_date_2'])?null:$editPlanData['departure_date_2'],
						'departure_date_3'  => empty($editPlanData['departure_date_3'])?null:$editPlanData['departure_date_3'],
						'departure_date_4'	=> empty($editPlanData['departure_date_4'])?null:$editPlanData['departure_date_4'],
						'air_time'          => $editPlanData['air_time'],
						'seat_number'       => $editPlanData['seat_number'],
						'selling_price'     => $editPlanData['selling_price'],
						'reserve_price'     => $editPlanData['reserve_price'],
						'time_limit'        => $editPlanData['time_limit'],
						'policy_state'      => $editPlanData['policy_state'],
					]);
					$planPositionM->save();
					$planPositionM->commit();
					$status = 1;
					$result ='编辑成功';
					
				}catch (\Exception $e)
				{
					$planPositionM->rollback();
					$status = 0;
					$result ='编辑失败';
				}
			}else
			{
				$status = 0;
				$result ='不是创建部门';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//删除计划位，验证当前计划下没有其他数据时才执行删除
	public function DeleVerifyPlanPositionData(Request $request)
	{
		$status = 0;
		$result='';
		$planPositionData = $request->param();
		
		$ReserveRecordRes = ReserveRecord::where('plan_position_id','=',$planPositionData['id'])->count();
		$DefiniteRecordRes = DefiniteRecord::where('plan_position_id','=',$planPositionData['id'])->count();
		$DefinitePassTableRes = DefinitePassTable::withTrashed()->where('plan_position_id','=',$planPositionData['id'])->count();
		if($ReserveRecordRes==0 && $DefiniteRecordRes==0 && $DefinitePassTableRes==0){
			$planPositionM = PlanPosition::get($planPositionData['id']);
			$planPositionM->startTrans();
			try
			{
				$planLogM = new PlanLog;
				$planLogM->data([
					'air_line_id'       =>  $planPositionM['air_line_id'],
					'plan_position_id'  =>  $planPositionM['id'],
					'type'              =>  'plan_position',
					'action'            =>  'delete',
					'submiter'          =>  $request->session('user_info.name'),
					'create_time'       =>  date("Y-m-d H:i:s", time()),
				]);
				$planLogM->save();
				$planPositionM->delete();
				$planPositionM->commit();
				$status = 1;
				$result = '删除成功';
			}catch(\Exception $e)
			{
				$planPositionM->rollback();
				$status = 0;
				$result = '删除失败';
			}
		}else
		{
			$status = 0;
			$result = '数据有变化，删除失败，请刷新页面后重试';	
		}
		return ['status'=>$status,'message'=>$result];
	}
	//删除计划位，包含当前计划下所有数据
	public function DelePlanPositionData(Request $request)
	{
		$status = 0;
		$result='';
		$planPositionData = $request->param();
		$planPositionM = PlanPosition::get($planPositionData['id']);
		$planPositionM->startTrans();
		try
		{
			$planLogM = new PlanLog;
			$planLogM->data([
				'air_line_id'       =>  $planPositionM['air_line_id'],
				'plan_position_id'  =>  $planPositionM['id'],
				'type'              =>  'plan_position',
				'action'            =>  'delete',
				'submiter'          =>  $request->session('user_info.name'),
				'create_time'       =>  date("Y-m-d H:i:s", time()),
			]);
			$planLogM->save();
			ReserveRecord::where('plan_position_id','=',$planPositionData['id'])->update(['delete_time'=>time()]);
			DefiniteRecord::where('plan_position_id','=',$planPositionData['id'])->update(['delete_time'=>time()]);
			DefinitePassTable::where('plan_position_id','=',$planPositionData['id'])->update(['delete_time'=>time()]);
			$planPositionM->delete();
			$planPositionM->commit();
			$status = 1;
			$result = '删除成功';
		}catch(\Exception $e)
		{
			$planPositionM->rollback();
			$status = 0;
			$result = '删除失败';
		}
		return ['status'=>$status,'message'=>$result];
	}
	
	//双击计划位表格开启记录管理页面
	public function RecordMange(Request $request)
	{
		$planPositionId = $request->param('id');
		$planPositionInfo = PlanPosition::with(['airLine','reserveRecord','definiteRecord'=>['definitePassList']])->where('id','=',$planPositionId)->find();
		$token = $this->request->token(); //表单令牌
		
		$this->assign('planPositionInfo', $planPositionInfo);
		$this->assign('token', $token);//表单令牌
		return $this -> fetch();
	}
	//点击操作记录查看页面根据air_line_id显示
	public function LogViewAirLine(Request $request)
	{
		$airLineId = $request->param('id');
		$airLineData = AirLineTable::get($airLineId);
		$planLogData = PlanLog::where('air_line_id','=',$airLineId)->order('id', 'desc')->select();
		
		$this->assign('airLineData', $airLineData);
		$this->assign('planLogData', $planLogData);
		return $this -> fetch();
	}
	//点击操作记录查看页面根据plan_position_id显示
	public function LogViewPlanPosition(Request $request)
	{
		$planPositionId = $request->param('id');
		$planLogData = PlanLog::where('plan_position_id','=',$planPositionId)->order('id', 'desc')->select();
		
		$this->assign('planLogData', $planLogData);
		return $this -> fetch();
	}
	//********计划位留位记录管理************
	//留位记录数据输出，通过plan_position_id获取
	public function ReserveRecordData(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$planPositionId = $request->param('planPositionId');
		
		$cuont = ReserveRecord::where('plan_position_id', '=', $planPositionId)->count();
		$reserveRecords = ReserveRecord::where('plan_position_id','=',$planPositionId)->order('id desc')->page($page,$limit)->select();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$reserveRecords];
	}
	//新增留位记录
	public function AddReserveRecordData(Request $request)
	{
		$status = 0;
		$result='';
		$reserveRecordData = $request->param();
		
		$result=$this->validate($reserveRecordData,'PlanValidate.addReserveRecord');
		if($result===true)
		{
			
			$planLogM = new PlanLog;
			$planLogM->startTrans();
			try
			{
				
				$reserveRecordModel = new ReserveRecord;
				$reserveRecordModel->data([
					'plan_position_id'  => $reserveRecordData['plan_position_id'],
					'title'             => $reserveRecordData['title'],
					'quantity'          => $reserveRecordData['quantity'],
					'create_time'       => date("Y-m-d H:i:s", time()),
					'submitter'         => $request->session('user_info.name'),
				]);
				$reserveRecordModel->save();
				
				$planLogM->data([
					'air_line_id'       =>  $reserveRecordModel['plan_position_info']['air_line_id'],
					'plan_position_id'  =>  $reserveRecordModel['plan_position_id'],
					'reserve_record_id' =>  $reserveRecordModel['id'],
					'type'              =>  'reserve_record',
					'action'            =>  'add',
					'submiter'          =>  $request->session('user_info.name'),
					'create_time'       =>  date("Y-m-d H:i:s", time()),
				]);
				$planLogM->save();
				$planLogM->commit();
				//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
				$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$reserveRecordData['plan_position_id'])->sum('quantity');
				$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$reserveRecordData['plan_position_id'])->count();
				$this->request->token();
				return ['status'=>1,'message'=>'新增成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
			}catch(\Exception $e)
			{
				$planLogM->rollback();
				$status = 0;
				$result ='新增失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
	}
	//修改留位记录
	public function editReserveRecordData(Request $request)
	{
		$status = 0;
		$result='';
		$reserveRecordData = $request->param();
		
		$result=$this->validate($reserveRecordData,'PlanValidate.addReserveRecord');
		if($result===true){
			$reserveRecordM = ReserveRecord::get($reserveRecordData['id']);
			unset($reserveRecordData['__token__']);
			unset($reserveRecordData['id']);
			$reserveRecordM->startTrans();
			try
			{
				$diffInfo = array_diff_assoc($reserveRecordData,$reserveRecordM->toArray());
				foreach($diffInfo as $k => $v){
					$planLogM = new PlanLog;
					$planLogM->data([
						'air_line_id'       =>  $reserveRecordM['plan_position_info']['air_line_id'],
						'plan_position_id'  =>  $reserveRecordM['plan_position_id'],
						'reserve_record_id' =>  $reserveRecordM['id'],
						'type'              => 'reserve_record',
						'action'            => 'updata',
						'action_field'      => $k,
						'before_value'      => $reserveRecordM[$k],
						'after_value'       => $v,
						'submiter'          => $request->session('user_info.name'),
						'create_time'       => date("Y-m-d H:i:s", time()),
					]);
					$planLogM->save();
				}	
				$planPositonID = $reserveRecordM['plan_position_id'];
				$reserveRecordM->data([
					'title'             => $reserveRecordData['title'],
					'quantity'          => $reserveRecordData['quantity'],
					'create_time'       => date("Y-m-d H:i:s", time()),
					'submitter'         => $request->session('user_info.name'),
				]);
				$reserveRecordM->save();
				$reserveRecordM->commit();
				//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
				$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$planPositonID)->sum('quantity');
				$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$planPositonID)->count();
				$this->request->token();
				return ['status'=>1,'message'=>'修改成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
			}catch(\Exception $e)
			{
				$reserveRecordM->rollback();
				$status = 0;
				$result ='修改失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
	}
	//删除留位记录
	public function DeleReserveRecordData(Request $request)
	{
		$status = 0;
		$result='';
		$reserveRecordData = $request->param();
		$reserveRecordM = ReserveRecord::get($reserveRecordData['id']);
		$planPositonID = $reserveRecordM['plan_position_id'];
		$reserveRecordM->startTrans();
		try
		{
			$planLogM = new PlanLog;
			$planLogM->data([
				'air_line_id'       =>  $reserveRecordM['plan_position_info']['air_line_id'],
				'plan_position_id'  =>  $reserveRecordM['plan_position_id'],
				'reserve_record_id' =>  $reserveRecordM['id'],
				'type'              =>  'reserve_record',
				'action'            =>  'delete',
				'submiter'          =>  $request->session('user_info.name'),
				'create_time'       =>  date("Y-m-d H:i:s", time()),
			]);
			$planLogM->save();
			$reserveRecordM->delete();
			$reserveRecordM->commit();
			//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
			$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$planPositonID)->sum('quantity');
			$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$planPositonID)->count();
			return ['status'=>1,'message'=>'删除成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
		}catch(\Exception $e)
		{
			$reserveRecordM->rollback();
			$status = 0;
			$result = '删除失败';
		}
		return ['status'=>$status,'message'=>$result];
	}
	//********计划位有名单的占位记录管理************
	//有名单占位记录数据输出，通过plan_position_id获取
	public function DefiniteRecordData(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$planPositionId = $request->param('planPositionId');
		
		$cuont = DefiniteRecord::where('plan_position_id', '=', $planPositionId)->count();
		$definiteRecords = DefiniteRecord::with('definitePassList')->where('plan_position_id','=',$planPositionId)->order('id desc')->page($page,$limit)->select();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$definiteRecords];
	}
	
	//新增有名单留位名称记录
	public function AddDefiniteRecordData(Request $request)
	{
		$status = 0;
		$result='';
		$definiteRecordData = $request->param();
		
		$result=$this->validate($definiteRecordData,'PlanValidate.addDefiniteRecord');
		if($result===true){
			
			$planLogM = new PlanLog;
			$planLogM->startTrans();
			try
			{
				$definiteRecordModel = new DefiniteRecord;
				$definiteRecordModel->data([
					'plan_position_id'  => $definiteRecordData['plan_position_id'],
					'title'             => $definiteRecordData['title'],
					'create_time'       => date("Y-m-d H:i:s", time()),
					'submitter'         => $request->session('user_info.name'),
				]);
				$definiteRecordModel->save();
				
				$planLogM->data([
					'air_line_id'       =>  $definiteRecordModel['plan_position_info']['air_line_id'],
					'plan_position_id'  =>  $definiteRecordModel['plan_position_id'],
					'definite_record_id'=>  $definiteRecordModel['id'],
					'type'              =>  'definite_record',
					'action'            =>  'add',
					'submiter'          =>  $request->session('user_info.name'),
					'create_time'       =>  date("Y-m-d H:i:s", time()),
				]);
				$planLogM->save();
				$planLogM->commit();
				$this->request->token();
				return ['status'=>1,'message'=>'新增成功'];
			}catch(\Exception $e)
			{
				$planLogM->rollback();
				$status = 0;
				$result ='新增失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
	}
	//修改有名单留位名称记录
	public function editDefiniteRecordData(Request $request)
	{
		$status = 0;
		$result='';
		$definiteRecordData = $request->param();
		
		$result=$this->validate($definiteRecordData,'PlanValidate.addDefiniteRecord');
		if($result===true){
			$definiteRecordM = DefiniteRecord::get($definiteRecordData['id']);
			unset($definiteRecordData['__token__']);
			unset($definiteRecordData['id']);
			$definiteRecordM->startTrans();
			try
			{
				$diffInfo = array_diff_assoc($definiteRecordData,$definiteRecordM->toArray());
				foreach($diffInfo as $k => $v){
					$planLogM = new PlanLog;
					$planLogM->data([
						'air_line_id'       =>  $definiteRecordM['plan_position_info']['air_line_id'],
						'plan_position_id'  =>  $definiteRecordM['plan_position_id'],
						'definite_record_id'=>  $definiteRecordM['id'],
						'type'              => 'definite_record',
						'action'            => 'updata',
						'action_field'      => $k,
						'before_value'      => $definiteRecordM[$k],
						'after_value'       => $v,
						'submiter'          => $request->session('user_info.name'),
						'create_time'       => date("Y-m-d H:i:s", time()),
					]);
					$planLogM->save();
				}	
				
				$definiteRecordM->data([
					'title'             => $definiteRecordData['title'],
					'create_time'       => date("Y-m-d H:i:s", time()),
					'submitter'         => $request->session('user_info.name'),
				]);
				$definiteRecordM->save();
				$definiteRecordM->commit();
				$this->request->token();
				return ['status'=>1,'message'=>'修改成功'];
			}catch(\Exception $e)
			{
				$definiteRecordM->rollback();
				$status = 0;
				$result ='修改失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
	}
	//删除有名单留位名称记录
	public function DeleDefiniteRecordData(Request $request)
	{
		$status = 0;
		$result='';
		$definiteRecordData = $request->param();
		$definiteRecordM = DefiniteRecord::get($definiteRecordData['id']);
		$planPositonID = $definiteRecordM['plan_position_id'];
		$definiteRecordM->startTrans();
		try
		{
			$planLogM = new PlanLog;
			$planLogM->data([
				'air_line_id'       =>  $definiteRecordM['plan_position_info']['air_line_id'],
				'plan_position_id'  =>  $definiteRecordM['plan_position_id'],
				'definite_record_id'=>  $definiteRecordM['id'],
				'type'              =>  'definite_record',
				'action'            =>  'delete',
				'submiter'          =>  $request->session('user_info.name'),
				'create_time'       =>  date("Y-m-d H:i:s", time()),
			]);
			$planLogM->save();
			DefinitePassTable::where('definite_record_id','=',$definiteRecordData['id'])->update(['delete_time'=>time()]);
			$definiteRecordM->delete();
			$definiteRecordM->commit();
			
			//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
			$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$planPositonID)->sum('quantity');
			$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$planPositonID)->count();
			return ['status'=>1,'message'=>'删除成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
		}catch (\Exception $e)
		{
			$definiteRecordM->rollback();
			$status = 0;
			$result = '删除失败';
		}
		return ['status'=>$status,'message'=>$result];
	}
	//名单数据输出根据plan——position_id获取
	public function FullDefinitePassData(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$planPositionId = $request->param('planPositionId');
		
		$cuont = DefinitePassTable::where('plan_position_id', '=', $planPositionId)->count();
		$definitePassList = DefinitePassTable::with('definiteRecord')->where('plan_position_id','=',$planPositionId)->order('id asc')->page($page,$limit)->select();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$definitePassList];
	}
	//批量填写票号,plan_position下每个记录中的操作，按照plan_position查询记录并操作
	public function PlAddFullDefiniteTicketData(Request $request)
	{
		$status = 0;
		$result='';
		$definiteTicketData = $request->param();
		
		$result=$this->validate($definiteTicketData,'PlanValidate.token');
		if($result===true)
		{
			foreach($definiteTicketData['data'] as $ticketInfo)
			{
				$resultList=$this->validate($ticketInfo,'PlanValidate.plAddDefiniteTicket');
				if($resultList!==true)
				{
					$this->request->token();
					return ['status'=>0,'message'=>$resultList];
				}
			}
			$planPositonId = $definiteTicketData['id'];
			$definiteTicketList = $definiteTicketData['data'];
			$definitePassHasV =  DefinitePassTable::where('plan_position_id','=',$planPositonId)->where('pass_name','in',array_column($definiteTicketList, 'pass_name'))->column('pass_name');
			if(count($definiteTicketList)<=count($definitePassHasV))
			{
				$unique_arr = array_unique($definitePassHasV);
				$repeat_arr = array_diff_assoc($definitePassHasV,$unique_arr);
				if(count($repeat_arr)==0){
					try
					{
						foreach($definiteTicketList as $ticketU)
						{
							
							$definiteTicketAddM = DefinitePassTable::where('plan_position_id','=',$planPositonId)->where('pass_name','=',$ticketU['pass_name'])->find();
							$planLogM = new PlanLog;
							$planLogM->data([
								'air_line_id'       =>  $definiteTicketAddM['definite_record']['plan_position_info']['air_line_id'],
								'plan_position_id'  =>  $definiteTicketAddM['plan_position_id'],
								'definite_record_id'=>  $definiteTicketAddM['definite_record_id'],
								'definite_pass_id'  =>  $definiteTicketAddM['id'],
								'type'              => 'definite_pass',
								'action'            => 'updata',
								'action_field'      => 'ticket_number',
								'before_value'      => $definiteTicketAddM['ticket_number'],
								'after_value'       => $ticketU['ticket_number'],
								'submiter'          => $request->session('user_info.name'),
								'create_time'       => date("Y-m-d H:i:s", time()),
							]);
							$planLogM->save();
							$definiteTicketAddM->data([
								'ticket_number'    =>  $ticketU['ticket_number']
							]);
							$definiteTicketAddM->save();
							
						}
						
						$this->request->token();
						return ['status'=>1,'message'=>'提交成功'];
					}catch(\Exception $e)
					{
						$this->request->token();
						return ['status'=>0,'message'=>'提交失败'];
					}
				}elseif(count($repeat_arr)>0)
				{
					$this->request->token();
					return ['status'=>0,'message'=>'提交失败,“'.implode('，',$repeat_arr).'”是重名，请单独提交'];
				}
			}elseif(count($definiteTicketList)>count($definitePassHasV))
			{
				$noName_arr = array_diff(array_column($definiteTicketList,'pass_name'),$definitePassHasV);
				$this->request->token();
				return ['status'=>0,'message'=>'提交失败,“'.implode('，',$noName_arr).'”无此名单，请检查'];
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//名单数据输出根据plan——position_id获取,用于导出Excel
	public function DefinitePassExcel(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$planPositionId = $request->param('planPositionId');

		$definitePassList = DefinitePassTable::with('definiteRecord')->where('plan_position_id','=',$planPositionId)->order('id asc')->page($page,$limit)->select();
		if(!empty($definitePassList)){
			return ['status'=>1,'message'=>'成功','data'=>$definitePassList];
		}else{
			return ['status'=>0,'message'=>'无信息'];
		}
	}
	//********计划位有名单的占位乘机人信息管理************
	//名单数据输出
	public function DefinitePassData(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$definiteRecordId = $request->param('definiteRecordId');
		
		$cuont = DefinitePassTable::where('definite_record_id', '=', $definiteRecordId)->count();
		$definitePassList = DefinitePassTable::where('definite_record_id','=',$definiteRecordId)->order('id asc')->page($page,$limit)->select();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$definitePassList];
	}
	//软删除的名单数据输出
	public function SoftDeleDefinitePassData(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$definiteRecordId = $request->param('definiteRecordId');
		
		$cuont = DefinitePassTable::onlyTrashed()->where('definite_record_id', '=', $definiteRecordId)->count();
		$definitePassList = DefinitePassTable::onlyTrashed()->where('definite_record_id','=',$definiteRecordId)->order('id asc')->page($page,$limit)->select();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$definitePassList];
	}
	//批量新增名单，查询有名字的就会提示重复，没有名字的就会新建信息，包含名字和证件号码，不含票号
	public function PlAddDefinitePassData(Request $request)
	{
		$status = 0;
		$result='';
		$definitePassData = $request->param();
		
		$result=$this->validate($definitePassData,'PlanValidate.token');
		if($result===true)
		{
			foreach($definitePassData['data'] as $passInfo)
			{
				$resultList=$this->validate($passInfo,'PlanValidate.plAddDefinitePass');
				if($resultList!==true)
				{
					$this->request->token();
					return ['status'=>0,'message'=>$resultList];
				}
			}
			$definiteRecordId = $definitePassData['id'];
			$planPositonId = $definitePassData['planPositonId'];
			$definitePassList = $definitePassData['data'];
			$definitePassHasV =  DefinitePassTable::where('definite_record_id','=',$definiteRecordId)->where('pass_name','in',array_column($definitePassList, 'pass_name'))->find();
			if($definitePassHasV==null){
				try
				{
					foreach($definitePassList as $passU)
					{
						
						$definitePassAddM = new DefinitePassTable;
						$definitePassAddM->data([
							'definite_record_id' =>  $definiteRecordId,
							'plan_position_id'   =>  $planPositonId,
							'pass_name'          =>  $passU['pass_name'],
							'pass_id'            =>  $passU['pass_id']
						]);
						$definitePassAddM->save();
						$planLogM = new PlanLog;
						$planLogM->data([
							'air_line_id'       =>  $definitePassAddM['definite_record']['plan_position_info']['air_line_id'],
							'plan_position_id'  =>  $definitePassAddM['plan_position_id'],
							'definite_record_id'=>  $definitePassAddM['definite_record_id'],
							'definite_pass_id'  =>  $definitePassAddM['id'],
							'type'              => 'definite_pass',
							'action'            => 'add',
							'submiter'          => $request->session('user_info.name'),
							'create_time'       => date("Y-m-d H:i:s", time()),
						]);
						$planLogM->save();
						
					}
					//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
					$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$planPositonId)->sum('quantity');
					$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$planPositonId)->count();
					$this->request->token();
					return ['status'=>1,'message'=>'提交成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
				}catch(\Exception $e)
				{
					$this->request->token();
					return ['status'=>0,'message'=>'提交失败'];
				}
			}else
			{
				$this->request->token();
				return ['status'=>0,'message'=>'提交失败,“'.$definitePassHasV['pass_name'].'”重名了，请单独提交'];
			}
			
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//批量填写票号,definite_record下每个记录中的操作，按照definite_record_id查询记录并操作
	public function PlAddDefiniteTicketData(Request $request)
	{
		$status = 0;
		$result='';
		$definiteTicketData = $request->param();
		
		$result=$this->validate($definiteTicketData,'PlanValidate.token');
		if($result===true)
		{
			foreach($definiteTicketData['data'] as $ticketInfo)
			{
				$resultList=$this->validate($ticketInfo,'PlanValidate.plAddDefiniteTicket');
				if($resultList!==true)
				{
					$this->request->token();
					return ['status'=>0,'message'=>$resultList];
				}
			}
			$definiteRecordId = $definiteTicketData['id'];
			$definiteTicketList = $definiteTicketData['data'];
			$definitePassHasV =  DefinitePassTable::where('definite_record_id','=',$definiteRecordId)->where('pass_name','in',array_column($definiteTicketList, 'pass_name'))->column('pass_name');
			if(count($definiteTicketList)<=count($definitePassHasV))
			{
				$unique_arr = array_unique($definitePassHasV);
				$repeat_arr = array_diff_assoc($definitePassHasV,$unique_arr);
				if(count($repeat_arr)==0){
					try
					{
						foreach($definiteTicketList as $ticketU)
						{
							
							$definiteTicketAddM = DefinitePassTable::where('definite_record_id','=',$definiteRecordId)->where('pass_name','=',$ticketU['pass_name'])->find();
							$planLogM = new PlanLog;
							$planLogM->data([
								'air_line_id'       =>  $definiteTicketAddM['definite_record']['plan_position_info']['air_line_id'],
								'plan_position_id'  =>  $definiteTicketAddM['plan_position_id'],
								'definite_record_id'=>  $definiteTicketAddM['definite_record_id'],
								'definite_pass_id'  =>  $definiteTicketAddM['id'],
								'type'              => 'definite_pass',
								'action'            => 'updata',
								'action_field'      => 'ticket_number',
								'before_value'      => $definiteTicketAddM['ticket_number'],
								'after_value'       => $ticketU['ticket_number'],
								'submiter'          => $request->session('user_info.name'),
								'create_time'       => date("Y-m-d H:i:s", time()),
							]);
							$planLogM->save();
							$definiteTicketAddM->data([
								'ticket_number'    =>  $ticketU['ticket_number']
							]);
							$definiteTicketAddM->save();
							
						}
						
						$this->request->token();
						return ['status'=>1,'message'=>'提交成功'];
					}catch(\Exception $e)
					{
						$this->request->token();
						return ['status'=>0,'message'=>'提交失败'];
					}
				}elseif(count($repeat_arr)>0)
				{
					$this->request->token();
					return ['status'=>0,'message'=>'提交失败,“'.implode('，',$repeat_arr).'”是重名，请单独提交'];
				}
			}elseif(count($definiteTicketList)>count($definitePassHasV))
			{
				$noName_arr = array_diff(array_column($definiteTicketList,'pass_name'),$definitePassHasV);
				$this->request->token();
				return ['status'=>0,'message'=>'提交失败,“'.implode('，',$noName_arr).'”无此名单，请检查'];
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//根据definite_record_id输出名单数据
	public function OutDefinitePassData(Request $request)
	{
		$status = 0;
		$result='';
		$definiteRecordId = $request->param('id');
		$passData = DefinitePassTable::where('definite_record_id','=',$definiteRecordId)->select();
		if(!empty($passData))
		{
			return ['status'=>1,'message'=>'获取成功','data'=>$passData];
		}else
		{
			return ['status'=>0,'message'=>'无信息'];
		}
		
	}
	//新增单个旅客信息，包含名字，证件号，票号
	public function AddSingleDefinitePassData(Request $request)
	{
		$status = 0;
		$result='';
		$definitePassData = $request->param();
		$result=$this->validate($definitePassData,'PlanValidate.singleDefinitePass');
		if($result===true)
		{
			$planLogM = new PlanLog;
			$planLogM->startTrans();
			try
			{
				$definitePassAddM = new DefinitePassTable;
				$definitePassAddM->data([
					'definite_record_id' =>  $definitePassData['definite_record_id'],
					'plan_position_id'   =>  $definitePassData['plan_position_id'],
					'pass_name'          =>  $definitePassData['pass_name'],
					'pass_id'            =>  $definitePassData['pass_id'],
					'ticket_number'      =>  empty($definitePassData['ticket_number'])?null:$definitePassData['ticket_number']
				]);
				$definitePassAddM->save();
				$planLogM->data([
					'air_line_id'       =>  $definitePassAddM['definite_record']['plan_position_info']['air_line_id'],
					'plan_position_id'  =>  $definitePassAddM['plan_position_id'],
					'definite_record_id'=>  $definitePassAddM['definite_record_id'],
					'definite_pass_id'  =>  $definitePassAddM['id'],
					'type'              => 'definite_pass',
					'action'            => 'add',
					'submiter'          => $request->session('user_info.name'),
					'create_time'       => date("Y-m-d H:i:s", time()),
				]);
				$planLogM->save();
				$planLogM->commit();
				//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
				$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$definitePassData['plan_position_id'])->sum('quantity');
				$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$definitePassData['plan_position_id'])->count();
				$this->request->token();
				return ['status'=>1,'message'=>'提交成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
			}catch(\Exception $e)
			{
				$planLogM->rollback();
				$this->request->token();
				return ['status'=>0,'message'=>'提交失败'];
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
	}
	//修改有名单记录
	public function editDefinitePassData(Request $request)
	{
		$status = 0;
		$result='';
		$definitePassData = $request->param();
		
		$result=$this->validate($definitePassData,'PlanValidate.singleDefinitePass');
		if($result===true){
			$definitePassM = DefinitePassTable::get($definitePassData['id']);
			$planPositonID = $definitePassM['plan_position_id'];
			unset($definitePassData['__token__']);
			unset($definitePassData['id']);
			$definitePassM->startTrans();
			try
			{
				$diffInfo = array_diff_assoc($definitePassData,$definitePassM->toArray());
				foreach($diffInfo as $k => $v){
					$planLogM = new PlanLog;
					$planLogM->data([
						'air_line_id'       =>  $definitePassM['definite_record']['plan_position_info']['air_line_id'],
						'plan_position_id'  =>  $definitePassM['plan_position_id'],
						'definite_record_id'=>  $definitePassM['definite_record_id'],
						'definite_pass_id'  =>  $definitePassM['id'],
						'type'              => 'definite_pass',
						'action'            => 'updata',
						'action_field'      => $k,
						'before_value'      => $definitePassM[$k],
						'after_value'       => $v,
						'submiter'          => $request->session('user_info.name'),
						'create_time'       => date("Y-m-d H:i:s", time()),
					]);
					$planLogM->save();
				}	
				$definitePassM->data([
					'pass_name'       => $definitePassData['pass_name'],
					'pass_id'         => $definitePassData['pass_id'],
					'ticket_number'   => empty($definitePassData['ticket_number'])?null:$definitePassData['ticket_number']
				]);
				$definitePassM->save();
				$definitePassM->commit();
				//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
				$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$planPositonID)->sum('quantity');
				$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$planPositonID)->count();
				$this->request->token();
				return ['status'=>1,'message'=>'修改成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
			}catch (\Exception $e)
			{
				$definitePassM->rollback();
				$status = 0;
				$result ='修改失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//删除有名单记录
	public function DeleDefinitePassData(Request $request)
	{
		$status = 0;
		$result='';
		$definitePassData = $request->param();
		$definitePassM = DefinitePassTable::get($definitePassData['id']);
		$planPositonID = $definitePassM['plan_position_id'];
		$definitePassM->startTrans();
		try
		{
			$planLogM = new PlanLog;
			$planLogM->data([
				'air_line_id'       =>  $definitePassM['definite_record']['plan_position_info']['air_line_id'],
				'plan_position_id'  =>  $definitePassM['plan_position_id'],
				'definite_record_id'=>  $definitePassM['definite_record_id'],
				'definite_pass_id'  =>  $definitePassM['id'],
				'type'              => 'definite_pass',
				'action'            => 'delete',
				'submiter'          =>  $request->session('user_info.name'),
				'create_time'       =>  date("Y-m-d H:i:s", time()),
			]);
			$planLogM->save();
			$definitePassM->delete();
			$definitePassM->commit();
			//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
			$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$planPositonID)->sum('quantity');
			$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$planPositonID)->count();
			return ['status'=>1,'message'=>'删除成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
		}catch (\Exception $e)
		{
			$definitePassM->rollback();
			$status = 0;
			$result = '删除失败';
		}
		return ['status'=>$status,'message'=>$result];
		
	}
	//永久删除有名单记录，删除软删除的记录
	/*
	public function SoftDeleDeleDefinitePassData(Request $request)
	{
		$status = 0;
		$result='';
		$definitePassData = $request->param();
		$definitePassM = DefinitePassTable::onlyTrashed()->where('id','=',$definitePassData['id'])->find();
		if(!empty($definitePassM->delete(true)))
		{
			
			return ['status'=>1,'message'=>'删除成功'];
		}else
		{
			$status = 0;
			$result = '删除失败';
		}
		
		return ['status'=>$status,'message'=>$result];
		
	}
	*/
	//恢复软删除的有名单记录
	public function SoftDeleRecoveryDefinitePassData(Request $request)
	{
		$status = 0;
		$result='';
		$definitePassData = $request->param();
		$definitePassM = DefinitePassTable::onlyTrashed()->where('id','=',$definitePassData['id'])->find();
		$planPositonID = $definitePassM['plan_position_id'];
		$planLogM = new PlanLog;
		$planLogM->startTrans();
		try
		{
			
			$planLogM->data([
				'air_line_id'       =>  $definitePassM['definite_record']['plan_position_info']['air_line_id'],
				'plan_position_id'  =>  $definitePassM['plan_position_id'],
				'definite_record_id'=>  $definitePassM['definite_record_id'],
				'definite_pass_id'  =>  $definitePassM['id'],
				'type'              => 'definite_pass',
				'action'            => 'recovery',
				'submiter'          =>  $request->session('user_info.name'),
				'create_time'       =>  date("Y-m-d H:i:s", time()),
			]);
			$definitePassM->data([
				'delete_time'   => null
			]);
			$definitePassM->save();
			$planLogM->save();
			$planLogM->commit();
			//查询ReserveRecord表及DefinitePassTable中满足plan_position_id的数据用于更新页面显示
			$reserveSeatNum = ReserveRecord::where('plan_position_id','=',$planPositonID)->sum('quantity');
			$definiteSeatNum = DefinitePassTable::where('plan_position_id','=',$planPositonID)->count();
			return ['status'=>1,'message'=>'恢复成功','quantityZ'=>$reserveSeatNum+$definiteSeatNum];
		}catch(\Exception $e)
		{
			$planLogM->rollback();
			$status = 0;
			$result = '恢复失败';
		}
		return ['status'=>$status,'message'=>$result];
		
	}
	//***********手机页面**************
	//计划位的列表
	public function PositionListMobile(Request $request)
	{
		$airLineId = $request->param('airLineId');
		$token = $this->request->token(); //表单令牌
		$airLineInfo = AirLineTable::with('groupName')->where('id','=',$airLineId)->find();
		
		$this->assign('token', $token);//表单令牌
		$this->assign('airLineInfo', $airLineInfo);
		return $this -> fetch('self_plan_manage/mobile/position_list_m');
	}
	//新增计划页面（整月计划）
	public function AddPlanPositionMobile(Request $request)
	{
		$airportCodeData = AirportCode::all();
		$token = $this->request->token(); //表单令牌
		$this->assign('airportCodeData', json_encode($airportCodeData));//机场三字码
		$this->assign('token', $token);//表单令牌
		return $this -> fetch('self_plan_manage/mobile/add_plan_position_m');
	}
	//修改编辑航线信息页面
	public function EditAirLineInfoMobile(Request $request)
	{
		$airLineId = $request->param('id');
		$airportCodeData = AirportCode::all();
		$token = $this->request->token(); //表单令牌
		$airLineData = AirLineTable::get($airLineId);
		
		$this->assign('airportCodeData', json_encode($airportCodeData));//机场三字码
		$this->assign('token', $token);//表单令牌
		$this->assign('airLineData', $airLineData);
		return $this -> fetch('self_plan_manage/mobile/edit_air_line_info_m');
	}
	//新增计划位页面（当前航线）
	public function AddThatPlanPositionMobile(Request $request)
	{
		$airLineId = $request->param('id');
		$token = $this->request->token(); //表单令牌
		$airLineInfo = AirLineTable::with('groupName')->where('id','=',$airLineId)->find();
		
		$this->assign('token', $token);//表单令牌
		$this->assign('airLineInfo', $airLineInfo);
		
		return $this -> fetch('self_plan_manage/mobile/add_that_position_m');
		
	}
	//计划位详情页面
	public function PositionDetailsMobile(Request $request)
	{
		$planPositionId = $request->param('planPositionId');
		$token = $this->request->token(); //表单令牌
		$planPositionInfo = PlanPosition::with('airLine,reserveRecord,definiteRecord')->where('id','=',$planPositionId)->find();
		
		$this->assign('token', $token);//表单令牌
		$this->assign('planPositionInfo', $planPositionInfo);
		return $this -> fetch('self_plan_manage/mobile/position_details_m');
	}
	//修改计划位信息页面
	public function EditThatPlanPositionMobile(Request $request)
	{
		$planPositionId = $request->param('id');
		$token = $this->request->token(); //表单令牌
		$planPositionInfo = PlanPosition::with('airLine,reserveRecord,definiteRecord')->where('id','=',$planPositionId)->find();
		$this->assign('token', $token);//表单令牌
		$this->assign('planPositionInfo', $planPositionInfo);
		return $this -> fetch('self_plan_manage/mobile/edit_that_position_m');
	}
	//有名单留位页面（乘机人信息）
	public function DefinitePassMobile(Request $request)
	{
		$definiteId = $request->param('definiteId');
		$token = $this->request->token(); //表单令牌
		$definiteInfo = DefiniteRecord::with('definitePassList')->where('id','=',$definiteId)->find();
		$passSoftInfo = DefinitePassTable::onlyTrashed()->where('definite_record_id','=',$definiteId)->order('id asc')->select();
		
		$this->assign('token', $token);//表单令牌
		$this->assign('definiteInfo', $definiteInfo);
		$this->assign('passSoftInfo', $passSoftInfo);
		return $this -> fetch('self_plan_manage/mobile/definite_pass_m');
	}
	//点击操作记录查看页面根据plan_position_id显示 手机页面
	public function LogViewPlanPositionMobile(Request $request)
	{
		$planPositionId = $request->param('id');
		$planLogData = PlanLog::where('plan_position_id','=',$planPositionId)->order('id', 'desc')->select();
		
		$this->assign('planLogData', $planLogData);
		return $this -> fetch('self_plan_manage/mobile/log_view_plan_position_m');
	}
}
