<?php
/**
 * Cms.php
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


use data\service\VirtualGoods as VirtualGoodsService;
/**
 *
 */
class VirtualGoods extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }
    
    /**
     * 获取虚拟商品列表
     */
    public function virtualGoodsList(){
        
        if(request()->isAjax())
        {
            $virtualGoods = new VirtualGoodsService();
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_name = request()->post('search_name', '');
            $use_status = request()->post('use_status', '');
            $virtual_code = request()->post('virtual_code', '');
            
            $condition = array();
            if($search_name != ''){
                $condition["ng.goods_name"] = array(
                    'like',
                    '%' . $search_name . '%'
                );
            }
            if($virtual_code != ''){
                $condition["nvg.virtual_code"] = $virtual_code;
            }
            if($use_status != ''){
                $condition["nvg.use_status"] = $use_status;
            }
            $order = "";
            $list = $virtualGoods -> getVirtualGoodsList($page_index, $page_size, $condition, $order);
            return $list;      
        }
        
        $type = request()->get('type', '');
        $child_menu_list = array();
        $child_menu_list[0] = array(
            'url' => "VirtualGoods/virtualGoodsList",
            'menu_name' => '虚拟商品管理',
            "active" => 1
        );
        $child_menu_list[1] = array(
            'url' => "Verification/virtualGoodsVerificationList?type=to_reply",
            'menu_name' => '核销记录',
            "active" => 2
        );
        $child_menu_list[2] = array(
            'url' => "Verification/index",
            'menu_name' => '核销人员',
            "active" => 0
        );
        $this->assign('child_menu_list', $child_menu_list);
        return view($this->style. "VirtualGoods/virtualGoodsList");
    }
}