<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Session;
use think\auth\Auth;

class Base extends Controller
{
    protected function _initialize()
	{
		parent::_initialize();
		define('USER_ID',Session::get('user_id'));
		$this->menuAuth();
	}
	protected function isLogin()
	{
		if(empty(USER_ID)){
			$this->error('请登陆',url('user/login'));
		}
	}
	protected function alreadyLogin()
	{
		if(!empty(USER_ID)){
			$this->error('请勿重复登陆',url('index/index'));
		}
	}
	//空操作
	public function _empty()
    {
		$this->error('没有此页面',url('index/index'));
	}
	//菜单显示权限
	protected function menuAuth()
	{
		$menu = [
			['menuName'=>'计划位管理',
			'url'=>'#',
			'authName'=>'menu-0'
			],
			['menuName'=>'用户角色管理',
			'url'=>'#',
			'authName'=>'menu-1'
			]
		];
		$menu[0]['childMenu'] =[
			['menuName'=>'计划位查看',
			'url'=>url('TeamPlanView/index'),
			'authName'=>'menu-0-0'
			],
			['menuName'=>'本部计划位管理',
			'url'=>url('SelfPlanManage/index'),
			'authName'=>'menu-0-1'
			],
			['menuName'=>'基础数据设置',
			'url'=>url('PlanBasicData/index'),
			'authName'=>'menu-0-2'
			],
			['menuName'=>'计划位高级查看',
			'url'=>url('TeamPlanAdvancedView/index'),
			'authName'=>'menu-0-3'
			],
			['menuName'=>'高级数据操作',
			'url'=>url('PlanAdvanced/index'),
			'authName'=>'menu-0-4'
			]
		];
		$menu[1]['childMenu'] =[
			['menuName'=>'用户管理',
			'url'=>url('user/UserList'),
			'authName'=>'menu-1-0'
			],
			['menuName'=>'角色管理',
			'url'=>url('role/RoleList'),
			'authName'=>'menu-1-1'
			],
		];
		$request = Request::instance();
		$uid = $request->session('user_id');
		if($uid!=1){
			$menuf = array_filter($menu,function($val) use($uid) {$auth = new Auth;return $auth->check($val['authName'],$uid);});
			foreach($menuf as $key=>$cmenu)
			{
				$menuf[$key]['childMenu'] = array_filter($cmenu['childMenu'],function($val) use($uid) {$auth = new Auth;return $auth->check($val['authName'],$uid);});
			}
		}else
		{
			$menuf = $menu;
		}
		$this->assign('menu',$menuf);
	}
	
	
}