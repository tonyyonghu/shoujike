<?php
date_default_timezone_set('PRC'); //设置中国时区 
// system("D:/ruanjian/Python/Python36/python.exe F:/python/myclass/gushiwen.py")
exec("python F:\python\myclass\gushiwen.py",$array,$ret);    echo("result: ");    print_r($array);    echo("return value: ".$ret);

?>