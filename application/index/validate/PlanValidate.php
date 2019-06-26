<?php
namespace app\index\validate;
use think\Validate;

class PlanValidate extends Validate
{
    protected $rule =   [
        'air_line_code'      => 'require|regex:^[\w,]+$|max:24',
        'air_line_text'      => 'require|regex:[^<>\s]+$|max:30',		
		'flight'             => 'require|regex:[^<>\s]+$|max:50',
		'air_time'           => 'require|regex:[^<>\s]+$|max:50',
		'differ_days'        => 'regex:[^<>\s]+$|max:10',
		'month'              => 'require|regex:^\d{4}-\d{2}$|max:7',
		'manager'            => 'max:20|regex:[^<>\s]+$',
		'departure_date_1'   => 'require|date|regex:^\d{4}-\d{2}-\d{2}$',
		'departure_date_2'   => 'date|regex:^\d{4}-\d{2}-\d{2}$',
		'departure_date_3'   => 'date|regex:^\d{4}-\d{2}-\d{2}$',
		'departure_date_4'   => 'date|regex:^\d{4}-\d{2}-\d{2}$',
		'seat_number'        => 'require|number',
		'selling_price'      => 'require|float',
		'reserve_price'      => 'require|float',
		'time_limit'         => 'regex:^20[1-9][0-9]-[0-1][0-9]-[0-3][0-9] [0-2][0-9]:[0-5][0-9]$',
		'title'              => 'require|max:200',
		'quantity'           => 'require|number',
		'pass_name'          => 'require|max:20|regex:/^[a-zA-Z\x{4e00}-\x{9fa5}\\\\\/]+$/u',
		'pass_id'            => 'require|max:18|alphaNum',
		'ticket_number'      => ['regex'=>'^\d{3}-\d{10}$|^\d{13}$'],
		'__token__'          => 'require|token',
		
    ];
    
    protected $message  =   [
        'air_line_code.require'      => '航线三字码必须有',
        'air_line_code.regex'        => '航线三字码有特殊字符',
		'flight.require'             => '航班号必须有',
		'flight.regex'               => '航班号有特殊字符',
		'air_time.require'           => '起飞时间必须有',
		'air_time.regex'             => '起飞时间有特殊字符',
		'differ_days.require'        => '天数必须有',
		'differ_days.regex'          => '天数有特殊字符',
		'month.require'              => '月份必须有',
		'month.regex'                => '月份格式错误',
		'manager.max'                => '负责人最多支持20个字符',
		'manager.regex'              => '负责人格式错误',
		'departure_date_1.require'   =>'第一程起飞日期必须有',
		'departure_date_1.date'      =>'第一程起飞日期不是有效日期',
		'departure_date_1.regex'     =>'第一程起飞日期格式错误',
		'departure_date_2.date'      =>'第二程起飞日期不是有效日期',
		'departure_date_2.regex'     =>'第二程起飞日期格式错误',
		'departure_date_3.date'      =>'第三程起飞日期不是有效日期',
		'departure_date_3.regex'     =>'第三程起飞日期格式错误',
		'departure_date_4.date'      =>'第四程起飞日期不是有效日期',
		'departure_date_4.regex'     =>'第四程起飞日期格式错误',
		'seat_number.require'        => '座位数量必须有',
		'seat_number.number'         => '座位数量必须是数字',
		'selling_price.require'      => '最低销售价必须有',
		'selling_price.float'        => '最低销售价格式错误',
		'reserve_price.require'      => '含税底价必须有',
		'reserve_price.float'        => '含税低价格式错误',
		'time_limit'                 => '出票时限格式错误',
		'title.require'              => '名称必须有',
		'title.max'                  => '名称最多200个字符',
		'quantity.require'           => '留位数量必须有',
		'quantity.number'            => '留位数量必须是数字',
		'pass_name.require'          => '乘机人名字必须填写',
		'pass_name.max'              => '名字最大长度20位',
		'pass_name.regex'            => '名字只能是中文英文和\\，/',	
		'pass_id.require'            => '证件号码必须有',
		'pass_id.max'                => '证件号码不能大于18位',
		'pass_id.alphaNum'           => '证件号码只能是英文字母和数字组合',
		'ticket_number.regex'        => '票号格式错误',
		'__token__.require'          => '缺少验证字段',
		'__token__.token'            => '非正常操作，刷新后再试',
    ];
	
	protected $scene = [
        'addAirLineTable'             =>  ['air_line_code','air_line_text','month','manager','flight','differ_days','__token__'],
		'addPlanPositionTable'        =>  ['departure_date_1','departure_date_2','departure_date_3','departure_date_4','air_time','seat_number','selling_price','reserve_price','time_limit'],
		'editPlanPostion'             =>  ['departure_date_1','departure_date_2','departure_date_3','departure_date_4','air_time','seat_number','selling_price','reserve_price','time_limit','__token__'],
		'addReserveRecord'            =>  ['title','quantity','__token__'],
		'plAddDefinitePass'           =>  ['pass_name','pass_id'],
		'plAddDefiniteTicket'         =>  ['pass_name','ticket_number'],
		'singleDefinitePass'          =>  ['pass_name','pass_id','ticket_number','__token__'],
		'addDefiniteRecord'           =>  ['title','__token__'],
		'token'                       =>  ['__token__']
		
    ];
    
}