<?php
namespace app\index\model;
use think\Model;

class PlanLog extends Model
{
	
	//关联航线表 包括被软删除的
	public function airLineInfo()
    {
        return $this->belongsTo('AirLineTable','air_line_id')->removeOption('soft_delete');
    }
	//关联计划位表 包括被软删除的
	public function planPositionInfo()
    {
        return $this->belongsTo('PlanPosition','plan_position_id')->removeOption('soft_delete');
    }
    //暂时留位表 包括被软删除的
	public function reserveRecordInfo()
    {
        return $this->belongsTo('ReserveRecord','reserve_record_id')->removeOption('soft_delete');
    }
	 //有名单留位表 包括被软删除的
	public function definiteRecordInfo()
    {
        return $this->belongsTo('DefiniteRecord','definite_record_id')->removeOption('soft_delete');
    }
	 //留位名单表 包括被软删除的
	public function definitePassInfo()
    {
        return $this->belongsTo('DefinitePassTable','definite_pass_id')->removeOption('soft_delete');
    }
	
}