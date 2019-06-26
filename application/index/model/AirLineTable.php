<?php
namespace app\index\model;
use think\Model;
use traits\model\SoftDelete;


class AirLineTable extends Model
{
	use SoftDelete;
	
	public function planPosition()
    {
    	return $this->hasMany('PlanPosition','air_line_id')
          ->order('departure_date_1 asc');
    }
	public function groupName()
    {
    	return $this->belongsTo('AuthGroup','group_id');
    }
}