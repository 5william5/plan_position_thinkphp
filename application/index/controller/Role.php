<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use think\auth\Auth;
use app\index\model\User as UserModel;
use app\index\model\AuthGroup;
use app\index\model\AuthRule;
use think\Session;

class Role extends Base
{	

	protected $beforeActionList = [
        'isLogin',
		'isCall'	
    ];
	
	//判断是否有对本控制器的访问权限
	protected function isCall()
	{
		$menuAuth = 'menu-1-1';
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
	//角色管理页面
	public function RoleList()
	{
		$groupList = AuthGroup::all();
		$token = $this->request->token(); //表单令牌
		$this->assign('groupList', $groupList);
		$this->assign('token', $token);//表单令牌
		return $this -> fetch();
	}
    
	//角色列表数据
	public function RoleListData(Request $request)
	{	//接收到的请求页码和每页条数
		$page = $request->param('page');
		$limit = $request->param('limit');
		//处理返回的数据
		$cuont = AuthGroup::count();
		$roleLsit = AuthGroup::order('id desc')->page($page,$limit)->select();
		
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$roleLsit];
	}
	//添加新角色
	public function AddRole(Request $request)
	{
		$status = 0;
		$result='';
		$addRoleData = $request->param();
		$rule=[
			'title|角色名'       => 'require|chsDash|min:2',
			'status|启用状态'    => 'require|in:0,1',
			'__token__'          =>'require|token'
		];
		$msg=[
			'title'      => ['require'=>'角色名不能为空','chsDash'=>'角色名只能使用中文、英文、数字及下划线','min'=>'角色名不能少于2个字符'],
			'status'     => ['require'=>'启用状态不能为空','in'=>'启用状态只能是0或1'],
			'__token__'  =>['require'=>'缺少验证字段',
								 'token'  =>'非正常操作，刷新后再试'
				]
		];
		$result=$this->validate($addRoleData,$rule,$msg);
		if($result===true){
			$groupM = new AuthGroup;
			$groupM->data([
				'title'  => $addRoleData['title'],
				'status'  => $addRoleData['status'],
			]);
			if(!empty($groupM->save())){
				$status = 1;
				$result ='添加角色成功';
			}else
			{
				$status = 0;
				$result ='添加角色失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//更改角色信息
	public function EditRole(Request $request)
	{
		
		$status = 0;
		$result='';
		$editRoleData = $request->param();
		$rule=[
			'id|角色ID'          => 'require|number',
			'title|角色名'       => 'require|chsDash|min:2',
			'status|启用状态'    => 'require|in:0,1',
			'__token__'          =>'require|token'
		];
		$msg=[
			'id'         => ['require'=>'角色ID不能为空','number'=>'角色ID只能是数字'],
			'title'      => ['require'=>'角色名不能为空','chsDash'=>'角色名只能使用中文、英文、数字及下划线','min'=>'角色名不能少于2个字符'],
			'status'     => ['require'=>'启用状态不能为空','in'=>'启用状态只能是0或1'],
			'__token__'  => ['require'=>'缺少验证字段','token'  =>'非正常操作，刷新后再试']
		];
		$result=$this->validate($editRoleData,$rule,$msg);
		if($result===true){
			$groupM = AuthGroup::get($editRoleData['id']);
			$groupM->data([
				'title'  => $editRoleData['title'],
				'status'  => $editRoleData['status'],
			]);
			if(!empty($groupM->save())){
				$status = 1;
				$result ='编辑用户成功';
			}else
			{
				$status = 0;
				$result ='编辑用户失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//用户表启动状态切换 1为启用，0为停用
	public function StatusChange(Request $request)
	{	
		$status = 0;
		$result='';
		
		$stausRoleData = $request->param();
		$rule=[
			'id|角色ID'          => 'require|number',
			'status|启用状态'    => 'require|in:0,1',
		];
		$msg=[
			'id'     => ['require'=>'角色ID不能为空','number'=>'角色ID只能是数字'],
			'status' => ['require'=>'启用状态不能为空','in'=>'启用状态只能是0或1'],
		];
		$result=$this->validate($stausRoleData,$rule,$msg);
		
		if($result===true){
			$RoleM = AuthGroup::get($stausRoleData['id']);
			$RoleM->status = $stausRoleData['status'];
			if($RoleM->save()===false){
				$status = 0;
				$result ='操作失败';
			}else
			{
				$status = 1;
				$result ='操作成功';
			}
		}
		return ['status'=>$status,'message'=>$result];
		
	}
	//用户表删除角色
	public function DeleRole(Request $request)
	{	
		$status = 0;
		$result='';
		$deleRoleData = $request->param();
		$rule=[
			'id|角色ID'   => 'require|number',
		];
		$msg=[
			'id'  => ['require'=>'角色ID不能为空','number'=>'角色ID只能是数字'],
		];
		$result=$this->validate($deleRoleData,$rule,$msg);
		if($result===true){
			$RoleM = AuthGroup::get($deleRoleData['id']);
			if(!empty($RoleM->delete())){
				$status = 1;
				$result = '删除成功';
			}else
			{
				$status = 0;
				$result = '删除失败';
			}
		}
		return ['status'=>$status,'message'=>$result];
		
	}
	//设置权限页面中获取的权限数据
	public function setAuthData(Request $request)
	{
		$status = 0;
		$result='';
		//$id = $request->param('id');//角色ID
		$authList = AuthRule::all();
		return $authList;
		
	}
	//设置权限提交
	public function setAuth(Request $request)
	{
		$status = 0;
		$result='';
		$id = $request->param('id');
		$data = $request->param();
		$rules = implode(',',$data['rules']);
		
		$groupAuth = AuthGroup::get($id);
		$groupAuth->data([
			'rules' =>  $rules
		]);
		if(!empty($groupAuth->save())){
			$status = 1;
			$result ='设置成功';
		}else
		{
			$status = 0;
			$result ='设置失败';
		}
		return ['status'=>$status,'message'=>$result];
	}
}
