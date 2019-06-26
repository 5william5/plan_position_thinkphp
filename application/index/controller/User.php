<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use app\index\model\User as UserModel;
use app\index\model\AuthGroupAccess;
use app\index\model\AuthGroup;
use think\auth\Auth;
use think\Session;

class User extends Base
{	
	protected $beforeActionList = [
        'isLogin'=>['except'=>'login,checklogin'],//不执行的方法名要小写
		'isCall' =>['except'=>'login,checklogin,logout,setpassword']
    ];
	
	//判断是否有对本控制器的访问权限
	protected function isCall()
	{
		$menuAuth = 'menu-1-0';
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
	//登陆界面
    public function login()
    {
        $this->alreadyLogin();
		return $this -> fetch();
    }
	//验证登陆
	public function checkLogin(Request $request)
	{
		$status=0;
		$result='';
		$data=$request -> param();
		$rule=[
			'account|登录帐号'=>'require',
			'password|密码'=>'require',
			'vercode|验证码'=>'require|captcha',
		];
		$msg=[
			'account'=>['require'=>'登陆帐号不能为空'],
			'password'=>['require'=>'密码不能为空'],
			'vercode'=>[
				'require'=>'验证码不能为空',
				'captcha'=>'验证码错误'
			],
		];
		$result=$this->validate($data,$rule,$msg);
		if($result===true){
			$map=[
				'account'=>$data['account'],
				'password'=>md5($data['password']),
			];
			$user=UserModel::get($map);
			if($user==null){
				$result='用户名或密码错误';
			}else if($user['status']==0)
			{
				$result='该帐号已停用';
			}else if($user['status']==1)
			{
				$status=1;
				$result='验证通过';
				Session::set('user_id',$user->id);
				Session::set('user_info',$user->getData());
			}
		}
		return ['status'=>$status,'message'=>$result];
	}
	//退出登陆
    public function logout()
    {
        Session::delete('user_id');
		Session::delete('user_info');
		$this->success('注销登录','user/login');
    }
	//用户自己设置密码
	public function SetPassword(Request $request)
    {
		$status=0;
		$result='';
		//$oldPassword = $request->param('oldPassword');
		//$newPassword = $request->param('newPassword');
		$password = $request->param();
		$uid = $request->session('user_id');
		$user=UserModel::get($uid);
		$rule=[
			'newPassword|新密码'=>['require','min'=>6,'regex'=>'^[a-zA-Z0-9~!@#$%^&*]+$']
		];
		$msg=[
			'newPassword'=>['require'=>'新密码不能为空',
							'min'=>'密码不能少于6个字符',
							'regex'=>'密码只能使用字母和数字加~!@#$%^&*'
							]
		];
		if(md5($password['oldPassword']) != $user['password'])
		{
			return ['status'=>0,'message'=>'原始密码错误'];
		}else
		{
			$result=$this->validate($password,$rule,$msg);
			if($result===true){
				$user->password = md5($password['newPassword']);
				if($user->save()===false){
					$status = 0;
					$result ='修改失败';
				}else
				{
					$status = 1;
					$result ='修改成功';
					Session::delete('user_id');
					Session::delete('user_info');
				}
			}
			return ['status'=>$status,'message'=>$result];
		}
    }
	//***用户管理页面***//
	//用户管理页面
	public function UserList()
	{
		$groupList = AuthGroup::all();
		$token = $this->request->token(); //表单令牌
		$this->assign('groupList', $groupList);
		$this->assign('token', $token);//表单令牌
		return $this -> fetch();
	}
	//用户列表数据
	public function UserListData(Request $request)
	{	//接收到的请求页码和每页条数
		$page = $request->param('page');
		$limit = $request->param('limit');
		//处理返回的数据
		$cuont = UserModel::count();
		$userLsit = UserModel::with('group')->field('password',true)->order('id desc')->page($page,$limit)->select();
		$data = collection($userLsit)->hidden(['group.uid'])->toArray();
		return ['code'=>'0','msg'=>'','count'=>$cuont,'data'=>$data];
	}
	//添加新用户
	public function AddUser(Request $request)
	{
		
		$status = 0;
		$result='';
		$addUserData = $request->param();
		//调用验证器验证
		$result=$this->validate($addUserData,'UserValidate.addUser');
		if($result===true){
			$userM = new UserModel;
			$userM->data([
				'account'  => $addUserData['account'],
				'name'  => $addUserData['name'],
				'phone'  => $addUserData['phone'],
				//'group_id'  => $addUserData['group_id'],
				'status'  => $addUserData['status'],
				'password'  => md5($addUserData['password']),
			]);
			if(!empty($userM->save())){
				$status = 1;
				$result ='添加用户成功';
			}else
			{
				$status = 0;
				$result ='添加用户失败';
			}
		}
		$this->request->token();
		return ['status'=>$status,'message'=>$result];
		
	}
	//更改用户信息，不包含密码
	public function EditUser(Request $request)
	{
		
		$status = 0;
		$result='';
		$editUserData = $request->param();
		if($editUserData['id'] !=1)
		{
			$result=$this->validate($editUserData,'UserValidate.editUser');
			if($result===true){
				$userM = UserModel::get($editUserData['id']);
				$userM->data([
					//'account'  => $editUserData['account'],
					'name'  => $editUserData['name'],
					'phone'  => $editUserData['phone'],
					//'group_id'  => $editUserData['group_id'],
					'status'  => $editUserData['status'],
				]);
				if(!empty($userM->save())){
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
		}else
		{
			return ['status'=>0,'message'=>'不允许编辑超级管理员'];
		}
		
	}
	//设置角色
	public function SetAuth(Request $request)
	{
		
		$status = 0;
		$result='';
		$uid = $request->param('id');
		$authData = $request->param();
		if($uid !=1)
		{
			//接收到的新设置数据处理
			if(array_key_exists('group_id',$authData))
			{
				$poarr = $authData['group_id'];
			}else
			{
				$poarr = [];
			}
			//数据库中保存的老数据处理得到老的角色ID
			$groupAccess = AuthGroupAccess::all(['uid'=>$uid]);
			$sqarr = array_column($groupAccess,'group_id');
			
			$addarr = array_diff($poarr,$sqarr);
			$delarr = array_diff($sqarr,$poarr);
			if(!empty($addarr))
			{
				foreach($addarr as $val)
				{
					$authGroupAccessM = new AuthGroupAccess;
					$authGroupAccessM->data([
						'uid'      =>  $uid,
						'group_id' =>  $val, 
					]);
					$authGroupAccessM->save();
				}
			}
			if(!empty($delarr))
			{
				foreach($delarr as $val)
				{
					$map=[
						'uid'=>$uid,
						'group_id'=>$val,
					];
					$authGroupAccessM = AuthGroupAccess::get($map);
					$authGroupAccessM->delete();
				}	
			}
			//判断执行的过程，感觉设计的不是太合理之后看情况改动
			$status = 1;
			$result ='设置成功';
			return ['status'=>$status,'message'=>$result];
		}else
		{
			return ['status'=>0,'message'=>'不允许编辑超级管理员'];
		}
		
	}
	//用户表启动状态切换 1为启用，0为停用
	public function StatusChange(Request $request)
	{	
		$status = 0;
		$result='';
		
		$stausUserData = $request->param();
		if($stausUserData['id'] !=1)
		{
			$result=$this->validate($stausUserData,'UserValidate.statusChange');
			if($result===true){
				$userM = UserModel::get($stausUserData['id']);
				$userM->status = $stausUserData['status'];
				if($userM->save()===false){
					$status = 0;
					$result ='操作失败';
				}else
				{
					$status = 1;
					$result ='操作成功';
				}
			}
			return ['status'=>$status,'message'=>$result];
		}else
		{
			return ['status'=>0,'message'=>'不允许编辑超级管理员'];
		}
		
	}
	//用户表更改密码
	public function PasswordChange(Request $request)
	{	
		$status = 0;
		$result='';
		$chUserData = $request->param();
		if($chUserData['id'] !=1)
		{
			$result=$this->validate($chUserData,'UserValidate.passwordChange');
			if($result===true){
				$userM = UserModel::get($chUserData['id']);
				$userM->password = md5($chUserData['password']);
				if($userM->save()===false){
					$status = 0;
					$result ='更改失败';
				}else
				{
					$status = 1;
					$result ='更改成功';
				}
			}
			$this->request->token();
			return ['status'=>$status,'message'=>$result];
		}else
		{
			return ['status'=>0,'message'=>'不允许编辑超级管理员'];
		}
		
	}
	//用户表删除用户
	public function DeleUser(Request $request)
	{	
		$status = 0;
		$result='';
		$chUserData = $request->param();
		if($chUserData['id'] !=1)
		{
			$result=$this->validate($chUserData,'UserValidate.deleUser');
			if($result===true){
				$userM = UserModel::get($chUserData['id']);
				if(!empty($userM->delete()))
				{	
					$resultAga = AuthGroupAccess::where('uid','=', $chUserData['id'])->delete();
					$status = 1;
					$result = '删除成功';
					
				}else
				{
					$status = 0;
					$result = '删除失败';
				}
			}
			return ['status'=>$status,'message'=>$result];
		}else
		{
			return ['status'=>0,'message'=>'不允许编辑超级管理员'];
		}
		
	}
	//用户数据表格搜索
	public function UserSearchData(Request $request)
	{	
		//接收到的请求页码和每页条数及各项查询条件
		$page = $request->param('page');
		$limit = $request->param('limit');
		$searchAccount = $request->param('searchAccount');
		$searchName = $request->param('searchName');
		$searchPhone = $request->param('searchPhone');
		//$searchGroupId = $request->param('searchGroupId');
		//生成查询条件
		$map = [];
		if(!empty($searchAccount))
		{
			$map['account'] = ['like','%'.$searchAccount.'%'];
		}
		if(!empty($searchName))
		{
			$map['name'] = ['like','%'.$searchName.'%'];
		}
		if(!empty($searchPhone))
		{
			$map['phone'] = ['=',$searchPhone];
		}
		//if(!empty($searchGroupId))
		//{
		//	$map['group_id'] = ['=',$searchGroupId];
		//}
		
		//用户数据输出
		
		$userCuont = UserModel::with('group')->order('id desc')->where($map)->count();
		$userResult = UserModel::with('group')->order('id desc')->where($map)->page($page,$limit)->select();
		if($userCuont==0)
		{
			return ['code'=>'0','msg'=>'','count'=>$userCuont,'data'=>''];
		}elseif($userCuont>0)
		{
			$orderdata = collection($userResult)->hidden(['cstmr_id','trip'=>['pass'=>['id','order_id','trip_id'],'id','order_id']])->toArray();
			return ['code'=>'0','msg'=>'','count'=>$userCuont,'data'=>$orderdata];
		}
		
		
	}
}
