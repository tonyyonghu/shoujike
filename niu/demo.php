<?php
/**
 * Order.php
 * Niushop商城系统 - 团队十年电商经验汇集巨献!
 * =========================================================
 * Copy right 2015-2025 山西牛酷信息科技有限公司, 保留所有权利。
 * ----------------------------------------------
 * 官方网址: http://www.niushop.com.cn
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用。
 * 任何企业和个人不允许对程序代码以任何形式任何目的再发布。
 * =========================================================
 * @author : niuteam
 * @date : 2015.1.17
 * @version : v1.0.0.0
 */
namespace app\admin\controller;

use data\service\Address;
use data\service\Address as AddressService;
use data\service\Config;
use data\service\Express as ExpressService;
use data\service\Ke\OrderGoods;
use data\service\Ke\OrderStatus;
use data\service\Ke as OrderService;
use data\service\Pay\AliPay;
use data\service\Pay\WeiXinPay;
use think\helper\Time;
use think\Db;
// use data\extend\phpexcel_classes\PHPExcel;
/**
 * 订单控制器
 *
 * @author Administrator
 *        
 */
class Ke extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 订单列表
     */
    public function keList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $start_date = request()->post('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('start_date'));
            $end_date = request()->post('end_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('end_date'));
            $xinghao = request()->post('xinghao', '');
            $caizhi = request()->post('caizhi', '');
            $category = (int)request()->post('category', '');
           
            if ($start_date != 0 && $end_date != 0) {
                $condition["ordertime"] = [
                    [
                        ">",
                        $start_date
                    ],
                    [
                        "<",
                        $end_date+86399
                    ]
                ];
            } elseif ($start_date != 0 && $end_date == 0) {
                $condition["ordertime"] = [
                    [
                        ">",
                        $start_date
                    ]
                ];
            } elseif ($start_date == 0 && $end_date != 0) {
                $condition["ordertime"] = [
                    [
                        "<",
                        $end_date+86399
                    ]
                ];
            }
            if (! empty($caizhi)&&$caizhi=="磨砂") {
                $condition['caizhi'] = 1;
            }
            if (! empty($caizhi)&&$caizhi=="玻璃") {
                $condition['caizhi'] = 2;
            }
            if (! empty($xinghao)) {
                $condition['xinghao'] = $xinghao;
            }
            if (! empty($category)) {
                $condition['categoryid'] = $category;
            }


           
            $order_service = new OrderService();
            $list = $order_service->getOrderList($page_index, $page_size, $condition, 'ordertime desc');
            $newlist=array();
            $newlist['total_count']=$list['total_count'];
            $newlist['page_count'] = $list['page_count'];
            $length=count($list['data']);

            $category=Db::table('ns_goods_category')->select();

            for($i=0;$i<$length;$i++){
                $newlist['data'][$i]['id']=$list['data'][$i]['id'];
                $newlist['data'][$i]['xinghao']=$list['data'][$i]['xinghao'];
                $newlist['data'][$i]['num']=$list['data'][$i]['num'];
                $newlist['data'][$i]['caizhi']=$list['data'][$i]['caizhi'];
                $newlist['data'][$i]['price']=$list['data'][$i]['price'];
                $newlist['data'][$i]['chengben']=$list['data'][$i]['chengben'];
                $newlist['data'][$i]['youfei']=$list['data'][$i]['youfei'];
                $newlist['data'][$i]['fenrunprice']=$list['data'][$i]['fenrunprice'];
                $newlist['data'][$i]['lirun']=$list['data'][$i]['lirun'];
                $newlist['data'][$i]['descs']=$list['data'][$i]['descs'];
                $newlist['data'][$i]['ordertime']=date("Y-m-d",$list['data'][$i]['ordertime']);
                $newlist['data'][$i]['ordernum']=$list['data'][$i]['ordernum'];
                $categoryid=$list['data'][$i]['categoryid'];
                $categoryname=Db::name("ns_goods_category")->where("category_id",$categoryid)->column("category_name");
                $newlist['data'][$i]['categoryname']=$categoryname;
            }

            return $newlist;
        } else {
            // $data = array();
            // list ($start, $end) = Time::month();
            // for ($j = 0; $j < ($end + 1 - $start) / 86400; $j ++) {
            //     $date_start = date("Y-m-d H:i:s", $start + 86400 * $j);
            //     $date_end = date("Y-m-d H:i:s", $start + 86400 * 
            //        ($j + 1));
            //     $count=Db::table("ns_ordernum")->where([
            //         'ordertime' => [
            //             'between',
            //             [
            //                 getTimeTurnTimeStamp($date_start),
            //                 getTimeTurnTimeStamp($date_end)
            //             ]
            //         ]
                    
            //     ])->count();
                
            //     $data[0][$j] = (1 + $j) . '日';
            //     $data[1][$j] = $count;
            // }

            // var_dump($data);

           $category=Db::table('ns_goods_category')->select();
           
           $this->assign('category',$category);
          
           // $condition['ordertime']=[
           //      [
           //          ">",
           //          1567728000
           //      ]
           //  ];
           //  $list=Db::table("ns_ke")->where($condition)->order("ordertime desc")->select();
           //  $arr=array();
           //  $arr['data']=$list;
           //  var_dump($arr);
            return view($this->style . "Ke/keList");
        }
    }

    /**
     * 手机壳统计
     * 
     */
    public function tongji(){
        if (request()->isAjax()) {
            $start_date = request()->post('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('start_date'));
            $end_date = request()->post('end_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('end_date'));

            if ($start_date != 0 && $end_date != 0) {
                $condition["ordertime"] = [
                    [
                        ">",
                        $start_date
                    ],
                    [
                        "<",
                        $end_date+86399
                    ]
                ];
            } 
            elseif ($start_date != 0 && $end_date == 0) {
                $condition["ordertime"] = [
                    [
                        ">",
                        $start_date
                    ]
                ];
            } elseif ($start_date == 0 && $end_date != 0) {
                $condition["ordertime"] = [
                    [
                        "<",
                        $end_date+86399
                    ]
                ];
            }

            $totalprice=Db::name("ns_ke")->where($condition)->sum("num*price");
            $totalnum=Db::name("ns_ke")->where($condition)->sum("num");
            $totalyoufei=Db::name("ns_ke")->where($condition)->sum("youfei");
            $chengben=Db::name("ns_ke")->where($condition)->sum("num*chengben");
            $totalchengben=$totalyoufei+$chengben;
            $totalfenrun=Db::name("ns_ke")->where($condition)->sum("num*fenrunprice");
            $totaljieyu=$totalprice-($totalchengben+$totalfenrun);

            $category=Db::table('ns_goods_category')->select();
            $this->assign('category',$category);
            $list=array();

            $count=Db::table("ns_goods_category")->count('category_id');
            for ($i=0; $i <$count ; $i++) { 
                $list['data'][$i]['categoryname']=$category[$i]['category_name'];
                if ($start_date != 0 && $end_date != 0) {
                    $list['data'][$i]['date']="'".date("m-d",$start_date)."-".date("m-d",$end_date+86399)."'";
                }
                elseif ($start_date != 0 && $end_date == 0) {
                    $list['data'][$i]['date']="从".date("m-d",$start_date);
                }
                elseif ($start_date == 0 && $end_date != 0) {
                    $list['data'][$i]['date']="从开始到".date("m-d",$end_date);
                }
                else{
                    $list['data'][$i]['date']="所有日期";
                }

                // $list[$i]['date']="所有日期";
                $condition['categoryid']=["=",$category[$i]['category_id']];
                $allprice=Db::table("ns_ke")->where($condition)->sum("price*num");
                $list['data'][$i]['allprice'] = $allprice;
                $result=Db::name("ns_ke")->field('caizhi,sum(num) as shuliang,chengben')->where($condition)->group('caizhi')->select();
                //echo Db::getLastSql();
                $dd=count($result);
                if($dd==0){
                    $list['data'][$i]['boli']="玻璃";
                    $list['data'][$i]['mosha']="磨砂";
                    $list['data'][$i]['bolinum']=0;
                    $list['data'][$i]['moshanum']=0;
                    $list['data'][$i]['moshachengben']=4.00;
                    $list['data'][$i]['bolichengben']=9.00;
                }
                else if($dd==1){
                    foreach ($result as $key => $value) {
                        if($value['caizhi']==1){
                            $list['data'][$i]['mosha']="磨砂";
                            $list['data'][$i]['moshanum']=$value['shuliang'];
                            $list['data'][$i]['moshachengben']=$value['chengben'];
                            $list['data'][$i]['boli']="玻璃";
                            $list['data'][$i]['bolinum']=0;
                            $list['data'][$i]['bolichengben']=9.00;
                        }
                        if($value['caizhi']==2){
                            $list['data'][$i]['boli']="玻璃";
                            $list['data'][$i]['bolinum']=$value['shuliang'];
                            $list['data'][$i]['bolichengben']=$value['chengben'];
                            $list['data'][$i]['mosha']="磨砂";
                            $list['data'][$i]['moshanum']=0;
                            $list['data'][$i]['moshachengben']=4.00;
                        }
                    }
                }
                else
                {
                    foreach ($result as $key => $value) {
                        if($value['caizhi']==1){
                            $list['data'][$i]['mosha']="磨砂";
                            $list['data'][$i]['moshanum']=$value['shuliang'];
                            $list['data'][$i]['moshachengben']=$value['chengben'];
                        }
                        if($value['caizhi']==2){
                            $list['data'][$i]['boli']="玻璃";
                            $list['data'][$i]['bolinum']=$value['shuliang'];
                            $list['data'][$i]['bolichengben']=$value['chengben'];
                        }
                    }
                }
                $youfei=Db::name("ns_ke")->where($condition)->sum('youfei');
                $chengben=Db::name("ns_ke")->where($condition)->sum('num*chengben');
                $list['data'][$i]['chengben']=$youfei+$chengben;
                $list['data'][$i]['youfei']=$youfei;

                $allfenrunmoney=Db::table('ns_ke')->where($condition)->sum("num*fenrunprice");
                //淘宝不统计分润
                if($category[$i]['category_name']=="淘宝"){
                    $list['data'][$i]['fenrunprice']='';
                    $list['data'][$i]['allfenrun']='';
                    $list['data'][$i]['jieyu']='';
                }
                else
                {
                    $list['data'][$i]['fenrunprice']=7;
                    $list['data'][$i]['allfenrun']=$allfenrunmoney;
                    $list['data'][$i]['jieyu']=$allprice-($youfei+$chengben+$allfenrunmoney);
                }
            }

            

            
            $list['aa']['totalprice']=$totalprice;
            $list['aa']['totalnum']=$totalnum;
            $list['aa']['totalchengben']=$totalchengben;
            $list['aa']['totalfenrun']=$totalfenrun;
            $list['aa']['totaljieyu']=$totaljieyu;


            return $list;
        }
        else{
            $category=Db::table('ns_goods_category')->select();
            $this->assign('category',$category);
            $list=array();

            $count=Db::table("ns_goods_category")->count('category_id');

            for($i=0;$i<$count;$i++){
                $list[$i]['categoryname']=$category[$i]['category_name'];
                $list[$i]['date']="所有日期";
                $allprice=Db::table("ns_ke")->where("categoryid",$category[$i]['category_id'])->sum("price*num");
                $list[$i]['allprice'] = $allprice;
                $result=Db::name("ns_ke")->field('caizhi,sum(num) as shuliang,chengben')->where("categoryid",$category[$i]['category_id'])->group('caizhi')->select();
                //echo Db::getLastSql();
                $dd=count($result);
                if($dd==0){
                    $list[$i]['boli']="玻璃";
                    $list[$i]['mosha']="磨砂";
                    $list[$i]['bolinum']=0;
                    $list[$i]['moshanum']=0;
                    $list[$i]['moshachengben']=4.00;
                    $list[$i]['bolichengben']=9.00;
                }
                else if($dd==1){
                    foreach ($result as $key => $value) {
                        if($value['caizhi']==1){
                            $list[$i]['mosha']="磨砂";
                            $list[$i]['moshanum']=$value['shuliang'];
                            $list[$i]['moshachengben']=$value['chengben'];
                            $list[$i]['boli']="玻璃";
                            $list[$i]['bolinum']=0;
                            $list[$i]['bolichengben']=9.00;
                        }
                        if($value['caizhi']==2){
                            $list[$i]['boli']="玻璃";
                            $list[$i]['bolinum']=$value['shuliang'];
                            $list[$i]['bolichengben']=$value['chengben'];
                            $list[$i]['mosha']="磨砂";
                            $list[$i]['moshanum']=0;
                            $list[$i]['moshachengben']=4.00;
                        }
                    }
                }
                else
                {
                    foreach ($result as $key => $value) {
                        if($value['caizhi']==1){
                            $list[$i]['mosha']="磨砂";
                            $list[$i]['moshanum']=$value['shuliang'];
                            $list[$i]['moshachengben']=$value['chengben'];
                        }
                        if($value['caizhi']==2){
                            $list[$i]['boli']="玻璃";
                            $list[$i]['bolinum']=$value['shuliang'];
                            $list[$i]['bolichengben']=$value['chengben'];
                        }
                    }
                }
                $youfei=Db::name("ns_ke")->where("categoryid",$category[$i]['category_id'])->sum('youfei');
                $chengben=Db::name("ns_ke")->where("categoryid",$category[$i]['category_id'])->sum('num*chengben');
                $list[$i]['chengben']=$youfei+$chengben;
                $list[$i]['youfei']=$youfei;

                $allfenrunmoney=Db::table('ns_ke')->where("categoryid",$category[$i]['category_id'])->sum("num*fenrunprice");
                //淘宝不统计分润
                if($category[$i]['category_name']=="淘宝"){
                    $list[$i]['fenrunprice']='';
                    $list[$i]['allfenrun']='';
                    $list[$i]['jieyu']='';
                }
                else
                {
                    $list[$i]['fenrunprice']=7;
                    $list[$i]['allfenrun']=$allfenrunmoney;
                    $list[$i]['jieyu']=$allprice-($youfei+$chengben+$allfenrunmoney);
                }
            }
            $totalprice=Db::name("ns_ke")->sum("num*price");
            $totalnum=Db::name("ns_ke")->sum("num");
            $totalyoufei=Db::name("ns_ke")->sum("youfei");
            $chengben=Db::name("ns_ke")->sum("num*chengben");
            $totalchengben=$totalyoufei+$chengben;
            $totalfenrun=Db::name("ns_ke")->sum("num*fenrunprice");
            $totaljieyu=$totalprice-($totalchengben+$totalfenrun);

            $this->assign("totalprice",$totalprice);
            $this->assign("totalnum",$totalnum);
            $this->assign("totalchengben",$totalchengben);
            $this->assign("totalfenrun",$totalfenrun);
            $this->assign("totaljieyu",$totaljieyu);
            $this->assign("list",$list);
            //var_dump($list);
            return view($this->style."Ke/tongji");
        }

        
    }

    /**
    *修改手机壳
    * 
    */
   public function keEdit()
   {
        if (request()->isAjax()) {
            $id = (int)request()->post('id', '');
            $ordernum = (int)request()->post('ordernum', '');
            $xinghao = request()->post('xinghao', '');
            $num = request()->post('num', '');
            $caizhi = request()->post('caizhi', '');
            
            $category= request()->post('category', '');
            $price = request()->post('price','');
            $chengben = request()->post('chengben','');
            $youfei = request()->post('youfei','');
            $fenprice = request()->post('fenrunprice','');
            $descs = request()->post('descs', '');

            $lirun=(float)(($price-$chengben)*$num-($youfei+$fenprice));

            $set="";
            $keinfo=Db::table("ns_ke")->where("id=".$id)->find();
            if($keinfo['ordernum']!=$ordernum){
                $set.="ordernum=$ordernum,";
            }
            if($keinfo['xinghao']!=$xinghao){
                $set.="xinghao='".$xinghao."',";
            }
            if($keinfo['num']!=$num){
                $set.="num=$num,";
            }
            if($keinfo['caizhi']!=$caizhi){
                $set.="caizhi=$caizhi,";
            }
            if($keinfo['categoryid']!=$category){
                $set.="categoryid=$category,";
            }
            if($keinfo['price']!=$price){
                $set.="price=$price,";
            }

            if($keinfo['chengben']!=$chengben){
                $set.="chengben=$chengben,";
            }

            if($keinfo['youfei']!=$youfei){
                $set.="youfei=$youfei,";
            }

            if($keinfo['fenrunprice']!=$fenprice){
                $set.="fenrunprice=$fenprice,";
            }

            if((float)$keinfo['lirun']!=$lirun){
                $set.="lirun=$lirun,";
            }


            if($keinfo['descs']==null){
                $keinfo['descs']="";
            }
            if($keinfo['descs']!=$descs){
                $set.="descs='".$descs."',";
            }
            $set=rtrim($set,",");
            $sql="update ns_ke set ".$set." where id=".$id;
           
            $dd=Db::execute($sql);
            if($dd){
                $result=array("code"=>1);
            }
            else
            {
                 $result=array("code"=>0);
            }
           
            //$result=array("code"=>1);
            return $result;
        }
        else
        {
            $id=(int)request()->get('id', 0);
            $this->assign("id",$id);
            $orderinfo=Db::table('ns_ke')->where("id=".$id)->find();

            $neworderinfo=array();
            $neworderinfo['id']=$orderinfo['id'];
            $neworderinfo['xinghao']=$orderinfo['xinghao'];
            $neworderinfo['ordernum']=$orderinfo['ordernum'];
            $neworderinfo['num']=$orderinfo['num'];
            $neworderinfo['caizhi']=$orderinfo['caizhi'];
            $neworderinfo['price']=$orderinfo['price'];
            $neworderinfo['youfei']=$orderinfo['youfei'];
            $neworderinfo['chengben']=$orderinfo['chengben'];
            $neworderinfo['fenrunprice']=$orderinfo['fenrunprice'];
            $neworderinfo['categoryid']=$orderinfo['categoryid'];
            if($orderinfo['descs']==null){
                $neworderinfo['descs']="";
            }
            else
            {
                $neworderinfo['descs']=$orderinfo['descs'];
            }

            $category=Db::table('ns_goods_category')->select();
           
            $this->assign('category',$category);
           
            $this->assign("keinfo",$neworderinfo);
            return view($this->style . "ke/keedit");
        }
        
   }
   


    /**
     * 功能说明：添加订单
     * 
     */
   
    public function addKe(){
        if (request()->isAjax()) {
            $ordernum = request()->post('ordernum', '');
            $xinghao = request()->post('xinghao', '');
            $num = request()->post('num', '');
            
            $caizhi = request()->post('caizhi', '');
            $category = request()->post('category', '');
            $price = (float)request()->post("price","");
            $chengben = request()->post('chengben', '');
            
            $youfei = request()->post('youfei', '');
            $fenprice = request()->post('fenrunprice', '');
            $descs = request()->post("descs","");
            $lirun=($price-$chengben)*$num-($youfei+$fenprice);

            $ordertime=time();
            $sql="insert into ns_ke(xinghao,num,caizhi,price,chengben,youfei,fenrunprice,lirun,descs,ordertime,ordernum,categoryid) values('".$xinghao."',$num,$caizhi,$price,$chengben,$youfei,$fenprice,$lirun,'".$descs."',$ordertime,$ordernum,$category)";
            
            $dd=Db::execute($sql);
            if($dd){
                $result=array("code"=>1);
            }
            else
            {
                 $result=array("code"=>0);
            }
            
            return $result;
        }
        else if(request()->get()){
            $id=request()->get('id',0);
            $ordernum=Db::table("ns_ordernum")->where("id",$id)->value('ordernum');

             $category=Db::table('ns_goods_category')->select();
           
           $this->assign('category',$category);
            $this->assign("ordernum",$ordernum);
            return view($this->style."Ke/addKe");
        }
        else{

            $category=Db::table('ns_goods_category')->select();
           
            $this->assign('category',$category);
            return view($this->style."Ke/addKe");
        }
        
    }

    

    

    /**
     * 导出粉丝列表到excal
     */
    public function testExcel()
    {
        // 导出Excel
        $xlsName = "开门记录列表";
        $xlsCell = array(
            array(
                'userid',
                '用户id'
            ),
            array(
                'use_name',
                '使用者姓名'
            )
        );
        $list = array(
            array(
                "userid" => "55",
                "use_name" => "王二小"
            ),
            array(
                "userid" => "56",
                "use_name" => "王二大"
            )
        );
        dataExcel($xlsName, $xlsCell, $list);
    }

    /**
     * 订单数据excel导出
     */
    public function tongjiDataExcel()
    {
        include 'data/extend/phpexcel_classes/PHPExcel.php';
       
        
        $start_date = request()->get('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->get('start_date'));
        $end_date = request()->get('end_date') == "" ? 0 : getTimeTurnTimeStamp(request()->get('end_date'));
        if ($start_date != 0 && $end_date != 0) {
            $condition["ordertime"] = [
                [
                    ">",
                    $start_date
                ],
                [
                    "<",
                    $end_date+86399
                ]
            ];
        } elseif ($start_date != 0 && $end_date == 0) {
            $condition["ordertime"] = [
                [
                    ">",
                    $start_date
                ]
            ];
        } elseif ($start_date == 0 && $end_date != 0) {
            $condition["ordertime"] = [
                [
                    "<",
                    $end_date+86399
                ]
            ];
        }
        $xlsTitle = iconv('utf-8', 'gb2312', "数据列表"); // 文件名称
        $fileName = $xlsTitle . date('_YmdHis'); // or $xlsTitle 文件名称可根据自己情况设定
        $objPHPExcel = new \PHPExcel();
        $objPHPExcel->getActiveSheet()->setTitle($fileName);
        // $objPHPExcel->getActiveSheet()->setCellValue("A1","日期");
        // $objPHPExcel->getActiveSheet()->setCellValue("B1","项目");
        // $objPHPExcel->getActiveSheet()->setCellValue("C1","营业额");
        // $objPHPExcel->getActiveSheet()->setCellValue("D1","材质");
        // $objPHPExcel->getActiveSheet()->setCellValue("E1","数量");
        // $objPHPExcel->getActiveSheet()->setCellValue("F1","成本单价");
        // $objPHPExcel->getActiveSheet()->setCellValue("G1","成本支出");
        // $objPHPExcel->getActiveSheet()->setCellValue("H1","分润单价");
        // $objPHPExcel->getActiveSheet()->setCellValue("I1","总分润");
        // $objPHPExcel->getActiveSheet()->setCellValue("J1","结余");
        // $objPHPExcel->getActiveSheet()->setCellValue("K1","备注");
        
            
        
        

        $objPHPExcel->getActiveSheet()->setCellValue("A1","成绩汇总");
        $objPHPExcel->getActiveSheet()->mergeCells("A1:L1");
        $objPHPExcel->getActiveSheet()->setCellValue("A2","考试时间".date("Y-m-d H:i:s",time()));
        $objPHPExcel->getActiveSheet()->mergeCells("A2:L2");
        $objPHPExcel->getActiveSheet()->setCellValue("A3","中心名称");
        $objPHPExcel->getActiveSheet()->mergeCells("A3:A4");
        $objPHPExcel->getActiveSheet()->setCellValue("B3","UID");
        $objPHPExcel->getActiveSheet()->mergeCells("B3:B4");
        $objPHPExcel->getActiveSheet()->setCellValue("C3","姓名");
        $objPHPExcel->getActiveSheet()->mergeCells("C3:C4");
        $objPHPExcel->getActiveSheet()->setCellValue("D3","分数(选择题)");
        $objPHPExcel->getActiveSheet()->mergeCells("D3:D4");
       
        header('pragma:public');
        header("Expires:0");
        header("Cache-Control:must-revalidate,post-check=0,pre-check=0");
        header('Content-type:application/vnd.ms-excel;charset=utf-8;name="' . $xlsTitle . '.xls"');
        header("Content-Disposition:attachment;filename=$fileName.xls"); // attachment新窗口打印inline本窗口打印
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');

        $objWriter->save('php://output');
        //dataExcel($xlsName, $xlsCell, $list);
    }

    /**
     * 订单数据excel导出
     */
    public function orderDataExcel()
    {
        $xlsName = "手机壳报表数据列表";
        
    }

    /**
     * 订单数据excel导出
     */
    public function virtualOrderDataExcel()
    {
        $xlsName = "订单数据列表";
        $xlsCell = array(
            array(
                'order_no',
                '订单编号'
            ),
            array(
                'create_date',
                '日期'
            ),
            array(
                'receiver_info',
                '收货人信息'
            ),
            array(
                'order_money',
                '订单金额'
            ),
            array(
                'pay_money',
                '实际支付'
            ),
            array(
                'pay_type_name',
                '支付方式'
            ),
            array(
                'pay_status_name',
                '支付状态'
            ),
            array(
                'goods_info',
                '商品信息'
            ),
            array(
                'buyer_message',
                '买家留言'
            ),
            array(
                'seller_memo',
                '卖家备注'
            )
        );
        $start_date = request()->get('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->get('start_date'));
        $end_date = request()->get('end_date') == "" ? 0 : getTimeTurnTimeStamp(request()->get('end_date'));
        $user_name = request()->get('user_name', '');
        $order_no = request()->get('order_no', '');
        $order_status = request()->get('order_status', '');
        $receiver_mobile = request()->get('receiver_mobile', '');
        $payment_type = request()->get('payment_type', '');
        $order_ids = request()->get("order_ids", "");
        
        if ($order_ids != "") {
            $condition["order_id"] = [
                "in",
                $order_ids
            ];
        }
        
        if ($start_date != 0 && $end_date != 0) {
            $condition["create_time"] = [
                [
                    ">",
                    $start_date
                ],
                [
                    "<",
                    $end_date
                ]
            ];
        } elseif ($start_date != 0 && $end_date == 0) {
            $condition["create_time"] = [
                [
                    ">",
                    $start_date
                ]
            ];
        } elseif ($start_date == 0 && $end_date != 0) {
            $condition["create_time"] = [
                [
                    "<",
                    $end_date
                ]
            ];
        }
        if ($order_status != '') {
            $condition['order_status'] = $order_status;
        }
        if (! empty($payment_type)) {
            $condition['payment_type'] = $payment_type;
        }
        if (! empty($user_name)) {
            $condition['receiver_name'] = $user_name;
        }
        if (! empty($order_no)) {
            $condition['order_no'] = $order_no;
        }
        if (! empty($receiver_mobile)) {
            $condition['receiver_mobile'] = $receiver_mobile;
        }
        $condition['shop_id'] = $this->instance_id;
        $condition['order_type'] = 2; // 虚拟订单
        $order_service = new OrderService();
        $list = $order_service->getOrderList(1, 0, $condition, 'create_time desc');
        $list = $list["data"];
        foreach ($list as $k => $v) {
            $list[$k]["create_date"] = getTimeStampTurnTime($v["create_time"]); // 创建时间
            $list[$k]["receiver_info"] = $v["user_name"] . "  " . $v["receiver_mobile"]; // 创建时间
            if ($v['pay_status'] == 0) {
                $list[$k]["pay_status_name"] = '待付款';
            } elseif ($v['pay_status'] == 2) {
                $list[$k]["pay_status_name"] = '已付款';
            }
            $goods_info = "";
            foreach ($v["order_item_list"] as $t => $m) {
                $goods_info .= "商品名称:" . $m["goods_name"] . "  规格:" . $m["sku_name"] . "  商品价格:" . $m["price"] . "  购买数量:" . $m["num"] . "  ";
            }
            $list[$k]["goods_info"] = $goods_info;
        }
        dataExcel($xlsName, $xlsCell, $list);
    }

    public function getOrderGoodsDetialAjax()
    {
        if (request()->isAjax()) {
            $order_goods_id = request()->post("order_goods_id", '');
            $order_goods = new OrderGoods();
            $res = $order_goods->getOrderGoodsRefundDetail($order_goods_id);
            return $res;
        }
    }

    /**
     * 收货
     */
    public function orderTakeDelivery()
    {
        $order_service = new OrderService();
        $order_id = request()->post('order_id', '');
        $res = $order_service->OrderTakeDelivery($order_id);
        return AjaxReturn($res);
    }

    /**
     * 删除订单
     */
    public function deleteOrder()
    {
        if (request()->isAjax()) {
            $order_service = new OrderService();
            $order_id = request()->post("order_id", "");
            $res = $order_service->deleteOrder($order_id, 1, $this->instance_id);
            return AjaxReturn($res);
        }
    }

    /**
     * 订单退款（测试）
     */
    public function orderrefundtest()
    {
        $weixin_pay = new WeiXinPay();
        $retval = $weixin_pay->setWeiXinRefund($refund_no, $out_trade_no, $refund_fee, $total_fee);
        var_dump($retval);
    }

    /**
     * 支付宝退款（测试）
     * 创建时间：2017年10月17日 10:26:05
     */
    public function aliPayRefundtest()
    {
        $ali_pay = new AliPay();
        $retval = $ali_pay->aliPayRefund(date("YmdHis", time()) . rand(100000, 999999), $out_trade_no, $refund_fee);
        $this->redirect($retval);
    }

    public function aliPayTransfer()
    {
        $ali_pay = new AliPay();
        $retval = $ali_pay->aliPayTransfer(date("YmdHis", time()) . rand(100000, 999999), '595566388@qq.com', 1);
        $this->redirect($retval);
    }

    /**
     * 查询订单项实际可退款余额
     * 创建时间：2017年10月16日 09:57:56 王永杰
     */
    public function getOrderGoodsRefundBalance()
    {
        $order_goods_id = request()->post("order_goods_id", "");
        if (! empty($order_goods_id)) {
            $order_goods = new OrderGoods();
            $refund_balance = $order_goods->orderGoodsRefundBalance($order_goods_id);
            return $refund_balance;
        }
        return 0;
    }

    /**
     * 查询当前订单的付款方式，用于进行退款操作时，选择退款方式
     * 创建时间：2017年10月16日 10:01:55 王永杰
     */
    public function getOrderTermsOfPayment()
    {
        $order_id = request()->post("order_id", "");
        if (! empty($order_id)) {
            $order = new OrderService();
            $payment_type = $order->getTermsOfPaymentByOrderId($order_id);
            $type = OrderStatus::getPayType($payment_type);
            $json = array();
            if ($type == "微信支付") {
                $temp['type_id'] = 1;
                $temp['type_name'] = "微信";
                array_push($json, $temp);
                $temp['type_id'] = 10;
                $temp['type_name'] = "线下";
                array_push($json, $temp);
            } elseif ($type == "支付宝") {
                $temp['type_id'] = 2;
                $temp['type_name'] = "支付宝";
                array_push($json, $temp);
                $temp['type_id'] = 10;
                $temp['type_name'] = "线下";
                array_push($json, $temp);
            } else {
                $temp['type_id'] = 10;
                $temp['type_name'] = "线下";
                array_push($json, $temp);
            }
            return json_encode($json);
        }
        return "";
    }

    /**
     * 检测支付配置是否开启，支付配置和原路退款配置都要开启才行（配置信息也要填写）
     * 创建时间：2017年10月17日 15:00:29 王永杰
     *
     * @return boolean
     */
    public function checkPayConfigEnabled()
    {
        $type = request()->post("type", "");
        if (! empty($type)) {
            $config = new Config();
            $enabled = $config->checkPayConfigEnabled($this->instance_id, $type);
            return $enabled;
        }
        return "";
    }

    /**
     * 获取出货商品列表
     */
    public function getShippingList()
    {
        if (request()->isAjax()) {
            $order_ids = request()->post("order_ids", "");
            $order_goods = new OrderGoods();
            $list = $order_goods->getShippingList($order_ids);
            return $list;
        }
    }

    /**
     * 出货单打印页面
     */
    public function printpreviewOfInvoice()
    {
        $order_ids = request()->get("order_ids", "");
        $order_goods = new OrderGoods();
        $list = $order_goods->getShippingList($order_ids);
        $this->assign("list", $list);
        $webSiteInfo = $this->website->getWebSiteInfo();
        if (empty($webSiteInfo["title"])) {
            $ShopName = "Niushop开源商城";
        } else {
            $ShopName = $webSiteInfo["title"];
        }
        $this->assign("ShopName", $ShopName);
        $this->assign("now_time", time());
        return view($this->style . "Order/printpreviewOfInvoice");
    }

    /**
     * 添加临时物流信息
     */
    public function addTmpExpressInformation()
    {
        $order_goods = new OrderGoods();
        $print_order_arr = request()->post("print_order_arr", "");
        $deliver_goods = request()->post("deliver_goods", 0);
        $print_order_arr = json_decode($print_order_arr, true);
        $res = $order_goods->addTmpExpressInformation($print_order_arr, $deliver_goods);
        return $res;
    }

    /**
     * 获取未发货的订单
     */
    public function getNotshippedOrderList()
    {
        $order_ids = request()->post("ids", "");
        $order = new OrderService();
        $list = $order->getNotshippedOrderByOrderId($order_ids);
        return $list;
    }

    /**
     * 打印订单
     */
    public function printOrder()
    {
        // 网站信息
        $web_info = $webSiteInfo = $this->website->getWebSiteInfo();
        $this->assign("web_info", $web_info);
        $order_ids = request()->get("print_order_ids", "");
        $order_service = new OrderService();
        $condition = array(
            "order_id" => array(
                "in",
                $order_ids
            ),
            "shop_id" => $this->instance_id,
            'order_type' => array(
                "in",
                "1,3"
            )
        );
        $list = $order_service->getOrderList(1, 0, $condition, '');
        foreach ($list["data"] as $k => $v) {
            $order_detail = $order_service->getOrderDetail($v["order_id"]);
            $list["data"][$k]["goods_packet_list"] = $order_detail["goods_packet_list"];
        }
        $this->assign("order_list", $list['data']);
        return view($this->style . "Order/printOrder");
    }

    /**
     * 打印虚拟订单
     */
    public function printVirtualOrder()
    {
        // 网站信息
        $web_info = $webSiteInfo = $this->website->getWebSiteInfo();
        $this->assign("web_info", $web_info);
        $order_ids = request()->get("print_order_ids", "");
        $order_service = new OrderService();
        $condition = array(
            "order_id" => array(
                "in",
                $order_ids
            ),
            "shop_id" => $this->instance_id,
            'order_type' => 2
        );
        $list = $order_service->getOrderList(1, 0, $condition, '');
        $this->assign("order_list", $list['data']);
        return view($this->style . "Order/printVirtualOrder");
    }
}