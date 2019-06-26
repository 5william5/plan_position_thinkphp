<?php
namespace app\index\validate;
use think\Validate;

class UserValidate extends Validate
{
    protected $rule =   [
        'id'        => 'require|number',
        'account'   => 'require|unique:User|alphaNum|min:6|max:20',
        'name'      => 'require|unique:User|chsAlphaNum|min:2|max:20',		
		'phone'     => 'require|number|length:11',
		//'group_id'  => 'require|number',
		'status'    => 'require|in:0,1',
		'password'  => ['require','min'=>6,'regex'=>'^[a-zA-Z0-9~!@#$%^&*]+$'],
		'__token__' => 'require|token'
		
    ];
    
    protected $message  =   [
        'id.require'       => '不能没有ID',
        'id.number'        => 'ID应为数字',
        'account.require'  => '登陆帐号不能为空',
        'account.unique'   => '登陆帐号已使用', 
		'account.alphaNum' => '登陆帐号只能是字母加数字组合',
		'account.min'      => '登陆帐号必须大于6个字符', 
		'account.max'      => '登陆帐号最多20个字符', 
		'name.require'     => '用户名不能为空',
		'name.unique'      => '用户名不能重复',
		'name.chsAlphaNum' => '用户名只能是中文加字母加数字组合',
		'name.min'         => '用户名必须大于2个字符',
		'name.max'         => '用户名必须最多20个字符',
		'phone.require'    => '电话不能为空',
		'phone.number'     => '电话必须是数字',
		'phone.length'     => '电话必须是11位',
		//'group_id.require' => '角色不能为空',
		//'group_id.number'  => '角色ID必须是数字',
		'status.require'   => '状态不能为空',
		'status.in'        => '状态只能是0或1',
		'password.require' => '密码不能为空', 
		'password.min'     => '密码不能少于6个字符',
		'password.regex'   => '密码只能使用字母和数字加~!@#$%^&*',
		'__token__.require'=> '缺少验证字段',
		'__token__.token'  => '非正常操作，刷新后再试'
    ];
	
	protected $scene = [
        'addUser'        =>  ['account','name','phone','status','password','__token__'],
		'editUser'       =>  ['id','account','name','phone','status','__token__'],
		'statusChange'   =>  ['id','status'],
		'passwordChange' =>  ['id','password','__token__'],
		//'setPassword'    =>  ['password'],
		'deleUser'       =>  ['id']
    ];
    
}