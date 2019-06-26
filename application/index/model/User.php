<?php
namespace app\index\model;
use think\Model;
class User extends Model
{
	public function group()
    {
    	
    	return $this->hasMany('AuthGroupAccess','uid');
    }
}