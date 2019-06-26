<?php
namespace app\index\model;
use think\Model;
use traits\model\SoftDelete;

class DefinitePassTable extends Model
{
	use SoftDelete;
	
	public function definiteRecord()
    {
    	return $this->belongsTo('DefiniteRecord','definite_record_id');
    }
}