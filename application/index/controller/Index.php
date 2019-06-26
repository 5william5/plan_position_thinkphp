<?php
namespace app\index\controller;
use app\index\controller\Base;
class Index extends Base
{
    public function index()
    {
        $this->isLogin();
		if(ismobile())
		{
			return $this -> fetch('index_m');
		}else
		{
			return $this -> fetch();
		}
    }
	
	
}
