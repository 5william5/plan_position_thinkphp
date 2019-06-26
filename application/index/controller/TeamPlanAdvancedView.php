<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use think\auth\Auth;
use app\index\model\User as UserModel;
use app\index\model\AirportCode;
use app\index\model\AuthGroupAccess;
use app\index\model\AirLineTable;
use app\index\model\PlanPosition;
use app\index\model\ReserveRecord;
use app\index\model\DefiniteRecord;
use app\index\model\DefinitePassTable;
use app\index\model\PlanLog;


class TeamPlanAdvancedView extends Base
{
	protected $beforeActionList = [
        'isLogin',
		'isCall'	
    ];
	
	//判断是否有对本控制器的访问权限
	protected function isCall()
	{
		$menuAuth = 'menu-0-3';
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
			return $this -> fetch('team_plan_advanced_view/mobile/index_m');
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
		
		$cuont = AirLineTable::count();
		$airLines  = AirLineTable::order('id desc')->page($page,$limit)->select();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$airLines];
		
	}
	//点击航线表格通过航线ID,和第一程的日期获取计划位表格数据并输出
	public function TeamPLanPositionData(Request $request)
	{
		$page = $request->param('page');
		$limit = $request->param('limit');
		$airLineId = $request->param('airLineId');
		$leftDate = $request->param('leftDate');
		$rightDate = $request->param('rightDate');
		$map = [];
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
		//生成查询条件
		$map = [];
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
			return ['code'=>'0','msg'=>'','count'=>$airLinesCount,'data'=>$airLines];
		}
			
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
	//***********手机页面**************
	//计划位的列表
	public function PositionListMobile(Request $request)
	{
		$airLineId = $request->param('airLineId');
		$token = $this->request->token(); //表单令牌
		$airLineInfo = AirLineTable::with('groupName')->where('id','=',$airLineId)->find();
		
		$this->assign('token', $token);//表单令牌
		$this->assign('airLineInfo', $airLineInfo);
		return $this -> fetch('team_plan_advanced_view/mobile/position_list_m');
	}
	//计划位详情页面
	public function PositionDetailsMobile(Request $request)
	{
		$planPositionId = $request->param('planPositionId');
		$token = $this->request->token(); //表单令牌
		$planPositionInfo = PlanPosition::with('airLine,reserveRecord,definiteRecord')->where('id','=',$planPositionId)->find();
		
		$this->assign('token', $token);//表单令牌
		$this->assign('planPositionInfo', $planPositionInfo);
		return $this -> fetch('team_plan_advanced_view/mobile/position_details_m');
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
		return $this -> fetch('team_plan_advanced_view/mobile/definite_pass_m');
	}
	//点击操作记录查看页面根据plan_position_id显示 手机页面
	public function LogViewPlanPositionMobile(Request $request)
	{
		$planPositionId = $request->param('id');
		$planLogData = PlanLog::where('plan_position_id','=',$planPositionId)->order('id', 'desc')->select();
		
		$this->assign('planLogData', $planLogData);
		return $this -> fetch('team_plan_advanced_view/mobile/log_view_plan_position_m');
	}
}
