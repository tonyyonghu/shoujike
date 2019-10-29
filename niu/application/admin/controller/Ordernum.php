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

use data\service\Ordernum as OrderService;
use think\Db;

/**
 * 订单控制器
 *
 * @author Administrator
 *        
 */
class Ordernum extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 订单列表
     */
    public function ordernumList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $start_date = request()->post('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('start_date'));
            $end_date = request()->post('end_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('end_date'));
            $ordernum = request()->post('ordernum', '');
            $mobile = request()->post("mobile",'');
            $shouhuouser = request()->post("shouhuouser",'');
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
            
            
            if (! empty($ordernum)) {
                $condition['ordernum'] = $ordernum;
            }
            if (! empty($mobile)) {
                $condition['mobile'] = $mobile;
            }
            if(! empty($shouhuouser)){
                 $condition['shouhuouser'] = $shouhuouser;
            }

            $order_service = new OrderService();
            $list = $order_service->getOrderList($page_index, $page_size, $condition, 'ordertime desc');
           // $list=Db::table('ns_ordernum')->select();
            return $list;
        } else {
            
            
        
            return view($this->style . "Ordernum/ordernumList");
        }
    }

   /**
    *修改订单
    * 
    */
   public function ordernumEdit()
   {
        if (request()->isAjax()) {
            $id = request()->post('id', '');
            $ordernum = request()->post('ordernum', '');
            $start_date = request()->post('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('start_date'));
            $shouhuouser = request()->post('shouhuouser', '');
            $mobile = request()->post('mobile', '');
            $citypicker = request()->post('citypicker', '');
            $array = explode("/",$citypicker);
            $province = $array[0];
            $city = $array[1];
            $area = $array[2];
            $address= request()->post('address', '');
            $descs = request()->post('descs', '');

            $set="";
            $orderinfo=Db::table("ns_ordernum")->where("id=".(int)$id)->find();
            if($orderinfo['ordernum']!=$ordernum){
                $set.="ordernum='".$ordernum."',";
            }
            if($orderinfo['shouhuouser']!=$shouhuouser){
                $set.="shouhuouser='".$shouhuouser."',";
            }
            if($orderinfo['mobile']!=$mobile){
                $set.="mobile='".$mobile."',";
            }
            if($orderinfo['province']!=$province){
                $set.="province='".$province."',";
            }
            if($orderinfo['city']!=$city){
                $set.="city='".$city."',";
            }
            if($orderinfo['ordertime']!=$start_date){
                $set.="ordertime='".$start_date."',";
            }
            if($orderinfo['area']!=$area){
                $set.="area='".$area."',";
            }

            if($orderinfo['address']!=$address){
                $set.="address='".$address."',";
            }
            if($orderinfo['descs']==null){
                $orderinfo['descs']="";
            }
            if($orderinfo['descs']!=$descs){
                $set.="descs='".$descs."',";
            }
            $set=rtrim($set,",");
            $sql="update ns_ordernum set ".$set." where id=".$id;
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
            $orderinfo=Db::table('ns_ordernum')->where("id=".$id)->find();

            $neworderinfo=array();
            $neworderinfo['id']=$orderinfo['id'];
            $neworderinfo['ordernum']=$orderinfo['ordernum'];
            $neworderinfo['shouhuouser']=$orderinfo['shouhuouser'];
            $neworderinfo['mobile']=$orderinfo['mobile'];
            $neworderinfo['detailaddress']=$orderinfo['province']."/".$orderinfo['city']."/".$orderinfo['area'];
            $neworderinfo['address']=$orderinfo['address'];
            $neworderinfo['ordertime']=$orderinfo['ordertime'];
            if($orderinfo['descs']==null){
                $neworderinfo['descs']="";
            }
            else
            {
                $neworderinfo['descs']=$orderinfo['descs'];
            }
            

            $this->assign("orderinfo",$neworderinfo);
            
            return view($this->style . "Ordernum/ordernumedit");
        }
        
   }



   /**
    *获取订单详情
    *
    * 
    */
   public function ordernumInfo()
   {
    $ordernum=request()->post("ordernum",0);

    $list=Db::table("ns_ke")->where("ordernum",$ordernum)->select();

    $newlist=array();
   foreach ($list as $key => $value) {
       $newlist[$key]['id']=$value['id'];
       $newlist[$key]['xinghao']=$value['xinghao'];
       if($value['caizhi']==1){
         $newlist[$key]['caizhi']="磨砂";
       }
       if($value['caizhi']==2){
         $newlist[$key]['caizhi']="玻璃";
       }
      
       $newlist[$key]['chengben'] = $value['chengben'];
       if($value['descs']==null||$value['descs']==""){
        $newlist[$key]['descs'] = "无";
       }
       else
       {
        $newlist[$key]['descs'] = $value['descs'];
       }
       
       $newlist[$key]['fenrunprice'] = $value['fenrunprice'];
       $newlist[$key]['lirun'] = $value['lirun'];
       $newlist[$key]['num'] = $value['num'];
       $newlist[$key]['ordernum'] = $value['ordernum'];
       $newlist[$key]['ordertime'] = date("m-d",$value['ordertime']);
       $newlist[$key]['price'] = $value['price'];
       $newlist[$key]['youfei'] = $value['youfei'];
       $categoryname=Db::table("ns_goods_category")->where("category_id",$value['categoryid'])->value("category_name");
       $newlist[$key]['categoryname']=$categoryname;
   }





    return array("code"=>1,"data"=>$newlist);
   }


   public function deleteordernum()
   {
    $id=request()->post("id",0);
    if(Db::table('ns_ordernum')->where('id',$id)->delete())
    {
        $result=array("code"=>1);
    }
    else
    {
        $result=array("code"=>0);
    }

    return $result;
   }
   

    /**
     * 功能说明：添加订单
     * 
     */
   
    public function ordernumAdd(){

        if (request()->isAjax()) {
            $ordernum = request()->post('ordernum', '');
            $start_date = request()->post('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->post('start_date'));
            $shouhuouser = request()->post('shouhuouser', '');
            $mobile = request()->post('mobile', '');
            $citypicker = request()->post('citypicker', '');
            $array = explode("/",$citypicker);
            $province = $array[0];
            $city = $array[1];
            $area = $array[2];
            $address = request()->post('address', '');
            $descs = request()->post('descs', '');
            $ordertime=$start_date;
            $sql="insert into ns_ordernum(ordernum,shouhuouser,mobile,province,city,area,address,descs,ordertime) values('".$ordernum."','".$shouhuouser."','".$mobile."','".$province."','".$city."','".$area."','".$address."','".$descs."',$ordertime)";
            $dd=Db::execute($sql);
            if($dd){
                $result=array("code"=>1);
            }
            else
            {
                 $result=array("code"=>0);
            }

           // $affected = Db::execute($sql,['ordernum'=>$ordernum,'shouhuouser'=>'"'.$shouhuouser.'"','mobile'=>'".$mobile."','province'=>'"'.$province.'"','city'=>'"'.$city.'"','area'=>'"'.$area.'"','address'=>'"'.$address.'"','descs'=>'"'.$descs.'"']);  
           // if($affected){
           //  $result=array("code"=>1);
           // } 
           // else{
           //  $result=array('code'=>0);
           // }         
            // $ordernum=new Ordernum();
            // $result = $ordernum->addOrEditOrdernum(0,$ordernum, $shouhuouser, $mobile, $province,$city,$area,$address,$descs);
            
            return $result;
            
        }
        else{
            echo getTimeTurnTimeStamp("1568822400");
            return view($this->style."Ordernum/ordernumAdd");
        }
        
    }


    /**
     * 订单数据excel导出
     */
    public function orderDataExcel()
    {
        $xlsName = "订单数据列表";
        $xlsCell = array(
            array(
                'ordernum',
                '订单号'
            ),
            array(
                'shouhuouser',
                ' 收货人'
            ),
            array(
                'mobile',
                '手机'
            ),
            array(
                'province',
                '省'
            ),
            array(
                'city',
                '市'
            ),
            array(
                'area',
                '区'
            ),
            array(
                'address',
                '街道'
            ),
            array(
                'descs',
                '订单备注'
            )
        );
        $start_date = request()->get('start_date') == "" ? 0 : getTimeTurnTimeStamp(request()->get('start_date'));
        $end_date = request()->get('end_date') == "" ? 0 : getTimeTurnTimeStamp(request()->get('end_date'));
        $shouhuouser = request()->get('shouhuouser', '');
        $ordernum = request()->get('ordernum', '');
        $mobile = request()->get('mobile', '');
        
        
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
        
        if (! empty($shouhuouser)) {
            $condition['shouhuouser'] = $shouhuouser;
        }
        if (! empty($ordernum)) {
            $condition['ordernum'] = $ordernum;
        }
        if (! empty($mobile)) {
            $condition['mobile'] = $mobile;
        }
       
        $order_service = new OrderService();
        $list = $order_service->getOrderList(1, 0, $condition, 'ordertime asc');
        $list = $list["data"];
        foreach ($list as $k => $v) {
            $list[$k]["ordernum"] = trim($v["ordernum"]);
            $list[$k]["shouhuouser"] = trim($v["shouhuouser"]);
            $list[$k]["mobile"] = trim($v["mobile"]);
            $list[$k]["province"] = trim($v["province"]);
            $list[$k]["city"] = trim($v["city"]);
            $list[$k]["area"] = trim($v["area"]);
            $list[$k]["address"] = trim($v["address"]);
            $list[$k]["descs"] = trim($v["descs"]);
        }
        dataExcel($xlsName, $xlsCell, $list);
    }

    
}