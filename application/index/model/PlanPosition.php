<?php
namespace app\index\model;
use think\Model;
use traits\model\SoftDelete;

class PlanPosition extends Model
{
	use SoftDelete;
	
	protected $type = [
		'time_limit' => 'datetime:Y-m-d H:i'
	];
	public function groupName()
    {
    	return $this->belongsTo('AuthGroup','group_id');
    }
	public function reserveRecord()
    {
    	return $this->hasMany('ReserveRecord','plan_position_id')->order('id desc');
    }
	public function airLine()
    {
    	return $this->belongsTo('AirLineTable','air_line_id');
    }
	public function definiteRecord()
    {
    	return $this->hasMany('DefiniteRecord','plan_position_id')->order('id desc');
    }
	public function definitePass()
    {
    	return $this->hasMany('DefinitePassTable','plan_position_id');
    }
}