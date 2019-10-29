<?php
/**
 * OrderAccount.php
 *
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
namespace data\service\Ordernum;

use data\model\AlbumPictureModel;
use data\model\ConfigModel;
use data\model\NsGoodsModel;
use data\model\NsGoodsSkuModel;
use data\model\NsOrderActionModel as NsOrderActionModel;
use data\model\NsOrderExpressCompanyModel;
use data\model\NsOrderGoodsExpressModel;
use data\model\NsOrderGoodsModel;
use data\model\NsOrderGoodsPromotionDetailsModel;
use data\model\NsOrdernumModel;
use data\model\NsOrderPickupModel;
use data\model\NsOrderPromotionDetailsModel;
use data\model\NsOrderRefundAccountRecordsModel;
use data\model\NsPickupPointModel;
use data\model\NsPromotionFullMailModel;
use data\model\NsPromotionMansongRuleModel;
use data\model\UserModel as UserModel;
use data\service\Address;
use data\service\BaseService;
use data\service\Config;
use data\service\Member\MemberAccount;
use data\service\Member\MemberCoupon;
use data\service\Ordernum\OrderStatus;
use data\service\promotion\GoodsExpress;
use data\service\promotion\GoodsMansong;
use data\service\promotion\GoodsPreference;
use data\service\UnifyPay;
use data\service\WebSite;
use think\Log;
use data\service\VirtualGoods;

/**
 * 订单操作类
 */
class Order extends BaseService
{

    public $order;
    // 订单主表
    function __construct()
    {
        parent::__construct();
        $this->order = new NsOrderModel();
    }
	
	/**
     * 订单创建
     * （订单传入积分系统默认为使用积分兑换商品）
     *
     * @param unknown $ordernum            
     * @param unknown $shouhuouser                       
     * @param unknown $receiver_mobile            
     * @param unknown $receiver_province            
     * @param unknown $receiver_city            
     * @param unknown $receiver_district            
     * @param unknown $receiver_address            
     * @param unknown $receiver_zip            
     * @param unknown $receiver_name            
     * @param unknown $point            
     * @param unknown $point_money            
     * @param unknown $coupon_money            
     * @param unknown $coupon_id            
     * @param unknown $user_money            
     * @param unknown $promotion_money            
     * @param unknown $shipping_money            
     * @param unknown $pay_money            
     * @param unknown $give_point            
     * @param unknown $goods_sku_list            
     * @return number|Exception
     */
    public function orderCreate($ordernum, $shouhuouser, $receiver_mobile, $receiver_province, $receiver_city, $receiver_district, $receiver_address,$desc = "")
    {
        $this->order->startTrans();
        
        try {
            // 订单待支付
           
           
            
           
           
            // 店铺名称
            
            $data_order = array(
                
                'ordernum' => $ordernum,
                'shouhuouser' => $shouhuouser,
                'mobile' => $receiver_mobile,
                'province' => $receiver_province,
                'city' => $receiver_city,
                'area' => $receiver_district,
                'address' => $receiver_address,
                'desc' => $desc,
                'ordertime' => time(),
            ); // datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '订单创建时间',
            
            $order = new NsOrdernumModel();
            $order->save($data_order);
            
			
			
			$order_id = $order->order_id;
            $this->order->commit();
            return $order_id;
        } catch (\Exception $e) {
            $this->order->rollback();
            return $e->getMessage();
        }
    }
	
}