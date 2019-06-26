<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use think\auth\Auth;
use app\index\model\AirportCode;
use app\index\model\AirLineTable;
use app\index\model\PlanPosition;


class TeamPlanView extends Base
{
	protected $beforeActionList = [
        'isLogin',
		'isCall'	
    ];
	
	//判断是否有对本控制器的访问权限
	protected function isCall()
	{
		$menuAuth = 'menu-0-0';
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
        
		if(ismobile())
		{
			return $this -> fetch('team_plan_view/mobile/index_m');
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
		//航线数据输出
		$cuont = AirLineTable::count();
		$airLines  = AirLineTable::order('id desc')->page($page,$limit)->select();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$airLines];
		
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
		$airLinesCount  = AirLineTable::where($map)->order('id desc')->count();
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
	//点击航线表格通过航线ID获取计划位表格数据并输出
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
	//***********手机页面**************
	//计划位的列表
	public function PositionListMobile(Request $request)
	{
		$airLineId = $request->param('airLineId');
		$token = $this->request->token(); //表单令牌
		$airLineInfo = AirLineTable::with('groupName')->where('id','=',$airLineId)->find();
		
		$this->assign('token', $token);//表单令牌
		$this->assign('airLineInfo', $airLineInfo);
		return $this -> fetch('team_plan_view/mobile/position_list_m');
	}

}
