<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use think\auth\Auth;
use app\index\model\AirportCode;

class PlanBasicData extends Base
{
	protected $beforeActionList = [
        'isLogin',
		'isCall'
    ];
	
	//判断是否有对本控制器的访问权限
	protected function isCall()
	{
		$menuAuth = 'menu-0-2';
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
		return $this -> fetch();
    }
	
	//机场三字码数据表格输出数据
	public function OutreachAirportCodeData(Request $request)
	{	
		//接收到的请求页码和每页条数
		$page = $request->param('page');
		$limit = $request->param('limit');
		//订单数据输出
		$cuont = AirportCode::count();
		$cstmr  = AirportCode::page($page,$limit)->order('id desc')->select();
		//$orderdata = collection($orders)->hidden(['cstmr_id','trip'=>['pass'=>['id','order_id','trip_id'],'id','order_id']])->toArray();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$cstmr];
		
	}
	//****机场三字码数据操作部分****//
	//机场三字码表修改提交
	public function AirportCodeUpdata(Request $request)
	{
		$id = $request->param('id');
		$data = $request->param();
		
		$rule=[
				'code|机场三字码'=>'require|alpha|length:3|unique:airport_code,code,'.$id,
				'airport|机场名称'=>'require|chsDash|max:20|unique:airport_code,airport,'.$id,
				'__token__'   =>'require|token'
		];
		$msg=[
				'code'=>['require'=>'机场三字码不能空',
						 'alpha'  =>'只能是字母',
					     'length' =>'只能是3个字符',
						 'unique' =>'机场三字码重复'
				],
				'airport'=>['require'=>'机场名称不能空',
						    'chsDash'=>'只能是汉字、字母、数字和下划线_及破折号-',
							'max'    =>'最多可以输入20个字符',
							'unique' =>'机场名称重复'
				],
				'__token__' =>['require'=>'缺少验证字段',
							   'token'  =>'非正常操作，刷新后再试'
				]
		];
		
		$result=$this->validate($data,$rule,$msg);
		if($result===true)
		{
			$code = $data['code'];
			$airport = $data['airport'];
			
			$airportCodeM = AirportCode::get($id);
			$airportCodeM->code = $code;
			$airportCodeM->airport = $airport;
			if($airportCodeM->save())
			{
				$this->request->token();
				return ['status'=>1,'message'=>'修改成功'];
			}else
			{
				$this->request->token();
				return ['status'=>0,'message'=>'修改失败'];
			}
		}
		$this->request->token();
		return ['status'=>0,'message'=>$result];
	}
	//机场三字码表删除提交
	public function AirportCodeDelete(Request $request)
	{
		$id = $request->param('id');
		$airportCodeM = AirportCode::get($id);
		if($airportCodeM->delete())
		{
			return ['status'=>1,'message'=>'删除成功'];
		}else
		{
			return ['status'=>0,'message'=>'删除失败'];
		}
	}
	//搜索机场三字码表重载表格
	public function AirportCodeSearch(Request $request)
	{
		//接收到的请求页码和每页条数
		$page = $request->param('page');
		$limit = $request->param('limit');
		$code = $request->param('code');
		$airport = $request->param('airport');
		$map = [];
		if(!empty($code))
		{
			$map['code'] = ['like','%'.$code.'%'];
		}
		if(!empty($airport))
		{
			$map['airport'] = ['like','%'.$airport.'%'];
		}
		//数据输出
		$cuont = AirportCode::where($map)->count();
		$airportCodes  = AirportCode::where($map)->page($page,$limit)->order('id desc')->select();
		//$orderdata = collection($orders)->hidden(['cstmr_id','trip'=>['pass'=>['id','order_id','trip_id'],'id','order_id']])->toArray();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$airportCodes];
		
	}
	//添加机场三字码提交
	public function AirportCodeAdd(Request $request)
	{
		$data = $request->param();
		$rule=[
				'code|机场三字码'=>'require|alpha|length:3|unique:airport_code',
				'airport|机场名称'=>'require|chsDash|max:20|unique:airport_code',
				'__token__'   =>'require|token'
		];
		$msg=[
				'code'=>['require'=>'机场三字码不能空',
						 'alpha'  =>'只能是字母',
					     'length' =>'只能是3个字符',
						 'unique' =>'添加的三字码重复'
				],
				'airport'=>['require'=>'机场名称不能空',
						    'chsDash'=>'只能是汉字、字母、数字和下划线_及破折号-',
							'max'    =>'最多可以输入20个字符',
							'unique' =>'添加的机场名称重复'
				],
				'__token__' =>['require'=>'缺少验证字段',
							   'token'  =>'非正常操作，刷新后再试'
				]
		];
		
		$result=$this->validate($data,$rule,$msg);
		if($result===true)
		{
			$code = $data['code'];
			$airport = $data['airport'];
			$airportCodeM = new AirportCode;
			$airportCodeM->code = $code;
			$airportCodeM->airport = $airport;
			if($airportCodeM->save())
			{
				$this->request->token();
				return ['status'=>1,'message'=>'添加成功'];
			}else
			{
				$this->request->token();
				return ['status'=>0,'message'=>'添加失败'];
			}
		}
		$this->request->token();
		return ['status'=>0,'message'=>$result];
	}
}
