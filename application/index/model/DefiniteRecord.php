<?php
namespace app\index\model;
use think\Model;
use traits\model\SoftDelete;

class DefiniteRecord extends Model
{
	use SoftDelete;
	
	public function planPositionInfo()
    {
    	return $this->belongsTo('PlanPosition','plan_position_id');
    }
	
	public function definitePassList()
    {
    	return $this->hasMany('DefinitePassTable','definite_record_id');
    }
}