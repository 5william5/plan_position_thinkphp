<?php
namespace app\index\model;
use think\Model;
use traits\model\SoftDelete;

class ReserveRecord extends Model
{
	use SoftDelete;
	public function planPositionInfo()
    {
    	return $this->belongsTo('PlanPosition','plan_position_id');
    }
}