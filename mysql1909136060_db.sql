-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-10-29 17:14:40
-- 服务器版本： 5.5.46
-- PHP 版本： 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `mysql1909136060_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_article`
--

CREATE TABLE `nc_cms_article` (
  `article_id` int(10) UNSIGNED NOT NULL COMMENT '文章编号',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `class_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章分类编号',
  `short_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '文章来源',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源链接',
  `author` varchar(50) NOT NULL COMMENT '文章作者',
  `summary` varchar(140) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题图片',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `article_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '相关文章',
  `click` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `sort` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章排序0-255',
  `commend_flag` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `comment_flag` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0-草稿、1-待审核、2-已发布、-1-回收站',
  `attachment_path` text NOT NULL COMMENT '文章附件路径',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标签',
  `comment_count` int(10) UNSIGNED NOT NULL COMMENT '文章评论数',
  `share_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '发布者编号',
  `last_comment_time` int(11) DEFAULT '0' COMMENT '最新评论时间',
  `public_time` int(11) DEFAULT '0' COMMENT '发布时间',
  `create_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '文章修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=6553 DEFAULT CHARSET=utf8 COMMENT='CMS文章表';

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_article_class`
--

CREATE TABLE `nc_cms_article_class` (
  `class_id` int(10) UNSIGNED NOT NULL COMMENT '分类编号 ',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=1170 DEFAULT CHARSET=utf8 COMMENT='cms文章分类表';

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_comment`
--

CREATE TABLE `nc_cms_comment` (
  `comment_id` int(10) UNSIGNED NOT NULL COMMENT '评论编号',
  `text` varchar(2000) NOT NULL COMMENT '评论内容',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '评论人编号',
  `quote_comment_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论引用',
  `up` int(10) UNSIGNED NOT NULL COMMENT '点赞数量',
  `comment_time` int(10) UNSIGNED NOT NULL COMMENT '评论时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='CMS评论表';

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_topic`
--

CREATE TABLE `nc_cms_topic` (
  `topic_id` int(10) UNSIGNED NOT NULL COMMENT '专题编号',
  `instance_id` int(10) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `title` varchar(255) NOT NULL COMMENT '专题标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '专题封面',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专题状态  0草稿  1发布',
  `content` text NOT NULL COMMENT '专题内容',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account`
--

CREATE TABLE `ns_account` (
  `account_id` int(10) NOT NULL COMMENT '账户ID',
  `account_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台的总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台资金总余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商城订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商城提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总余额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总提现'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='商城资金统计';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_assistant_records`
--

CREATE TABLE `ns_account_assistant_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招商员支付记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_order_records`
--

CREATE TABLE `ns_account_order_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='金额账户记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_period`
--

CREATE TABLE `ns_account_period` (
  `period_id` int(10) NOT NULL COMMENT '账户ID',
  `period_year` int(10) NOT NULL COMMENT '账期年份',
  `period_month` int(10) NOT NULL COMMENT '账期月份',
  `account_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总发生余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总发生额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总提现额',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='商城账期结算表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_records`
--

CREATE TABLE `ns_account_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_calculate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否参与计算',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1092 DEFAULT CHARSET=utf8 COMMENT='金额账户记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_return_records`
--

CREATE TABLE `ns_account_return_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `return_type` int(11) NOT NULL DEFAULT '0' COMMENT '提成类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `is_display` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_calculate` int(11) NOT NULL DEFAULT '0' COMMENT '是否计算',
  `remark` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=910 DEFAULT CHARSET=utf8 COMMENT='平台的利润的记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_withdraw_records`
--

CREATE TABLE `ns_account_withdraw_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金额账户记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_withdraw_user_records`
--

CREATE TABLE `ns_account_withdraw_user_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_attribute`
--

CREATE TABLE `ns_attribute` (
  `attr_id` int(10) UNSIGNED NOT NULL COMMENT '商品属性ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `spec_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '关联规格',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='商品相关属性';

-- --------------------------------------------------------

--
-- 表的结构 `ns_attribute_value`
--

CREATE TABLE `ns_attribute_value` (
  `attr_value_id` int(11) UNSIGNED NOT NULL COMMENT '属性值ID',
  `attr_value_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_id` int(11) NOT NULL COMMENT '属性ID',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '属性对应相关数据',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '属性对应输入类型1.直接2.单选3.多选',
  `sort` int(11) NOT NULL DEFAULT '1999' COMMENT '排序号',
  `is_search` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用'
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8 COMMENT='商品属性值';

-- --------------------------------------------------------

--
-- 表的结构 `ns_cart`
--

CREATE TABLE `ns_cart` (
  `cart_id` int(11) NOT NULL COMMENT '购物车id',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '买家id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品的skuid',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品的sku名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `num` smallint(5) NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `bl_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '组合套装ID'
) ENGINE=InnoDB AVG_ROW_LENGTH=1170 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_click_fabulous`
--

CREATE TABLE `ns_click_fabulous` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `create_time` int(11) DEFAULT '0' COMMENT '点赞时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '点赞状态 0 未点赞 1 点赞',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='商品点赞记录表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_consult`
--

CREATE TABLE `ns_consult` (
  `consult_id` int(10) UNSIGNED NOT NULL COMMENT '咨询编号',
  `goods_id` int(11) UNSIGNED DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `ct_id` int(10) UNSIGNED NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询内容',
  `consult_reply` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询回复内容',
  `isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  `consult_addtime` int(11) DEFAULT '0' COMMENT '咨询发布时间',
  `consult_reply_time` int(11) DEFAULT '0' COMMENT '咨询回复时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8 COMMENT='咨询类型表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_consult_type`
--

CREATE TABLE `ns_consult_type` (
  `ct_id` int(10) UNSIGNED NOT NULL COMMENT '咨询类型id',
  `ct_name` varchar(50) NOT NULL DEFAULT '' COMMENT '咨询类型名称',
  `ct_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `ct_sort` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='咨询类型表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_coupon`
--

CREATE TABLE `ns_coupon` (
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `shop_id` int(11) NOT NULL COMMENT '店铺Id',
  `coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券编码',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '领用人',
  `use_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用订单id',
  `create_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `money` decimal(10,2) NOT NULL COMMENT '面额',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期',
  `get_type` int(11) NOT NULL DEFAULT '0' COMMENT '获取方式1订单2.首页领取',
  `fetch_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `use_time` int(11) DEFAULT '0' COMMENT '使用时间',
  `start_time` int(11) DEFAULT '0' COMMENT '有效期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '有效期结束时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=148 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_coupon_goods`
--

CREATE TABLE `ns_coupon_goods` (
  `id` int(11) NOT NULL,
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id'
) ENGINE=InnoDB AVG_ROW_LENGTH=606 DEFAULT CHARSET=utf8 COMMENT='优惠券使用商品表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_coupon_type`
--

CREATE TABLE `ns_coupon_type` (
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型Id',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `coupon_name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `money` decimal(10,2) NOT NULL COMMENT '发放面额',
  `count` int(11) NOT NULL COMMENT '发放数量',
  `max_fetch` int(11) NOT NULL DEFAULT '0' COMMENT '每人最大领取个数 0无限制',
  `at_least` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少元使用 0代表无限制',
  `need_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '领取人会员等级',
  `range_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用范围0部分产品使用 1全场产品使用',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否允许首页显示0不显示1显示',
  `start_time` int(11) DEFAULT '0' COMMENT '有效日期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '有效日期结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1365 DEFAULT CHARSET=utf8 COMMENT='优惠券类型表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_company`
--

CREATE TABLE `ns_express_company` (
  `co_id` int(11) NOT NULL COMMENT '表序号',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(20) NOT NULL DEFAULT '' COMMENT '物流编号',
  `is_enabled` int(11) NOT NULL DEFAULT '1' COMMENT '使用状态',
  `image` varchar(255) DEFAULT '' COMMENT '物流公司模版图片',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `orders` int(11) DEFAULT NULL,
  `express_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否设置为默认 0未设置 1 默认'
) ENGINE=InnoDB AVG_ROW_LENGTH=420 DEFAULT CHARSET=utf8 COMMENT='物流公司';

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_shipping`
--

CREATE TABLE `ns_express_shipping` (
  `sid` int(11) NOT NULL COMMENT '运单模版id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `template_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模版名称',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司 id',
  `size_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '尺寸类型 1像素px  2毫米mm',
  `width` smallint(6) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` smallint(6) NOT NULL DEFAULT '0' COMMENT '长度',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单图片'
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 COMMENT='运单模板';

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_shipping_items`
--

CREATE TABLE `ns_express_shipping_items` (
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '运单模版id',
  `field_name` varchar(30) NOT NULL COMMENT '字段名称',
  `field_display_name` varchar(255) NOT NULL COMMENT '打印项名称',
  `is_print` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否打印',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'x',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'y'
) ENGINE=InnoDB AVG_ROW_LENGTH=420 DEFAULT CHARSET=utf8 COMMENT='物流模板打印项';

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_shipping_items_library`
--

CREATE TABLE `ns_express_shipping_items_library` (
  `Id` int(11) NOT NULL COMMENT '物流模版打印项库ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `field_name` varchar(50) NOT NULL COMMENT '字段名',
  `field_display_name` varchar(50) NOT NULL COMMENT '字段显示名',
  `is_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用'
) ENGINE=InnoDB AVG_ROW_LENGTH=1260 DEFAULT CHARSET=utf8 COMMENT='物流模版打印项库';

--
-- 转存表中的数据 `ns_express_shipping_items_library`
--

INSERT INTO `ns_express_shipping_items_library` (`Id`, `shop_id`, `field_name`, `field_display_name`, `is_enabled`) VALUES
(1, 0, 'A1', '订单编号', b'1'),
(2, 0, 'A2', '发件人公司', b'1'),
(3, 0, 'A8', '收件人姓名', b'1'),
(4, 0, 'A10', '收件人邮编', b'1'),
(5, 0, 'A4', '发件人姓名', b'1'),
(6, 0, 'A3', '发件人地址', b'1'),
(7, 0, 'A9', '收件人电话', b'1'),
(8, 0, 'A12', '代收金额', b'1'),
(9, 0, 'A5', '发件人电话', b'1'),
(10, 0, 'A6', '发件人邮编', b'1'),
(11, 0, 'A7', '收件人地址', b'1'),
(12, 0, 'A11', '货到付款物流编号', b'1'),
(13, 0, 'A13', '备注', b'1');

-- --------------------------------------------------------

--
-- 表的结构 `ns_gift_grant_records`
--

CREATE TABLE `ns_gift_grant_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `gift_id` int(11) NOT NULL COMMENT '赠送活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠送商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '赠送商品名称',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '赠送商品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠送数量',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '发放方式',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放相关ID',
  `memo` text NOT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '赠送时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赠品发放记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods`
--

CREATE TABLE `ns_goods` (
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品id(SKU)',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) UNSIGNED NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(11) DEFAULT '0',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id',
  `sale_date` int(11) DEFAULT '0' COMMENT '上下架时间',
  `create_time` int(11) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT '0' COMMENT '最少买几件',
  `virtual_goods_type_id` int(11) DEFAULT '0' COMMENT '虚拟商品类型id',
  `production_date` int(11) NOT NULL DEFAULT '0' COMMENT '生产日期',
  `shelf_life` varchar(50) NOT NULL DEFAULT '' COMMENT '保质期'
) ENGINE=InnoDB AVG_ROW_LENGTH=16554 DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `ns_goods`
--

INSERT INTO `ns_goods` (`goods_id`, `goods_name`, `shop_id`, `category_id`, `category_id_1`, `category_id_2`, `category_id_3`, `brand_id`, `group_id_array`, `promotion_type`, `promote_id`, `goods_type`, `market_price`, `price`, `promotion_price`, `cost_price`, `point_exchange_type`, `point_exchange`, `give_point`, `is_member_discount`, `shipping_fee`, `shipping_fee_id`, `stock`, `max_buy`, `clicks`, `min_stock_alarm`, `sales`, `collects`, `star`, `evaluates`, `shares`, `province_id`, `city_id`, `picture`, `keywords`, `introduction`, `description`, `QRcode`, `code`, `is_stock_visible`, `is_hot`, `is_recommend`, `is_new`, `is_pre_sale`, `is_bill`, `state`, `sort`, `img_id_array`, `sku_img_array`, `match_point`, `match_ratio`, `real_sales`, `goods_attribute_id`, `goods_spec_format`, `goods_weight`, `goods_volume`, `shipping_fee_type`, `extend_category_id`, `extend_category_id_1`, `extend_category_id_2`, `extend_category_id_3`, `supplier_id`, `sale_date`, `create_time`, `update_time`, `min_buy`, `virtual_goods_type_id`, `production_date`, `shelf_life`) VALUES
(1, '阿士大夫撒地方', 0, 1, 1, 0, 0, 0, '', 0, 0, 1, '90.00', '80.00', '80.00', '50.00', 0, 0, 0, 0, '0.00', 0, 100, 0, 17, 10, 0, 0, 0, 0, 0, 0, 0, 1, '阿斯顿发大水', '第三发生的', '<p>俺的沙发</p>', 'upload/goods_qrcode/goods_qrcode_1.png', '', 1, 0, 0, 0, 0, 0, 1, 0, '1', '', NULL, NULL, 0, 0, '[]', '0.00', '0.00', 3, '', '', '', '', 0, 1567741083, 1567741083, 1567764009, 0, 0, 0, '0');

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_attribute`
--

CREATE TABLE `ns_goods_attribute` (
  `attr_id` int(10) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=315 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_attribute_deleted`
--

CREATE TABLE `ns_goods_attribute_deleted` (
  `attr_id` int(10) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=315 DEFAULT CHARSET=utf8 COMMENT='商品属性回收站表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_attribute_value`
--

CREATE TABLE `ns_goods_attribute_value` (
  `attr_value_id` int(11) NOT NULL COMMENT '商品属性值ID',
  `attr_id` int(11) NOT NULL COMMENT '商品属性ID',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '值名称',
  `is_visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可视',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=1092 DEFAULT CHARSET=utf8 COMMENT='商品规格值模版表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_brand`
--

CREATE TABLE `ns_goods_brand` (
  `brand_id` bigint(20) NOT NULL COMMENT '索引ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) NOT NULL COMMENT '品牌首字母',
  `brand_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `brand_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `sort` int(11) DEFAULT NULL,
  `brand_category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名称',
  `category_id_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '所属分类id组',
  `brand_ads` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌推荐广告',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌所属分类名称',
  `category_id_1` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `category_id_2` int(11) NOT NULL DEFAULT '0' COMMENT '二级分类ID',
  `category_id_3` int(11) NOT NULL DEFAULT '0' COMMENT '三级分类ID'
) ENGINE=InnoDB AVG_ROW_LENGTH=1024 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_category`
--

CREATE TABLE `ns_goods_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL DEFAULT '',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品分类简称 ',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联商品类型ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '关联类型名称',
  `fenrunprice` int(10) NOT NULL COMMENT '分润价格',
  `is_jieyu` int(11) NOT NULL DEFAULT '1' COMMENT '1显示结余0不显示结余',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片'
) ENGINE=InnoDB AVG_ROW_LENGTH=244 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

--
-- 转存表中的数据 `ns_goods_category`
--

INSERT INTO `ns_goods_category` (`category_id`, `category_name`, `short_name`, `pid`, `level`, `is_visible`, `attr_id`, `attr_name`, `fenrunprice`, `is_jieyu`, `keywords`, `description`, `sort`, `category_pic`) VALUES
(1, '个性头像丫', '个性', 0, 1, 1, 0, '', 7, 1, '个性', '个性头像', 3, ''),
(2, '香香壁纸', '香香', 0, 1, 1, 0, '', 7, 1, '香香', '香香壁纸', 4, ''),
(3, '个性潮图', '个性潮图', 0, 1, 1, 0, '', 7, 1, '个性,潮图', '个性潮图', 5, ''),
(5, '淘宝', '淘宝', 0, 1, 1, 0, '', 0, 1, '淘宝', '淘宝', 6, ''),
(6, '星云潮图', '星云潮图', 0, 1, 1, 0, '', 7, 1, '星云潮图', '星云潮图', 1, ''),
(7, '代理', '代理', 0, 1, 1, 0, '', 0, 1, '', '', 7, ''),
(8, '星云潮图7', '星云潮图7', 0, 1, 1, 0, '', 7, 1, '', '', 2, ''),
(9, '代理7', '代理7', 0, 1, 1, 0, '', 0, 1, '', '', 8, ''),
(10, '巧巧潮图', '巧巧潮图', 0, 1, 1, 0, '', 7, 1, '', '', 9, '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_category_block`
--

CREATE TABLE `ns_goods_category_block` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `category_alias` varchar(50) NOT NULL DEFAULT '' COMMENT '分类别名',
  `color` varchar(255) DEFAULT '#FFFFFF' COMMENT '颜色',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1显示 0 不显示',
  `is_show_lower_category` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示下级分类',
  `is_show_brand` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示品牌',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `ad_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图  {["title":"","subtitle":"","picture":"","url":"","background":""]}',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `short_name` varchar(255) DEFAULT '' COMMENT '分类简称',
  `goods_sort_type` int(11) NOT NULL DEFAULT '0' COMMENT '楼层商品排序方式 0默认按时间和排序号倒叙 1按发布时间排序 2按销量排序 3按排序号排序 4按人气排序'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='商品分类楼层表';

--
-- 转存表中的数据 `ns_goods_category_block`
--

INSERT INTO `ns_goods_category_block` (`id`, `shop_id`, `category_name`, `category_id`, `category_alias`, `color`, `is_show`, `is_show_lower_category`, `is_show_brand`, `sort`, `ad_picture`, `create_time`, `modify_time`, `short_name`, `goods_sort_type`) VALUES
(3, 0, '个性头像丫', 1, '个性头像丫', '#FFFFFF', 1, 0, 0, 0, '', 1567649894, 1568872972, '个性头像', 0),
(4, 0, '香香壁纸', 2, '香香壁纸', '#FFFFFF', 1, 0, 0, 0, '', 1567650003, 1568872974, '香香壁纸', 0),
(5, 0, '个性潮图', 3, '个性潮图', '#FFFFFF', 1, 0, 0, 0, '', 1567650063, 1568872975, '个性潮图', 0),
(7, 0, '淘宝', 5, '淘宝', '#FFFFFF', 1, 0, 0, 0, '', 1567650377, 1569487239, '淘宝', 0),
(8, 0, '星云潮图', 6, '星云潮图', '#FFFFFF', 1, 0, 0, 0, '', 1568085511, 1568703272, '星云潮图', 0),
(9, 0, '代理', 7, '代理', '#FFFFFF', 1, 0, 0, 0, '', 1568448327, 1568872978, '代理', 0),
(10, 0, '星云潮图7', 8, '星云潮图7', '#FFFFFF', 1, 0, 0, 0, '', 1568448355, 1568872965, '星云潮图', 0),
(11, 0, '代理7', 9, '代理7', '#FFFFFF', 1, 0, 0, 0, '', 1568908498, 1568908506, '代理7', 0),
(12, 0, '巧巧潮图', 10, '巧巧潮图', '#FFFFFF', 1, 0, 0, 0, '', 1569921029, 1569989069, '巧巧潮图', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_comment`
--

CREATE TABLE `ns_goods_comment` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `create_time` int(11) DEFAULT '0' COMMENT '评论创建时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '评论状态 0未评论 1已评论',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='商品评论送积分记录表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_deleted`
--

CREATE TABLE `ns_goods_deleted` (
  `goods_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品id(SKU)',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) UNSIGNED NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(1) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id',
  `sale_date` int(11) DEFAULT '0' COMMENT '上下架时间',
  `create_time` int(11) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT '0' COMMENT '最少买几件',
  `virtual_goods_type_id` int(11) DEFAULT '0' COMMENT '虚拟商品类型id',
  `production_date` int(11) NOT NULL DEFAULT '0' COMMENT '生产日期',
  `shelf_life` varchar(50) NOT NULL DEFAULT '' COMMENT '保质期'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='商品回收站表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_evaluate`
--

CREATE TABLE `ns_goods_evaluate` (
  `id` int(11) NOT NULL COMMENT '评价ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` bigint(20) UNSIGNED NOT NULL COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_image` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `image` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价图片',
  `explain_first` varchar(255) NOT NULL DEFAULT '' COMMENT '解释内容',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '评价人名称',
  `uid` int(11) NOT NULL COMMENT '评价人编号',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `again_content` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价内容',
  `again_image` varchar(1000) NOT NULL DEFAULT '' COMMENT '追评评价图片',
  `again_explain` varchar(255) NOT NULL DEFAULT '' COMMENT '追加解释内容',
  `explain_type` int(11) DEFAULT '0' COMMENT '1好评2中评3差评',
  `is_show` int(1) DEFAULT '1' COMMENT '1显示 0隐藏',
  `addtime` int(11) DEFAULT '0' COMMENT '评价时间',
  `again_addtime` int(11) DEFAULT '0' COMMENT '追加评价时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8 COMMENT='商品评价表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_group`
--

CREATE TABLE `ns_goods_group` (
  `group_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id 最多2级',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别',
  `is_visible` int(1) NOT NULL DEFAULT '1' COMMENT '是否可视',
  `group_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=160 DEFAULT CHARSET=utf8 COMMENT='商品本店分类';

--
-- 转存表中的数据 `ns_goods_group`
--

INSERT INTO `ns_goods_group` (`group_id`, `shop_id`, `group_name`, `pid`, `level`, `is_visible`, `group_pic`, `sort`) VALUES
(1, 0, '', 0, 1, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku`
--

CREATE TABLE `ns_goods_sku` (
  `sku_id` int(11) NOT NULL COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_date` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=481 DEFAULT CHARSET=utf8 COMMENT='商品skui规格价格库存信息表';

--
-- 转存表中的数据 `ns_goods_sku`
--

INSERT INTO `ns_goods_sku` (`sku_id`, `goods_id`, `sku_name`, `attr_value_items`, `attr_value_items_format`, `market_price`, `price`, `promote_price`, `cost_price`, `stock`, `picture`, `code`, `QRcode`, `create_date`, `update_date`) VALUES
(1, 1, '', '', '', '90.00', '80.00', '80.00', '50.00', 100, 0, '', '', 1567741084, 1567764009);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku_deleted`
--

CREATE TABLE `ns_goods_sku_deleted` (
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_date` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8 COMMENT='商品skui规格价格库存信息回收站表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku_picture`
--

CREATE TABLE `ns_goods_sku_picture` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品sku多图';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku_picture_delete`
--

CREATE TABLE `ns_goods_sku_picture_delete` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8 COMMENT='商品sku多图';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_spec`
--

CREATE TABLE `ns_goods_spec` (
  `spec_id` int(11) NOT NULL COMMENT '属性ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `show_type` int(11) NOT NULL DEFAULT '1' COMMENT '展示方式 1 文字 2 颜色 3 图片',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `is_screen` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否参与筛选 0 不参与 1 参与'
) ENGINE=InnoDB AVG_ROW_LENGTH=3276 DEFAULT CHARSET=utf8 COMMENT='商品属性（规格）表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_spec_value`
--

CREATE TABLE `ns_goods_spec_value` (
  `spec_value_id` int(11) NOT NULL COMMENT '商品属性值ID',
  `spec_id` int(11) NOT NULL COMMENT '商品属性ID',
  `spec_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值名称',
  `spec_value_data` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值数据',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=1092 DEFAULT CHARSET=utf8 COMMENT='商品规格值模版表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_ke`
--

CREATE TABLE `ns_ke` (
  `id` int(10) NOT NULL,
  `xinghao` varchar(255) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `caizhi` char(1) DEFAULT NULL COMMENT '材质1表示磨砂2表示玻璃',
  `price` decimal(10,2) DEFAULT NULL COMMENT '零售价',
  `chengben` decimal(10,2) DEFAULT NULL COMMENT '成本',
  `shunfeng` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是顺丰，1表示是顺丰',
  `youfei` int(11) DEFAULT NULL COMMENT '邮费',
  `fenrunprice` int(11) DEFAULT NULL COMMENT '分润单价',
  `lirun` decimal(10,2) DEFAULT '0.00' COMMENT '利润',
  `descs` varchar(255) DEFAULT NULL COMMENT '备注',
  `ordertime` int(10) DEFAULT NULL COMMENT '下单日期',
  `ordernum` varchar(20) DEFAULT NULL COMMENT '订单号',
  `categoryid` int(11) DEFAULT NULL COMMENT '类别id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ns_ke`
--

INSERT INTO `ns_ke` (`id`, `xinghao`, `num`, `caizhi`, `price`, `chengben`, `shunfeng`, `youfei`, `fenrunprice`, `lirun`, `descs`, `ordertime`, `ordernum`, `categoryid`) VALUES
(17, 'vivo Y 97', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1568690833, '152592487', 8),
(16, 'vivo Y 97', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568690811, '152592487', 8),
(15, '华为nova 5pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568690604, '152592486', 8),
(14, '6sP', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568690485, '152592485', 8),
(18, 'xs', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568691045, '152592488', 8),
(19, 'oppo  R9 Plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568691160, '152592489', 8),
(20, '荣耀20', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568691326, '152592490', 8),
(21, '苹果xr', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568691724, '152592491', 8),
(22, '8p', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '支付宝收款', 1568691948, '152592492', 8),
(23, 'iPhone x', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568692100, '152592493', 8),
(24, '华为P20', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568692224, '152592494', 8),
(25, 'Iphone X r', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568692326, '152592495', 8),
(26, 'vivoX27', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568692671, '152592496', 8),
(27, 'vivoz5x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568692917, '152592497', 8),
(28, 'vivo X20plus', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568693146, '152592498', 8),
(31, 'vivo  x23', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568694577, '152592499', 8),
(32, '苹果xsmax', 1, '1', '29.90', '4.00', 0, 0, 7, '18.90', '', 1568694609, '152592499', 8),
(33, '华为荣耀play', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568695025, '152592500', 2),
(34, 'vivox27pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568695153, '152592501', 2),
(35, 'vivo Z5x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568696066, '152592502', 1),
(36, 'OPPOR17', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568696241, '152592503', 1),
(37, '苹果7p', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568696364, '152592504', 1),
(38, 'oppo reno', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568696491, '152592505', 1),
(39, '苹果6SP', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568697276, '152592506', 3),
(40, ' vivo X27', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568698367, '152592507', 6),
(41, '华为Mate20', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568698436, '152592508', 6),
(42, 'ViVOX23幻彩版', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568698543, '152592509', 6),
(43, '苹果6', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568698629, '152592510', 6),
(44, 'oppo  A83', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568700099, '152592511', 8),
(45, 'vivoX21', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1568700536, '152592512', 5),
(46, '苹果6SP', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568804696, '152592513', 3),
(47, 'Vivo    y97', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568806554, '152592514', 3),
(48, '华为nova5', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568807057, '152592515', 6),
(49, '华为nova5', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1568807085, '152592515', 6),
(50, '华为p20', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1568807214, '152592516', 7),
(51, 'xsmax', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568807507, '152592517', 6),
(52, '7p', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1568807541, '152592517', 6),
(53, '华为nova5', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568807645, '152592518', 6),
(54, 'oppo r17', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568807802, '152592519', 6),
(55, 'OPPOA37m', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568807943, '152592520', 6),
(56, ' oppoA9', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568808053, '152592521', 6),
(57, 'vivox7plus', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568808147, '152592522', 6),
(58, 'vivo x21后置指纹版', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568808246, '152592523', 6),
(59, 'Vivo  x21后', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568808733, '152592524', 1),
(60, '华为p30pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568764800, '152592525', 1),
(61, '华为nova5i', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568809172, '152592526', 1),
(62, 'vivoY93', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568809333, '152592527', 1),
(63, '8P', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568898600, '152592528', 3),
(70, 'nova3', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568903775, '152592534', 6),
(65, '6S PLUS', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568899927, '152592530', 6),
(66, 'vivoY93', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '支付宝', 1568813894, '152592531', 6),
(67, 'vivox21后置', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568901833, '152592533', 6),
(68, '华为P30', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568903008, '152592529', 6),
(69, 'vivoY83', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568903139, '152592535', 6),
(71, 'vivo x27', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568906810, '152592536', 3),
(72, '苹果XR', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568821381, '152592537', 8),
(73, 'σppoRenoz', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568821648, '152592538', 8),
(74, 'σppoRenoz', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1568821676, '152592538', 8),
(75, 'iPhone XR', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568821931, '152592539', 8),
(76, 'oppo A9', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568822303, '152592540', 9),
(77, '苹果X', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568736001, '152592541', 9),
(78, '苹果X', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568736274, '152592542', 9),
(79, '苹果xr', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568736406, '152592543', 9),
(80, 'oppor17', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568736525, '152592544', 8),
(81, '0PP0R17', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1568736673, '152592545', 9),
(82, '小米play ', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1568736800, '152592546', 9),
(83, 'vivo x20', 1, '1', '21.90', '4.00', 0, 0, 0, '17.90', '', 1568736840, '152592546', 9),
(84, 'OPPO Reno', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568823937, '152592547', 8),
(85, '苹果xs', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1568824037, '152592547', 8),
(86, 'p30', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568738578, '152592548', 8),
(87, 'oppo A5', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568739514, '152592550', 2),
(88, '华为p30', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568739640, '152592551', 2),
(89, 'XS MAX', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568739712, '152592549', 8),
(90, 'XS MAX', 1, '1', '29.90', '4.00', 0, 0, 7, '18.90', '', 1568739779, '152592549', 8),
(91, 'nova4', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568894279, '152592532', 6),
(92, '华为nova4e', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568862310, '152592553', 2),
(93, '华为nova4e', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1568863064, '152592553', 2),
(94, '红米note5', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568863195, '152592554', 2),
(95, '苹果6sp', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568863353, '152592555', 2),
(96, 'OPPO Reno', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568864018, '152592556', 2),
(97, '苹果X', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568864188, '152592557', 9),
(98, '苹果7', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568864280, '152592558', 9),
(99, 'vivox9s', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568864714, '152592559', 8),
(100, '苹果7P', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1568864749, '152592559', 8),
(101, ' oppor15', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568864862, '152592560', 8),
(102, '苹果XR', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568864977, '152592561', 8),
(103, '华为P20  pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568865069, '152592562', 8),
(104, '华为畅想9plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568865241, '152592563', 8),
(105, '苹果7 plus', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568865373, '152592564', 9),
(106, '苹果6S plus', 1, '2', '21.90', '9.00', 0, 0, 0, '12.90', '', 1568865410, '152592564', 9),
(107, 'vivo x23幻彩', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568865859, '152592565', 8),
(108, '华为P30', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568867378, '152592566', 8),
(109, '苹果7plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568866493, '152592567', 8),
(110, 'OPPOFDX', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568867047, '152592568', 8),
(111, 'OPPOr17', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568867535, '152592569', 8),
(112, 'OPPOr17', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1568867555, '152592569', 8),
(113, '7p', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568868249, '152592570', 8),
(114, '苹果Xs  max', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568868387, '152592571', 8),
(115, 'oppor11plus', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568868477, '152592572', 8),
(116, '华为p20pro ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568868511, '152592573', 8),
(117, 'vivoy7s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568868791, '152592574', 8),
(118, '苹果xr', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568869055, '152592575', 8),
(119, 'oppor17', 2, '1', '59.80', '4.00', 0, 4, 0, '47.80', '', 1568869540, '152592576', 5),
(120, 'oppo a73', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1568869714, '152592577', 5),
(121, 'OPPO   R15', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568973484, '152592578', 1),
(122, '华为P30por', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568973590, '152592579', 1),
(123, '苹果x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568973697, '152592580', 1),
(124, 'oppo r11s plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568973785, '152592581', 1),
(125, '华为nova3', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568973873, '152592582', 1),
(126, 'OPPOR15', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1568973957, '152592583', 3),
(127, '荣耀8x max', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568975337, '152592584', 6),
(128, '苹果6sp', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568975502, '152592585', 6),
(129, '华为畅享9PⅠus', 1, '1', '22.00', '4.00', 0, 4, 0, '14.00', '', 1568975627, '152592586', 7),
(130, '苹果8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568975769, '152592587', 6),
(131, 'vivox9l', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568948459, '152592588', 7),
(132, 'OPPO Reno Z', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568976045, '152592589', 7),
(133, 'vivonex后置指纹的', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568976483, '152592590', 2),
(134, 'OPPO A5', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568976587, '152592591', 2),
(135, '华为p30pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568976732, '152592592', 2),
(136, '华为p30pro', 1, '1', '29.90', '4.00', 0, 0, 7, '18.90', '', 1568976764, '152592592', 2),
(137, 'vivox21A  后', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568946650, '152592593', 8),
(138, 'oppo r9p', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568948360, '152592594', 8),
(139, '华为nova5pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568948591, '152592595', 8),
(140, 'OPPOR17', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568948739, '152592596', 9),
(141, 'nova5i', 1, '1', '24.90', '4.00', 0, 4, 0, '16.90', '', 1568948867, '152592597', 9),
(142, 'oppor17', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568949185, '152592598', 8),
(143, 'oppo r17', 1, '1', '29.90', '4.00', 0, 0, 7, '18.90', '', 1568949635, '152592598', 8),
(144, 'vivo  Y3', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568950268, '152592599', 8),
(145, 'iPhone Xs Max', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568950462, '152592600', 8),
(146, 'vlvox7', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568950617, '152592601', 8),
(147, '苹果7p', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568950766, '152592602', 8),
(148, '苹果7 plus', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1568950847, '152592603', 9),
(149, 'vivo x23', 1, '2', '21.90', '9.00', 0, 0, 0, '12.90', '', 1568950884, '152592603', 9),
(150, 'vivox9s plus', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1568950987, '152592604', 8),
(151, '苹果6', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1568951256, '152592605', 9),
(152, '6P ', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1568951398, '152592606', 8),
(153, 'vivo   Y66', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1568951585, '152592607', 8),
(186, 'vivox23幻彩版', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569119230, '152592635', 6),
(155, 'oppo   Reno', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1568953083, '152592608', 5),
(161, '畅想9', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569070484, '152592609', 6),
(162, '小米8', 2, '2', '43.80', '9.00', 0, 4, 0, '21.80', '', 1569070604, '152592610', 7),
(163, '苹果7p', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1569070779, '152592611', 7),
(160, '小米8', 2, '2', '43.80', '9.00', 0, 4, 0, '21.80', '', 1569070128, '152592597', 7),
(164, 'vivoNEX', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569070945, '152592612', 6),
(165, 'vivo   X7', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569071352, '152592613', 6),
(166, '8p ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569071231, '152592614', 6),
(167, 'xr', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569071437, '152592615', 3),
(168, 'vivo Z3i', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569071520, '152592616', 3),
(169, '华为畅享9plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569071597, '152592617', 3),
(170, '苹果XSmax', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569071943, '152592618', 1),
(171, '畅享八', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569072072, '152592619', 1),
(172, '荣耀8x', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569072659, '152592620', 2),
(173, 'vivoX23', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569072932, '152592621', 2),
(174, 'vivo x21i A', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569073158, '152592622', 2),
(175, '苹果6s', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569073317, '152592623', 2),
(176, '华为nova5pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '支付宝收款', 1569073467, '152592624', 2),
(177, '苹果8', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569073700, '152592625', 8),
(178, '华为9puls ', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569073815, '152592626', 8),
(179, '苹果8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569073931, '152592627', 8),
(180, 'oppor11s', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569074035, '152592628', 8),
(181, '华为9xpro', 2, '2', '59.80', '9.00', 0, 4, 7, '23.80', '', 1569074369, '152592629', 8),
(182, '苹果8p', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569074475, '152592630', 8),
(183, '8p', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569074537, '152592631', 8),
(184, '华为mate5pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569074609, '152592632', 8),
(185, 'oppor17', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1569075282, '152592633', 5),
(187, '8p', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569119380, '152592636', 6),
(188, 'oppo r15', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569119539, '152592637', 6),
(189, 'oppokl', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569119705, '152592638', 6),
(190, '华为nova3', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569119904, '152592639', 6),
(191, 'VIVOx23幻彩', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1569120042, '152592640', 7),
(192, 'VIVOx23幻彩', 1, '2', '21.90', '9.00', 0, 0, 0, '12.90', '', 1569120143, '152592640', 7),
(193, 'vivo x23', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569120488, '152592642', 6),
(194, '华为nova2s', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569120733, '152592641', 6),
(195, '华为荣耀9XPro', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1569121233, '152592643', 7),
(196, 'iPhoneXR', 1, '1', '21.90', '4.00', 0, 0, 0, '17.90', '', 1569121300, '152592643', 7),
(197, 'vivox23', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569121458, '152592644', 6),
(198, 'OPPO r 17', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569121543, '152592645', 6),
(199, '苹果7P', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569121654, '152592646', 6),
(200, '华为Mate20x', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569121988, '152592647', 3),
(201, '苹果XR ', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569122198, '152592648', 1),
(202, 'vivoY55', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569122812, '152592650', 2),
(203, '华为荣耀play', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569122988, '152592651', 2),
(204, 'OPPO Reno', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569123350, '152592649', 1),
(205, 'OPPO Reno', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1569123394, '152592649', 1),
(206, 'HUAWEInova3i', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1569124460, '152592652', 2),
(207, 'oppo r17', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1569124566, '152592652', 2),
(208, 'OPPO r15梦境版', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569124993, '152592653', 8),
(209, '苹果8P', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569125087, '152592654', 8),
(210, 'oppo reno', 1, '1', '24.90', '4.00', 0, 4, 0, '16.90', '', 1569125580, '152592655', 9),
(211, 'iphone 7', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1569125602, '152592656', 9),
(212, 'vivo X7', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569125738, '152592657', 8),
(213, '苹果6sp', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569126096, '152592658', 8),
(214, '华为mate20', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569126583, '152592634', 8),
(215, 'HUAWEI nova3i', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569126936, '152592659', 8),
(216, 'iPhone Xs Max', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569127476, '152592660', 8),
(217, 'vivoX23', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569127588, '152592661', 8),
(218, 'oppo r9', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569200013, '152592663', 6),
(219, '华为p30', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569200134, '152592664', 6),
(220, '华为p20pro', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1569200254, '152592665', 7),
(221, '苹果8plus', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1569200402, '152592666', 6),
(222, '华为nova5i ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569200540, '152592667', 6),
(223, 'oppoR11s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569200588, '152592668', 6),
(224, '苹果8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569200729, '152592669', 6),
(225, 'OPPO A57', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569201052, '152592670', 1),
(227, 'oppo a5', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569201369, '152592671', 1),
(228, '苹果6splus', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569201511, '152592672', 2),
(229, 'vivox9', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569201733, '152592673', 2),
(230, 'OPPOR17', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569201818, '152592674', 2),
(231, 'vivoX23', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569201884, '152592675', 2),
(232, '6splus ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '支付宝', 1569202136, '152592676', 6),
(233, '小米MIX3', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569202251, '152592677', 8),
(234, 'iPhone 6Plus', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569202359, '152592678', 8),
(235, 'OPPO r17', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569202490, '152592679', 8),
(236, '8p', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1569202628, '152592680', 5),
(237, '华为mate20', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569328148, '152592681', 6),
(238, 'oppo  reno', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569328513, '152592682', 6),
(239, 'P30pr0', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569329652, '152592683', 6),
(240, '8p', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1569329703, '152592683', 6),
(241, '苹果xr', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569330126, '152592684', 6),
(242, '华为magic 2', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569330459, '152592685', 3),
(243, 'vivez3i', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569331298, '152592686', 1),
(244, '三星s10+', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569331432, '152592687', 1),
(245, 'OPPO r 17', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1569337944, '152592688', 1),
(472, '苹果7P', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569766397, '152592883', 8),
(247, 'vivo x27', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569333290, '152592690', 2),
(248, 'vivo  Y97', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569333400, '152592691', 2),
(249, '华为荣耀play', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569333554, '152592692', 2),
(250, 'iphone6s plus', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569333643, '152592693', 2),
(251, '华为p20pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569334440, '152592694', 8),
(252, '华为nova4', 1, '1', '29.90', '4.00', 0, 0, 7, '18.90', '', 1569334474, '152592694', 8),
(253, '华为mate20pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569335217, '152592695', 8),
(254, '苹果xr', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569335470, '152592696', 8),
(255, '小米8se', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569335618, '152592697', 8),
(256, '小米mix3', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569335830, '152592698', 8),
(257, '苹果XR', 2, '2', '59.80', '9.00', 0, 4, 7, '23.80', '', 1569335996, '152592699', 8),
(258, '华为P20pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569336236, '152592700', 8),
(259, 'opporeno', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569336539, '152592701', 8),
(260, '小米5X', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569336673, '152592702', 8),
(261, 'xsmax', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1569338378, '152592703', 5),
(262, '7p', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1569338460, '152592704', 5),
(263, 'vivo x23', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569383418, '152592705', 6),
(264, '苹果8', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569383641, '152592706', 6),
(265, '苹果8P', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1569383664, '152592706', 6),
(266, '小米6x', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569383925, '152592707', 6),
(267, 'nova 5 Pro', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569384770, '152592708', 6),
(268, 'OPPOR17', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569385087, '152592709', 3),
(269, '华为mate20pro', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569385227, '152592710', 3),
(270, 'oppoR9s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569385325, '152592711', 3),
(271, '华为荣耀9x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569385454, '152592712', 3),
(272, '华为荣耀8X', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569385867, '152592713', 1),
(273, 'Xs  max', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569386527, '152592714', 2),
(274, '苹果Xs   MAX', 2, '1', '59.80', '4.00', 0, 4, 7, '33.80', '', 1569387559, '152592715', 8),
(275, '苹果Xs   MAX', 2, '2', '59.80', '9.00', 0, 0, 7, '27.80', '', 1569387586, '152592715', 8),
(276, 'OPPO r 17', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569388610, '152592716', 8),
(277, 'OPPO A7x', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569388673, '152592717', 8),
(278, '苹果6puls ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569388864, '152592718', 8),
(279, '小米九', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569389036, '152592719', 8),
(280, 'oppoR15梦境版', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569390729, '152592720', 8),
(281, '苹果XS', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569390843, '152592721', 8),
(282, 'OPPO R11Plus', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569390955, '152592722', 8),
(283, '苹果XR', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569391041, '152592723', 8),
(284, 'vivoy93', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569391136, '152592724', 8),
(285, 'vivoIQooneo', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1569391169, '152592724', 8),
(286, '苹果8p', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569391332, '152592725', 8),
(287, '苹果xsMax', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1569391359, '152592725', 8),
(288, '苹果11', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569391593, '152592726', 8),
(289, '荣耀note10', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569487779, '152592727', 6),
(290, '华为P30  Pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569487876, '152592728', 6),
(291, 'ipone7', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569487986, '152592729', 6),
(292, 'oppo r15', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1569488018, '152592729', 6),
(293, '7p', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1569488250, '152592730', 6),
(294, 'vivo x23', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569488332, '152592731', 6),
(295, 'OPPOr9s ', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569488567, '152592732', 3),
(296, 'OPPOr15', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1569488598, '152592732', 3),
(297, 'vivo x23', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569489083, '152592733', 3),
(298, ':vivoY7s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569489265, '152592734', 3),
(299, '华为nova5pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569489387, '152592735', 3),
(300, 'OPPOR17', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569489620, '152592736', 1),
(301, '机OPPOR15X', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569489849, '152592737', 1),
(302, '苹果7p', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569489936, '152592738', 1),
(303, '华为P30pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569490014, '152592739', 1),
(304, '7p', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569490190, '152592740', 1),
(305, '8p', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1569490209, '152592740', 1),
(306, '华为nove2s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569490433, '152592741', 1),
(307, 'vivo z3i', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1569490464, '152592741', 1),
(308, '魅族16thplus', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569490659, '152592742', 1),
(309, '荣耀10lite', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569491005, '152592743', 2),
(310, 'oppor15梦境版', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569492012, '152592744', 8),
(311, '苹果X', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569492214, '152592745', 8),
(312, 'nova4', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569492296, '152592746', 8),
(313, 'oppo r15x', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569492618, '152592747', 8),
(314, '7p', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1569492641, '152592747', 8),
(315, 'vivo nex 后置', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1569492794, '152592748', 5),
(316, 'oppoa9x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569540181, '152592749', 6),
(317, '苹果XR', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1569540328, '152592750', 6),
(318, 'xs max', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569540462, '152592751', 6),
(319, 'xs max', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1569540488, '152592751', 6),
(320, '苹果×', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569540649, '152592752', 3),
(321, '华为p20pro', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1569540682, '152592752', 3),
(322, '苹果Xsmax', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1569540740, '152592752', 3),
(323, '华为畅享10plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569541121, '152592753', 1),
(324, '苹果X', 1, '1', '44.90', '4.00', 1, 7, 7, '26.90', '', 1569541545, '152592754', 8),
(325, '华为p30pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569541674, '152592755', 8),
(326, '华为荣耀V20', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569541752, '152592756', 8),
(327, 'oppor17', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569541854, '152592757', 8),
(328, '苹果7P', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1569541886, '152592757', 8),
(329, 'vivoX20', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569542035, '152592758', 8),
(330, '苹果7plus', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1569542683, '152592759', 5),
(331, '小米9se', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569542944, '152592760', 8),
(332, 'vivo z3i', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569651178, '152592761', 6),
(333, 'OPPO   R15标版', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569651286, '152592762', 6),
(334, 'OPPO   R15标版', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569651348, '152592762', 6),
(335, 'VivoxpLay6', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569651484, '152592763', 6),
(336, '华为nove4', 1, '1', '35.00', '4.00', 1, 7, 4, '20.00', '', 1569651693, '152592764', 6),
(337, '苹果8p', 1, '1', '20.00', '4.00', 0, 0, 4, '12.00', '', 1569651719, '152592764', 6),
(338, 'oppo R17', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569651976, '152592765', 6),
(339, 'oppo R17', 1, '1', '19.90', '4.00', 0, 0, 4, '11.90', '', 1569651999, '152592765', 6),
(340, 'oppo R17', 1, '1', '19.90', '4.00', 0, 0, 4, '11.90', '', 1569652035, '152592765', 6),
(341, '7P', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569652229, '152592766', 6),
(342, 'VIVOX27', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569652309, '152592767', 6),
(343, 'OPPO  R15', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569652488, '152592768', 6),
(344, 'iPhone Xs Max', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569652578, '152592769', 6),
(345, '华为nova3', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569652724, '152592770', 6),
(346, 'viv0x21', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569652810, '152592771', 6),
(347, '7p', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569652830, '152592771', 6),
(348, '苹果Xr', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569652902, '152592772', 6),
(349, 'vivoX27', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569652977, '152592773', 6),
(350, '苹果6', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569653107, '152592774', 6),
(351, 'vivo X21 iA', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569653216, '152592775', 6),
(352, 'oppo R11plus', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569653281, '152592776', 6),
(353, '苹果6', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569653355, '152592777', 6),
(354, '华为P30pro', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569653666, '152592778', 3),
(355, 'oppoR15梦境版', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569653779, '152592779', 3),
(356, 'vivo x21i', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569653885, '152592780', 3),
(357, 'vivoX23', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569653981, '152592781', 3),
(358, 'OPPOA59s', 1, '1', '20.00', '4.00', 0, 0, 4, '12.00', '', 1569654001, '152592781', 3),
(359, 'vivoX9', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569654074, '152592782', 3),
(360, 'OPPO R17', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1569654145, '152592783', 3),
(361, '华为p30', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1569654304, '152592784', 3),
(362, 'oppo  reno  ', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569654383, '152592785', 3),
(363, '小米九', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569654469, '152592786', 3),
(364, '华为荣耀10', 1, '1', '19.90', '4.00', 0, 0, 4, '11.90', '', 1569654496, '152592786', 3),
(365, '荣耀V20', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569654618, '152592787', 3),
(366, 'vivo y97', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569654713, '152592788', 3),
(367, 'xr', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569654875, '152592789', 3),
(368, 'iPhone7', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569655091, '152592790', 1),
(369, '小米mix3', 1, '2', '20.00', '9.00', 0, 0, 4, '7.00', '', 1569655119, '152592790', 1),
(370, 'vivoY79', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569655186, '152592791', 1),
(371, 'HUAWEI Mate 10 Pro', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569655255, '152592792', 1),
(372, '果8p', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569655318, '152592793', 1),
(373, 'vivoiq00', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569655464, '152592794', 1),
(374, 'oppo  r17', 2, '1', '40.00', '4.00', 0, 4, 4, '20.00', '', 1569655635, '152592795', 1),
(375, '苹果6s  plus', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569655762, '152592796', 1),
(376, 'oppo a1', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569655848, '152592797', 1),
(377, 'iPhone7P', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569656270, '152592798', 1),
(378, 'iPhone7P', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569656291, '152592798', 1),
(379, '苹果xr', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1569657213, '152592799', 2),
(380, 'OPPOA5', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569657461, '152592800', 2),
(381, 'iphone8p', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569657825, '152592801', 8),
(382, '荣耀20i', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569657934, '152592802', 8),
(383, '华为nova5pro ', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569657989, '152592803', 8),
(384, '小米MIX3', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569658066, '152592804', 8),
(385, 'iphone 6s plus', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569744528, '152592805', 8),
(386, 'vivox 23幻彩版', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569658235, '152592806', 8),
(387, 'vivox 23幻彩版', 1, '2', '20.00', '9.00', 0, 0, 4, '7.00', '', 1569658257, '152592806', 8),
(388, 'vivo x9s plus', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569658292, '152592807', 8),
(389, 'OPPO r 15星云渐变', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569658538, '152592808', 8),
(390, 'nava5 ', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569658604, '152592809', 8),
(391, 'iPhone 8', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569658751, '152592810', 8),
(392, 'vivo幻彩版x23', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569658818, '152592811', 8),
(393, 'P30por', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569658925, '152592812', 8),
(394, '华为畅享9 Plus', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569659027, '152592813', 8),
(395, 'vivox21屏幕指纹', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569659090, '152592814', 8),
(396, '苹果7plus', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569659159, '152592815', 8),
(397, 'r15标准版', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569659278, '152592816', 8),
(398, 'x27', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569659374, '152592817', 8),
(399, '华为mate10', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569659497, '152592818', 8),
(400, 'vivox23', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569659589, '152592819', 8),
(401, 'vivox27', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569659610, '152592819', 8),
(402, '荣耀8X', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569659696, '152592820', 8),
(403, '荣耀8X', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569659802, '152592821', 8),
(404, 'iPhone8plus', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569659885, '152592822', 8),
(405, 'oppor17', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569660096, '152592823', 8),
(406, '苹果7', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569660154, '152592824', 8),
(407, 'OPpOA9 ', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569660233, '152592825', 8),
(408, 'oppo reno ', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569660358, '152592826', 8),
(409, 'opporeno', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569660403, '152592826', 8),
(410, 'OPPOA1', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569755448, '152592828', 6),
(411, '华为nva4', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1569755659, '152592829', 6),
(412, '华为荣耀play', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569755748, '152592830', 6),
(413, '华为，p20pro', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569755830, '152592831', 6),
(414, '华为p30', 2, '1', '40.00', '4.00', 0, 4, 4, '20.00', '', 1569755946, '152592832', 6),
(415, '苹果x', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569756023, '152592833', 6),
(416, '华为Mate20', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569756120, '152592834', 6),
(417, 'OPPO，R11', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569756194, '152592835', 7),
(418, 'xsmax', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569756310, '152592836', 6),
(419, 'oppo/a5', 3, '2', '59.70', '9.00', 0, 4, 4, '16.70', '', 1569756393, '152592837', 6),
(420, 'oppo/a5', 1, '1', '19.90', '4.00', 0, 0, 4, '11.90', '', 1569756428, '152592837', 6),
(421, 'iPhone8plus', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569756647, '152592838', 6),
(422, 'oppok3', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569756748, '152592839', 6),
(423, '8P', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569756828, '152592840', 6),
(424, '苹果xsmax', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569756921, '152592841', 6),
(425, '华为p30pro', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569757029, '152592842', 6),
(426, 'vivox27pro', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569757099, '152592843', 6),
(427, 'OPPO r 17', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569757194, '152592844', 6),
(428, 'vivox27', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569757373, '152592845', 6),
(429, '苹果8p', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569757591, '152592846', 6),
(430, '华为p20pro', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569757725, '152592847', 6),
(431, '华为p30', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569757745, '152592847', 6),
(432, '华为nova5 Pro ', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569757900, '152592848', 6),
(433, '一加5T手机', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569758014, '152592849', 6),
(434, '苹果8P', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569758186, '152592850', 6),
(435, ' IPhoneXsmax', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569758326, '152592851', 6),
(436, 'Vivox21 ', 1, '2', '20.00', '9.00', 0, 0, 4, '7.00', '', 1569758345, '152592851', 6),
(437, 'vivoZ3i', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569759301, '152592852', 3),
(438, 'iPhoneX', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569759581, '152592853', 3),
(439, 'vivo x9sl ', 1, '1', '19.90', '4.00', 0, 0, 4, '11.90', '', 1569759725, '152592853', 3),
(440, '华为nove2s', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569760124, '152592854', 1),
(441, 'vivoy85', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569760277, '152592855', 1),
(442, 'OPPO a 9 X', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569760364, '152592856', 1),
(443, '华为nova4e', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569760445, '152592857', 1),
(444, 'iphone xs max ', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569760519, '152592858', 1),
(445, 'OPPOA57', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569760626, '152592859', 1),
(446, '华为nova5pro', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569760729, '152592860', 1),
(447, '苹果8p', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569761040, '152592861', 1),
(448, 'OPPOa57', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569761207, '152592862', 1),
(449, '华为畅享9S', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569761312, '152592863', 1),
(450, 'OPPO a7x ', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569761437, '152592864', 1),
(451, '苹果7P', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569762037, '152592865', 5),
(452, '畅想9', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569762193, '152592866', 5),
(453, '华为P20 ', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569762288, '152592867', 5),
(454, 'iPhonexs', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569762386, '152592868', 5),
(455, 'iPhoneX ', 1, '2', '19.90', '9.00', 0, 0, 0, '10.90', '', 1569762413, '152592868', 5),
(456, '苹果8plus', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569762549, '152592869', 5),
(457, '华为nova5Pro', 2, '2', '39.80', '9.00', 0, 4, 0, '17.80', '', 1569762734, '152592870', 5),
(458, '华为P30Pro', 2, '2', '39.80', '9.00', 0, 4, 0, '17.80', '', 1569762826, '152592871', 5),
(459, 'vivoZ1i ', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569762934, '152592872', 5),
(460, ' oppo  r17', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569763015, '152592873', 5),
(461, '苹果xr', 1, '1', '19.90', '4.00', 0, 0, 0, '15.90', '', 1569763114, '152592874', 5),
(462, '苹果xr', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569763132, '152592874', 5),
(463, '小米9', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569763272, '152592875', 5),
(464, 'R17', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569763361, '152592877', 5),
(465, ' 6sP', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569763431, '152592876', 5),
(466, 'vivox27pro', 2, '2', '39.80', '9.00', 0, 4, 0, '17.80', '', 1569763678, '152592878', 5),
(467, 'OPPO Renoz ', 2, '2', '39.80', '9.00', 0, 4, 0, '17.80', '', 1569763847, '152592879', 5),
(468, 'xsmax', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '支付宝收款', 1569764073, '152592880', 3),
(469, 'vivo   z5x', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569765110, '152592881', 2),
(470, 'vivox9plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569765194, '152592882', 2),
(473, '苹果x', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569766502, '152592884', 8),
(474, '华为p30pro', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569766525, '152592884', 8),
(475, '苹果7P', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569766658, '152592885', 9),
(476, 'nova4', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569766809, '152592886', 8),
(477, '苹果xr', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569766901, '152592887', 8),
(478, ' vivo x27', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569767045, '152592888', 8),
(479, 'vivo x 21屏', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569767132, '152592888', 8),
(480, '畅享8', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569767267, '152592889', 8),
(481, '苹果7p', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569767364, '152592890', 8),
(482, 'OPPO R11pIus', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569767458, '152592891', 8),
(483, '华为nova5pro', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569767584, '152592892', 8),
(484, '苹果6Plus', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569767687, '152592893', 8),
(485, 'OPPOr11st', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569767769, '152592894', 8),
(486, 'vivox21A', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1569767860, '152592895', 8),
(487, '苹果xs max', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569767961, '152592896', 8),
(488, '小米9', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569768138, '152592897', 8),
(489, '小米9', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569768102, '152592897', 8),
(490, 'iphone8plus', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1569768263, '152592898', 8),
(491, '苹果8', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569768366, '152592899', 8),
(492, '苹果7Plus', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569768391, '152592899', 8),
(493, 'OPPOA73', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569768460, '152592900', 8),
(494, 'oppor11spls', 3, '1', '59.70', '4.00', 0, 4, 4, '31.70', '', 1569768709, '152592902', 8),
(495, 'vivo y93', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569768760, '152592901', 8),
(496, '苹果8p', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569768864, '152592903', 8),
(497, '华为p30por', 1, '1', '19.90', '4.00', 0, 0, 4, '11.90', '', 1569768886, '152592903', 8),
(498, '华为p30', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569768958, '152592904', 8),
(499, 'vivo y79', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '支付宝收款', 1569769268, '152592905', 1),
(500, 'x27', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1569769932, '152592827', 8),
(501, '华为畅享7S', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569748469, '152592906', 10),
(502, '11', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569748870, '152592907', 10),
(503, '11', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569748907, '152592907', 10),
(504, '苹果6s', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569836193, '152592908', 6),
(505, 'y85', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569836321, '152592909', 6),
(506, 'vivo X21屏幕指纹版', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569836441, '152592910', 6),
(507, 'oppok3', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569836586, '152592911', 6),
(508, '华为荣耀20', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569837750, '152592912', 6),
(509, 'OPPO A59s', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569837920, '152592913', 6),
(510, '华为荣耀V10', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569837960, '152592913', 6),
(511, '苹果XR ', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569838176, '152592914', 6),
(512, '7p', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569838337, '152592915', 6),
(513, 'P30pro', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569838568, '152592916', 6),
(514, '华为p30Pro', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569838742, '152592917', 7),
(515, 'iPhonexr', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569838827, '152592918', 7),
(516, 'vivoX9s plus', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569839236, '152592919', 3),
(517, 'vivox20A', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569839322, '152592920', 3),
(518, 'OPPO R11s plus', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569839448, '152592921', 1),
(519, 'OPPOa83', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569839532, '152592922', 1),
(520, 'vivonex后置指纹', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569839606, '152592923', 1),
(521, 'oppoa3', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569839685, '152592924', 1),
(522, '6p', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569839787, '152592925', 1),
(523, 'oppo r11 ', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569839862, '152592926', 1),
(524, 'oppo A57', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569839929, '152592927', 1),
(525, '苹果xr ', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569841030, '152592928', 8),
(526, '苹果xr ', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569841062, '152592928', 8),
(527, 'OPPO r17', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569841178, '152592929', 8),
(528, '7p', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569841284, '152592930', 8),
(529, 'OPPO Reno2', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569841420, '152592931', 8),
(530, '华为荣耀play', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569841632, '152592932', 9),
(531, '荣耀8X', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569841703, '152592933', 9),
(532, '苹果7', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569841782, '152592934', 8),
(533, '华为P30  pro', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1569841923, '152592935', 8),
(534, 'r15梦境版', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569842688, '152592936', 8),
(535, ' vivoX9P', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569842918, '152592937', 8),
(536, ' vivoX9P', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569842942, '152592937', 8),
(537, '苹果7p', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569843170, '152592938', 8),
(538, '苹果7plus', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569843382, '152592939', 8),
(539, 'OPPO Reno2', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569843422, '152592939', 8),
(540, '苹果7P', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569843825, '152592940', 8),
(541, '苹果6', 1, '1', '20.00', '4.00', 0, 0, 4, '12.00', '', 1569843857, '152592940', 8),
(542, '苹果X', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569843941, '152592941', 8),
(543, 'iPhone x', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569844097, '152592942', 8),
(544, 'vivox23', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569844240, '152592943', 8),
(545, '7p', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569844546, '152592944', 10),
(546, 'vivo y93', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569844656, '152592945', 10),
(547, '华为nova 5', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569845000, '152592946', 5),
(548, 'oppo A 7x ', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569845104, '152592947', 5),
(549, 'r17', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569845336, '152592948', 5),
(550, 'r17', 1, '2', '19.90', '9.00', 0, 0, 0, '10.90', '', 1569845359, '152592948', 5),
(551, 'oppor15梦境版', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569902919, '152592949', 6),
(552, 'OPPO R11', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569903032, '152592950', 6),
(553, '苹果7plus ', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569903198, '152592951', 6),
(554, '小米note3', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569903299, '152592952', 6),
(555, 'vivox27', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569903385, '152592953', 6),
(556, 'vivoz3i', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569903575, '152592954', 6),
(557, 'OPPOR9', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569903696, '152592955', 6),
(558, 'oppoA83', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569903769, '152592956', 6),
(559, 'oppoR17', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569903994, '152592957', 3),
(560, 'OPPO R17', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569904157, '152592958', 3),
(561, '华为P20PRO', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569904262, '152592959', 3),
(562, '华为nova4  ', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569904484, '152592960', 1),
(563, '华为荣耀play', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569904567, '152592961', 1),
(564, 'vivoX23', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569904637, '152592962', 1),
(565, 'iPhone XR', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1569904665, '152592962', 1),
(566, '华为荣耀play', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569904729, '152592963', 1),
(567, 'oppoReno', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1569905023, '152592964', 2),
(568, 'oppoa7x ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1569905086, '152592965', 2),
(569, '华为荣耀9i', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569905719, '152592966', 8),
(570, 'OPPOA3', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569905854, '152592967', 8),
(571, '华为畅享9plus', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569905930, '152592968', 8),
(572, '华为p20', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569906020, '152592969', 8),
(573, '荣耀20i', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1569906099, '152592970', 9),
(574, 'OPPOR17', 1, '1', '19.90', '4.00', 0, 4, 0, '11.90', '', 1569906203, '152592971', 9);
INSERT INTO `ns_ke` (`id`, `xinghao`, `num`, `caizhi`, `price`, `chengben`, `shunfeng`, `youfei`, `fenrunprice`, `lirun`, `descs`, `ordertime`, `ordernum`, `categoryid`) VALUES
(575, '6s plus', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569906339, '152592972', 8),
(576, '华为荣耀9i', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569906622, '152592973', 8),
(577, '苹果7p', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569906683, '152592974', 8),
(578, '苹果XR', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569906763, '152592975', 8),
(579, '苹果X', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569906828, '152592976', 8),
(580, 'vivoX21', 2, '1', '40.00', '4.00', 0, 4, 4, '20.00', '', 1569906918, '152592977', 8),
(581, 'x21a 后', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569907029, '152592978', 8),
(582, 'x27', 1, '2', '20.00', '9.00', 0, 0, 4, '7.00', '', 1569907053, '152592978', 8),
(583, 'iPhoneX', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569907178, '152592979', 8),
(584, '苹果7', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1569907361, '152592980', 8),
(585, 'vivox21A  后置', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '支付宝收款', 1569907712, '152592981', 8),
(586, 'XsMax', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570018817, '152592983', 6),
(587, 'XsMax', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1570018817, '152592983', 6),
(588, '7p', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1570018817, '152592983', 6),
(589, '苹果x', 2, '1', '39.80', '4.00', 0, 4, 4, '19.80', '', 1570019037, '152592984', 6),
(590, '华为荣耀10', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570019184, '152592985', 6),
(591, 'Vivox21前置指纹', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570019267, '152592986', 6),
(592, '华为荣耀9X', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570019329, '152592987', 6),
(593, 'oppok3', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570019520, '152592988', 6),
(594, '苹果6', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570019614, '152592989', 6),
(595, '苹果6SP', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570019674, '152592990', 6),
(596, '苹果7P', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1570019843, '152592991', 6),
(597, '苹果x', 1, '2', '20.00', '9.00', 0, 4, 0, '7.00', '', 1570020040, '152592993', 7),
(598, '荣耀Magic 2', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570019950, '152592992', 6),
(599, '华为荣耀magic2', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570027035, '152592994', 6),
(600, 'oppor17', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570027545, '152592995', 3),
(601, '苹果7', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570027651, '152592996', 6),
(602, '苹果XR', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570028030, '152592997', 3),
(603, 'R17', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570028149, '152592998', 3),
(604, 'Vivo nex 前置', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570028208, '152592999', 3),
(605, '华为mate20', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570028299, '152593000', 3),
(606, '华为p20', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1570028299, '152593000', 3),
(607, 'vivo x23', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570028457, '152593001', 3),
(608, 'oppor15梦境版', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1570028905, '152593002', 3),
(609, '小米8', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570029511, '152593003', 1),
(610, 'Mate 9 Pro', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570029846, '152593004', 1),
(611, '华为play', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1570030046, '152593005', 1),
(612, '苹果7p', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570030291, '152593006', 1),
(613, '苹果7p', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1570030291, '152593006', 1),
(614, '7p', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570030401, '152593007', 1),
(615, 'oppoA73', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570030535, '152593008', 1),
(616, 'oppor11s', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570030848, '152593009', 1),
(617, '苹果6s', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570030928, '152593010', 1),
(618, 'xsmax', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570031077, '152593011', 1),
(619, 'xsmax', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1570031077, '152593011', 1),
(620, '苹果X', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570031250, '152593012', 3),
(621, 'vivox27', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1570031329, '152593013', 1),
(622, 'vivoIQoo', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570031750, '152593014', 3),
(623, '华为nova5pro', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569945650, '152593015', 8),
(624, '小米6X', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569945950, '152593016', 8),
(625, '苹果8P', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569946033, '152593017', 8),
(626, '华为nova5Pro', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569946128, '152593018', 8),
(627, 'OPPO r 11', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569946191, '152593019', 8),
(628, '苹果X', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569946262, '152593020', 8),
(629, 'OPOOA59s', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569946329, '152593021', 8),
(630, '11', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569946408, '152593022', 8),
(631, '苹果XR', 2, '1', '40.00', '4.00', 0, 4, 4, '20.00', '', 1569946475, '152593023', 8),
(632, 'vivo Y85', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569946582, '152593024', 8),
(633, '苹果八', 2, '1', '39.80', '4.00', 0, 4, 4, '19.80', '', 1569946718, '152593025', 8),
(634, '6sp', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569946845, '152593026', 8),
(635, '苹果6', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569946945, '152593027', 8),
(636, '苹果8p', 2, '1', '39.80', '4.00', 0, 4, 4, '19.80', '', 1569947058, '152593028', 8),
(637, '华为荣耀20s', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569948063, '152593029', 8),
(638, 'vivox23幻彩版', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569948232, '152593030', 8),
(639, '苹果X', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569948359, '152593031', 8),
(640, '华为P20', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569948430, '152593032', 8),
(641, '华为p10', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569948430, '152593032', 8),
(642, 'vivo X23炫彩版', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1569948599, '152593033', 8),
(643, 'vivo X23炫彩版', 1, '2', '19.90', '9.00', 0, 0, 4, '6.90', '', 1569948599, '152593033', 8),
(644, 'OPPOR17', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569948740, '152593034', 8),
(645, 'oppo r11s', 2, '1', '40.00', '4.00', 0, 4, 4, '20.00', '', 1569948832, '152593035', 8),
(646, 'xr', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569948904, '152593036', 8),
(647, 'z3i', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569949095, '152593037', 10),
(648, '苹果8p', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1569949163, '152593038', 10),
(649, '三星s9+', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1570069003, '152593039', 6),
(650, '畅玩8c', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570069141, '152593040', 6),
(651, '苹果XR', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570069228, '152593041', 6),
(652, '华为nova4 ', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570069455, '152593042', 6),
(653, '荣耀8x', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570069455, '152593042', 6),
(654, '8p', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570069573, '152593043', 6),
(655, '华为nova5pro', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570069673, '152593044', 6),
(656, 'VivoX21后指纹', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570069727, '152593045', 6),
(657, 'nova5 pro', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570069811, '152593046', 6),
(658, '华为nova2', 1, '1', '20.00', '4.00', 0, 4, 0, '12.00', '', 1570069971, '152593047', 7),
(659, 'oppo r17', 1, '2', '20.00', '9.00', 0, 0, 0, '11.00', '', 1570069971, '152593047', 7),
(660, '苹果xr', 1, '2', '20.00', '9.00', 0, 0, 0, '11.00', '', 1570069971, '152593047', 7),
(661, '华为nova4', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570070799, '152593048', 6),
(662, 'vivoZ3', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570070799, '152593048', 6),
(663, 'vivo x21', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570070900, '152593049', 6),
(664, 'vivo  X27 Pro', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1570070954, '152593050', 6),
(665, '华为mate20', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570071055, '152593051', 6),
(666, '苹果X ', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570071101, '152593052', 6),
(667, '荣耀10青春', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570071223, '152593053', 6),
(668, 'vivoz1i', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570071298, '152593054', 6),
(669, 'vivoX21后置', 2, '2', '39.80', '9.00', 0, 4, 4, '9.80', '', 1570071356, '152593055', 6),
(670, '苹果8', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570071465, '152593056', 6),
(671, '苹果7', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570071568, '152593057', 6),
(672, 'OPPO K3', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570071647, '152593058', 6),
(673, '金立M7  ', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1570071723, '152593059', 6),
(674, '华为荣耀V10', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570071770, '152593060', 6),
(675, '7p', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570071888, '152593061', 6),
(676, 'oppo r17', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1570072000, '152593062', 6),
(677, ' iPhone8', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570072104, '152593063', 6),
(678, 'Honor  8x   Max', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570072104, '152593064', 6),
(679, '华为mate20 ', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570072341, '152593065', 3),
(680, ' 华为p20', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570072341, '152593065', 3),
(681, '7p', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570072771, '152593066', 3),
(682, '华为Nova4', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1570072920, '152593067', 1),
(683, 'OPPOR15X', 3, '2', '59.70', '9.00', 0, 4, 4, '16.70', '', 1570073037, '152593068', 1),
(684, 'iphoneX', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570073162, '152593069', 1),
(685, 'OPPOR15标准版', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570073211, '152593070', 1),
(686, 'vivo x23', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570073286, '152593071', 1),
(687, 'OPPOreno', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570073328, '152593072', 1),
(688, '6sp', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1570073415, '152593073', 1),
(689, '7p', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1570073415, '152593073', 1),
(690, '苹果XR', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570073578, '152593074', 1),
(691, '华为畅享8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570073769, '152593075', 2),
(692, 'vivoiqoo   Neo', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570073851, '152593076', 2),
(693, '6p', 1, '1', '19.90', '4.00', 0, 0, 4, '11.90', '', 1570074002, '152593077', 8),
(694, '7p', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570074002, '152593077', 8),
(695, 'oppor17', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570074171, '152593078', 8),
(696, 'OPPOR11P', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570074240, '152593079', 8),
(697, 'VivoX23幻彩版', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570074388, '152593080', 8),
(698, 'oppo R 15普通版', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570074495, '152593081', 8),
(699, 'Vivoz1', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570075244, '152593082', 8),
(700, 'iPhone6sp', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570075367, '152593083', 8),
(701, 'vivox23  幻彩版', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570075500, '152593084', 8),
(702, 'vivo X27', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570075568, '152593085', 8),
(703, 'iphone 6s', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570075654, '152593086', 8),
(704, '华为nova 2', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570075731, '152593087', 8),
(705, '华为荣耀8X ', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570075793, '152593088', 8),
(706, 'vivoz3', 1, '2', '19.90', '9.00', 0, 4, 7, '-0.10', '', 1570075865, '152593089', 8),
(707, 'OPPOR7p', 1, '1', '20.00', '4.00', 0, 4, 4, '8.00', '', 1570075929, '152593090', 8),
(708, 'vivo x23', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570075989, '152593091', 8),
(709, '华为P30por', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1570076083, '152593092', 8),
(710, 'vivox27', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570076213, '152593093', 8),
(711, '苹果7p', 1, '2', '20.00', '9.00', 0, 4, 4, '3.00', '', 1570076330, '152593094', 8),
(712, '苹果7p', 2, '2', '40.00', '9.00', 0, 4, 4, '10.00', '', 1570076399, '152593095', 8),
(713, 'xixoX20', 1, '1', '19.90', '4.00', 0, 4, 4, '7.90', '', 1570076516, '152593096', 8),
(714, 'vivo z3i', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570076601, '152593097', 8),
(715, '7p', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570076662, '152593098', 8),
(716, '苹果XR', 3, '2', '59.70', '9.00', 0, 4, 4, '16.70', '', 1570076889, '152593099', 8),
(717, '荣耀9', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1570077069, '152593100', 8),
(718, '黑鲨2', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570163485, '152593101', 2),
(719, 'xs', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570163646, '152593102', 8),
(720, '苹果6', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570163848, '152593103', 8),
(721, 'nova5', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570163984, '152593104', 8),
(722, 'OPPO A9', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1570164083, '152593105', 9),
(723, 'oppor11splus', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570164412, '152593106', 5),
(724, '小米8青春', 1, '2', '19.90', '9.00', 0, 4, 0, '6.90', '', 1570164513, '152593107', 5),
(725, 'vivoX23炫彩', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570164735, '152593108', 8),
(726, ' vivo x21A', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570164833, '152593109', 3),
(727, '11pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570242519, '000000003', 6),
(728, '苹果11', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570244243, '152593111', 6),
(729, '小米8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570244150, '152593110', 6),
(730, ' vivo iqoo pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570244467, '152593112', 6),
(731, 'OPPO Reno', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570244583, '152593113', 6),
(732, 'vivox21后置指纹', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570245424, '152593114', 1),
(733, 'vivo x23 ', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1570245475, '152593115', 1),
(734, '荣耀8X', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '支付宝30', 1570245595, '152593116', 3),
(735, '红米k20 Pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '支付宝29.9', 1570245775, '152593117', 2),
(736, '6p', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570246016, '152593118', 8),
(737, 'OPPO A9x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570246174, '152593119', 8),
(738, '苹果x', 1, '2', '45.00', '9.00', 1, 7, 7, '22.00', '', 1570246222, '152593120', 8),
(739, '苹果11', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1570246222, '152593120', 8),
(740, '华为mate20 Pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570246356, '152593121', 8),
(741, '苹果X', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570246476, '152593122', 8),
(742, '华为p20', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1570338244, '152593123', 7),
(743, 'vivoz3', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570338400, '152593124', 6),
(744, '金立 m7', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570338480, '152593125', 6),
(745, 'iPhonex', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570338575, '152593126', 6),
(746, 'OPPO  r11s  ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570338904, '152593127', 3),
(747, ' vivo  y66', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570338978, '152593128', 1),
(748, 'OPPO R11', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570339196, '152593129', 1),
(749, 'vivoX27', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570339522, '152593130', 8),
(750, 'Xr', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570339606, '152593131', 8),
(751, '苹果6', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1570339678, '152593132', 9),
(752, '华为P30', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570339737, '152593133', 8),
(753, 'HUAWEInova3', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570339778, '152593134', 8),
(754, ' oppor11puls', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570339902, '152593135', 8),
(755, 'r17', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1570338480, '152593125', 6),
(756, 'oppor17', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570421174, '152593136', 6),
(757, 'y81s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570421689, '152593137', 6),
(758, '6s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570421770, '152593138', 6),
(759, '苹果11', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570421836, '152593139', 6),
(760, 'vivoY67', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570421996, '152593140', 6),
(761, '华为 nova3', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570422087, '152593141', 6),
(762, 'iPhone 8p', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570422238, '152593142', 6),
(763, '苹果小7 ', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570422289, '152593143', 6),
(764, '苹果6p', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570422394, '152593144', 3),
(765, 'oppo A7X', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570423055, '152593145', 1),
(766, '黑鲨2', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570423131, '152593146', 2),
(767, 'OPPOR17pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570423334, '152593147', 2),
(768, '红米note5', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '支付宝29.9', 1570423398, '152593148', 2),
(769, ' iPhone8  pIus ', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570423585, '152593149', 8),
(770, 'vivoX27', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570423685, '152593150', 8),
(771, '华为mate 20 X', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1570423749, '152593151', 9),
(772, '苹果XR', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570423800, '152593152', 8),
(773, '苹果7', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570423928, '152593153', 8),
(774, '华为p30', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570423928, '152593153', 8),
(775, 'ViVO z3', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570424159, '152593154', 8),
(776, 'VIVO IQOO', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570424238, '152593155', 8),
(777, 'vivo Y66', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '', 1569992962, '152593156', 1),
(778, 'iPhone 8', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1570431661, '152593157', 5),
(779, 'oppo r17 ', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1570431747, '152593158', 5),
(780, 'p30', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570431826, '152593159', 5),
(781, 'vivo x21屏幕', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1570507461, '152593160', 10),
(782, '华为mate30pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570507947, '152593161', 1),
(783, 'oppo r17', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570508130, '152593162', 2),
(784, 'oppo  R9sk', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570508375, '152593163', 2),
(785, '荣耀10青春版', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570508434, '152593164', 2),
(786, '苹果6s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570508508, '152593165', 2),
(787, '华为p30', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570509138, '152593166', 8),
(788, '苹果7plus ', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570509203, '152593167', 8),
(789, 'Opp0r15', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570509252, '152593168', 8),
(790, '苹果X', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570509324, '152593169', 5),
(791, 'vivo z3', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570509520, '152593170', 5),
(792, 'OPR17', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570509649, '152593171', 5),
(793, 'OPPO R 17', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1570509875, '152593172', 5),
(794, '华为畅想9s', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '支付宝收款29.9', 1570510183, '152593173', 8),
(795, '苹果8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '支付宝收款29.9', 1570510259, '152593174', 1),
(796, '苹果XR', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570516626, '152593175', 8),
(797, '畅享9s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570516712, '152593176', 8),
(798, '畅享9', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570592633, '152593177', 1),
(799, 'vivo y66', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570592633, '152593177', 1),
(800, 'vivonex', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570593023, '152593178', 1),
(801, 'vivoX9spiusl', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570593142, '152593179', 1),
(802, 'vivo  x23 幻彩版 ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570593296, '152593180', 1),
(803, '荣耀9X', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570593617, '152593181', 2),
(804, '华为mate20pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570593676, '152593182', 8),
(805, 'Xr', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570593891, '152593183', 8),
(806, '华为20S', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570593954, '152593184', 8),
(807, '小米5X', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570594119, '152593185', 8),
(808, 'oppo r15', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '支付宝收款29.9', 1570594319, '152593186', 8),
(809, 'opporeno2', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1570594552, '152593187', 5),
(810, '小米9', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1570689568, '152593188', 6),
(811, '华为nova4e', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570689799, '152593189', 6),
(812, '小米9', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1570689799, '152593189', 6),
(820, '荣耀9i', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570691260, '152593195', 2),
(814, 'VivoX21A ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570690107, '152593190', 3),
(815, 'vivoX7', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570690439, '152593191', 1),
(816, '华为nova4', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570690551, '152593192', 1),
(817, '苹果8p', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570690618, '152593193', 1),
(818, '苹果8', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1570690618, '152593193', 1),
(819, 'oppo  A57', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570690787, '152593194', 1),
(822, 'iPhone 11 Pro Max', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570691308, '152593196', 2),
(823, 'VIVOX23  ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570691493, '152593198', 2),
(824, 'vivoz1i', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570691588, '152593199', 2),
(825, '苹果xs max  ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570692087, '152593200', 8),
(826, '苹果xr ', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1570692165, '152593201', 9),
(827, 'p20', 2, '1', '59.80', '4.00', 0, 4, 0, '47.80', '', 1570773518, '152593202', 5),
(828, 'p10', 1, '1', '0.00', '4.00', 0, 0, 0, '-4.00', '淘宝买二赠一', 1570773518, '152593202', 5),
(829, '7plus', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570774696, '152593203', 5),
(830, 'oppo r11 Splus', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570774827, '152593204', 5),
(831, 'IPhoneXR', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570774913, '152593205', 5),
(832, '华为p30', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570775002, '152593206', 5),
(833, 'oppr15', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570776619, '152593207', 2),
(834, '苹果7', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570780200, '152593208', 10),
(835, 'opporeno', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570780549, '152593209', 8),
(836, '苹果6sp', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1570780549, '152593209', 8),
(837, 'OPPO R11', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1570780661, '152593210', 9),
(838, '苹果7P', 1, '2', '24.90', '9.00', 0, 4, 0, '11.90', '', 1570780728, '152593211', 9),
(839, '苹果8P', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570859527, '152593212', 6),
(840, '苹果6SP', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570859655, '152593213', 6),
(841, '华为P30', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570859748, '152593214', 6),
(842, '华为荣耀9i', 2, '2', '59.80', '9.00', 0, 4, 7, '23.80', '', 1570859892, '152593215', 6),
(843, '苹果x', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1570860027, '152593216', 7),
(844, 'oppor9 m', 1, '2', '21.90', '9.00', 0, 0, 0, '12.90', '', 1570860027, '152593216', 7),
(845, '华为畅享10plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570860795, '152593217', 3),
(846, 'Oppo r11s', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570860888, '152593218', 3),
(847, '苹果x', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570862239, '152593219', 8),
(848, 'iphone6s plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570862350, '152593220', 8),
(849, 'OPPO   A5', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570862534, '152593221', 8),
(850, 'iphoneX', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1570862534, '152593221', 8),
(851, 'z3i', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570862617, '152593222', 8),
(852, '华为荣耀9X', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570862820, '152593223', 8),
(853, 'oppor17', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570862927, '152593224', 8),
(854, '苹果7', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570862967, '152593225', 8),
(855, '华为荣耀10', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570863148, '152593226', 8),
(856, '华为mate20', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570863216, '152593227', 8),
(857, 'mate20por', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570863285, '152593228', 5),
(858, 'oppo a79', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570868759, '152593229', 1),
(859, '苹果8p', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570868853, '152593230', 1),
(860, 'OPPOA9', 1, '2', '19.90', '9.00', 0, 4, 4, '2.90', '支付宝支付19.9', 1570093689, '186030130', 1),
(861, 'Iphone xs max', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570948255, '152593233', 6),
(862, 'Iphone xs max', 1, '1', '19.90', '4.00', 0, 0, 7, '8.90', '', 1570948255, '152593233', 6),
(863, 'OPPOR 15 标准版', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570948345, '152593234', 6),
(864, 'vivox27', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1570948489, '152593235', 6),
(865, 'x27', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '10.11号收款，漏统计', 1570949228, '152593236', 10),
(866, 'vivo Y 93', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1570949688, '152593237', 7),
(867, 'oppo r 15', 1, '1', '21.90', '4.00', 0, 0, 0, '17.90', '', 1570949688, '152593237', 7),
(868, 'OPPO  A5', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570950227, '152593238', 1),
(869, 'OPPO r 17', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '支付宝收款29.9', 1570950281, '152593239', 1),
(870, '8plus', 2, '1', '60.00', '4.00', 0, 4, 7, '34.00', '', 1570950756, '152593240', 8),
(871, 'nova3e', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1570952575, '152593241', 8),
(872, 'vivoy79', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1570952692, '152593242', 8),
(873, 'vivoX23', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1570952749, '152593243', 8),
(874, '华为Mate20 X', 1, '2', '45.00', '9.00', 1, 7, 7, '22.00', '', 1570953256, '152593244', 8),
(875, '苹果XR', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1570953256, '152593244', 8),
(876, 'P30Pro', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570953508, '152593245', 5),
(877, '苹果8 ', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1570953598, '152593246', 5),
(878, 'OPPO R 11s', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1570953676, '152593247', 5),
(879, 'mete30', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1570953755, '152593248', 5),
(880, 'oppo findx', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571029678, '152593249', 6),
(881, '0PP0R11', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571030008, '152593250', 6),
(882, '苹果6s', 1, '2', '24.90', '9.00', 0, 4, 0, '11.90', '', 1571030105, '152593251', 7),
(883, '苹果7p ', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1571030185, '152593252', 7),
(884, '苹果x', 1, '2', '22.00', '9.00', 0, 4, 7, '2.00', '', 1571030253, '152593253', 6),
(885, 'opopr11sp', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571030392, '152593254', 3),
(886, '荣耀畅享8plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571030922, '152593255', 1),
(887, 'OPPORENO  Z', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571031675, '152593256', 1),
(888, 'p30pro', 2, '1', '59.80', '4.00', 0, 4, 7, '33.80', '', 1571031773, '152593257', 1),
(889, '苹果8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571033144, '152593258', 1),
(890, 'vivox23幻彩', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571033796, '152593259', 2),
(891, '华为麦芒7', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571033874, '152593260', 2),
(892, 'OPPO R9sPlus', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571033939, '152593261', 2),
(893, 'oppor17', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571034417, '152593262', 8),
(894, '华为荣耀9x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571034694, '152593263', 8),
(895, 'xr', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571034790, '152593264', 8),
(896, '苹果6p', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571034847, '152593265', 8),
(897, '三星s9edg＋', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571034940, '152593266', 8),
(898, 'iPhone 6Plus', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571035004, '152593267', 9),
(899, 'OPPOR15', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1571121983, '152593268', 5),
(900, 'oppoA57', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '支付宝收款30', 1571122097, '152593269', 6),
(901, 'vivo S1 Pro', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571122163, '152593270', 7),
(902, 'vivo s1', 2, '2', '59.80', '9.00', 0, 4, 7, '23.80', '', 1571122314, '152593271', 10),
(903, 'mate20pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571122861, '152593272', 8),
(904, '华为nova5pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '支付宝收款29.9', 1571123012, '152593273', 2),
(905, 'Xs  MaX', 2, '2', '59.80', '9.00', 0, 4, 7, '23.80', '', 1571123187, '152593274', 8),
(906, '11Pro Max', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1571123187, '152593274', 8),
(907, '苹果XR', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571123345, '152593275', 8),
(908, 'oppoa57t', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571123414, '152593276', 8),
(909, '小米MIX3', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571123496, '152593277', 8),
(910, 'vivoX27', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1571123580, '152593278', 9),
(911, '苹果xr', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571123713, '152593279', 8),
(912, '华为p30pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571124027, '152593280', 8),
(913, 'vivoX21后置指纹', 3, '2', '89.70', '9.00', 0, 4, 7, '37.70', '', 1571124098, '152593281', 8),
(914, '苹果XSMax', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571203375, '152593282', 3),
(915, 'iPhone xs max', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571203551, '152593283', 3),
(916, '华为mate20', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571203715, '152593284', 2),
(917, '苹果7P', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571203715, '152593285', 2),
(918, 'vivo x23 幻彩版', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571204176, '152593286', 2),
(919, '华为mate20', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571204287, '152593287', 8),
(920, ' 苹果x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571204387, '152593288', 8),
(921, 'xsmax', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571204472, '152593289', 8),
(922, '苹果Xmax', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571204575, '152593290', 6),
(923, 'VivoX20', 2, '1', '49.80', '4.00', 0, 4, 0, '37.80', '', 1571204715, '152593291', 7),
(924, 'vivo y93', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571204854, '152593292', 6),
(925, 'vivo Y3', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1571204958, '152593293', 7),
(926, ' 华为nova5i', 1, '2', '22.00', '9.00', 0, 4, 0, '9.00', '', 1571205130, '152593294', 7),
(927, ' 三星note8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571226358, '152593295', 8),
(928, 'iPhone xs max', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571286028, '152593296', 1),
(929, '华为nova4', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571286204, '152593297', 1),
(930, 'vivox23', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571286284, '152593298', 3),
(931, '华为p20', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571286430, '152593299', 3),
(932, '苹果8p', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571286551, '152593300', 6),
(933, 'iphone 11 pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571286779, '152593302', 6),
(934, 'mate20pro保时捷款', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571286865, '152593303', 6),
(935, 'OPPO RenoZ', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1571287184, '152593304', 7),
(936, '苹果xs max', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571287287, '152593305', 6),
(937, '苹果6s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571287358, '152593306', 2),
(938, 'vivo X7', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571287429, '152593307', 9),
(939, '女的X23幻彩版', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571287508, '152593308', 8),
(940, 'oppoa5', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571287584, '152593309', 8),
(941, '荣耀8X', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571287649, '152593310', 8),
(942, 'vivox23', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571286640, '152593301', 6),
(943, '苹果6splus', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1571286640, '152593301', 6),
(944, '华为mate20x', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571287864, '152593311', 5),
(945, ' 苹果8plus', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571287989, '152593312', 5),
(946, ' iPhone X', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571385712, '152593313', 1),
(947, ' iPhone Xs max', 1, '2', '29.90', '9.00', 0, 0, 7, '13.90', '', 1571385712, '152593313', 1),
(948, 'iPhone X', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571386001, '152593314', 1),
(949, '苹果x', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571386082, '152593315', 6),
(950, 'oppoR 11s ', 1, '1', '24.90', '4.00', 0, 4, 0, '16.90', '', 1571386196, '152593316', 7),
(951, 'oppoR 11s', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1571386313, '152593317', 7),
(952, '华为p20', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571386481, '152593319', 8),
(953, 'vivo Z3i', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571386401, '152593318', 2),
(954, 'OPPO Reno', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571386614, '152593320', 8),
(955, 'OPPO R15x', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571386686, '152593321', 8),
(956, 'vivo nex 后置', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571386785, '152593322', 8),
(957, ' vivo x21屏幕', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571386846, '152593323', 8),
(958, 'vivo    x23', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571386921, '152593324', 8),
(959, 'Vivo x9s plus', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1571388048, '152593325', 5),
(960, 'OPPOr17', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571478698, '152593326', 7),
(961, 'oppo A9', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571479314, '152593327', 7),
(962, '华为荣耀9x', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571479402, '152593328', 3),
(963, 'oppo A9', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571479469, '152593329', 10),
(964, '苹果x', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571479539, '152593330', 1),
(965, '华为p8标准版', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571479605, '152593331', 1),
(966, 'vivox23', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571479668, '152593332', 2),
(967, 'oppo  a7x', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571479742, '152593333', 2),
(968, '华为nova5Pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571479818, '152593334', 2),
(969, '华为mate30', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571479888, '152593335', 8),
(970, 'vivo x27 Pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571480014, '152593336', 8),
(971, 'r 15标准版', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571480078, '152593337', 8),
(972, '苹果8P', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571480142, '152593338', 9),
(973, '8p', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571480231, '152593339', 8),
(974, 'iphone8plus', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571480297, '152593340', 8),
(975, 'vivo   x21i后', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571480377, '152593341', 8),
(976, '华为nova5', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571480514, '152593342', 9),
(977, '苹果xsmax', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571480574, '152593343', 8),
(978, '苹果7p', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571480703, '152593344', 5),
(979, '苹果8p', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1571481208, '152593345', 5),
(980, ' vivoZ1i', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571482689, '152593346', 5),
(981, 'IPhoneXsmax ', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571482757, '152593347', 6),
(982, 'OPPO R 11S', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571483286, '152593348', 8),
(983, 'vivoY7s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571545703, '152593349', 3),
(984, 'iPhoneXR', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571545795, '152593350', 3),
(985, 'vivoY7s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571545868, '152593351', 2),
(986, '华为p30', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571545947, '152593352', 2),
(987, '小米9', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571546193, '152593353', 2),
(988, '苹果x', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571546477, '152593354', 8),
(989, '华为mate 20', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571546588, '152593355', 8),
(990, 'OPPOa9', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571546647, '152593356', 8),
(991, 'vivoS1Pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571546716, '152593357', 8),
(992, '华为 nova5pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571546784, '152593358', 8),
(993, 'vivox20plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571546857, '152593359', 8),
(994, '苹果xs.max', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1571547025, '152593361', 5),
(995, 'vivox23', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571547231, '152593362', 8),
(996, 'nove4e', 1, '1', '24.90', '4.00', 0, 4, 0, '16.90', '', 1571547311, '152593363', 9),
(997, '苹果x', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571546939, '152593360', 8),
(998, 'XR', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571636669, '152593364', 6),
(999, 'vivo7s', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571636760, '152593365', 6),
(1000, 'OPPOr11s', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571636876, '152593366', 6),
(1001, '苹果7', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571637010, '152593367', 6),
(1002, '小米9', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571637139, '152593368', 2),
(1003, '苹果xs max', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571637203, '152593369', 8),
(1004, 'vivo.x9', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571637278, '152593370', 8),
(1005, 'OPPOr17', 2, '2', '59.80', '9.00', 0, 4, 7, '23.80', '', 1571637350, '152593371', 8),
(1006, 'OppoR9sPIUS', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571637418, '152593372', 8),
(1007, '8p', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571637478, '152593373', 8),
(1008, '苹果XR', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '支付宝收款', 1571637608, '152593375', 1),
(1009, '荣耀v20', 1, '1', '29.90', '4.00', 0, 4, 0, '21.90', '', 1571637540, '152593374', 5),
(1010, '苹果7', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '支付宝收款', 1571637608, '152593375', 1),
(1011, 'vivo x23', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1571637608, '152593375', 1),
(1012, '苹果7p', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '支付宝收款', 1571637850, '152593376', 2),
(1013, 'vivox9 玻璃', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571723468, '152593377', 1),
(1014, 'Redmi  5  PIUS', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1571723468, '152593377', 1),
(1015, '苹果7p', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1571723709, '152593378', 7),
(1016, 'mate20x', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571723806, '152593379', 6),
(1017, '红米note7Pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571723881, '152593380', 2),
(1018, 'vivo x9s', 2, '2', '59.80', '9.00', 0, 4, 7, '23.80', '', 1571723977, '152593381', 8),
(1019, '华为P30  pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571724199, '152593382', 8),
(1020, 'vivox9plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571724303, '152593383', 8),
(1021, '苹果8', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571724400, '152593384', 8),
(1022, '华为nova4', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571724492, '152593385', 8),
(1023, 'OppoR17', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571724602, '152593386', 8),
(1024, '苹果7plus', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571724716, '152593387', 8),
(1025, '华为荣耀8X', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571724837, '152593388', 8),
(1026, 'opporeno', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571724938, '152593389', 8),
(1027, 'vivox27', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571725064, '152593390', 8),
(1028, 'Vivox9', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571725200, '152593391', 8),
(1029, 'p30', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571725375, '152593392', 5),
(1030, '苹果x', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571725467, '152593393', 5),
(1031, '苹果7plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571815405, '152593394', 3),
(1032, '荣耀8', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571815470, '152593395', 1),
(1033, 'iPhone X Max', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571815547, '152593396', 2),
(1034, 'OPPOR11s', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571815612, '152593397', 8),
(1035, '苹果7plus ', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571815707, '152593398', 8),
(1036, '荣耀10', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571815789, '152593399', 8),
(1037, '华为畅享7', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571891798, '152593400', 2),
(1038, '华为 mate 20 pro', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1571891965, '152593401', 9),
(1039, 'OPPOReno', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571892132, '152593402', 8),
(1040, '华为nova4', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571892216, '152593403', 8),
(1041, 'vivo x27pro', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571892288, '152593404', 8),
(1042, '苹果XSMax', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571892381, '152593405', 3),
(1043, 'OPPO R17', 2, '1', '59.80', '4.00', 0, 4, 0, '47.80', '', 1571892482, '152593406', 5),
(1044, 'vivo x21ia', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '支付宝收款', 1571892599, '152593407', 8),
(1045, '荣耀8', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571979295, '252593395', 1),
(1046, 'vivo y97', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571981036, '152593408', 1),
(1047, 'r11s', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571981220, '152593409', 6),
(1048, '苹果11', 2, '2', '60.00', '9.00', 0, 4, 7, '24.00', '', 1571981331, '152593410', 1),
(1049, '6s   Plus', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571981418, '152593411', 6),
(1050, '苹果6s plus', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1571981563, '152593412', 6),
(1051, 'OPPOA7X', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571981636, '152593413', 2),
(1052, 'IPhonexsmax', 1, '2', '21.90', '9.00', 0, 4, 0, '8.90', '', 1571981711, '152593414', 9),
(1053, 'vivox23幻彩版', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1571981779, '152593415', 8),
(1054, 'vivo.x27', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571981901, '152593417', 5),
(1055, 'x21ia', 1, '2', '29.90', '9.00', 0, 4, 0, '16.90', '', 1571987533, '152593418', 5),
(1056, 's1', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1571987682, '152593419', 6),
(1057, '小米Play', 1, '2', '30.00', '9.00', 0, 0, 7, '14.00', '', 1571987682, '152593419', 6),
(1058, '苹果8', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1571987682, '152593419', 6),
(1059, ' oppoR15', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1571981845, '152593416', 8),
(1060, '华为mate20 pro', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1572093003, '152593420', 8),
(1061, '苹果6splus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1572093069, '152593421', 8),
(1062, 'vivo  Y67', 1, '2', '30.00', '9.00', 0, 4, 7, '10.00', '', 1572093149, '152593422', 8),
(1063, 'oppo Reno', 1, '1', '21.90', '4.00', 0, 4, 0, '13.90', '', 1572093223, '152593423', 9),
(1064, 'OPPO r11 s', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1572093303, '152593424', 2),
(1067, '苹果XR', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1572154290, '152593425', 6),
(1066, 'oppo reno', 1, '1', '30.00', '4.00', 0, 0, 7, '19.00', '', 1572093303, '152593424', 2),
(1068, 'OPPO R15 梦境版', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1572154436, '152593426', 6),
(1069, '华为20 pro', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1572154518, '152593427', 3),
(1070, '华为mate30', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1572154636, '152593428', 1),
(1071, 'oppor7s', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1572154713, '152593429', 1),
(1072, '荣耀magic2', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1572154782, '152593430', 8),
(1073, 'vivox27', 1, '2', '29.90', '9.00', 0, 4, 7, '9.90', '', 1572154919, '152593431', 8),
(1074, 'iPhone X', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1572155035, '152593432', 8),
(1075, ' Vivo  x23幻彩版', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1572155149, '152593433', 8),
(1076, '苹果6plus', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '', 1572155235, '152593434', 8),
(1077, 'reno z', 3, '2', '59.80', '9.00', 0, 4, 0, '28.80', '淘宝买二送一', 1572155354, '152593435', 5),
(1078, '小米CC9', 1, '1', '29.90', '4.00', 0, 4, 7, '14.90', '支付宝收款', 1572155545, '152593436', 2),
(1079, 'vivo x20', 1, '1', '30.00', '4.00', 0, 4, 7, '15.00', '', 1572155744, '152593437', 2);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member`
--

CREATE TABLE `ns_member` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL DEFAULT '' COMMENT '前台用户名',
  `member_level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `memo` varchar(1000) DEFAULT NULL COMMENT '备注',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=147 DEFAULT CHARSET=utf8 COMMENT='前台用户表';

--
-- 转存表中的数据 `ns_member`
--

INSERT INTO `ns_member` (`uid`, `member_name`, `member_level`, `memo`, `reg_time`) VALUES
(1, 'admin', 47, '', 2018),
(2, 'admin', 47, '', 2019),
(3, 'tonyyonghu', 47, NULL, 1567741143),
(4, 'tony', 47, NULL, 1568873838),
(5, 'cc112233', 47, NULL, 1570211784),
(6, 'cc123456', 47, NULL, 1570211835),
(7, 'tonyonghu', 47, NULL, 1571034323);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_account`
--

CREATE TABLE `ns_member_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '购物币',
  `member_cunsum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员消费',
  `member_sum_point` int(11) NOT NULL DEFAULT '0' COMMENT '会员累计积分'
) ENGINE=InnoDB AVG_ROW_LENGTH=3276 DEFAULT CHARSET=utf8 COMMENT='会员账户统计表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_account_records`
--

CREATE TABLE `ns_member_account_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '账户类型1.积分2.余额3.购物币',
  `sign` smallint(6) NOT NULL DEFAULT '1' COMMENT '正负号',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `from_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '产生方式1.商城订单2.订单退还3.兑换4.充值5.签到6.分享7.注册8.提现9提现退还',
  `data_id` int(11) NOT NULL DEFAULT '0' COMMENT '相关表的数据ID',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '数据相关内容描述文本',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=108 DEFAULT CHARSET=utf8 COMMENT='会员流水账表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_balance_withdraw`
--

CREATE TABLE `ns_member_balance_withdraw` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ask_for_date` int(11) DEFAULT '0' COMMENT '提现日期',
  `payment_date` int(11) DEFAULT '0' COMMENT '到账日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期'
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8 COMMENT='会员余额提现记录表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_bank_account`
--

CREATE TABLE `ns_member_bank_account` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认账号',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='会员提现账号';

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_express_address`
--

CREATE TABLE `ns_member_express_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '会员基本资料表ID',
  `consigner` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '固定电话',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '区县',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zip_code` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `alias` varchar(50) NOT NULL DEFAULT '' COMMENT '地址别名',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '默认收货地址'
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8 COMMENT='会员收货地址管理';

--
-- 转存表中的数据 `ns_member_express_address`
--

INSERT INTO `ns_member_express_address` (`id`, `uid`, `consigner`, `mobile`, `phone`, `province`, `city`, `district`, `address`, `zip_code`, `alias`, `is_default`) VALUES
(1, 5, 'cc', '15888888888', '', 19, 197, 1747, 'cc', '', '', 1),
(2, 6, 'dd', '15999999999', '', 34, 345, 2869, 'dd', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_favorites`
--

CREATE TABLE `ns_member_favorites` (
  `log_id` int(10) UNSIGNED NOT NULL COMMENT '记录ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `fav_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品或店铺ID',
  `fav_type` varchar(20) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,shop为店铺,默认为商品',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `shop_name` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺logo',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_image` varchar(300) DEFAULT NULL,
  `log_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品收藏时价格',
  `log_msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '收藏备注',
  `fav_time` int(11) DEFAULT '0' COMMENT '收藏时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_gift`
--

CREATE TABLE `ns_member_gift` (
  `gift_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `promotion_gift_id` int(11) NOT NULL COMMENT '赠品活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠品ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '赠品名称',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '赠品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠品数量',
  `get_type` int(11) NOT NULL DEFAULT '1' COMMENT '获取方式',
  `get_type_id` int(11) NOT NULL COMMENT '获取方式对应ID',
  `desc` text NOT NULL COMMENT '说明',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员赠品表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_level`
--

CREATE TABLE `ns_member_level` (
  `level_id` int(10) UNSIGNED NOT NULL COMMENT '等级ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `level_name` varchar(50) NOT NULL DEFAULT '' COMMENT '等级名称',
  `min_integral` int(11) NOT NULL DEFAULT '0' COMMENT '累计积分',
  `goods_discount` decimal(3,2) NOT NULL DEFAULT '1.00' COMMENT '折扣率',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '等级描述',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认',
  `quota` int(11) NOT NULL DEFAULT '0' COMMENT '消费额度',
  `upgrade` int(11) NOT NULL COMMENT '升级条件  1.累计积分 2.消费额度 3.同时满足',
  `relation` int(11) NOT NULL DEFAULT '1' COMMENT '1.或 2. 且'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='会员等级';

--
-- 转存表中的数据 `ns_member_level`
--

INSERT INTO `ns_member_level` (`level_id`, `shop_id`, `level_name`, `min_integral`, `goods_discount`, `desc`, `is_default`, `quota`, `upgrade`, `relation`) VALUES
(47, 0, '普通会员', 0, '1.00', '', 1, 0, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_recharge`
--

CREATE TABLE `ns_member_recharge` (
  `id` int(10) UNSIGNED NOT NULL,
  `recharge_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `uid` varchar(255) NOT NULL COMMENT '用户uid',
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `create_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_pay` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='会员充值余额记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_notice`
--

CREATE TABLE `ns_notice` (
  `id` int(11) NOT NULL COMMENT '公告id',
  `notice_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `notice_content` text NOT NULL COMMENT '公告内容',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺公告表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_offpay_area`
--

CREATE TABLE `ns_offpay_area` (
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺Id',
  `province_id` text COMMENT '省Id组合',
  `city_id` text COMMENT '市Id组合',
  `district_id` text COMMENT '县Id组合'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='货到付款支持地区表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order`
--

CREATE TABLE `ns_order` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_no` varchar(255) DEFAULT '' COMMENT '订单编号',
  `out_trade_no` varchar(100) NOT NULL DEFAULT '0' COMMENT '外部交易号',
  `order_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `payment_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付类型。取值范围：\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN (微信自有支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN_DAIXIAO (微信代销支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nALIPAY (支付宝支付)',
  `shipping_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单配送方式',
  `order_from` varchar(255) NOT NULL DEFAULT '' COMMENT '订单来源',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '买家会员名称',
  `buyer_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '买家ip',
  `buyer_message` varchar(255) NOT NULL DEFAULT '' COMMENT '买家附言',
  `buyer_invoice` varchar(255) NOT NULL DEFAULT '' COMMENT '买家发票信息',
  `receiver_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人的手机号码',
  `receiver_province` int(11) NOT NULL COMMENT '收货人所在省',
  `receiver_city` int(11) NOT NULL COMMENT '收货人所在城市',
  `receiver_district` int(11) NOT NULL COMMENT '收货人所在街道',
  `receiver_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `receiver_zip` varchar(6) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `receiver_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `shop_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '卖家店铺名称',
  `seller_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卖家对订单的标注星标',
  `seller_memo` varchar(255) NOT NULL DEFAULT '' COMMENT '卖家对订单的备注',
  `consign_time_adjust` int(11) NOT NULL DEFAULT '0' COMMENT '卖家延迟发货时间',
  `goods_money` decimal(19,2) NOT NULL COMMENT '商品总价',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单总价',
  `point` int(11) NOT NULL COMMENT '订单消耗积分',
  `point_money` decimal(10,2) NOT NULL COMMENT '订单消耗积分抵多少钱',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '订单代金券支付金额',
  `coupon_id` int(11) NOT NULL COMMENT '订单代金券id',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单余额支付金额',
  `user_platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户平台余额支付',
  `promotion_money` decimal(10,2) NOT NULL COMMENT '订单优惠活动金额',
  `shipping_money` decimal(10,2) NOT NULL COMMENT '订单运费',
  `pay_money` decimal(10,2) NOT NULL COMMENT '订单实付金额',
  `refund_money` decimal(10,2) NOT NULL COMMENT '订单退款金额',
  `coin_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币金额',
  `give_point` int(11) NOT NULL COMMENT '订单赠送积分',
  `give_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单成功之后返购物币',
  `order_status` tinyint(4) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(4) NOT NULL COMMENT '订单付款状态',
  `shipping_status` tinyint(4) NOT NULL COMMENT '订单配送状态',
  `review_status` tinyint(4) NOT NULL COMMENT '订单评价状态',
  `feedback_status` tinyint(4) NOT NULL COMMENT '订单维权状态',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `tax_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送物流公司ID',
  `give_point_type` int(11) NOT NULL DEFAULT '1' COMMENT '积分返还类型 1 订单完成  2 订单收货 3  支付订单',
  `pay_time` int(11) DEFAULT '0' COMMENT '订单付款时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '买家要求配送时间',
  `sign_time` int(11) DEFAULT '0' COMMENT '买家签收时间',
  `consign_time` int(11) DEFAULT '0' COMMENT '卖家发货时间',
  `create_time` int(11) DEFAULT '0' COMMENT '订单创建时间',
  `finish_time` int(11) DEFAULT '0' COMMENT '订单完成时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT '订单是否已删除',
  `operator_type` int(1) NOT NULL DEFAULT '0' COMMENT '操作人类型  1店铺  2用户',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  `fixed_telephone` varchar(50) NOT NULL DEFAULT '' COMMENT '固定电话'
) ENGINE=InnoDB AVG_ROW_LENGTH=440 DEFAULT CHARSET=utf8 COMMENT='订单表';

--
-- 转存表中的数据 `ns_order`
--

INSERT INTO `ns_order` (`order_id`, `order_no`, `out_trade_no`, `order_type`, `payment_type`, `shipping_type`, `order_from`, `buyer_id`, `user_name`, `buyer_ip`, `buyer_message`, `buyer_invoice`, `receiver_mobile`, `receiver_province`, `receiver_city`, `receiver_district`, `receiver_address`, `receiver_zip`, `receiver_name`, `shop_id`, `shop_name`, `seller_star`, `seller_memo`, `consign_time_adjust`, `goods_money`, `order_money`, `point`, `point_money`, `coupon_money`, `coupon_id`, `user_money`, `user_platform_money`, `promotion_money`, `shipping_money`, `pay_money`, `refund_money`, `coin_money`, `give_point`, `give_coin`, `order_status`, `pay_status`, `shipping_status`, `review_status`, `feedback_status`, `is_evaluate`, `tax_money`, `shipping_company_id`, `give_point_type`, `pay_time`, `shipping_time`, `sign_time`, `consign_time`, `create_time`, `finish_time`, `is_deleted`, `operator_type`, `operator_id`, `refund_balance_money`, `fixed_telephone`) VALUES
(1, '123456', '0', 1, 0, 1, '', 3, 'tonyyonghu', '', '', 'adsfasdf', '15927154161', 1, 2, 3, 'adsfasdfasdf', 'asdfas', 'sasdfasd', 0, 'dfsdfsdf', 0, 'asdfasdf', 0, '0.00', '199.00', 0, '0.00', '0.00', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 5, 0, 0, 0, 0, 0, '0.00', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_ordernum`
--

CREATE TABLE `ns_ordernum` (
  `id` int(10) NOT NULL,
  `ordernum` varchar(20) DEFAULT NULL COMMENT '订单号',
  `shouhuouser` varchar(255) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `area` varchar(255) DEFAULT NULL COMMENT '区',
  `address` varchar(255) DEFAULT NULL COMMENT '街道',
  `descs` varchar(255) DEFAULT NULL COMMENT '备注',
  `ordertime` int(11) DEFAULT NULL COMMENT '订单时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ns_ordernum`
--

INSERT INTO `ns_ordernum` (`id`, `ordernum`, `shouhuouser`, `mobile`, `province`, `city`, `area`, `address`, `descs`, `ordertime`) VALUES
(15, '152592487', '康康', '15700989795', '新疆维吾尔自治区', '哈密市', '伊州区', '建设东路七路人防大厦二楼', '', 1568690790),
(14, '152592486', '周宗理', '15025409257', '云南省', '丽江市', '古城区', '雪山路412号西北方向156米四季家园', '', 1568690581),
(13, '152592485', '刘媛媛', '18282994386', '江苏省', '苏州市', '昆山市', '印象欧洲五区30栋', '', 1568690435),
(16, '152592488', '妞妞', '15901819431', '上海市', '上海市', '浦东新区', '上南路1016号肚子里有料。', '', 1568691016),
(17, '152592489', '弈宇', '18147232453', '内蒙古自治区', '包头市', '青山区', '钢铁大街乙30号京华府', '', 1568691135),
(18, '152592490', '杨洋', '16639900532', '江苏省', '苏州市', '昆山市', '千灯镇石浦协易路西艾杰电机', '', 1568691299),
(19, '152592491', ' 冯俊杰', '17605815496', '浙江省', '杭州市', '桐庐县', '分水镇裕丰家园  ', '', 1568691516),
(20, '152592492', '乐盼盼', '13995980723', '湖北省', '黄石市', '大冶市', '还地桥镇煤矿村金盆地湾', '', 1568691823),
(21, '152592493', '邓紫棋', '18898408529', '广东省', '广州市', '海珠区', '康乐中约北12巷8号', '', 1568692059),
(22, '152592494', '罗婷', '18872817652', '湖北省', '恩施土家族苗族自治州', '利川市', '清江大道361-7（古茗）', '', 1568692201),
(23, '152592495', '朱小胖', '15507325900', '浙江省', '金华市', '东阳市', '江北街道歌山北路238号门卫室', '', 1568692302),
(24, '152592496', '蒿兴芳', '13584365637', '江苏省', '常州市', '天宁区', '郑陆镇徐家村委大徐家头106号', '', 1568692648),
(25, '152592497', '罗中', '15111234023', '湖南省', '长沙市', '宁乡县', '金州镇宁乡金洲新区金水东路38号湖南红门金属建材有限公司', '', 1568692894),
(26, '152592498', '小姨子', '15088275224', '浙江省', '金华市', '永康市', '江南街道 城南路758后门', '', 1568693125),
(27, '152592499', '俞春英', '13967895958', '浙江省', '宁波市', '鄞州区', '四明中路577弄48号202室', '', 1568694119),
(28, '152592500', '陈。。。', '18657664933', '浙江省', '台州市', '温岭市', '城北街道沧浦村三叉路口振华自选', '', 1568695003),
(29, '152592501', '吴晓柯', '15845607520', '陕西省', '西安市', '未央区', '长安大学渭水校区', '', 1568695134),
(30, '152592502', '蔡蔡', '17762310206', '湖北省', '恩施土家族苗族自治州', '恩施市', '航空路银河大厦三楼', '', 1568695225),
(31, '152592503', '滕延芳 ', '15016169722', '河南省', '平顶山市', '汝州市', '陵头镇桥沟村3组', '', 1568696222),
(32, '152592504', '董志保', '13855014901', '江苏省', '扬州市', '邗江区', '华扬西路同扬光电', '', 1568696345),
(33, '152592505', '小慧', '13858691719', '浙江省', '台州市', '临海市', '杜桥镇洋洋公寓303', '', 1568696465),
(34, '152592506', '刘亚芹', '15161279856', '江苏省', '宿迁市', '沭阳县', '青伊湖镇青伊湖花苑', '', 1568697256),
(35, '152592507', '芯晴', '15362011405', '安徽省', '安庆市', '太湖县', '晋湖家园二期百莲凯美容会所', '', 1568698350),
(36, '152592508', '罗燕华', '18174863986', '广西壮族自治区', '贵港市', '桂平市', '金田镇田江村上板下屯50号', '', 1568698420),
(37, '152592509', '郑其容', '13678311086', '四川省', '宜宾市', '珙县', '巡场镇 圆通快递汪智宇收', '', 1568698503),
(38, '152592510', '李先生', '13943666160', '吉林省', '白城市', '洮北区', '绿色家园小区55-10#3单元', '', 1568698612),
(39, '152592511', '蒋锦', '18873060920', '广东省', '佛山市', '高明区', '杨和镇塘口新村36号', '', 1568700077),
(40, '152592512', '小凤', '15678232561', '广西壮族自治区', '来宾市', '忻城县', '城关镇芝州二路广场奥斯汀', '', 1568700455),
(41, '152592513', '刘亚芹', '15161279856', '江苏省', '宿迁市', '沭阳县', '青伊湖镇青伊湖花苑', '', 1568802923),
(42, '152592514', '白小姐', '13712433970', '广东省', '东莞市', '长安镇', '宵边第三工业区平谦工业园G栋肯尼有限公司', '', 1568806493),
(43, '152592515', '刘岩', '18238060705', '山东省', '济南市', '章丘市', '双山街道 经十东路3028号齐鲁理工学院', '', 1568807013),
(44, '152592516', '王祥宇', '13115090218', '江苏省', '无锡市', '江阴市', '云亭街道澄阳路199号', '', 1568807138),
(45, '152592517', '李丽欣', '13435673547', '广东省', '广州市', '海珠区', '新港西路，顺景街4号之19档，依嘉美发', '', 1568807467),
(46, '152592518', '邬方超', '13587041311', '浙江省', '舟山市', '普陀区', '泗湾路96弄1号', '', 1568807585),
(47, '152592519', '黎雯雪', '18077975735', '广东省', '佛山市', '南海区', '桂城石啃农贸市场403', '', 1568807672),
(48, '152592520', '施楠楠', '15360205439', '广东省', '汕尾市', '陆丰市', '甲子镇金源七区十巷3号', '', 1568807837),
(49, '152592521', '敖华英', '13984688925', '四川省', '阿坝藏族羌族自治州', '汶川县', '水磨镇阿坝师范学院', '', 1568807982),
(50, '152592522', '蒲发美', '13511471143', '浙江省', '台州市', '黄岩区', '院桥镇东家峰工业区，爱本文具有限公司', '', 1568808070),
(51, '152592523', '陈丹冰 ', '13926755957', '广东省', '汕头市', '龙湖区', '泰山路83号仙乐健康有限公司一厂区', '', 1568808183),
(52, '152592524', '阿洛', '18121008138', '江苏省', '苏州市', '张家港市', '塘桥填妙桥商城路237号港鸿模塑有限公司二楼海威服饰', '', 1568808670),
(53, '152592525', '杭建祥', '13955282527', '北京市', '北京市', '朝阳区', '亚运村街道 详细地址: 安定路五号院外运大厦B座6层', '', 1568808809),
(54, '152592526', '潘昱婷', '18306228371', '江苏省', '苏州市', '太仓市', '沙溪金榜世家', '', 1568809095),
(55, '152592527', '杜钱凤', '18892485872', '贵州省', '遵义市', '务川仡佬族苗族自治县', '东门米市宏发电器 ', '', 1568809258),
(56, '152592528', '梅子', '15285543096', '贵州省', '贵阳市', '乌当区', '高新社区服务中心云岩区水东路中天甜蜜小镇6组团3栋', '', 1568898258),
(57, '152592529', '小鹦鹉', '18336362890', '河南省', '郑州市', '中牟县', '郑开大道与通商路交叉口向北一千米亨泽物流园内壹米滴答物流', '', 1568898951),
(58, '152592530', '谢丽媛', '13945355521', '黑龙江省', '牡丹江市', '宁安市', '西大街媗扬化妆品', '', 1568899571),
(59, '152592531', '蔡佳斌', '15757295961', '浙江省', '湖州市', '德清县', '洛舍镇章家桥啊忠车行', '', 1568813725),
(60, '152592532', '周德海', '18217872743', '海南省', '屯昌县', '', '昌源路 昌源洗车场 ', '', 1568900526),
(61, '152592533', '李兴玲', '13925351436', '广西壮族自治区', '玉林市', '玉州区', '解放路 食坊里桃花季', '', 1568901716),
(62, '152592534', '张槿馨', '18076182420', '贵州省', '贵阳市', '观山湖区', '金阳红街景和酒店一楼前台', '', 1568901964),
(63, '152592535', '张心怡', '18536628701', '山西省', '太原市', '小店区', '恒大绿洲西区北门57号楼三单元', '', 1568903051),
(64, '152592536', '黄飞燕', '18783978493', '四川省', '南充市', '西充县', '城北新区.麓湖国际小区正门口', '', 1568906767),
(65, '152592537', '赵萌', '18631897089', '河北省', '衡水市', '冀州市', '金鸡大街富强理想城售楼部', '', 1568821334),
(66, '152592538', '段胤伦', '15971900019', '湖北省', '十堰市', '茅箭区', '国家税务总局十堰经济开发区税务局  ', '', 1568821538),
(67, '152592539', '纳亚鑫', '19987683727', '云南省', '红河哈尼族彝族自治州', '个旧市', '沙甸镇沙甸大寺', '', 1568821856),
(68, '152592540', '徐静', '18523696906', '广西壮族自治区', '贵港市', '桂平市', '西山镇桂平一职学校外', '', 1568822261),
(69, '152592541', '韩最英', '13996719659', '重庆市', '重庆市', '涪陵区', '蔺市镇人民政府', '', 1568822361),
(70, '152592542', '王亚玲', '15076195209', '河北省', '石家庄市', '藁城区', '兴安镇兴安村', '', 1568736107),
(71, '152592543', '杨洋', '17665497002', '广东省', '深圳市', '宝安区', '西乡大道宝源二区兴业路181栋', '', 1568736330),
(72, '152592544', '高芳', '15251015011', '辽宁省', '沈阳市', '铁西区', '霁虹街道北三东路火肉火泥炉烤肉28/1号10门', '', 1568736489),
(73, '152592545', '吕妹', '15258556698', '浙江省', '绍兴市', '嵊州市', '富民街145号', '', 1568736598),
(74, '152592546', '梦静', '17719442030', '北京市', '北京市', '丰台区', '西四环中路100号中国人民解放军302医院', '', 1568736711),
(75, '152592547', '宋孝亭', '18937709937', '广东省', '东莞市', '黄江镇', '君悦蓝庭1栋二单元1603', '', 1568823756),
(76, '152592548', '邓显存', '13556684626', '广东省', '佛山市', '三水区', '西南街道南丰大道永业路1号合和建筑五金', '', 1568738511),
(77, '152592549', '孙东艳', '17621588725', '上海市', '上海市', '嘉定区', '江桥镇丰庄北路5弄住嘉佳苑12号楼602室', '', 1568738612),
(78, '152592550', '吴泽武', '15113103238', '广东省', '汕头市', '潮南区', '仙城镇榕堂村八乡圩华龙超市', '', 1568739440),
(79, '152592551', '崔树刚', '15266737921', '内蒙古自治区', '阿拉善盟', '阿拉善右旗', '内蒙古自治区—阿拉善盟—阿拉善右旗', '', 1568739557),
(80, '152592553', '李凯洋', '16620745215', '广东省', '东莞市', '大岭山镇', '金雄达科技园J栋4楼下', '', 1568862162),
(81, '152592554', '林浩林', '15016560641', '广东省', '广州市', '白云区', '龙归北太路黄埔技工学校', '', 1568863113),
(82, '152592555', '耿晓伟', '13296317988', '山东省', '威海市', '乳山市', '城东街道办事处商业街47乳山利群购物广场', '', 1568863283),
(83, '152592556', '丁鹏举', '18704015388', '辽宁省', '丹东市', '振兴区', '振七街，61号楼， 锦山大街兴七路道口，向西100米，光大银行对面办公家具', '', 1568863776),
(84, '152592557', '臧莉', '18622967067', '天津市', '天津市', '静海区', '泰安盛世骏，9号楼，201室', '', 1568864081),
(85, '152592558', '郑再宁', '18778874100', '广西壮族自治区', '钦州市', '钦南区', '南珠街道高岭社区郑屋村71号', '', 1568864240),
(86, '152592559', '谢文斌', '13085987751', '陕西省', '西安市', '雁塔区', '唐延路3号仆蜂莲花', '', 1568864679),
(87, '152592560', '陌陌', '18335853112', '山西省', '吕梁市', '文水县', '开栅镇北峪口村', '', 1568864815),
(88, '152592561', '王福坤', '15632202555', '河北省', '保定市', '涿州市', '范阳路366号名流公寓底商北京易融方弘涿州分公司', '', 1568864887),
(89, '152592562', '吴小芬', '18981664143', '四川省', '巴中市', '巴州区', '财苑街农田咖啡', '', 1568865035),
(90, '152592563', '张跃华', '13333466526', '山西省', '太原市', '小店区', '长治路103号阳光国际商务中心B座1903室', '', 1568865150),
(91, '152592564', '李宗铠', '18518060504', '北京市', '北京市', '大兴区', '安定镇郑前路2号', '', 1568865310),
(92, '152592565', ' 刘鑫', '18593820704', '贵州省', '贵阳市', '南明区', '贵阳市南明区小碧乡WJYZD  机 关', '', 1568865469),
(93, '152592566', '陈鑫', '18199526789', '新疆维吾尔自治区', '喀什地区', '莎车县', '恰热克工业园', '', 1568866144),
(94, '152592567', '孙欣冉', '13601395287', '河北省', '廊坊市', '三河市', '燕郊镇天洋城北区21号楼4单元1501', '', 1568866379),
(95, '152592568', '黄笑', '15514932765', '河南省', '商丘市', '虞城县', '古王集乡风暴KTV', '', 1568867004),
(96, '152592569', '欢欢', '13598879372', '河南省', '郑州市', '金水区', '东风路花园路正弘城负一楼弘坊区小乾龙儿童珠宝', '', 1568867495),
(97, '152592570', '夏天', '13282628373', '浙江省', '台州市', '临海市', '靖江中路187号13楼蓝馆健身房', '', 1568868171),
(98, '152592571', '程程', '13754842491', '山西省', '长治市', '襄垣县', '欧亚大酒店康乐中心吧台收', '', 1568868334),
(99, '152592572', '王兰萍', '18989181165', '四川省', '南充市', '嘉陵区', '大通镇人民正街', '', 1568868408),
(100, '152592573', '蒋侦', '17706094490', '福建省', '福州市', '闽侯县', '上街镇高新苑b区26栋', '', 1568868511),
(101, '152592574', '谭宇翔', '18274269381', '湖南省', '株洲市', '荷塘区', '湖南工业大学（老校区）', '', 1568868648),
(102, '152592575', '刘萱 ', '13382022981', '江苏省', '南京市', '栖霞区', '迈皋桥街道和悦街11号凤来南园4栋2807', '', 1568868805),
(103, '152592576', '楠楠', '13641915974', '上海市', '上海市', '青浦区', '夏阳街道城南47号', '', 1568869407),
(104, '152592577', '李小敏', '15655823561', '上海市', '上海市', '青浦区', '夏阳街道上海上海市青浦区夏阳街道青峰路103号东北农家院', '', 1568869658),
(105, '152592578', '廖海涛 ', '13729357977', '广东省', '揭阳市', '普宁市', '池尾街道 高埕村 美乐门口 ', '', 1568973241),
(106, '152592579', '陈志兰', '13557573132', '广西壮族自治区', '南宁市', '兴宁区', '望州路南二里天主教往前300米', '', 1568973543),
(107, '152592580', '薛意洛', '18191590044', '陕西省', '安康市', '石泉县', '石泉县池河镇', '', 1568973617),
(108, '152592581', '高博蕾', '15031170350', '河北省', '石家庄市', '桥西区', '滨河小区颐兴园', '', 1568973744),
(109, '152592582', '侯静', '15232136070', '河北省', '石家庄市', '裕华区', '东岗怡园33-2-1002', '', 1568973813),
(110, '152592583', '胡茜茜', '13702621164', '广东省', '佛山市', '禅城区', '南庄镇 详细地址: 吉利市场对面沃达百货三楼打包台', '', 1568973957),
(111, '152592584', '吴玉', '15121616560', '广东省', '广州市', '南沙区', '黄阁镇，保利半岛北地块', '', 1568975291),
(112, '152592585', '于明远', '13791695293', '山东省', '潍坊市', '寿光市', '渤海路1047号', '', 1568975464),
(113, '152592586', '程向', '13618182600', '四川省', '乐山市', '市中区', '人民北路180号博世一站式汽车养护', '', 1568975594),
(114, '152592587', '明俊', '15959195394', '福建省', '宁德市', '蕉城区', '万达华城D区22栋二单元1305', '', 1568975700),
(115, '152592588', '郭林玲 ', '18912575227', '江苏省', '盐城市', '阜宁县', '长春路上海路交叉口路东 百嘉乐主题ktv前台', '', 1568975795),
(116, '152592589', '陈志杰', '15605294026', '江苏省', '南京市', '栖霞区', '龙潭街道东阳街777号近邻宝东院9区93号', '', 1568975974),
(117, '152592590', '程丽丽', '18168162479', '江苏省', '泰州市', '海陵区', '寺巷镇光电产业园青年公寓「月琴百货代收」', '', 1568976438),
(118, '152592591', '谷小雨', '18795902504', '江苏省', '南京市', '浦口区', '江浦街道金浦广场5-22号猫巷', '', 1568976524),
(119, '152592592', '李文虎', '18118306203', '江苏省', '苏州市', '常熟市', '练塘镇罗墩村，强者共舞有限公司', '', 1568976624),
(120, '152592593', '高露露', '18846617952', '黑龙江省', '大庆市', '大同区', '福民苑16号楼四单元。', '', 1568946543),
(121, '152592594', '木渣渣', '17826980530', '浙江省', '金华市', '武义县', '牛背金工业区沈宅百拓牛牛（颐家新厂）（电话打不通放门卫）', '', 1568948273),
(122, '152592595', '刘思雨', '18283827793', '四川省', '成都市', '金牛区', '西华街道红光大道9999号西华大学德馨苑', '', 1568948556),
(123, '152592596', '刘玉', '18655229935', '安徽省', '蚌埠市', '怀远县', '怀远县万福镇', '', 1568948646),
(124, '152592597', '周金晶', '13456550262', '浙江省', '绍兴市', '嵊州市', '北直街100号一单元407室', '', 1568948784),
(125, '152592598', '胡萌萌', '13275473683', '山东省', '济宁市', '金乡县', '王丕镇李故楼村苏庄', '', 1568948907),
(126, '152592599', '何川', '18081716044', '四川省', '攀枝花市', '其它区', '盐边县渔门镇', '', 1568950201),
(127, '152592600', '胡正哲', '13584823282', '江苏省', '苏州市', '吴中区', '工业园区苏州中心商场南区五楼左庭右院', '', 1568950329),
(128, '152592601', '杜红', '15308702120', '云南省', '红河哈尼族彝族自治州', '泸西县', '果树站隔壁俊腾人力资源', '', 1568950542),
(129, '152592602', '唐晓倩', '18281035211', '四川省', '内江市', '隆昌市', '川南幼儿师范高等专科学校。放大门口', '', 1568950691),
(130, '152592603', '刘凯伟', '17600235278', '北京市', '北京市', '昌平区', '小汤山镇白马路甲1号', '', 1568950800),
(131, '152592604', '刘华荣  ', '18634679172', '广东省', '广州市', '天河区', '黄埔大道中199号阳光酒店', '', 1568950959),
(132, '152592605', '吕妹', '15258556698', '浙江省', '绍兴市', '嵊州市', '仙湖路828号一号楼三楼', '', 1568951211),
(133, '152592606', '杨莉', '15921904451', '安徽省', '蚌埠市', '淮上区', '双墩路  桂花园北区  十号楼  三单元 102', '', 1568951360),
(134, '152592607', '黄俊杰', '15113269557', '贵州省', '毕节市', '大方县', '大方县大山乡', '', 1568951421),
(135, '152592608', '小敏', '15519592362', '贵州省', '遵义市', '红花岗区', '老城街道老城步行街，中段优韩女装专卖店', '', 1568953048),
(141, '152592609', '余慧', '17796422295', '四川省', '内江市', '威远县', '东联镇菜子湾村5', '', 1569070360),
(142, '152592610', '柏叶斌', '15588621416', '江苏省', '常州市', '武进区', '延政西大道1号九洲喜来登酒店员工通道', '', 1569070503),
(143, '152592611', '郭林玲', '18912575227', '江苏省', '盐城市', '阜宁县', '长春路上海路交叉口路东 百嘉乐主题ktv前台', '', 1569070732),
(144, '152592612', '陈美玲', '18867258287', '福建省', '漳州市', '芗城区', ' 绿洲富城边小陈超市', '', 1569070879),
(145, '152592613', '汪静', '13547785521', '四川省', '遂宁市', '射洪县', '武安河下段1号', '', 1569070962),
(146, '152592614', '李梦瑶', '18261306571', '江苏省', '徐州市', '睢宁县', '高作镇 水木年华汤泉宫 ', '', 1569071094),
(147, '152592615', '代妹', '17623169110', '福建省', '福州市', '永泰县', '领路乡潭后村', '', 1569071406),
(148, '152592616', '周仕仙', '19857357031', '浙江省', '嘉兴市', '嘉善县', '姚庄镇福泰路19号', '', 1569071460),
(149, '152592617', '王园园', '18365006335', '安徽省', '滁州市', '天长市', '关塘福胜小区', '', 1569071553),
(150, '152592618', '佳佳', '18755641300', '安徽省', '安庆市', '桐城市', '桐城市香港广场 沃佳 收件人 佳佳 18755641300', '', 1569071804),
(151, '152592619', '莹', '13556352502', '广东省', '汕头市', '澄海区', '澄华街道领亭新村13幢706（快递到了不要打电话，发信息就行，谢了昂）', '', 1569071995),
(152, '152592620', '刘永豪', '19927725483', '广东省', '广州市', '天河区', '交通运输技师学院', '', 1569072383),
(153, '152592621', '杨永昌', '17740483146', '河南省', '新乡市', '卫滨区', '解放路与化工路交叉口东南角成杰汽修院内', '', 1569072697),
(154, '152592622', '许声键', '18960952910', '福建省', '福州市', '晋安区', '宦溪镇五四北泰禾广场2号楼1号店发现美容美发', '', 1569072961),
(155, '152592623', '李颖', '17843894632', '重庆市', '重庆市', '合川区', '土场镇北汽银翔新概念网盟', '', 1569073180),
(156, '152592624', '洪焱林', '18814381077', '广东省', '惠州市', '惠阳区', '新圩镇塘吓市场西区万兴路奥佳苑A栋', '', 1569073432),
(157, '152592625', '李文彬', '18865334289', '山东省', '淄博市', '桓台县', '少海街道五里小区29号楼1单元一楼西户', '', 1569073666),
(158, '152592626', '胡予婕 ', '19973287617', '湖北省', '武汉市', '黄陂区', '横店影视城天阳路7号', '', 1569073750),
(159, '152592627', '易雄彪', '17397382777', '湖南省', '娄底市', '娄星区', '早元街添天烟酒', '', 1569073877),
(160, '152592628', '李江云', '17369708568', '贵州省', '安顺市', '镇宁布依族苗族自治县', '黄果树镇，黄果树新城荡上南区一排优越酒店收', '', 1569073956),
(161, '152592629', '王春利', '15049680800', '北京市', '北京市', '通州区', '台湖镇科创东五街九号院弘赫体育', '', 1569074326),
(162, '152592630', '彭慧敏', '18751631115', '江苏省', '徐州市', '沛县', '徐州市沛县杨屯', '', 1569074432),
(163, '152592631', '可乐', '13633718288', '河南省', '郑州市', '金水区', '东岳寨村15排琪琪内衣店', '', 1569074496),
(164, '152592632', '单康娟', '15961277731', '江苏省', '常州市', '溧阳市', '盛世华城18栋一单元402室', '', 1569074570),
(165, '152592633', '罗白平', '18311745045', '贵州省', '铜仁市', '万山区', '谢桥街道 名家汇国际广场金色贵族', '', 1569075252),
(166, '152592635', '李丹', '18748620040', '广东省', '东莞市', '塘厦镇', '田心科苑城沙田路9号中宝信息产业园 卓源精密', '', 1569119071),
(167, '152592636', '潘浩刚', '15152705567', '江苏省', '扬州市', '邗江区', '西湖镇西湖景园35栋二单元303', '', 1569119254),
(168, '152592637', '石木', '15137873511', '河南省', '开封市', '龙亭区', '北郊乡东京大道开封大学新校区', '', 1569119411),
(169, '152592638', '梁颖', '15811994270', '广东省', '惠州市', '惠城区', '龙湖19区8号西盛科技有效公司前台', '', 1569119666),
(170, '152592639', '叶伟丽', '13750692140', '浙江省', '台州市', '椒江区', '三甲街道朝阳路100号卓越诚品教育', '', 1569119739),
(171, '152592640', '张帅昌', '18799329995', '新疆维吾尔自治区', '和田地区', '和田县', '和田玉州小区五号楼二单元601', '', 1569119947),
(172, '152592642', '丁斌', '18119880588', '江苏省', '南京市', '玄武区', '珠江路511   1栋7单元514', '', 1569120429),
(173, '152592641', '花花', '15330441688', '重庆市', '重庆市', '开州区', '开州区文峰街道 中原街一支路130号', '', 1569120514),
(174, '152592643', '宋浩华', '18834864670', '山西省', '吕梁市', '孝义市', '孝义市佳香基', '', 1569120772),
(175, '152592644', '周丽', '15760095932', '四川省', '宜宾市', '高县', '庆符镇贾村街道', '', 1569121427),
(176, '152592645', '贾玉冬', '18658107261', '浙江省', '杭州市', '滨江区', '西兴街道东流路700号海康威视', '', 1569121486),
(177, '152592646', '万明', '15025570765', '上海市', '上海市', '浦东新区', '唐镇创新西路52号（唯宝地产）', '', 1569121615),
(178, '152592647', '李灿妹', '19127411760', '广西壮族自治区', '梧州市', '苍梧县', '石桥镇隆诚建材料店', '', 1569121946),
(179, '152592648', '陆冬 ', '15851228942', '江苏省', '南通市', '启东市', '吕四港镇茅家港菜场', '', 1569122140),
(180, '152592649', '刘丽兰', '13928696757', '广东省', '深圳市', '宝安区', '沙井镇共和村西十三巷23号宝佳百货', '', 1569122539),
(181, '152592650', '龙耀坤', '15099815536', '广东省', '茂名市', '茂南区', '羊角镇西粤中路茂丰花园斜坡直入500米东北烧烤', '', 1569122767),
(182, '152592651', '陈。。。', '18657664933', '浙江省', '台州市', '温岭市', '城北街道沧浦村三叉路口振华自选', '', 1569122892),
(183, '152592652', '夏延礼', '15867650098', '浙江省', '台州市', '温岭市', '城北街道沧浦村', '', 1569123038),
(184, '152592653', '明鑫雨', '13694593739', '吉林省', '长春市', '绿园区', '轻铁湖西花园犄角旮旯烧烤', '', 1569124903),
(185, '152592654', '周倩怡', '13407596343', '浙江省', '杭州市', '桐庐县', '富春江镇俞赵工业区旭日鞋', '', 1569125038),
(186, '152592655', '吕娜', '13732454576', '辽宁省', '沈阳市', '浑南区', '五三街到汇泉路3号金地旭辉风华2门杭州小笼包', '', 1569125113),
(187, '152592656', '高飞', '15858184515', '浙江省', '杭州市', '余杭区', '良渚街道万科锦云坊57-2-501', '', 1569125432),
(188, '152592657', '黄超存', '15688803597', '山东省', '潍坊市', '潍城区', '望留街道山东科技职业学院', '', 1569125702),
(191, '152592634', '王钰杰', '18838004070', '河南省', '郑州市', '惠济区', '南阳寨西湖花园小区23号楼', '', 1569126454),
(190, '152592658', '静静', '19973226599', '湖南省', '长沙市', '岳麓区', '学士街道学士小区20栋', '', 1569126022),
(192, '152592659', '谢中意', '16623124083', '重庆市', '重庆市', '合川区', '欧博星座1栋11—3', '', 1569126621),
(193, '152592660', '胡正哲', '13584823282', '江苏省', '苏州市', '吴中区', '工业园区苏州中心商场南区五楼左庭右院', '', 1569127413),
(194, '152592661', '蒿兴芳', '13584365637', '江苏省', '常州市', '天宁区', '郑陆镇徐家村委大徐家头106号', '', 1569127538),
(195, '152592663', '赵国兴 ', '15051397428', '江苏省', '淮安市', '清浦区', '淮海东路苏果超市东侧三楼国贸休闲酒店', '', 1569199593),
(196, '152592664', '孙先生', '15251775603', '江苏省', '南京市', '鼓楼区', '龙江路30号，中冶盛世滨江售楼处', '', 1569200088),
(197, '152592665', '施青宇', '17396415401', '江苏省', '常州市', '武进区', '湟里东安蒋埝许家头37号', '', 1569200161),
(198, '152592666', '王蕊蕊', '15256153563', '安徽省', '亳州市', '蒙城县', '王集乡王集街', '', 1569200373),
(199, '152592667', '陈瑞', '13337879512', '江苏省', '苏州市', '昆山市', '晨淞路299号', '', 1569200496),
(200, '152592668', '杨润', '17606855485', '浙江省', '宁波市', '慈溪市', '后二房路146弄14号', '', 1569200588),
(201, '152592669', '谢珏', '13697001127', '江西省', '南昌市', '青山湖区', '上海路街道新魏路半边街23号 ', '', 1569200676),
(202, '152592670', '贝乐姿', '15277731718', '广西壮族自治区', '桂林市', '荔浦县', '修仁镇横水村镰刀湾贝家屯13号', '', 1569200847),
(204, '152592671', '梁文丽', '15819998635', '广东省', '中山市', '五桂山镇', '金美怡有限公司', '', 1569201331),
(205, '152592672', '田巍', '18772889848', '湖北省', '十堰市', '房县', '白鹤镇孙家湾村六组', '', 1569201448),
(206, '152592673', '景玉柱', '19891207156', '陕西省', '西安市', '鄠邑区', '科技卫校', '', 1569201706),
(207, '152592674', '丁照俊', '17856856027', '安徽省', '阜阳市', '颍州区', '王店镇新建村胜利庄', '', 1569201769),
(208, '152592675', '常卿', '13758438429', '广东省', '佛山市', '南海区', '大沥镇盐步广河路平地北段6号悦江澜二楼', '', 1569201854),
(209, '152592676', '黄桂花', '18268798392', '浙江省', '绍兴市', '袍江新区', '马山镇三江路博盟精工机械有限公司', '', 1569202031),
(210, '152592677', '黄柏淋', '13924137813', '广东省', '广州市', '天河区', '中山大道中珠村国际机械城百力商务办公楼3楼', '', 1569202183),
(211, '152592678', '小勇 ', '13858502439', '贵州省', '贵阳市', '南明区', '花果园。金融街2号3楼', '', 1569202267),
(212, '152592679', '陈萍', '13921160907', '江苏省', '无锡市', '江阴市', '祝塘镇文林环南路21-1云如超市', '', 1569202390),
(213, '152592680', '李宏勇', '13933386752', '河北省', '唐山市', '路南区', '梁家屯路街道仁泰里710楼2门302', '', 1569202593),
(214, '152592681', '张娟', '18955716217', '浙江省', '杭州市', '富阳区', '东洲街道京东亚洲一号物流园', '', 1569328114),
(215, '152592682', '蒋芸', '15982627498', '四川省', '广安市', '华蓥市', '时代映像艾薇尔美容会所', '', 1569328186),
(216, '152592683', 'Angel', '18680180666', '广东省', '中山市', '东区街道', '远洋城美域9幢', '', 1569329276),
(217, '152592684', '陈亚鑫', '15865841916', '山东省', '菏泽市', '开发区', '开发区华英路与永昌路交叉口往北60米大叔烤肉', '', 1569330086),
(218, '152592685', '王兴波', '18767914850', '浙江省', '金华市', '武义县', '桐琴镇桃产村万家乐超市', '', 1569330154),
(219, '152592686', '海涵', '15136037033', '河南省', '郑州市', '中牟县', '豫兴街道前程路8号郑州工商学院', '', 1569331247),
(220, '152592687', '刘莉', '15523048087', '重庆市', '重庆市', '开州区', '开县百城街105号 上海城一楼', '', 1569331332),
(221, '152592688', '王轩', '17629232461', '陕西省', '西安市', '未央区', '大白杨街道梨园路御园温泉小区', '', 1569331482),
(419, '152592883', '孙梦珂', '15890980822', '江苏省', '南通市', '海门市', '天补镇海天桥', '', 1569765907),
(223, '152592690', '苏浩', '18398211779', '四川省', '成都市', '青羊区', '清江中路53－55号金沙春', '', 1569333219),
(224, '152592691', '朱兆军', '13071926150', '浙江省', '宁波市', '鄞州区', '下应镇芊丝美发1085', '', 1569333341),
(225, '152592692', '陈。。。', '18657664933', '浙江省', '台州市', '温岭市', '城北街道沧浦村三叉路口振华自选', '', 1569333460),
(226, '152592693', '大熊', '17611525280', '北京市', '北京市', '朝阳区', '左家庄街道静安东里16号楼世纪华联超市一纸鸡锡纸烧肉饭', '', 1569333587),
(227, '152592694', '刘乐乐', '18163555996', '湖北省', '武汉市', '江夏区', '纸坊街武昌大道642号建颐小区', '', 1569334402),
(228, '152592695', '王春利', '15049680800', '北京市', '北京市', '通州区', '台湖镇科创东五街九号院弘赫体育', '', 1569335172),
(229, '152592696', '钟幼娟', '15879530680', '江西省', '宜春市', '袁州区', '明月南路123号', '', 1569335432),
(232, '152592698', '杨小辉', '13292266827', '河北省', '衡水市', '故城县', '里老乡宇航超市', '', 1569335799),
(231, '152592697', '林碧', '18174660550', '广东省', '深圳市', '宝安区', '沙井新沙天虹购物中心九楼九田家', '', 1569335566),
(233, '152592699', '闫荣', '13835912859', '山西省', '运城市', '盐湖区', '中城街道都市绿洲13号楼1单元402', '', 1569335884),
(234, '152592700', '李紫夷', '13811398952', '北京市', '北京市', '海淀区', '苏州街76号大洋公寓一层中控室（不要放快递柜和代收点）', '', 1569336183),
(235, '152592701', '张云艳', '17601394820', '上海市', '上海市', '嘉定区', '安亭镇上海市嘉定区方泰镇泰波路8号自提柜', '', 1569336474),
(236, '152592702', '敬思敏', '17158803963', '广东省', '佛山市', '顺德区', '伦教旧广珠路康丽花苑1-501', '', 1569336648),
(237, '152592703', '伊一', '13952612552', '江苏省', '泰州市', '海陵区', ' 医药城香榭湾菜鸟驿站', '', 1569338240),
(238, '152592704', '苗苗', '15915680870', '广东省', '揭阳市', '普宁市', '池尾街道华市村金叶园29栋', '', 1569338397),
(240, '152592705', '李进平', '18093306521', '甘肃省', '平凉市', '崆峒区', '解放北路87号中医医院家属院一号楼一单元601', '', 1569383372),
(241, '152592706', '二妖', '13917705368', '上海市', '上海市', '嘉定区', '马陆镇樊宝路樊家花苑35弄49号', '', 1569383504),
(242, '152592707', '杨文蕊', '18313999403', '云南省', '临沧市', '凤庆县', '凤山镇时代广场老年活动中心', '', 1569383867),
(243, '152592708', '佘胤', '17708364378', '重庆市', '重庆市', '武隆区', '龙腾苑 2栋18-4', '', 1569384725),
(244, '152592709', '小徐', '18277408856', '广东省', '广州市', '黄埔区', '永和街道新安路3-2号新庄门诊', '', 1569385057),
(245, '152592710', '梁玲玲', '18012906969', '江苏省', '南京市', '六合区', '六合区泰山路7号', '', 1569385179),
(246, '152592711', '嘉嘉', '15521303552', '广东省', '广州市', '增城区', '增城区新塘镇石新大道168号，放美宜家', '', 1569385263),
(247, '152592712', '杨义', '13711708273', '广东省', '东莞市', '南城区', '南城区鸿福花园', '', 1569385409),
(248, '152592713', '刘雪', '13624340244', '吉林省', '长春市', '农安县', '农安县伏龙泉镇', '', 1569385825),
(249, '152592714', '关家金', '18717893297', '上海市', '上海市', '嘉定区', '徐行镇汇源路288号嘉隆国际2栋418室', '', 1569386493),
(250, '152592715', '王鸿琳', '15868277098', '浙江省', '湖州市', '德清县', '武康镇星辰公馆10幢三单元606', '', 1569387516),
(251, '152592716', '李梅', '18775522896', '广西壮族自治区', '玉林市', '玉州区', '樟木镇罗冲村', '', 1569388532),
(252, '152592717', '罗仕敏', '18328186797', '四川省', '乐山市', '市中区', '通江街王河小区文星后街56号，黄记鲜肉包子铺', '', 1569388624),
(253, '152592718', '汤强健', '13861701051', '江苏省', '无锡市', '惠山区', '长安镇长宁苑五区', '', 1569388826),
(254, '152592719', '王洪园', '18805601367', '安徽省', '宿州市', '埇桥区', '埇桥区顺河乡 ', '', 1569388946),
(255, '152592720', '余娜', '18004776993', '内蒙古自治区', '鄂尔多斯市', '鄂托克旗', '棋盘井镇人保财险', '', 1569390669),
(256, '152592721', '李沁梅', '13882007894', '四川省', '成都市', '武侯区', '一环路南一段和信派都', '', 1569390810),
(257, '152592722', '刘鑫朋', '15244093382', '山东省', '青岛市', '黄岛区', '滨海街道小口子16-0信箱八分队', '', 1569390880),
(258, '152592723', '刘琪', '15263319912', '山东省', '日照市', '东港区', '丹阳路121号泉祥佳苑2号楼二单元402', '', 1569390995),
(259, '152592724', '梁凯毅', '18775433290', '广东省', '佛山市', '高明区', '杨和镇 沙水河西路佛山市山高峰包装材料科技有限公司', '', 1569391103),
(260, '152592725', '胡婷婷', '13545545653', '湖北省', '黄石市', '大冶市', '世纪乐园二楼金秋店', '', 1569391211),
(261, '152592726', '王艺迪', '18339251565', '河南省', '郑州市', '金水区', '顺河路55号院(黄河中心医院家属院）', '', 1569391554),
(262, '152592727', '徐东', '18964277109', '上海市', '上海市', '嘉定区', '汇源路208号1号楼', '', 1569487624),
(263, '152592728', '骆相奇', '15676637368', '广西壮族自治区', '百色市', '凌云县', '逻楼镇海里燃气店', '', 1569487812),
(264, '152592729', '花小贱', '18657210610', '浙江省', '湖州市', '德清县', '武康镇吉祥街155号印茶', '', 1569487897),
(265, '152592730', '王晓强', '18640605678', '辽宁省', '锦州市', '凌河区', '凌河区吉庆里7_1', '', 1569488089),
(266, '152592731', '秦春莉', '18919063876', '甘肃省', '兰州市', '七里河区', '西站建兰南路便民百货，七天酒店对面', '', 1569488285),
(267, '152592732', '小晴 ', ' 1885935332', '浙江省', '温州市', '鹿城区', '五马街道江滨西路 江滨大厦二楼 475号    ', '', 1569488519),
(268, '152592733', '唐芳慧', '18975075083', '湖南省', '怀化市', '中方县', '镇城南派出所', '', 1569489023),
(269, '152592734', '胡兆玲', '14787491356', '云南省', '昆明市', '官渡区', '关上新村石虎关加油站', '', 1569489114),
(270, '152592735', '黄蓉', '13966262399', '安徽省', '六安市', '金安区', '六安大市场三期公安路156号', '', 1569489298),
(271, '152592736', '仇媛媛', '18852175393', '江苏省', '徐州市', '铜山区', '铜山街道上海路101号江苏师范大学科文学院二期（山上）', '', 1569489545),
(272, '152592737', '晓颖 ', '13677769207', '广东省', '深圳市', '龙岗区', '布吉街道宝丽路西环路红绿灯路口德福广场B1216', '', 1569489798),
(273, '152592738', '官莉莉', '15207071880', '江西省', '赣州市', '章贡区', '水南新村三明路6-66号', '', 1569489874),
(274, '152592739', '何懿露', '18292168060', '陕西省', '西安市', '未央区', '梨园路金业观湖大第', '', 1569489971),
(275, '152592740', '童静', '18966872667', '陕西省', '西安市', '碑林区', '景观路33号爱多格宠物会所', '', 1569490106),
(276, '152592741', '柴奥颖', '15306386179', '山东省', '威海市', '环翠区', '初村镇山东药品食品职业学院菜鸟驿站', '', 1569490366),
(277, '152592742', '王勇锋', '13824251687', '广东省', '惠州市', '惠城区', '三栋数码园北区申通快递点', '', 1569490634),
(278, '152592743', '李天蕴', '13299479502', '河北省', '保定市', '蠡县', '男庄镇宋岗村253号', '', 1569490861),
(279, '152592744', '董艳', '18325771753', '安徽省', '宿州市', '埇桥区', '支河乡曹庄村杨树底', '', 1569491911),
(280, '152592745', '陈朵', '15211042873', '湖南省', '长沙市', '岳麓区', '望城坡街道江南公寓4栋', '', 1569492089),
(281, '152592746', '晓丽', '15868272860', '浙江省', '湖州市', '安吉县', '递铺镇丰华路恒隆府IBED酒店', '', 1569492244),
(282, '152592747', '费锋锋', '13615799600', '浙江省', '金华市', '义乌市', '五洲大道2000号浙中新农批6区28A', '', 1569492594),
(283, '152592748', '秦芳（李鹏）', '18874048617', '湖南省', '长沙市', '望城区', '高塘岭街道黄桥大道高域自然城本宜超市', '', 1569492717),
(284, '152592749', '盼盼', '13676734821', '浙江省', '温州市', '鹿城区', '人民西路269（妙果寺对面车站台旁）女王化妆品店', '', 1569540036),
(285, '152592750', '王化彬', '15940963678', '辽宁省', '大连市', '瓦房店市', '复州城镇馨怡景苑6号楼一单元一零一室', '', 1569540210),
(286, '152592751', '万姐', '18013488182', '江苏省', '苏州市', '相城区', '渭塘镇珍珠湖路99号珍珠湖浴场', '', 1569540405),
(287, '152592752', '李明洁', '15637796000', '河南省', '南阳市', '桐柏县', '桐柏县第三医院', '', 1569540561),
(288, '152592753', '王钰杰', '17629087563', '陕西省', '西安市', '蓝田县', '二十米路中段艾维女装', '', 1569540922),
(289, '152592754', '鲁文广', '18060169222', '甘肃省', '兰州市', '城关区', '亚太城市月光4号楼2808', '自费顺丰15元', 1569541458),
(290, '152592755', '宋宋', '18053279309', '山东省', '青岛市', '市北区', '道口路30号', '', 1569541601),
(291, '152592756', '卢瑞丽', '13969722663', '山东省', '青岛市', '市北区', '仲和路六号9号楼一单元304', '', 1569541699),
(292, '152592757', '北北', '13079587176', '上海市', '上海市', '浦东新区', '川周公路2914号', '', 1569541778),
(293, '152592758', '李秀红', '18813746870', '广东省', '汕尾市', '陆丰市', '东海镇沙埔管区龙辉中学', '', 1569541921),
(294, '152592759', '庄百会', '15275586915', '山东省', '临沂市', '兰山区', '半程镇百世快递收', '', 1569542230),
(295, '152592760', '王莘茹', '15156898125', '安徽省', '合肥市', '肥东县', '撮镇镇义和东区2期', '支付宝', 1569542894),
(296, '152592761', '陶珊珊', '18724419117', '黑龙江省', '哈尔滨市', '松北区', ' 对青山镇 李家乡', '', 1569651132),
(297, '152592762', '王增霞', '15099458050', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '库尔勒市', '巴音西路聚荣大厦建设银行旁绿色悦己', '', 1569651212),
(298, '152592763', '谢凯', '15873993915', '湖南省', '邵阳市', '邵东县', '永兴南路79号', '', 1569651373),
(299, '152592764', '张院飞', '13125362980', '江西省', '赣州市', '', '江新区赣江源大道15号沃尔顿国际酒店预订部', '自费顺丰', 1569651511),
(300, '152592765', '杜含笑', '15139410572', '上海市', '上海市', '浦东新区', '唐镇  胜利路 30弄 金盛佳苑', '', 1569651812),
(301, '152592766', '金志军', '18362355883', '江苏省', '无锡市', '江阴市', '长泾镇长隆广场 恒润发超市', '', 1569652066),
(302, '152592767', '宋良人', '15805152823', '江苏省', '南京市', '鼓楼区', '漓江路中保绿苑7栋投速递易', '', 1569652264),
(303, '152592768', '梁正礼', '13479340836', '云南省', '红河哈尼族彝族自治州', '建水县', '景欣佳园二期', '', 1569652350),
(304, '152592769', '王雪梅', '13852897132', '江苏省', '泰州市', '兴化市', '西鲍乡北贺村', '', 1569652544),
(305, '152592770', '杨楠', '18113248301', '四川省', '凉山彝族自治州', '会东县', '明阳文苑三幢三单元2305', '', 1569652624),
(306, '152592771', '周小波', '13382587521', '河北省', '保定市', '易县', '易州镇西范村碧水湾洗浴', '', 1569652752),
(307, '152592772', '向敏', '18898609906', '湖南省', '湘西土家族苗族自治州', '龙山县', '民安街道南门坡2号', '', 1569652860),
(308, '152592773', '黄雅婷', '15572120821', '湖北省', '荆州市', '监利县', '汪桥镇严场幼儿园', '', 1569652936),
(309, '152592774', '郭懿萱', '15144235850', '吉林省', '吉林市', '昌邑区', '十一中朝阳鸿翔苑1号楼2单元', '', 1569653026),
(310, '152592775', '李晶晶', '13395653861', '安徽省', '合肥市', '巢湖市', '滨湖景城东区14栋  1801', '', 1569653129),
(311, '152592776', '张妙贤', '15819598859', '广东省', '揭阳市', '普宁市', '燎原镇泥沟乡民明大道京东烟酒店', '', 1569653240),
(312, '152592777', '王玲', '13485777551', '安徽省', '滁州市', '定远县', '定远县永康镇', '', 1569653310),
(313, '152592778', '朱徐芳', '19908417948', '湖南省', '常德市', '石门县', '楚江镇宝峰开发区金元阁二楼都市丽人', '', 1569653618),
(314, '152592779', '萧晓', '15633617080', '河南省', '郑州市', '新郑市', '航空港区凌飞街与苇航路交叉口合凯公寓', '', 1569653690),
(315, '152592780', '周倩', '15881168520', '西藏自治区', '日喀则市', '桑珠孜区', '科技路曙光医院导医台', '', 1569653849),
(316, '152592781', '胡玉玲', '15172245650', '湖北省', '十堰市', '张湾区', '车城路街道北京路农业局旁姊妹花酒店', '', 1569653908),
(317, '152592782', '海霞', '18748522046', '广西壮族自治区', '北海市', '银海区', '新世纪大道南京路九州家园中门23号店', '', 1569654032),
(318, '152592783', '鲁雅蓉', '18893646945', '甘肃省', '酒泉市', '瓜州县', '渊泉镇渊泉街143号渊泉派出所', '', 1569654116),
(319, '152592784', '丁丽', '15925875436', '浙江省', '绍兴市', '嵊州市', '浦口经济开发区亿田电器  ', '', 1569654230),
(320, '152592785', '刘珍', '13367867546', '浙江省', '宁波市', '余姚市', '朗霞街道 详细地址:  崇文路262号     万艺饭店', '', 1569654338),
(321, '152592786', '王珂', '15106189147', '江苏省', '无锡市', '锡山区', '无锡锡山开发区云林苑北区150栋后门车库最后一间', '', 1569654409),
(322, '152592787', '刘云', '15284168419', '四川省', '宜宾市', '翠屏区', '翠屏区土地堂', '', 1569654549),
(323, '152592788', '石文文', '15871077662', '湖北省', '黄石市', '阳新县', '兴国镇石震村', '', 1569654653),
(324, '152592789', '代妹', '17623169110', '福建省', '福州市', '永泰县', '领路乡潭后村', '', 1569654747),
(325, '152592790', '付妍', '18513993789', '北京市', '北京市', '朝阳区', '东四环中路红星美凯龙家居馆二层CHIC', '', 1569655035),
(326, '152592791', '韦德全', '18776653181', '浙江省', '嘉兴市', '嘉善县', '惠民街道台升路凯嘉5井立讯宿舍', '', 1569655143),
(327, '152592792', '孙冰雪', '18156163755', '安徽省', '淮北市', '濉溪县', '韩村镇海孜矿工人村', '', 1569655210),
(328, '152592793', '刘骅', '15189921138', '江苏省', '泰州市', '靖江市', '卓然（靖江）设备制造有限公司', '', 1569655277),
(329, '152592794', '蔡蔡', '15549138782', '湖北省', '恩施土家族苗族自治州', '恩施市', '航空路银河大厦三楼', '', 1569655336),
(330, '152592795', '马毛豆', '15038013305', '河南省', '郑州市', '新郑市', '龙湖镇双湖大道与鸿鹄路交叉口龙湖御景30号楼', '', 1569655547),
(331, '152592796', '马艺源', '18548938592', '北京市', '北京市', '东城区', '王府井大街银泰百货三楼海底捞', '', 1569655698),
(332, '152592797', '张崔兰', '13993989713', '甘肃省', '陇南市', '康县', '碾坝镇玉岭村', '', 1569655819),
(333, '152592798', '朱婷', '15952629611', '江苏省', '泰州市', '靖江市', '城南园区富阳路西首卓然(靖江)设备制造有限公司', '', 1569656158),
(334, '152592799', '何天云', '13735588437', '浙江省', '杭州市', '余杭区', '临平大道833号', '', 1569657142),
(335, '152592800', '肖凯峰', '15859377358', '福建省', '宁德市', '蕉城区', '财经学校（电话打不通放门卫处）', '', 1569657333),
(336, '152592801', '林鹏', '17608058180', '四川省', '成都市', '锦江区', '黄经楼西路，锦城尚宛，5栋1单元2202', '', 1569657775),
(337, '152592802', '张华', '15964061550', '山东省', '滨州市', '邹平县', '魏桥创业集团第二工业园第一生活区96号', '', 1569657867),
(338, '152592803', '胡海花', ' 1997343669', '广东省', '广州市', '番禺区', '南村镇市新公路1100号益嘉工业园易偲美公司', '', 1569657955),
(339, '152592804', '黄柏淋', '13924137813', '广东省', '广州市', '天河区', '中山大道中珠村国际机械城百力商务办公楼3楼', '', 1569658039),
(387, '152592852', '杨倩', '18805572716', '安徽省', '淮北市', '濉溪县', '濉溪县双堆集镇', '', 1569759222),
(341, '152592806', '杨海英', '13718225061', '海南省', '陵水黎族自治县', '椰林镇', '海韵广场酒吧街入口！重庆刘一手火锅店', '', 1569658197),
(342, '152592807', '范富生', '15893563316', '广东省', '东莞市', '大岭山镇', '杨屋 第四工业区平洋科技园', '', 1569658292),
(343, '152592808', '严华琴', '19923392661', '重庆市', '重庆市', '大足区', '双塔巷龙都花苑', '', 1569658411),
(344, '152592809', '张等霞', '15009683811', '宁夏回族自治区', '银川市', '兴庆区', '北京东路幸福世家25号楼四单元602', '', 1569658572),
(345, '152592810', '公主', ' 1576221032', '山东省', '烟台市', '', '经济开发区北京南路8号东泰公寓C1楼', '', 1569658627),
(346, '152592811', '方晓娟', '15728317998', '广东省', '揭阳市', '揭西县', '棉湖镇迎宾馆 附 楼阳光休闲会所二楼收银台', '', 1569658778),
(347, '152592812', '何家宝', '15248939571', '海南省', '海口市', '美兰区', '灵山镇 详细地址: 琼山大道172号琥珀悠澜', '', 1569658841),
(349, '152592813', '程先生', '17688402967', '广东省', '广州市', '番禺区', '沙湾镇福涌金井大街36号', '', 1569658951),
(350, '152592814', '静静 ', '19973226599', '湖南省', '长沙市', '岳麓区', '学士街道学士小区20栋', '', 1569659052),
(351, '152592815', '胡兴容', '15298073850', '四川省', '乐山市', '夹江县', '厚丰商场金童玉女童装店', '', 1569659111),
(352, '152592816', '田海英', '15124774663', '内蒙古自治区', '呼和浩特市', '回民区', '光明路坤源小区低店旭日洗化店', '', 1569659186),
(353, '152592817', '党康宁', '18295999058', '山西省', '运城市', '芮城县', '风零度镇王辽村', '', 1569659342),
(354, '152592818', '张怀仁', '13234505255', '黑龙江省', '哈尔滨市', '道外区', '宇轩花园9号楼二单元402', '', 1569659439),
(355, '152592819', '张慧敏', '17550505729', '河南省', '商丘市', '虞城县', '张集镇 小乔集', '', 1569659555),
(356, '152592820', '韩倩', '15641915509', '北京市', '北京市', '延庆区', '湖南西路夏都会议中心', '', 1569659643),
(357, '152592821', '谢彦先', '17358427800', '重庆市', '重庆市', '巴南区', '重庆鱼洞巴南区金竹工业园区全悦祥机械厂', '', 1569659742),
(358, '152592822', '王斌', '13227767167', '上海市', '上海市', '浦东新区', '康桥镇苗桥路268号', '', 1569659839),
(359, '152592823', '赵巧巧', '15951133080', '甘肃省', '陇南市', '宕昌县', '宕昌县理川镇', '', 1569660042),
(360, '152592824', '庄庄', '18118440688', '江苏省', '苏州市', '虎丘区', '枫桥街道富康新村26-301', '', 1569660115),
(361, '152592825', '胡予婕', '19973287617', '湖北省', '武汉市', '黄陂区', '横店影视城天阳路7号', '', 1569660185),
(362, '152592826', '丁晶晶', '19883191240', '湖北省', '武汉市', '东西湖区', '新城15路5号鸿运九昌工业园鑫东阳纸杯厂1栋1楼办公室', '', 1569660260),
(363, '152592828', '宋鹏飞', '13630897962', '河北省', '邢台市', '任县', '西固城  齐村', '', 1569755333),
(364, '152592829', '刘洋', '15947393244', '山西省', '大同市', '南郊区', '新区e区，泰华里小区五栋四单元五楼九号', '', 1569755475),
(365, '152592830', '小白', '13931577806', '河北省', '唐山市', '迁西县', '兴城镇泰安小区2号楼3单元501', '', 1569755691),
(366, '152592831', '陈芳', '13429945255', '湖北省', '孝感市', '应城市', '建设街60号', '', 1569755774),
(367, '152592832', '梁红真', '13558699424', '四川省', '成都市', '金牛区', '古柏中心村废品回收站', '', 1569755849),
(368, '152592833', '廖利洁', '13763388642', '广东省', '广州市', '越秀区', '越秀中路36号 宇宙金门', '', 1569755973),
(369, '152592834', '罗燕华', '18174863986', '广东省', '中山市', '中山市', '南头镇晋合路33号雅乐思电器有限公司', '', 1569756047),
(370, '152592835', '程向', '13618182600', '四川省', '乐山市', '市中区', '青果山博世一站式快车道汽车服务中心', '', 1569756144),
(371, '152592836', '葛锦伟', '15857175401', '浙江省', '杭州市', '西湖区', '双铺镇新浦沿村188号', '', 1569756216),
(372, '152592837', '潘柃灏', '15962322621', '江苏省', '苏州市', '常熟市', '尚湖大道25号', '', 1569756337),
(373, '152592838', '张小华', '13667026659', '江西省', '九江市', '', '八里湖新区市民服务中心东楼一楼税务窗口', '', 1569756568),
(374, '152592839', '董子岩', '17863532375', '山东省', '聊城市', '东昌府区', '盖世物流程达超市', '', 1569756667),
(375, '152592840', '杜', '15898913077', '山东省', '济南市', '济阳区', '济北街道中央华府和家园40栋三单元701', '', 1569756772),
(376, '152592841', '赵芯冉', '15912440918', '云南省', '昆明市', '官渡区', '昆明市第三人民医院发热门诊', '', 1569756882),
(377, '152592842', '彭诗盈', '15855152505', '安徽省', '合肥市', '', '城新区润地星城6楼富侨足道', '', 1569756986),
(378, '152592843', '刘彦茹', '15163779827', '山东省', '济宁市', '任城区', '洸河路与济安桥路交叉口向南288米路东全季火锅', '', 1569757055),
(379, '152592844', '贾玉冬', '18658107261', '浙江省', '杭州市', '滨江区', '西兴街道东流路700号海康威视', '', 1569757122),
(380, '152592845', '赵泽璇', '13734027105', '北京市', '北京市', '海淀区', '知春路25号北京丽亭华苑酒店(保卫处代收)', '', 1569757225),
(381, '152592846', '李秋宁', '18423661022', '广东省', '深圳市', '宝安区', '福永镇征程二路4号 皇家显示技术有限公司', '', 1569757540),
(382, '152592847', '刘红平', '18601567937', '江苏省', '无锡市', '新区', '江溪街道万裕苑二区148栋502室', '', 1569757702),
(383, '152592848', '魏利民', '18739328380', '河南省', '濮阳市', '范县', '范县新区惠民花园东门', '', 1569757790),
(384, '152592849', '符江', '19928280295', '河北省', '廊坊市', '香河县', '刘宋镇倪庄村', '', 1569757944),
(385, '152592850', ' 余安', '15658827975', '浙江省', '杭州市', '萧山区', '新塘街道新安郡嘉苑10幢1单元1401室', '', 1569758073),
(386, '152592851', '李小姐', '13723405056', '广东省', '深圳市', '龙华区', '观澜赤花路21号', '', 1569758250),
(388, '152592853', '钟小娟', '18981930748', '四川省', '成都市', '龙泉驿区', '大面镇白鹤小区', '', 1569759373),
(389, '152592854', '柴奥颖', '15306386179', '山东省', '威海市', '环翠区', '初村镇山东药品食品职业学院菜鸟驿站', '', 1569760089),
(390, '152592855', '小丽', '18859459921', '福建省', '泉州市', '南安市', '洪濑镇洪南街千辩万发美发沙龙店二楼', '', 1569760193),
(391, '152592856', '周静', '15302476514', '广东省', '广州市', '白云区', '永平街道白云大道北东平中路，13号世丰模具有限公司', '', 1569760306),
(392, '152592857', '李云子', '14769085113', '云南省', '昆明市', '呈贡区', '1076号云南中医药大学', '', 1569760389),
(393, '152592858', '许悦', '15124697411', '山东省', '威海市', '荣成市', '石岛区凤凰湖E区725栋303室', '', 1569760471),
(394, '152592859', '唐想想', '18074646879', '湖南省', '永州市', '江华瑶族自治县', '沱江镇鲤鱼井大道68号江华瑶族自治县第一中学', '', 1569760574),
(395, '152592860', '杨春旭', '13674503212', '辽宁省', '抚顺市', '望花区', '七百商城对面四季面条', '', 1569760649),
(396, '152592861', '刘骅', '15189921138', '江苏省', '泰州市', '靖江市', '卓然（靖江）设备制造有限公司   苹果8p', '', 1569760901),
(397, '152592862', '过娟', '18856551073', '安徽省', '马鞍山市', '含山县', '环峰镇金域城10栋401', '', 1569761105),
(398, '152592863', '艾莹', '13072410509', '辽宁省', '沈阳市', '铁西区', '大青实验小学', '', 1569761274),
(399, '152592864', '田茂丽', '18985072374', '贵州省', '遵义市', '红花岗区', '红花岗区新蒲镇遵义师范学院', '', 1569761355),
(400, '152592865', '梓涵', '17713597745', '四川省', '成都市', '金牛区', '西华街道兴盛世家E区', '', 1569762001),
(401, '152592866', '沈姝怡', '18950810240', '福建省', '龙岩市', '新罗区', '中城街道九一北路电业局宿舍6栋3座105', '', 1569762070),
(402, '152592867', '艾莉', '13702183018', '天津市', '天津市', '滨海新区', ' 新港街道天津市塘沽区新港三号路北仑里26栋小卖部', '', 1569762221),
(403, '152592868', '黄月玲', '18991518596', '陕西省', '安康市', '汉滨区', '新城街道大桥路秦巴铭座B座', '', 1569762313),
(404, '152592869', '毛毛', '15110420418', '山西省', '太原市', '万柏林区', '兴华街道新华街美特好总部三楼', '', 1569762458),
(405, '152592870', '秦珊', '15349927699', '新疆维吾尔自治区', '哈密市', '伊州区', '丽园街道新民六路丽景国际互惠超市', '', 1569762625),
(406, '152592871', '花絮', '15828318405', '四川省', '成都市', '金牛区', '茶店子街道育仁东路19号院福祥家园3-2-3', '', 1569762774),
(407, '152592872', '刘梦阳', '18568847452', '河南省', '安阳市', '林州市', '河顺镇西里村', '', 1569762870),
(408, '152592873', '顾娟', '15371133323', '江苏省', '盐城市', '阜宁县', '阜城镇合利社区', '', 1569762971),
(409, '152592874', '李月君', '18738876414', '河南省', '周口市', '西华县', '聂堆镇西华县聂堆镇', '', 1569763065),
(410, '152592875', '杨晨霖', '18676606342', '广东省', '云浮市', '罗定市', '素龙街道龙华东路金煦宾馆四楼前台', '', 1569763221),
(411, '152592877', '刘惠云', '15695906997', '福建省', '福州市', '连江县', '凤城镇马祖西路丽景天下12栋1302', '', 1569763312),
(412, '152592876', '张利云', '15221076737', '上海市', '上海市', '静安区', '彭浦镇彭越浦路800弄万荣小区21号楼403', '', 1569763400),
(413, '152592878', '于恩伟', '15039320911', '河南省', '濮阳市', '濮阳县', '濮阳县柳屯镇河南省濮阳市濮阳县柳屯镇于家村082号', '', 1569763459),
(414, '152592879', '紫沫', '13352287070', '辽宁省', '大连市', '甘井子区', '泡崖街道玉泉街30号2单元202', '', 1569763754),
(415, '152592880', '张娜', '15613063326', '河北省', '邯郸市', '峰峰矿区', '新市区春光西区1号楼5单元', '支付宝收款', 1569764044),
(416, '152592805', '李健', '16627621701', '上海市', '上海市', '闵行区', '万源路与古美西路交叉口中庚漫游城3楼胡桃里音乐酒馆', '', 1569764569),
(417, '152592881', '黄叶冬', '14775042152', '江西省', '上饶市', '鄱阳县', '鄱阳县实验中学', '', 1569765083),
(418, '152592882', '杨将', '15110624595', '山西省', '忻州市', '神池县', '神池南站公寓楼', '', 1569765142),
(420, '152592884', '何艳君', '18804756567', '内蒙古自治区', '通辽市', '奈曼旗', '嘉汇商业广场四楼', '', 1569766422),
(421, '152592885', '焦杰', '18740798700', '陕西省', '铜川市', '耀州区', '耀州区关庄街道', '', 1569766597),
(422, '152592886', '杨琳', '18072965318', '云南省', '昭通市', '昭阳区', '凤凰街道，民欣街83号', '', 1569766763),
(423, '152592887', '李琴茂', '18002651242', '广东省', '东莞市', '南城区', '莞太路元美广场B11铺谭鸭血老火锅（南城店）', '', 1569766838),
(424, '152592888', '刘文', '16631203137', '河北省', '保定市', '高碑店市', '白沟镇仁和南路68号胡同里第一家', '', 1569766979),
(425, '152592889', '张丹', '18109009972', '四川省', '成都市', '其它区', '天府新区红豆家园', '', 1569767190),
(426, '152592890', '邵美玲', '18571906263', '广东省', '珠海市', '香洲区', '梅华街道 梅华西路 特警支队2260', '', 1569767313),
(427, '152592891', '唐雪丽', '13595467832', '贵州省', '黔南布依族苗族自治州', '贵定县', '城关镇教师新村大众药房', '', 1569767377),
(428, '152592892', '静哥', '15936659998', '河南省', '安阳市', '林州市', '振林街道东营街南三巷8号', '', 1569767526),
(429, '152592893', '龙女士', '18251670223', '江苏省', '徐州市', '新沂市', '汉锦城 汉锦城大黄蜂D105 ', '', 1569767604),
(430, '152592894', '胡志伟', '15162981090', '江苏省', '镇江市', '丹徒区', ' 丹徒区  高资镇', '', 1569767730),
(431, '152592895', '张小敏', '13476780251', '湖北省', '黄石市', '大冶市', '大冶大道阳光花园斜对面银都大酒店三楼前台', '', 1569767794),
(432, '152592896', '姜姜', '18019187586', '上海市', '上海市', '青浦区', '徐泾镇徐乐路99弄12号全季酒店前台收', '', 1569767893),
(433, '152592897', '李结', '18762204137', '江苏省', '徐州市', '邳州市', '碾庄镇桑园村9组', '', 1569768002),
(434, '152592898', '郭莹莹', '18743403000', '吉林省', '四平市', '梨树县', '郭家店镇雄健健身房', '', 1569768213),
(435, '152592899', '张晓慧', '15610660077', '山东省', '临沂市', '河东区', '区政府西临沿街精益眼镜店', '', 1569768333),
(436, '152592900', '申慧', '18852633325', '江苏省', '泰州市', '泰兴市', '横垛镇西雁岭', '', 1569768432),
(437, '152592901', '游党中', '15299735503', '新疆维吾尔自治区', '乌鲁木齐市', '天山区', '幸福花园4期4单元101', '', 1569768495),
(438, '152592902', '李娜', '18409090095', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '精河县', '后街一小斜对面独壹处椒麻鸡', '', 1569768642),
(439, '152592903', '陈圣红', '15357913908', '安徽省', '合肥市', '', '北城新区蒙城北路与金梅路交口力高共和城西五区33栋1201', '', 1569768818),
(440, '152592904', '何莹', '18584499629', '广东省', '惠州市', '惠城区', '数码园南区恒都电子有限公司', '', 1569768916),
(441, '152592905', '王妍', '15870927203', '江西省', '上饶市', '鄱阳县', '古县渡镇古南乡德八里村', '', 1569769098),
(442, '152592827', '鲁晓云', '18305648036', '云南省', '昭通市', '镇雄县', '龙腾广场盛锦苑五栋二单元602', '', 1569597073),
(443, '152592906', '陈锋', '15814346818', '广东省', '东莞市', '茶山镇', '东岳路57号新图电脑', '', 1569748425),
(444, '152592907', '包小芝', '18850675867', '浙江省', '湖州市', '吴兴区', '凤凰街道南庄迂小区5号楼', '', 1569748809),
(445, '152592908', '顾兴玲', '15968383975', '浙江省', '嘉兴市', '南湖区', '南湖街道仿工路1948号', '', 1569836150),
(446, '152592909', '余嘻嘻', '13813135982', '江苏省', '扬州市', '江都区', '龙溪畔岛2栋2单元', '', 1569836247),
(447, '152592910', '刘雨婷', '15827901222', '湖北省', '武汉市', '武昌区', '武泰闸中山路竹子厂121号', '', 1569836382),
(448, '152592911', '李盼盼', '15539799579', '河南省', '平顶山市', '汝州市', '汝南街道办事处袁庄村', '', 1569836509),
(449, '152592912', '磊磊', '15522211428', '天津市', '天津市', '北辰区', '北辰西道北侧荣翠园', '', 1569837679),
(450, '152592913', '裴继国', '15097580163', '河北省', '唐山市', '迁安市', '马兰庄镇后裴庄村', '', 1569837867),
(451, '152592914', '廖明伟', '18081924311', '四川省', '成都市', '金堂县', '金堂县清江镇', '', 1569838138),
(452, '152592915', '周小波', '13382587521', '河北省', '保定市', '易县', '易州镇西范村碧水湾洗浴', '', 1569838289),
(453, '152592916', 'Angel', '18680180666', '广东省', '中山市', '东区街道', '远洋城美域9幢', '', 1569838401),
(454, '152592917', '孟爱玲', '15835851977', '山西省', '吕梁市', '文水县', '文水县十指大动', '', 1569838707),
(455, '152592918', '赵丹', '18335872660', '山西省', '吕梁市', '文水县', '文水县十指大动', '', 1569838791),
(456, '152592919', '张璐', '18438713024', '江苏省', '苏州市', '昆山市', '陆家镇邵村家园10栋二单元六楼', '', 1569839186),
(457, '152592920', '刘亚军', '15963190215', '山东省', '聊城市', '临清市', '山东省聊城市临清烟店镇', '', 1569839272),
(458, '152592921', '小伟', '15754224474', '辽宁省', '朝阳市', '建平县', '建平县张家营子镇', '', 1569839404),
(459, '152592922', '温心洁', '18806776421', '浙江省', '温州市', '苍南县', '灵溪镇玉苍路858号', '', 1569839499),
(460, '152592923', '盛明艳', '18725398712', '广东省', '深圳市', '光明区', '光明新区凤凰街道汇通路269号得润电子工业园', '', 1569839563),
(461, '152592924', '熊玉琴', '15170607021', '江西省', '赣州市', '赣县区', '赣州市赣县五云镇街上', '', 1569839650),
(462, '152592925', '唐凤', '18311834171', '贵州省', '铜仁市', '沿河土家族自治县', '三桥画廊天街河东紫苏美肤中心D200号', '', 1569839734),
(463, '152592926', '黄洁', '18286061047', '贵州省', '毕节市', '七星关区', '七星关区大银镇街上', '', 1569839814),
(464, '152592927', '次仁卓玛', '17665697871', '广东省', '佛山市', '禅城区', '南庄镇佛山市实验中学 高三四班', '', 1569839901),
(465, '152592928', '懒猪', '13666134114', '四川省', '德阳市', '广汉市', '新丰镇普洛斯物流园A3仓 ', '', 1569840951),
(466, '152592929', '马薪惠', '15951355036', '江苏省', '徐州市', '铜山区', '国营沿湖农场闫大庄', '', 1569841117),
(467, '152592930', '连月东 ', '19903237099', '河北省', '张家口市', '怀来县', '怀来县大黄庄', '', 1569841203),
(468, '152592931', '小楠楠', '18156860632', '安徽省', '合肥市', '庐阳区', '逍遥津街道徽州大道与红星路交口乐圃大厦4楼', '', 1569841374),
(469, '152592932', '罗杨', '18141587622', '四川省', '乐山市', '犍为县', '玉津镇铜高村1组68号26信箱', '', 1569841597),
(470, '152592933', '谢淑娟', '13409980101', '湖北省', '黄冈市', '黄梅县', '黄梅县小池镇', '', 1569841658),
(471, '152592934', 'Redbask  ', '15122724462', '天津市', '天津市', '河西区', '琼州道113号 胡大饭馆 ', '', 1569841730),
(472, '152592935', '白耀霞', '15215490527', '山东省', '临沂市', '沂水县', '健康路金梦园小区南门对面完美视界眼镜店', '', 1569841861),
(473, '152592936', '张爱华', '18336175055', '河南省', '周口市', '郸城县', '白马镇李庄行政村安庙', '', 1569841951),
(474, '152592937', '路钰群', '18678211081', '山东省', '淄博市', '张店区', '洪沟三居小区6号楼', '', 1569842876),
(475, '152592938', '钟镇涛', '18319616776', '广东省', '惠州市', '博罗县', '巡逻警察大队', '', 1569843141),
(476, '152592939', '臧仁', '17626636333', '江苏省', '苏州市', '虎丘区', '阳山花苑二区', '', 1569843348),
(477, '152592940', '小鹿', '13979571233', '浙江省', '温州市', '', '怡心公寓309', '', 1569843761),
(478, '152592941', '于谦', '15264417999', '山东省', '威海市', '乳山市', '乳山市徐家镇洋村', '', 1569843901),
(479, '152592942', '朱丽丽', '18515665076', '河北省', '保定市', '高碑店市', '辛桥乡辛桥村', '', 1569843986),
(480, '152592943', '丽玲', '13480349827', '广东省', '揭阳市', '普宁市', '流沙镇 斗文二片6+1酒店后面权德楼36号', '', 1569844132),
(481, '152592944', '陈锋', '15814346818', '广东省', '东莞市', '茶山镇', '东岳路57号新图电脑', '', 1569844330),
(482, '152592945', '童金萍', '15109594890', '宁夏回族自治区', '固原市', '原州区', '五指广场喜洋洋蛋糕店', '', 1569844588),
(483, '152592946', '陈露', '17633520311', '河南省', '周口市', '郸城县', '双楼乡后陈庄', '', 1569844924),
(484, '152592947', '温晓娟', '15738989797', '河南省', '洛阳市', '偃师市', '槐新街道槐新路1号偃师迎宾馆', '', 1569845037),
(485, '152592948', '王杨群', '13732253009', '浙江省', '杭州市', '余杭区', ' 径山镇小古城村俞家堰工业区杭州国光旅游用品有限公司', '', 1569845130),
(486, '152592949', '萱', '17317080387', '河北省', '石家庄市', '行唐县', '行唐县翟营乡', '', 1569902810),
(487, '152592950', '于博', '15613408815', '河北省', '唐山市', '玉田县', '玉田县林南仓一村', '', 1569902973),
(488, '152592951', '罗丽娜', '15221062382', '上海市', '上海市', '浦东新区', '南汇祝桥镇华星路，渔家酸菜鱼馆，107号', '', 1569903122),
(489, '152592952', '王', '17561911003', '上海市', '上海市', '嘉定区', '马陆镇横仓公路2555号振傲供应链', '', 1569903228),
(490, '152592953', '清寒', '13840373582', '辽宁省', '沈阳市', '于洪区', '广业西路142－7', '', 1569903345),
(491, '152592954', '陶珊珊', '18724419117', '黑龙江省', '哈尔滨市', '松北区', '对青山镇 李家乡', '', 1569903467),
(492, '152592955', '伍', '18665861920', '广东省', '深圳市', '宝安区', '菜鸟驿站(深圳固戍南昌二队西二巷7号店)', '', 1569903649),
(493, '152592956', '张慧', '13897096770', '青海省', '海西蒙古族藏族自治州', '格尔木市', '金峰路雪峰巷', '', 1569903732),
(494, '152592957', '欧经理', '13425029854', '广东省', '珠海市', '香洲区', '拱北粤海东路1155号金沙俱乐部', '', 1569903963),
(495, '152592958', '鲁雅蓉', '18893646945', '甘肃省', '酒泉市', '瓜州县', '渊泉镇渊泉街143号渊泉派出所', '', 1569904124),
(496, '152592959', '佳錡尚品', '18299380767', '新疆维吾尔自治区', '石河子市', '', '二十三小区65栋佳錡尚品', '', 1569904182),
(497, '152592960', '周英 ', '17665491523', '广东省', '深圳市', '宝安区', '塘西第二工业区B区一栋一楼', '', 1569904454),
(498, '152592961', '杨慧', '18339815769', '河南省', '郑州市', '二七区', '淮河路街道升龙城5号院1号楼3单元', '', 1569904512),
(499, '152592962', '查小宝', '13915225420', '江苏省', '无锡市', '江阴市', '顾山镇北国国韵华府福民路841号，东方母婴，', '', 1569904590),
(500, '152592963', '孙晓艺', '15169862290', '山东省', '泰安市', '泰山区', '财源街道泰安市泰山区万达金街D区211', '', 1569904697),
(501, '152592964', '毕川森', '15147641942', '黑龙江省', '双鸭山市', '岭东区', '双选路64号黑龙江建龙钢铁有限公司', '', 1569904975),
(502, '152592965', '周睿', '18573690422', '湖南省', '常德市', '安乡县', '孟家州11栋三单元605', '', 1569905056),
(503, '152592966', '韩寿全', '15269100228', '山东省', '济南市', '历下区', '国际会展中心A区负一层汤泉一品', '', 1569905529),
(504, '152592967', '张明慧', '18371031516', '湖北省', '襄阳市', '襄州区', '永安南路襄州七中旁吉祥餐馆 ', '', 1569905752),
(505, '152592968', '俞燕', '13033672097', '浙江省', '嘉兴市', '南湖区', '七星镇湘都公寓3幢505室', '', 1569905902),
(506, '152592969', '芦焱紫', '18612989455', '北京市', '北京市', '西城区', '地安门西大街57号什刹海体育运动学校（北京市什刹海体育运动学校育英楼武术队。）', '', 1569905988),
(507, '152592970', '朱丽娜', '13939283994', '河南省', '鹤壁市', '浚县', '白寺乡盖寨村', '', 1569906067),
(508, '152592971', '姚庆祥', '13967513218', '浙江省', '绍兴市', '嵊州市', '甘霖镇孙村189号', '', 1569906158),
(509, '152592972', '孙敏', '15082923085', '河南省', '商丘市', '宁陵县', '宁陵县程楼乡孙庄', '', 1569906302),
(510, '152592973', '范喜迎', '13253759920', '河南省', '开封市', '龙亭区', '北郊乡北郊乡东京大道开封大学新校区', '', 1569906597),
(511, '152592974', '陈蒙', '13669016675', '湖北省', '鄂州市', '鄂城区', '沿江大道北门社区小北门街8号3栋304', '', 1569906652),
(512, '152592975', '文丽', '15857708283', '浙江省', '温州市', '瓯海区', '后岸路185号美惠全超市旁', '', 1569906711),
(513, '152592976', '王莉', '18221127785', '上海市', '上海市', '浦东新区', '高行高宝路68弄49号1002', '', 1569906791),
(514, '152592977', '乙安桂', '15715124998', '江苏省', '苏州市', '苏州工业园区', '工业园区唯亭镇金陵西路168号三楼春会馆', '', 1569906887),
(515, '152592978', '张清珠', '15980432975', '福建省', '泉州市', '惠安县', '净峰镇莲峰东内村', '', 1569906950),
(516, '152592979', '林孟萍', '18152086688', '山东省', '德州市', '夏津县', '夏津华夏医院', '', 1569907086),
(517, '152592980', '庄庄', '18118440688', '江苏省', '苏州市', '虎丘区', '枫桥街道富康新村26-301', '', 1569907328),
(518, '152592981', '高露露', '18846617952', '黑龙江省', '大庆市', '大同区', '福民苑16号楼四单元。', '支付宝收款', 1569907682),
(519, '152592983', '陈晓宇', '13775262787', '江苏省', '常州市', '溧阳市', '罗湾路名仕国际娱乐会所', '', 1570018817),
(520, '152592984', '张琴琴', '18076182420', '贵州省', '贵阳市', '观山湖区', '观山景和酒店一楼前台', '', 1570019037),
(521, '152592985', '曾钦林', '15070034051', '江西省', '赣州市', '章贡区', '黄金岭街道金凤东路与华昌路交叉口金凤梅园8号木屋', '', 1570019184),
(522, '152592986', '曹薇', '13655502025', '安徽省', '滁州市', '琅琊区', '北关菜场门面房金摇篮', '', 1570019267),
(523, '152592987', '董园', '17603872432', '河南省', '郑州市', '新郑市', '龙湖镇梅山村', '', 1570019329),
(524, '152592988', '李盼盼', '15539799579', '河南省', '平顶山市', '汝州市', '汝南街道办事处袁庄村', '', 1570019520),
(525, '152592989', '黄巧燕', '15059354373', '福建省', '宁德市', '蕉城区', '金涵畲族乡琼堂新源新村28号', '', 1570019614),
(526, '152592990', '乔兰', '18737912120', '河南省', '郑州市', '管城回族区', '经济开发区明湖街道第七大街与经北六路交叉口长盛广场', '', 1570019674),
(527, '152592991', '王文刚', '15167139026', '浙江省', '杭州市', '富阳区', '新登渌渚镇年家湾佳远印花有限公司', '', 1570019843),
(528, '152592992', '陈锦', '15865167007', '山东省', '青岛市', '城阳区', '上马街道   林家段河   桃源小学北200米 ', '', 1570019950),
(529, '152592993', '殷高翔', '15371129088', '江苏省', '南通市', '崇川区', '新城桥街道   濠南路原 阿酷KTV', '', 1570020040),
(530, '152592994', '杨佳鑫', '15144493550', '吉林省', '长春市', '双阳区', '云山街道东华大街1699号长春科技学院', '', 1570027035),
(531, '152592995', '张福莉', '18209508722', '宁夏回族自治区', '银川市', '西夏区', '镇北堡镇华西村', '', 1570027545),
(532, '152592996', '吴俊山', '15224267071', '山东省', '聊城市', '东昌府区', '艾科水果市场', '', 1570027651),
(533, '152592997', '林秋菊', '15859790034', '福建省', '泉州市', '晋江市', '安海镇恒安工业城总部', '', 1570028030),
(534, '152592998', '啊进', '15094293849', '云南省', '昭通市', '永善县', '粮食局新步行街', '', 1570028149),
(535, '152592999', '王玲', '15166016478', '山东省', '青岛市', '莱西市', '府新嘉苑小区东门', '', 1570028208),
(536, '152593000', '周盼盼', '13141822801', '江苏省', '苏州市', '吴江区', '吴江经济开发区西湖花苑267号', '', 1570028299),
(537, '152593001', '谢雪艳', '18477228931', '广西壮族自治区', '柳州市', '鹿寨县', '江口乡开心阁', '', 1570028457),
(538, '152593002', '曾凤', '15753376229', '广东省', '佛山市', '禅城区', '南庄镇吉利市场对面沃达百货三楼打包台', '', 1570028905),
(539, '152593003', '李伟伟', '15256055997', '安徽省', '阜阳市', '临泉县', '工业园区15号厂房西村电子', '', 1570029511),
(540, '152593004', '高晶晶', '15256237916', '安徽省', '合肥市', '巢湖市', '卧牛山街道西苑广场市直机关大院档案局宿舍', '', 1570029846),
(541, '152593005', '王惠民', '18477330942', '广西壮族自治区', '桂林市', '', '奇峰镇8号62栋', '', 1570030046),
(542, '152593006', '纯真', '18310119436', '北京市', '北京市', '丰台区', '汉威国际广场4区10号楼', '', 1570030291),
(543, '152593007', '静静', '13008829830', '广东省', '揭阳市', '榕城区', '鹏馨公寓1305', '', 1570030401),
(544, '152593008', '李国澎', '18408858242', '云南省', '昆明市', '呈贡区', '师范大学呈贡校区西区菜鸟驿站', '', 1570030535),
(545, '152593009', '陈思林', '15841682615', '辽宁省', '锦州市', '义县', '义州街道越都花园博硕幼稚园', '', 1570030848),
(546, '152593010', '娜娜', '18034804470', '新疆维吾尔自治区', '和田地区', '和田市', '建设路73号3栋五单元203室', '', 1570030928),
(547, '152593011', '周二', '13707446982', '湖南省', '张家界市', '永定区', '西溪坪高峰胖胖酒家后面', '', 1570031077),
(548, '152593012', '熊孩子 ', '18518407622', '北京市', '北京市', '朝阳区', '三房玲珑山二号楼311', '19.9支付宝', 1570031250),
(549, '152593013', '孟耽昱', ' 1853565263', '山西省', '临汾市', '尧都区', '山西师范大学体育学院', '39.8支付宝', 1570031329);
INSERT INTO `ns_ordernum` (`id`, `ordernum`, `shouhuouser`, `mobile`, `province`, `city`, `area`, `address`, `descs`, `ordertime`) VALUES
(550, '152593014', '吴亚萍', '13918476356', '上海市', '上海市', '浦东新区', '祝桥镇浦东机场启航路1100号华美达广场酒店', '19.9支付宝', 1570031750),
(551, '152593015', '王子涵', '13103999885', '河南省', '焦作市', '解放区', '太行西路耐二西院六号楼一单元二楼', '20支付宝', 1569945650),
(552, '152593016', '李长鹏', '13377065486', '广西壮族自治区', '桂林市', '资源县', '车田乡石寨村', '', 1569945950),
(553, '152593017', '林丹丹', '13959576461', '福建省', '莆田市', '城厢区', '文献西路961号中国人寿', '', 1569946033),
(554, '152593018', '李贤惠', '17621416741', '上海市', '上海市', '闵行区', '颛桥镇光华路一号青租界2020', '', 1569946128),
(555, '152593019', '刘丽', '18639007614', '河南省', '郑州市', '金水区', '北三环与丰华北路交叉口中建大厦', '', 1569946191),
(556, '152593020', '孙晶华', '13727858660', '广东省', '中山市', '坦洲镇', '界狮南路海伦印象16栋703', '', 1569946262),
(557, '152593021', '安南', '15144995169', '内蒙古自治区', '通辽市', '科尔沁区', '霍林河大街民大住宅园区东门其布尔干洗店', '', 1569946329),
(558, '152593022', '庞悦生', '13552587026', '上海市', '上海市', '金山区', '张堰镇东大街125号', '', 1569946408),
(559, '152593023', '钟女士', '13883523118', '海南省', '海口市', '美兰区', '飞龙公寓A栋4楼', '', 1569946475),
(560, '152593024', '王利芳', '15207551735', '广东省', '深圳市', '福田区', '岗厦村东二坊74栋窈茶', '', 1569946582),
(561, '152593025', '戴露露', '15151399421', '江苏省', '南通市', '通州区', '刘桥镇女王美妆   ', '', 1569946718),
(562, '152593026', '凤仙', '17726202857', '重庆市', '重庆市', '南川区', '上海城风之彩楼上逸往网咖', '', 1569946845),
(563, '152593027', '吴秀萍', '18258580880', '浙江省', '绍兴市', '新昌县', '七星街道上礼泉村坑边路4弄6号', '', 1569946945),
(564, '152593028', '苗林', '18454028930', '山东省', '菏泽市', '牡丹区', '岳城街道长江东路菏泽市污水处理厂', '', 1569947058),
(567, '152593030', '婷婷', '18322403921', '天津市', '天津市', '西青区', '王顶堤商贸城D1二楼橙区2号', '', 1569948232),
(566, '152593029', '王城', '18881117084', '浙江省', '金华市', '义乌市', '城西街道西站大道877号好又多超市', '', 1569948063),
(568, '152593031', '钟优若', '18760100777', '福建省', '龙岩市', '新罗区', '万达广场sohoA2522', '', 1569948359),
(569, '152593032', '杨杨', '15919840697', '广东省', '深圳市', '宝安区', '福永镇新和二区七巷九号店（菜鸟驿站）', '', 1569948430),
(570, '152593033', '陈胜男', '19871933569', '湖北省', '武汉市', '东西湖区', '新城15路5号鸿运九昌工业园鑫东阳纸杯厂3栋门卫室', '', 1569948599),
(571, '152593034', '媛媛', '13697278519', '湖北省', '宜昌市', '夷陵区', '双虹大道61-18', '', 1569948740),
(572, '152593035', '玉罕', '15012130886', '云南省', '西双版纳傣族自治州', '景洪市', '允景洪街道曼景兰村二巷老年活动中心', '', 1569948832),
(573, '152593036', '丁晶晶', '19883191240', '湖北省', '武汉市', '东西湖区', '新城15路5号鸿运九昌工业园鑫东阳纸杯厂1栋1楼办公室', '', 1569948904),
(574, '152593037', '冯君宝', '13546676353', '山西省', '太原市', '小店区', '富士康南三门，菜鸟驿站', '', 1569949095),
(575, '152593038', '陈', '15159061108', '福建省', '龙岩市', '新罗区', '西陂街道龙岩大道夜市广场二哥烧烤大排挡', '', 1569949163),
(576, '152593039', '杨馨雨', '13509404864', '重庆市', '重庆市', '长寿区', '渡舟街道西三路348号金科世界城25-1-6-3', '20支付宝', 1570069003),
(577, '152593040', '小林', '18023463457', '广东省', '广州市', '白云区', '太和镇田心村田心东街13号', '19.9支付宝', 1570069141),
(578, '152593041', '邓志云', '13966231594', '上海市', '上海市', '青浦区', '崧复路777号A1栋303', '19.9支付宝', 1570069228),
(579, '152593042', '王俊泽', '18291630809', '广东省', '东莞市', '茶山镇', '圆中一路奥托仑光电子有限公司  ', '', 1570069351),
(586, '152593048', '于健波', '17625361522', '江苏省', '苏州市', '昆山市', '玉山镇经济开发区南河路贸联电子168号', '', 1570070799),
(581, '152593043', '郑明生', '19895971566', '江苏省', '连云港市', '东海县', '东海县石湖乡尤塘村三组', '', 1570069573),
(582, '152593044', '黄晓静', '15237612713', '北京市', '北京市', '东城区', '建国门内大街9号北京国际饭店10层 ', '', 1570069673),
(583, '152593045', '李兴玲 ', '13925351436', '广西壮族自治区', '玉林市', '玉州区', '解放路 食坊里桃花季', '', 1570069727),
(584, '152593046', '刘利国', '152593046', '上海市', '上海市', '嘉定区', '江桥镇曹昂公路2300弄130号米其林轮胎店', '', 1570069811),
(585, '152593047', '郭林玲', '18912575227', '江苏省', '盐城市', '阜宁县', '长春路上海路交叉口路东 百嘉乐主题ktv前台 ', '', 1570069971),
(587, '152593049', '孙玉丹', '18985571912', '贵州省', '贵阳市', '乌当区', '下坝镇左正凤包装厂', '', 1570070900),
(588, '152593050', '吕海萍', '18297509025', '安徽省', '芜湖市', '镜湖区', '大富新村东区3栋', '', 1570070954),
(589, '152593051', '元妹儿', '17612935896', '四川省', '成都市', '新都区', '同仁路199号我的大学小区', '', 1570071055),
(590, '152593052', '黄美芳', '15905070375', '福建省', '泉州市', '晋江市', '池店镇新加坡城1栋1311', '', 1570071101),
(591, '152593053', '黄雅婷', '15572120821', '湖北省', '荆州市', '监利县', '汪桥镇古堤村', '', 1570071223),
(592, '152593054', '李翔', '18895535072', '安徽省', '阜阳市', '颍上县', '前进路99号鑫都华庭二期大门口东侧(徽王府)总店', '', 1570071298),
(593, '152593055', '熊慢慢', '18360128230', '江苏省', '宿迁市', '泗阳县', '城区洪泽湖大道星宇华府', '', 1570071356),
(594, '152593056', '徐福萃', '18321753192', '上海市', '上海市', '松江区', '叶榭镇叶兴公路28号搜鹿电子厂', '', 1570071465),
(595, '152593057', '陈秋秋', '18250926017', '福建省', '宁德市', '蕉城区', '天茂城市广场5号楼2902', '', 1570071568),
(596, '152593058', '刘书铭', '13581107392', '山东省', '枣庄市', '滕州市', '鲍沟镇前皇甫村博文网吧', '', 1570071647),
(597, '152593059', '王铭浩', '18041964819', '辽宁省', '葫芦岛市', '绥中县', '塔山镇大南铺', '', 1570071723),
(598, '152593060', '刘云', '15284288562', '河北省', '邢台市', '南和县', '南和县西韩村', '', 1570071770),
(599, '152593061', '王晓强', '18640605678', '辽宁省', '锦州市', '凌河区', '凌河区吉庆里7_1', '', 1570071888),
(600, '152593062', '王小慧', '15899660642', '广东省', '东莞市', '寮步镇', '石步村 金三角工业区 迪大音响器材有限公司', '', 1570072000),
(601, '152593063', '刘乾飞', '13883650262', '重庆市', '重庆市', '永川区', '永川区凤凰育才', '', 1570072104),
(602, '152593064', '杨美玲', '15181728043', '福建省', '福州市', '福清市', '清荣大道大北路明德楼', '', 1570072563),
(603, '152593065', '周盼盼', '13141822801', '江苏省', '苏州市', '吴江区', '吴江经济开发区西湖花苑267号', '', 1570072341),
(604, '152593066', '刘云', '15284168419', '四川省', '宜宾市', '翠屏区', '翠屏区土地堂', '', 1570072771),
(605, '152593067', '杨琴美', '15708495119', '四川省', '成都市', '其它区', '高新区，伏小区7街', '', 1570072920),
(606, '152593068', '晓颖', '13677769207', '广东省', '深圳市', '龙岗区', '宝丽路西环路红绿灯路口德福广场B1216', '', 1570073037),
(607, '152593069', '惠琴', '15811987475', '广东省', '惠州市', '惠阳区', '淡水镇上湖西街一巷十号', '', 1570073162),
(608, '152593070', '李达清', '18593976532', '广东省', '东莞市', '长安镇', '乌沙江贝社区振安中路76号联手便利店', '', 1570073211),
(609, '152593071', '龚林栎', '18100742057', '湖南省', '长沙市', '天心区', '南湖路湖南邮电职业技术学院', '', 1570073286),
(610, '152593072', '毛喆 ', '17778152296', '北京市', '北京市', '朝阳区', '望京花家地方舟苑南门望京小腰门口有个大机器人', '', 1570073328),
(611, '152593073', '蔡婷', '15851397793', '江苏省', '南通市', '南通经济技术开发区', '橡树湾48栋1003  ', '', 1570073415),
(612, '152593074', '刘爽', '13889152704', '辽宁省', '沈阳市', '铁西区', '沈阳经济开发区中央大街10号路阳光100果岭公馆西门T1', '', 1570073578),
(613, '152593075', '谢子楠', '17851554162', '江苏省', '淮安市', '清浦区', '恒大名都二期907', '', 1570073769),
(614, '152593076', '乐阳', '17531907841', '福建省', '厦门市', '同安区', '汀溪镇朝元路1801号惠尔康食品有限公司', '', 1570073851),
(615, '152593077', '俞春英', '13967895958', '浙江省', '宁波市', '鄞州区', '云龙镇环湖西路1916号（万宝隆机械有限公司）', '', 1570074002),
(616, '152593078', '王利芳', '15207551735', '广东省', '深圳市', '福田区', '岗厦村东二坊74栋窈茶', '', 1570074171),
(617, '152593079', '张亚奇', '13562704555', '山东省', '济宁市', '兖州区', '建设西路农业局宿舍4号楼1单元201室', '', 1570074240),
(618, '152593080', '罗静', '13695870987', '浙江省', '温州市', '乐清市', '虹桥镇虹港北路39号周氏中草药', '', 1570074388),
(619, '152593081', '吴娟', '15199639358', '甘肃省', '平凉市', '泾川县', '丰台镇盖郭村西头社32号', '', 1570074495),
(620, '152593082', '幼妤', '15191062384', '陕西省', '西安市', '长安区', '郭杜街道蓝博公寓C区西门', '', 1570075244),
(621, '152593083', '任先生', '19805662218', '江苏省', '南通市', '崇川区', '新开街道永旺梦乐城1层140号VERO MODA专柜', '', 1570075367),
(622, '152593084', '李刚', '18771248765', '浙江省', '金华市', '义乌市', '义亭镇姑塘工业区五联路源达彩印196号', '', 1570075500),
(623, '152593085', '唐斌', '18760288688', '福建省', '三明市', '清流县', '南区45栋 通达玻璃', '', 1570075568),
(624, '152593086', '刘先生', '18339931273', '福建省', '福州市', '闽清县', '塔庄镇塔庄村', '', 1570075654),
(625, '152593087', '杨桃', '15039516157', '山东省', '济南市', '市中区', '七贤街道中海环宇城31楼', '', 1570075731),
(626, '152593088', '杨楠', '18113248301', '四川省', '凉山彝族自治州', '会东县', '明阳文苑三幢三单元2305', '', 1570075793),
(627, '152593089', '黄友明', '15059888815', '福建省', '泉州市', '南安市', '美林镇梅亭后山', '', 1570075865),
(628, '152593090', '赵倩', '15856702266', '安徽省', '芜湖市', '弋江区', '奥运康城四栋1604', '', 1570075929),
(629, '152593091', '黄杉', '15166320669', '山东省', '枣庄市', '台儿庄区', '运河街道兰琪路兰琪金苑二单元四号楼', '', 1570075989),
(630, '152593092', '刘金红', '15280044545', '福建省', '龙岩市', '长汀县', '腾飞一路9号长诚鞋业有限公司', '', 1570076083),
(631, '152593093', '熊燕', '15279549239', '江西省', '宜春市', '丰城市', '高新园区捷和电机保安室', '', 1570076213),
(632, '152593094', '王兵', '17366200335', '江苏省', '南京市', '六合区', '葛塘街道长城新苑43栋501', '', 1570076330),
(633, '152593095', '潘婷', '18012905338', '江苏省', '南京市', '六合区', '大厂南钢凤滨嘉园46-501', '', 1570076399),
(634, '152593096', '冯燕', '15176375509', '河北省', '保定市', '竞秀区', '朝阳路北国先天下', '', 1570076516),
(635, '152593097', '刘怡', '18835957882', '北京市', '北京市', '海淀区', '万寿路长银大厦88号味多美', '', 1570076601),
(636, '152593098', '罗茜', '13778264520', '四川省', '绵阳市', '', '东辰宜家美一点（火车站店）', '', 1570076662),
(637, '152593099', '胡三岁', '15068129537', '浙江省', '杭州市', '余杭区', '余杭街道城西路488号海恒大酒店 6楼', '', 1570076889),
(638, '152593100', '郭瑞娜', '18699967232', '新疆维吾尔自治区', '伊犁哈萨克自治州', '霍城县', '芦草沟中心小学', '', 1570077069),
(639, '152593101', '刘正强', '17843894632', '重庆市', '重庆市', '合川区', '土场镇北汽银翔盛世庭院', '', 1570163485),
(640, '152593102', '袁浩转出海（云忆）', '13922754996', '广东省', '广州市', '白云区', '鹤龙街道鹤边街道黄边北路63号嘉禾创意产业园8栋8101', '', 1570163646),
(641, '152593103', '盼盼', '13995980723', '湖北省', '黄石市', '大冶市', '还地桥镇 煤矿村金盆地湾', '', 1570163848),
(642, '152593104', '刘烨', '15667302983', '陕西省', '汉中市', '汉台区', '河东店镇陕西理工大学北校区', '', 1570163984),
(643, '152593105', '徐静', '18523666906', '广西壮族自治区', '贵港市', '桂平市', '西山镇桂平一职自职点学校外', '', 1570164083),
(644, '152593106', ' 郭斌', '18600586991', '北京市', '北京市', '房山区', '石楼镇石楼大街32号世纪华联购物中心来一碗面香坊', '', 1570164412),
(645, '152593107', '魏丽娜', '18720918099', '江西省', '南昌市', '青山湖区', '蛟桥镇庐山南大道1598号(鑫之源汽车真皮座椅)', '', 1570164513),
(646, '152593108', '張玉', '15877656372', '浙江省', '宁波市', '海曙区', '望春街道環城西路北段325號連雲谷', '', 1570164735),
(647, '152593109', '项永维', ' 1565523872', '安徽省', '宿州市', '萧县', '宿州市萧县赵庄镇', '', 1570164833),
(648, '000000003', '宋子琴', '15071374595', '湖北省', '武汉市', '汉阳区', '磨山集团，吓吧咀340号', '', 1570242519),
(649, '152593110', '运广思', '15122867261', '天津市', '天津市', '塘沽区', '塘沽区新港二号路福慧花园4-1-503', '', 1570244150),
(650, '152593111', '微微', '13924727124', '广东省', '潮州市', '潮安区', '广东市潮安区庵埠镇开濠旅馆', '', 1570244243),
(651, '152593112', '吴丽', '18225301300', '重庆市', '重庆市', '秀山土家族苗族自治县', '中和镇官湖社区武陵生活馆', '', 1570244467),
(652, '152593113', '鞠天英', '18173317009', '湖南省', '长沙市', '开福区', '长沙市开福区芙蓉中路金阳大厦429号4楼玲珑梵宫', '', 1570244583),
(653, '152593114', '张婷婷', '13017491935', '贵州省', '遵义市', '汇川区', '汇川区衡阳路71号', '', 1570245424),
(654, '152593115', '王玲玲', '18262696560', '江苏省', '苏州市', '张家港市', '塘桥填妙桥商城路237号港鸿模塑有限公司二楼海威服饰', '', 1570245475),
(655, '152593116', '李安', '13388742056', '云南省', '曲靖市', '宣威市', '城区新北站副食区195号', '支付宝30', 1570245595),
(656, '152593117', '孙誉恒', '13282251938', '浙江省', '温州市', '瓯海区', '茶山街道温州职业技术学院', '支付宝29.9', 1570245775),
(657, '152593118', '張玉', '15877656372', '浙江省', '宁波市', '海曙区', '望春街道環城西路北段325號連雲谷', '', 1570246016),
(658, '152593119', '俞乐彬', '13777449665', '浙江省', '杭州市', '萧山区', '瓜沥镇友谊二期安置小区9号东', '', 1570246174),
(659, '152593120', '文文', '18643048733', '辽宁省', '沈阳市', '皇姑区', '兴工街道华山街道华山路238号鲲鹏家园西区17-2号161室', '顺丰', 1570246222),
(660, '152593121', '牟少美', '18171231880', '湖北省', '武汉市', '江夏区', '纸坊街武昌大道642建颐小区', '', 1570246356),
(661, '152593122', '李娇', '15267871211', '浙江省', '宁波市', '海曙区', '鄞州大道西段228号万隆花苑7幢', '', 1570246476),
(662, '152593123', '华欣', '13685208642', '江苏省', '常州市', '武进区', '湟里镇东安村委南环路36号', '', 1570338244),
(663, '152593124', '刘燕霞', '13774419938', '上海市', '上海市', '奉贤区', '胡桥镇寺胡路久江集团2639', '', 1570338400),
(664, '152593125', '郑其容', '13678311086', '四川省', '宜宾市', '珙县', '巡场镇圆通快递汪智宇收', '', 1570338480),
(665, '152593126', '萱', '13648842921', '湖南省', '郴州市', '北湖区', '北湖路凯悦宾馆前台', '', 1570338575),
(666, '152593127', '王心悦', '15980119350', '福建省', '福州市', '台江区', '金融街万达百货四楼阿迪达斯', '', 1570338904),
(667, '152593128', '赵玉莹', '18155474947', '安徽省', '淮南市', '田家庵区', '龙泉街道南岭村53号楼', '', 1570338978),
(668, '152593129', '郝强', '15930463987', '河北省', '石家庄市', '桥西区', '长兴街12号石家庄职业技术学院', '', 1570339196),
(669, '152593130', '張玉', '15877656372', '浙江省', '宁波市', '海曙区', '望春街道環城西路北段325號連雲谷', '', 1570339522),
(670, '152593131', '罗敏', '13635774132', '湖北省', '恩施土家族苗族自治州', '建始县', '建始县景阳镇', '', 1570339606),
(671, '152593132', '吴秋芳', '13575532917', '浙江省', '绍兴市', '嵊州市', '鹿山广场曼卡龙专柜', '', 1570339678),
(672, '152593133', '李景财', '18811403940', '北京市', '北京市', '东城区', '金鱼池西区9号楼2门002 ', '', 1570339737),
(673, '152593134', '小辣椒', '15988274410', '浙江省', '绍兴市', '越城区', '马山镇马山路袍江工业区浙江越王台酒有限公司', '', 1570339778),
(674, '152593135', '徐凤', '17364394363', '上海市', '上海市', '闵行区', '闵行区莘庄镇春申路宝燕到家三楼海货一店', '', 1570339902),
(675, '152593136', '杨美玲', '15181728043', '福建省', '福州市', '福清市', '清荣大道大北路明德楼', '', 1570421174),
(676, '152593137', '陈焱', '18912975103', '江苏省', '南京市', '高淳区', '淳溪镇康乐路财智广场小区九栋一单元901', '', 1570421689),
(677, '152593138', '潘柯林', '15001068573', '北京市', '北京市', '海淀区', '万寿路西街5号院对面底商我爱我家', '', 1570421770),
(678, '152593139', '顾红烈', '18822832573', '广东省', '惠州市', '', '大亚湾西区碧桂园太东公园上城一期12栋一单元', '', 1570421836),
(679, '152593140', '聂慧琼', '18173609823', '贵州省', '贵阳市', '乌当区', '诚信北路绿地联胜国际7栋1楼3号门面  ', '', 1570421996),
(680, '152593141', '小玉', '18179775124', '江西省', '赣州市', '上犹县', '东山镇桂花园富华雨衣 厂', '', 1570422087),
(681, '152593142', '张立和', '13588900328', '浙江省', '温州市', '平阳县', '鳌江镇邮电路381号。', '', 1570422238),
(682, '152593143', '王赛男', '18155834258', '江苏省', '苏州市', '昆山市', '陆家镇芦莺路43号百灵雨露', '', 1570422289),
(683, '152593144', '刘芳', '18520250605', '广东省', '广州市', '海珠区', '凤阳街道康乐桥', '', 1570422394),
(685, '152593145', '王志强', '18306771843', '安徽省', '亳州市', '利辛县', '莱佛广场金水湾小区', '', 1570423055),
(686, '152593146', '刘正强', '17843894632', '重庆市', '重庆市', '合川区', '土场镇北汽银翔盛世庭院', '', 1570423131),
(687, '152593147', '王张晴', '15905677221', '安徽省', '亳州市', '谯城区', '亳州市经济技术开发区国购观澜天下东区  ', '', 1570423334),
(688, '152593148', '皓宸', '17530409835', '河南省', '驻马店市', '驿城区', '金雀路开发区高中', '支付宝29.9', 1570423398),
(689, '152593149', '袁媛', '18256339293', '安徽省', '宣城市', '绩溪县', '华阳镇 来苏 景苑9排8号', '', 1570423585),
(690, '152593150', '曹玉娟', '15755073153', '安徽省', '滁州市', '凤阳县', '黄湾社区街道办事处     ', '', 1570423685),
(691, '152593151', '萌萌', '18518060520', '北京市', '北京市', '大兴区', '安定镇郑前路2号95', '', 1570423749),
(692, '152593152', '宗旋', '13865011811', '安徽省', '合肥市', '长丰县', '双凤开发区凤霞路42号', '', 1570423800),
(693, '152593153', '张永勤', '18093316026', '甘肃省', '平凉市', '崆峒区', '白水镇打虎村', '', 1570423928),
(694, '152593154', '王青青', '15167836084', '浙江省', '温州市', '苍南县', '龙港镇西五街龙湖小区3栋101室', '', 1570424159),
(695, '152593155', '王良 ', '18565491815', '广东省', '广州市', '黄埔区', '东江大道普晖村金辉苑丰巢快递柜      ', '', 1570424238),
(696, '152593156', '邓美云', '18727051769', '北京市', '北京市', '丰台区', '南苑路天雅女装大厦2037', '', 1569992962),
(697, '152593157', '周丹丹', '19962331083', '江苏省', '盐城市', '建湖县', '建阳镇江苏省盐城市建湖县建阳镇兴建路63号佳佳批发超市', '', 1570431661),
(698, '152593158', '胡春凤', '13328518097', '四川省', '遂宁市', '船山区', '南强街道遂宁市英创力电子科技有限公司', '', 1570431747),
(699, '152593159', '于波', '13654031555', '辽宁省', '沈阳市', '苏家屯区', '湖西街道葵松路20号', '', 1570431826),
(700, '152593160', '黄琼桂', '18820440042', '云南省', '昆明市', '官渡区', '关上南路国旅汽修店对面值班室', '', 1570507461),
(701, '152593161', '小茹', '18247647449', '内蒙古自治区', '赤峰市', '林西县', '林西县政府小区', '', 1570507947),
(702, '152593162', '霍星威', '18576027668', '陕西省', '宝鸡市', '渭滨区', '高家镇姜谭路西段二副一号', '', 1570508130),
(703, '152593163', '陈鑫城', '15913905377', '广东省', '汕头市', '龙湖区', '周厝塭村美美超市', '', 1570508375),
(704, '152593164', '李天蕴', '13299479502', '河北省', '保定市', '蠡县', '南庄镇宋岗村253号', '', 1570508434),
(705, '152593165', '潘保', '19971088487', '浙江省', '宁波市', '海曙区', '顺德路346号，腾达汽车真皮内饰改装', '', 1570508508),
(706, '152593166', '卢秀华', '18278740771', '广西壮族自治区', '钦州市', '灵山县', '旧州镇西屯村', '', 1570509138),
(707, '152593167', '于健航', '18792784521', '陕西省', '西安市', '临潼区', '斜口镇于李村喜悦餐厅', '', 1570509203),
(708, '152593168', '赵洁收', '18295038225', '宁夏回族自治区', '银川市', '', '宁东镇东龙步行街爱丽蛋糕屋', '', 1570509252),
(709, '152593169', '王娇', '15000437719', '上海市', '上海市', '杨浦区', '五角场镇长海路长海三村17号楼502室', '', 1570509324),
(710, '152593170', '于女士', '13942381806', '辽宁省', '抚顺市', '新抚区', '永安台街道中国人寿保险股份有限公司抚顺客户服务中心', '', 1570509520),
(711, '152593171', ' 许海军', '15775850019', '浙江省', '金华市', '武义县', '浙江省金华市武义县白洋街道龙源路3号（长荣工贸公司）', '', 1570509649),
(712, '152593172', '李冰', '13954165316', '山东省', '济南市', '济阳区', '济阳街道济阳县安达城市广场A区32号Young女装', '', 1570509875),
(713, '152593173', '张俊', '13105838785', '浙江省', '嘉兴市', '桐乡市', '羔羊工业区嘉戴艾妮鞋业有限公司', '支付宝收款29.9', 1570510183),
(714, '152593174', '邓思源', '18616987754', '浙江省', '杭州市', '富阳区', '富春街道后周路92号玫瑰公寓', '支付宝收款29.9', 1570510259),
(715, '152593175', '杨阳', '17773255522', '湖南省', '长沙市', '天心区', '湘府中路青园街道198号CEO行政公馆', '', 1570516626),
(716, '152593176', '路小丽', '18567897891', '湖北省', '十堰市', '竹山县', '潘口乡湖北嘉麟杰服饰', '', 1570516712),
(717, '152593177', '杜钱凤', '18892485872', '贵州省', '遵义市', '务川仡佬族苗族自治县', '东门米市宏发电器', '', 1570592633),
(718, '152593178', '白茹', '15993202219', '河南省', '郑州市', '管城回族区', '族区经开第七大街经南二路豫禾坊胡辣汤', '', 1570593023),
(719, '152593179', '胡二伟', '15138277907', '河南省', '周口市', '西华县', '逍遥镇柴城村', '', 1570593142),
(720, '152593180', '梅灵', '18354134829', '山东省', '济南市', '历下区', '天辰路288号山东九州通医药有限公司', '', 1570593296),
(721, '152593181', '赵云', '13257077364', '江西省', '赣州市', '于都县', '贡江镇于都中学（南区）', '', 1570593617),
(722, '152593182', '王春利', '15049680800', '北京市', '北京市', '通州区', '台湖镇科创东五街九号院弘赫体育', '', 1570593676),
(723, '152593183', '李卓群', '18510151234', '吉林省', '长春市', '南关区', '大经路恒兴国际城1421', '', 1570593891),
(724, '152593184', '鲁振元', '16639312112', '河南省', '濮阳市', '濮阳县', '濮阳县习城乡', '', 1570593954),
(725, '152593185', '吕张然', '13315491022', '河北省', '石家庄市', '鹿泉区', '和平路西三环石家庄同创铁路运输学院', '', 1570594119),
(726, '152593186', '刘蓉', '17756335509', '安徽省', '宣城市', '郎溪县', '郎溪县檀雨玩具厂', '支付宝29.9', 1570594319),
(727, '152593187', '向柏林', '19172405005', '湖北省', '恩施土家族苗族自治州', '恩施市', ' 舞阳坝街道东风大道132号华龙村大酒店斜对面公交站牌康恩农业', '', 1570594552),
(728, '152593188', '李玉银', '18255177122', '安徽省', '合肥市', '肥西县', '高新区明珠大道格力馨雅园', '', 1570689568),
(729, '152593189', '周长军', '15184452752', '四川省', '成都市', '龙泉驿区', '十陵街长江职业学院', '', 1570689799),
(730, '152593190', '小玲', '13144297164', '广东省', '佛山市', '南海区', '狮山镇官窑教育路中兴对面官窑烟酒', '', 1570690107),
(731, '152593191', '韩嘉琳', '15819092323', '广东省', '汕尾市', '陆丰市', '碣石镇玉燕中学老校门', '', 1570690439),
(732, '152593192', '杜鑫', '15039097434', '河南省', '郑州市', '新密市', '曲梁服装工业园区天安街永尔特对面秀姿美容美发', '', 1570690551),
(733, '152593193', '王大可', '18781357752', '四川省', '乐山市', '市中区', '檀木南路王河三号小区友点多超市收', '', 1570690618),
(734, '152593194', '张涵菲', '13504541328', '黑龙江省', '佳木斯市', '', '时代景城小多超市', '', 1570690787),
(735, '152593195', '余可敬', '15992983208', '广东省', '肇庆市', '高要区', '莲塘镇广东理工学院西区专科智顺通快递', '', 1570691260),
(736, '152593196', 'L', '19807847168', '广西壮族自治区', '南宁市', '马山县', '白山镇合群村', '', 1570691308),
(737, '152593198', '王伟', '13470754076', '安徽省', '芜湖市', '鸠江区', '万春街道 万春花园 万春新苑 蓝领公寓', '', 1570691493),
(738, '152593199', '张思恬', ' 1813314196', '安徽省', '阜阳市', '', '五十铺乡', '', 1570691588),
(739, '152593200', '陈亚丽', '13785631963', '河北省', '廊坊市', '广阳区', '九州镇芒店二村国利加油站200米白色大院', '', 1570692087),
(740, '152593201', '丁永壮', '15868394587', '江苏省', '徐州市', '铜山区', '沿湖新街金典家具', '', 1570692165),
(741, '152593202', '姚绍方', '18283226060', '四川省', '内江市', '市中区', '城西街道民族路侯家巷52号5栋1单元405，垃圾库往回走右手边第二个口子需要下几步梯坎就是52号5栋一单元，包裹请放在楼下103四叔处', '', 1570773518),
(742, '152593203', '王芊洳', '18670471666', '湖南省', '衡阳市', '常宁市', '培元街道万象阳光城大门口对面眉眼唇店', '', 1570774696),
(743, '152593204', '张丹', '15912406944', '云南省', '曲靖市', '宣威市', '务德镇云南省宣威市务德镇宏爱村6组', '', 1570774827),
(744, '152593205', '思思', '13711242024', '广东省', '揭阳市', '普宁市', '燎原街道泥沟村泥沟乡门', '', 1570774913),
(745, '152593206', ' 李云', '18288900262', '湖北省', '潜江市', '园林街道', ' 园林街道湖北省潜江市红梅路集贤一街52号', '', 1570775002),
(746, '152593207', '蒋飞 ', '18384452481', '浙江省', '嘉兴市', '嘉善县', '西云村嘉善大道1683号智联电子有限公司  ', '', 1570776619),
(747, '152593208', '姜斌', '1514080911', '辽宁省', '鞍山市', '铁东区', '解放东路南麓世家三期3单元1102', '', 1570780200),
(748, '152593209', '张益达', '13372365860', '浙江省', '台州市', '玉环市', '玉城街道陈屿刘园塘股路六合超市旁27号重庆烧烤', '', 1570780549),
(749, '152593210', '谢淑娟', '13409980101', '湖北省', '黄冈市', '黄梅县', '黄梅县小池镇', '', 1570780661),
(750, '152593211', '赵鑫卫', '15158238711', '浙江省', '杭州市', '下城区', '北景竹邻苑1幢2单元201', '', 1570780728),
(751, '152593212', '金少', '18552271071', '江苏省', '南京市', '秦淮区', '夫子庙东牌楼路4号（桂花鸭店）', '', 1570859527),
(752, '152593213', '徐开燕', '18054389435', '山东省', '滨州市', '', '杜店街道茶叶市场大哈推拿', '', 1570859655),
(753, '152593214', '黄越', '17625944994', '江苏省', '南京市', '栖霞区', '天佑路28号人才公寓', '', 1570859748),
(754, '152593215', '李梦梦', '18456724526', '江苏省', '常州市', '新北区', '薛家镇庆阳路26号三楼沃西电子', '', 1570859892),
(755, '152593216', '李慰欣', '18504600735', '黑龙江省', '哈尔滨市', '南岗区', '和祥路四季上东小区12号楼4单元1201', '', 1570860027),
(756, '152593217', '伪面君子', ' 1824929407', '黑龙江省', '哈尔滨市', '呼兰区', '学院路街道660号黑龙江农垦职业学院 ', '', 1570860795),
(757, '152593218', '陈子', '13360289845', '广东省', '茂名市', '高州市', '潘州街道聚福新村南18栋五楼', '', 1570860888),
(758, '152593219', '陈小凤', '15869327025', '浙江省', '宁波市', '鄞州区', '贸城东路192号东裕商业街2号楼3楼世外桃源', '', 1570862239),
(759, '152593220', '王晓蕾', '13962356176', '江苏省', '苏州市', '常熟市', '海虞镇王市热能有限公司', '', 1570862350),
(760, '152593221', '贝贝', '13846744434', '黑龙江省', '绥化市', '海伦市', '共和镇小学旁', '', 1570862534),
(761, '152593222', '王丽', '18851363574', '江苏省', '宿迁市', '泗洪县', '梅花梅兰嘉苑', '', 1570862617),
(762, '152593223', '刘思凡', '13279548395', '陕西省', '西安市', '临潼区', '韩峪镇平峪路88号陕西能源职业技术学院', '', 1570862820),
(763, '152593224', '吴学谦', '15160580857', '福建省', '宁德市', '蕉城区', '塔山村塔山路塔山弄4号 （小卖铺）', '', 1570862927),
(764, '152593225', '欧阳秀', '13243896979', '广东省', '深圳市', '龙华区', '民治塘水围一区一栋  ', '', 1570862967),
(765, '152593226', '王燕', '13121431632', '北京市', '北京市', '大兴区', '旧宫南小街宇航小区1号楼三单元601', '', 1570863148),
(766, '152593227', '李双 ', '18313393125', '云南省', '普洱市', '景谷傣族彝族自治县', '十字街家和源餐厅', '', 1570863216),
(767, '152593228', '姑奶奶', '15879225093', '江西省', '九江市', '濂溪区', '五里街道会馆路万达华府E区物业管理处', '', 1570863285),
(768, '152593229', '贾子轩', ' 1511017735', '北京市', '北京市', '丰台区', '程庄南里小区9号楼306', '', 1570868759),
(769, '152593230', '耿美龄', '15712509392', '河北省', '保定市', '唐县', '唐县齐家佐中学', '', 1570868853),
(770, '186030130', '羡三岁', '17537713829', '河南省', '南阳市', '镇平县', '侯集镇快递超市', '', 1570093689),
(771, '152593233', '夏先生', '1368388811', '河南省', '驻马店市', '泌阳县', '行政路东段二高东侧书香苑销售中心', '', 1570948255),
(772, '152593234', '罗小玲', '18685013531', '贵州省', '贵阳市', '南明区', '花果园一期12栋一单元', '', 1570948345),
(773, '152593235', '唐林', '18380616200', '四川省', '德阳市', '中江县', '老林业局对面黄金大饼4楼 ', '', 1570948489),
(774, '152593236', '祁宝玉', '17128384888', '辽宁省', '沈阳市', '新民市', '兴隆堡镇沿海营子威龙超市', '', 1570949228),
(775, '152593237', '孙艳伟', '15075699075', '河北省', '廊坊市', '三河市', '城建新村五号楼一单元', '', 1570949688),
(776, '152593238', '林月球', '13570565920', '广东省', '广州市', '越秀区', '白云街道二沙岛11区晴波路15号陶然轩', '', 1570950227),
(777, '152593239', '王轩', '18292844875', '陕西省', '西安市', '莲湖区', '红庙坡街道梨园路御园温泉小区，', '', 1570950281),
(778, '152593240', '赵颖', '17320733210', '河北省', '沧州市', '新华区', '东环街道铁路宿舍9-1-102', '', 1570950756),
(779, '152593241', '熊秀英', '15081086139', '河北省', '邯郸市', '', '马长街小区B7楼二单元', '', 1570952575),
(780, '152593242', '张潦潦', '15809298302', '陕西省', '西安市', '长安区', '锦业二路，法士特赛斐广场北门，保安室代收', '', 1570952692),
(781, '152593243', '刘文龙', '17606054892', '福建省', '漳州市', '龙海市', '龙池开发区龙池大道25－6漳州盈塑工业有限公司', '', 1570952749),
(782, '152593244', '吴道安', '15825657377', '浙江省', '温州市', '瑞安市', '瑞祥大道344号', '', 1570953256),
(783, '152593245', '李华', '13821948800', '天津市', '天津市', '东丽区', '张贵庄街道四季恋城春秀园11-1-203', '', 1570953508),
(784, '152593246', '李红', '18075216101', '安徽省', '亳州市', '蒙城县', '城关镇307线，解放商用汽车，兆鑫集团，一楼收款室', '', 1570953598),
(785, '152593247', '朱杏蓉', '13118895158', '广东省', '佛山市', '顺德区', '北滘镇碧江隔涌新村街20号(万象广场东侧）', '', 1570953676),
(786, '152593248', ' 康敏', '18385120385', '贵州省', '遵义市', '仁怀市', '盐津街道贵州遵义仁怀人民银行对面伯爵足疗', '', 1570953755),
(787, '152593249', '程静', '18550371119', '江苏省', '苏州市', '昆山市', '巴城石牌凤栖原79栋', '', 1571029678),
(788, '152593250', '罗萱珏', '17307830556', '广西壮族自治区', '桂林市', '叠彩区', '大河乡上窑村英瑞达幼儿园乌石街分园', '', 1571030008),
(789, '152593251', '南超', '15506460238', '山东省', '聊城市', '', '当代核心10号楼西座12楼 ', '', 1571030105),
(790, '152593252', '赵川', '13547558991', '福建省', '厦门市', '思明区', '莲前街道吕岭路大唐中心2011号D 栋自提柜', '', 1571030185),
(791, '152593253', '刘先生', '18616368555', '上海市', '上海市', '普陀区', '古浪路355弄99号303室', '', 1571030253),
(792, '152593254', '汪忠梅', ' 1868504936', '浙江省', '宁波市', '余姚市', '阳明街道舜宇西路184号宁波贝隆精密模塑有限公司', '', 1571030392),
(793, '152593255', '张琳倩', '18845635105', '江苏省', '南京市', '玄武区', '裴家桥小区8号楼', '', 1571030922),
(794, '152593256', '杨佳蕊', '17614863082', '内蒙古自治区', '鄂尔多斯市', '康巴什区', '青春山街道鄂尔多斯生态环境职业学院', '', 1571031675),
(795, '152593257', '逗逗', '13332055512', '天津市', '天津市', '南开区', '咸阳路庆达园底商增57号湘土居湘菜馆', '', 1571031773),
(796, '152593258', '吴玲', '18813912700', '广东省', '深圳市', '宝安区', '福永同和凤凰花苑4栋C3座1103', '', 1571033144),
(797, '152593259', '王铭', '15121681206', '广东省', '中山市', '南头镇', '升辉南路12号中山市永安宝电器有限公司', '', 1571033796),
(798, '152593260', '李佳澳', '17756376623', '安徽省', '宣城市', '宣州区', '鳌峰街道鳌峰东路广凯停车场（宣奥汽修）', '', 1571033874),
(799, '152593261', '龙耀坤', '15099815536', '广东省', '茂名市', '茂南区', '羊角镇西粤中路茂丰花园斜坡直入500米东北烧烤', '', 1571033939),
(800, '152593262', '伊伊', '15136992710', '上海市', '上海市', '松江区', '中山中路79弄平高大厦17楼1704 室', '', 1571034417),
(801, '152593263', '朱慧星', '18272761085', '河南省', '南阳市', '内乡县', '南阳市内乡县赵店乡', '', 1571034694),
(802, '152593264', '茹慧', '13327108055', '内蒙古自治区', '呼和浩特市', '回民区', '永盛巷锦泽园小区8号楼底商昊海数码', '', 1571034790),
(803, '152593265', '李老师', '13622140326', '天津市', '天津市', '河东区', '鲁山道东瑞家园4号楼1门1206', '', 1571034847),
(804, '152593266', '刘杰', '13520022550', '北京市', '北京市', '朝阳区', '崔各庄乡南皋路草场地长建驾校', '', 1571034940),
(805, '152593267', '卞林春   ', '13248078669', '上海市', '上海市', '', '崇明县陈家镇花漂村241号', '', 1571035004),
(806, '152593268', '紫沫', '13352287070', '辽宁省', '大连市', '甘井子区', '泡崖街道玉泉街30号2单元202', '', 1571121983),
(807, '152593269', '陈锦', '1565167007', '山东省', '青岛市', '城阳区', '上马街道桃源小学北沙发厂', '', 1571122097),
(808, '152593270', '李佳龙', '18390009126', '湖南省', '岳阳市', '', '冷水铺嘉宝莉油漆店', '', 1571122163),
(809, '152593271', '龚微', '15845503562', '黑龙江省', '绥化市', '海伦市', '复兴路2号利民锅炉厂', '', 1571122314),
(810, '152593272', '陈佳文 ', '15279986065', '江西省', '景德镇市', '昌江区', '河西茶山超市', '', 1571122861),
(811, '152593273', '洪焱林', '18814381077', '广东省', '惠州市', '惠城区', '新圩镇塘吓产经村兴鸿昌工业园（把快递放在保安室）', '', 1571123012),
(812, '152593274', '庄佩佩', '13291525999', '浙江省', '嘉兴市', '平湖市', '中国服装城B区一层南B09', '', 1571123187),
(813, '152593275', '郭守重', '15800414962', '上海市', '上海市', '松江区', '车墩镇长溇村626号', '', 1571123345),
(814, '152593276', '凌琪', '13865633970', '安徽省', '宣城市', '郎溪县', '经济开发区檀雨玩具厂', '', 1571123414),
(815, '152593277', '黄柏淋', '13924137813', '广东省', '广州市', '黄埔区', '鱼珠街道中山大道中珠村国际机械城百力商务办公楼3楼', '', 1571123496),
(816, '152593278', '尤本红', '13966007288', '安徽省', '芜湖市', '南陵县', '江南国际建材家居城D3幢105－106欧普照明', '', 1571123580),
(817, '152593279', '吴翠', '13264745425', '湖北省', '武汉市', '洪山区', '光谷步行街风度柏林小区一期', '', 1571123713),
(818, '152593280', '曾祥浩', '15811749296', '广东省', '韶关市', '乳源瑶族自治县', '游溪镇重阳猪场新厂', '', 1571124027),
(819, '152593281', '籍超强', '13412666664', '广东省', '东莞市', '万江区', '华发建筑物资市场前排32号', '', 1571124098),
(820, '152593282', '杨婷', '13262732273', '上海市', '上海市', '嘉定区', '江桥镇华江支路677弄中星海兰苑60号楼801室', '', 1571203375),
(821, '152593283', '张红', '13637266355', '安徽省', '六安市', '金安区', '皋城路与经二路交叉口标榜装饰六楼融信酒店用品', '', 1571203551),
(822, '152593284', '杨昊', '18809335516', '甘肃省', '平凉市', '泾川县', '城关镇水泉小学附近', '', 1571203715),
(823, '152593285', '梁志凡', '13631698814', '广东省', '深圳市', '盐田区', '沙头角第一生活区', '', 1571203875),
(824, '152593286', '陈伟作', '13528175883', '广东省', '中山市', '古镇镇', '六坊工业区北路15号', '', 1571204176),
(825, '152593287', '蓝云', '15224065162', '浙江省', '杭州市', '富阳区', '永昌镇，永利茶叶厂', '', 1571204287),
(826, '152593288', '宋君悦', '18810310186', '北京市', '北京市', '丰台区', '马连道南街华睦大厦608', '', 1571204387),
(827, '152593289', '余洪浩', '15555607883', '河北省', '石家庄市', '新华区', '大郭镇石获北路37号', '', 1571204472),
(828, '152593290', '刘梅梅', '15320703796', '重庆市', '重庆市', '云阳县', '体育路天宫市场（刘东诊所）', '', 1571204575),
(829, '152593291', '秦春丽', '18919063876', '甘肃省', '兰州市', '七里河区', '西站建兰南路便民百货', '', 1571204715),
(830, '152593292', '张亮', '15114582413', '黑龙江省', '哈尔滨市', '松北区', '对青山镇对青山镇', '', 1571204854),
(831, '152593293', '李卿云', '18056282331', '安徽省', '铜陵市', '义安区', '翠湖三路西段 399铜峰工业园', '', 1571204958),
(832, '152593294', '王井业', '15151032421', '江苏省', '南京市', '秦淮区', '贡院街46-3号我爱我家', '', 1571205130),
(833, '152593295', '刘建轲', '18739352333', '河南省', '濮阳市', '濮阳县', '濮阳县习城乡', '', 1571226358),
(834, '152593296', '王璐', '13337724221', '江苏省', '南京市', '鼓楼区', '汉江路16号龙凤花园腾龙里30号楼501室', '', 1571286028),
(835, '152593297', '韩楷棪', '18910722922', '北京市', '北京市', '', '冠捷科技显示有限公司', '', 1571286204),
(836, '152593298', '曾雪莲', '18879664921', '江西省', '吉安市', '吉州区', '曲濑镇杨家坊村7号', '', 1571286284),
(837, '152593299', '田秀', '13516449738', '安徽省', '安庆市', '宜秀区', '大龙山镇安庆师范大学龙山校区', '', 1571286430),
(838, '152593300', '小一', '13659876462', '湖北省', '咸宁市', '', '天城医院住院部二楼护士站', '', 1571286551),
(839, '152593301', '王晓雨', '18814922220', '浙江省', '温州市', '永嘉县', '瓯北镇安丰工业区蜘蛛王经典公爵 ', '', 1571286640),
(840, '152593302', '张华婷', '18688873047', '广东省', '广州市', '花都区', '建设北路大华市场A区8号创新数码', '', 1571286779),
(841, '152593303', '吴泓颐', '15925618468', '浙江省', '杭州市', '江干区', '四季青街道盛世钱塘5幢3204室', '', 1571286865),
(842, '152593304', '华欣', '13685208642', '江苏省', '常州市', '武进区', '湟里镇东安村委南环路36号', '', 1571287184),
(843, '152593305', '万姐', '18013488182', '江苏省', '苏州市', '相城区', '渭塘镇珍珠湖路99号珍珠湖浴场', '', 1571287287),
(844, '152593306', '潘保', '19971088487', '浙江省', '宁波市', '海曙区', '顺德路346号，腾达汽车真皮内饰改装', '', 1571287358),
(845, '152593307', '徐静', '18523666906', '广西壮族自治区', '贵港市', '桂平市', '西山镇桂平一职学校外', '', 1571287429),
(846, '152593308', '袁秀梅', '13691318521', '北京市', '北京市', '通州区', '果园环岛京东小海鲜', '', 1571287508),
(847, '152593309', '封宽亮', '13675266650', '江苏省', '镇江市', '扬中市', '三茅镇利民东路27号', '', 1571287584),
(848, '152593310', '赵国兴', '15051397428', '江苏省', '淮安市', '清江浦区', '盐河镇王元二支路', '', 1571287649),
(849, '152593311', '杨伟文', '15973979765', '湖南省', '邵阳市', '城步苗族自治县', '白毛坪乡白毛坪双庆桥批发部', '', 1571287864),
(850, '152593312', '陈俊妮', '18826570361', '广东省', '深圳市', '福田区', '沙头街道新洲路4003号都市花园御庭轩29楼29f', '', 1571287989),
(851, '152593313', '付妍', '18513993789', '北京市', '北京市', '朝阳区', '东四环中路红星美凯龙家居馆二层CHIC', '', 1571385712),
(852, '152593314', '龙扬', '18582229282', '四川省', '成都市', '武侯区', '肖家河正街45号', '', 1571386001),
(853, '152593315', '小薛', '15250518509', '江苏省', '苏州市', '吴江区', '太湖新城镇 详细地址: 八坼镇学营路77号宏远钢材市场D-08若水物流有限公司', '', 1571386082),
(854, '152593316', '秦春丽', '18919063876', '甘肃省', '兰州市', '', '西站建兰南路便民日用百货', '', 1571386196),
(855, '152593317', '袁妍妍', '18371413816', '湖北省', '黄石市', '黄石港区', '江北管理区湖北师范大学(请寄到菜鸟驿站', '', 1571386313),
(856, '152593318', '梁珂菘', '19967833534', '河南省', '开封市', '龙亭区', '西郊乡开封技师学院', '', 1571386401),
(857, '152593319', '潘柏林', '13372055000', '江苏省', '宿迁市', '泗洪县', '泗洪县东城康桥', '', 1571386481),
(858, '152593320', '郑静', '18337755660', '河南省', '新乡市', '红旗区', '开发区街道振中路与道清路口金禧园小区25号楼3单元5楼西户', '', 1571386614),
(859, '152593321', '杨宁', '18782310797', '四川省', '攀枝花市', '西区', '清香坪建兴路书香御景1栋2单元22-1号', '', 1571386686),
(860, '152593322', '李秀', '15029854083', '福建省', '三明市', '永安市', '含笑大道1246号', '', 1571386785),
(861, '152593323', '范丰源', '17513106005', '河南省', '安阳市', '龙安区', '中州路电业大厦南50米廉政教育中心', '', 1571386846),
(862, '152593324', '邓艳玲', '18230591773', '浙江省', '金华市', '义乌市', '稠城街道下车门路篁园新村38栋6－1湘味缘蒸菜馆', '', 1571386921),
(863, '152593325', '周羽', '15857655627', '浙江省', '杭州市', '余杭区', '运河街道费兴路30号盛泰家纺', '', 1571388048),
(864, '152593326', '吴永红', '18805013603', '福建省', '福州市', '长乐区', '金峰镇华阳锦鸿针织', '', 1571478698),
(865, '152593327', '李小娟', '15916952000', '广东省', '东莞市', '凤岗镇', '油甘埔青塘工业三路宏骏工业园C栋4 楼。', '', 1571479314),
(866, '152593328', '曹姐', '13781639950', '上海市', '上海市', '浦东新区', '紫荆花路88号临港分区指挥部', '', 1571479402),
(867, '152593329', '张洪杰', '15188895101', '山东省', '潍坊市', '奎文区', '新城街道玉清路东风街歌尔电声园三期', '', 1571479469),
(868, '152593330', '孟令鑫', '18538733675', '山东省', '滨州市', '阳信县', '河流镇九龙湖东第一社区。', '', 1571479539),
(869, '152593331', '庄智群', '13751924002', '广东省', '汕尾市', '城区', '红海西路八巷24号', '', 1571479605),
(870, '152593332', '付世东', '17674548344', '湖北省', '武汉市', '硚口区', '古田街道陆军勤务学院北门', '', 1571479668),
(871, '152593333', '王磊', '19856538954', '安徽省', '合肥市', '包河区', '滨湖顺园北区11栋2002', '', 1571479742),
(872, '152593334', '空白', '17683230881', '四川省', '南充市', '顺庆区', '建华中学报刊亭', '', 1571479818),
(873, '152593335', '王锐', '15756596597', '四川省', '成都市', '金牛区', '古柏五组育梁学校后面100号', '', 1571479888),
(874, '152593336', '徐康棋', '18737479756', '河南省', '郑州市', '中原区', '陇海西路338号中原新城新玛特豪客来', '', 1571480014),
(875, '152593337', '田海英', '15124774663', '内蒙古自治区', '呼和浩特市', '回民区', '光明路坤源小区旭日洗化店', '', 1571480078),
(876, '152593338', '刘丽', '15131742765', '河北省', '沧州市', '青县', '青县青王路宏利绣品', '', 1571480142),
(877, '152593339', '杜喜庆', '15901105186', '山东省', '青岛市', '黄岛区', '红石崖街道 昆仑山北路与金钱河路交叉口路东思迈外语学校', '', 1571480231),
(878, '152593340', '郭莹莹', '18743403000', '吉林省', '四平市', '梨树县', '郭家店镇雄健健身房 ', '', 1571480297),
(879, '152593341', '明瑞鹏', '13150396623', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '精河县', '托托乡九十一团小果园', '', 1571480377),
(880, '152593342', '王一如', '15901453989', '北京市', '北京市', '昌平区', '小汤山镇白马路甲1号学员11队', '', 1571480514),
(881, '152593343', '金加惠', '13616287732', '江苏省', '苏州市', '昆山市', '玉山镇虹旗路森林半岛 花园10号楼三单元205室', '', 1571480574),
(882, '152593344', '邹丽', '13550286963', '四川省', '成都市', '双流区', '九江街道成都市双流县九江镇香博城御阁酒店', '', 1571480703),
(883, '152593345', '雅静', '13185227681', '浙江省', '湖州市', '德清县', ' 武康镇石北巷45号丝诺造型', '', 1571481208),
(884, '152593346', '刘晓薇', '17327668790', '江苏省', '徐州市', '沛县', '大屯镇奚阁村37号', '', 1571482689),
(885, '152593347', '余生', '13613011627', '广东省', '深圳市', '罗湖区', '莲塘村三巷12号A506', '', 1571482757),
(886, '152593348', '尹宗芬', '18224248901', '四川省', '宜宾市', '', '巡场孝儿镇双田三组', '', 1571483286),
(887, '152593349', '胡兆玲', '14787491356', '云南省', '昆明市', '官渡区', '关上新村石虎关加油站', '', 1571545703),
(888, '152593350', '媛媛', '18688474103', '广东省', '广州市', '番禺区', '桥南路大润发购物中心一楼', '', 1571545795),
(889, '152593351', '张文贤', '17769454751', '湖南省', '怀化市', '溆浦县', '溆浦县水东镇', '', 1571545868),
(890, '152593352', '孙宏鹏', '18501551841', '江苏省', '南通市', '启东市', '滨海工业园区南海路1号南通大学启东校区', '', 1571545947),
(891, '152593353', '张先生', '19925938769', '广东省', '中山市', '三角镇', '旭日领御111卡', '', 1571546193),
(892, '152593354', '王敬贺', '13116131530', '北京市', '北京市', '朝阳区', '金盏乡黎各庄村朝鑫东方物流园', '', 1571546477),
(893, '152593355', '何易', '15284037011', '四川省', '绵阳市', '三台县', '下新乡松林村四组007号', '', 1571546588),
(894, '152593356', '陈诚', '15228666455', '四川省', '广元市', '苍溪县', '陵江镇武当社区武当二组', '', 1571546647),
(895, '152593357', '袁源', '19872082097', '湖北省', '十堰市', '竹山县', '湖北十堰竹山绿松石城', '', 1571546716),
(896, '152593358', '静哥', '15936659998', '河南省', '安阳市', '林州市', '振林街道东营街南三巷8号', '', 1571546784),
(897, '152593359', '王艳艳', '15188309154', '河南省', '郑州市', '金水区', '北环锦绣汇城9号楼一单元8楼804', '', 1571546857),
(898, '152593360', '马莹', '17734457000', '河北省', '廊坊市', '', '河北省廊坊市开发区 南营村 ', '', 1571546939),
(899, '152593361', '吴添', '13605196046', '江苏省', '南京市', '秦淮区', '五老村街道淮海路68号苏宁电器一楼移动柜台', '', 1571547025),
(900, '152593362', '阿荣', '18747943606', '内蒙古自治区', '锡林郭勒盟', '锡林浩特市', '金桥楼下名宣造型', '', 1571547231),
(901, '152593363', '周金晶', '13456550262', '浙江省', '绍兴市', '嵊州市', '北直街100号一单元407室', '', 1571547311),
(902, '152593364', '邹光理', '17713673146', '浙江省', '嘉兴市', '嘉善县', '魏塘街道长秀村新开河11号', '', 1571636669),
(903, '152593365', '赵水菊', '15894511054', '上海市', '上海市', '嘉定区', '陈翔路699号', '', 1571636760),
(904, '152593366', '陈颖', '13262225942', '江苏省', '宿迁市', '沭阳县', '陇集镇李徐村东王组', '', 1571636876),
(905, '152593367', '周周', '17625932949', '江苏省', '南京市', '建邺区', '水西门大街金基广场268号3栋106（克丽缇娜）', '', 1571637010),
(906, '152593368', '张亚柠', '15613939153', '河北省', '石家庄市', '鹿泉区', '学府路169号石家庄工程职业学院', '', 1571637139),
(907, '152593369', '曹剑', '15230592085', '河北省', '唐山市', '玉田县', '梧桐嘉园c1-3单元-1001', '', 1571637203),
(908, '152593370', '小龙', '18755992637', '浙江省', '温州市', '鹿城区', '五马街沙帽河工农商餐厅', '', 1571637278),
(909, '152593371', '刘敏', '15237021112', '河南省', '商丘市', '睢阳区', '文化路金银路交叉口向南路西中国体育彩票', '', 1571637350),
(910, '152593372', '韦爱新', '18824813620', '广东省', '惠州市', '惠阳区', '大亚湾西区办事处石化大道敏华新厂32号', '', 1571637418),
(911, '152593373', '袁媛', '18256339293', '安徽省', '宣城市', '绩溪县', '华阳镇 来苏景苑9排8号', '', 1571637478),
(912, '152593374', '萨丽', '15064665295', '山东省', '潍坊市', '潍城区', '潍城经济开发区潍城区东风街以南彩虹路以东金昌商城西区1―06', '', 1571637540),
(913, '152593375', '未晚', '18458656350', '浙江省', '宁波市', '慈溪市', '观海卫镇观附公路公牛西区258号', '', 1571637608),
(914, '152593376', '小雪', '15384070807', '山东省', '滨州市', '滨城区', '杜店街道黄河8路海洋之星温泉酒店', '', 1571637850),
(915, '152593377', '吴祥', '15299916414', '新疆维吾尔自治区', '石河子市', '', '职业技术学院', '', 1571723468),
(916, '152593378', '秦春丽', '18919063876', '甘肃省', '兰州市', '七里河区', '西站建兰南路便民日用百货', '', 1571723709),
(917, '152593379', '张乐', '17897581389', '北京市', '北京市', '通州区', '宋庄镇小堡文化广场常赢三兄弟涮肉', '', 1571723806),
(918, '152593380', '张兆阳', '18187441305', '云南省', '曲靖市', '富源县', '大河镇黄泥村委会下堡子村', '', 1571723881),
(919, '152593381', '张燕华', '15818843378', '广东省', '广州市', '天河区', '沙河大街非凡网络市场A001', '', 1571723977),
(920, '152593382', '骆相奇', '15676637368', '广西壮族自治区', '百色市', '凌云县', '逻楼镇逻楼市场海力燃气店', '', 1571724199),
(921, '152593383', '刘小娇', '18362508391', '江苏省', '苏州市', '吴江区', '七都镇亨通公寓', '', 1571724303),
(922, '152593384', '李磊', '13193650022', '福建省', '福州市', '仓山区', '盖山镇齐安路花鸟市场对面0度发屋', '', 1571724400),
(923, '152593385', '王慧', '13079929507', '新疆维吾尔自治区', '吐鲁番市', '高昌区', '312国道，西虹宾馆收', '', 1571724492),
(924, '152593386', '郑观云', '18826350737', '福建省', '福州市', '晋安区', '新店镇福日新城四栋606', '', 1571724602),
(925, '152593387', '胡兴容', '18990328432', '四川省', '乐山市', '夹江县', '厚丰商场金童玉女童装店', '', 1571724716),
(926, '152593388', '丁永超', '13770402154', '江苏省', '淮安市', '淮安区', '城东乡华西路95号江苏龙泉有限公司', '', 1571724837),
(927, '152593389', '袁媛', '18256339293', '安徽省', '宣城市', '绩溪县', '华阳镇 来苏景苑9排8号', '', 1571724938),
(928, '152593390', '米君品', '15752467362', '广东省', '阳江市', '阳春市', '阳春市春湾镇', '', 1571725064),
(929, '152593391', '谢婷', '15316062805', '上海市', '上海市', '松江区', '新桥镇莘松路绿洲长岛花园207号楼402室', '', 1571725200),
(930, '152593392', '凌希', '18768114877', '浙江省', '杭州市', '富阳区', '富春街道西提北路10-13广发美业', '', 1571725375),
(931, '152593393', '陈燕红', '18120409520', '福建省', '福州市', '仓山区', '盖山镇濂水路7号闽江世纪城A区13座1梯303一单元', '', 1571725467),
(932, '152593394', '曾小姐', '13725099815', '广东省', '惠州市', '', '大亚湾区华润小径湾商业街s2-111', '', 1571815405),
(933, '152593395', '草莓', '15869819476', '山东省', '青岛市', '胶州市', '胶州市毛毡小区', '', 1571815470),
(934, '152593396', '林丰荣', '13859756998', '福建省', '泉州市', '丰泽区', '西湖北侧 马加坡111号福建经贸学校', '', 1571815547),
(935, '152593397', '范俊云', '18797183425', '新疆维吾尔自治区', '阿克苏地区', '阿克苏市', '解放南路海川路桥', '', 1571815612),
(936, '152593398', '雷新娟', '15178450927', '安徽省', '滁州市', '天长市', '张铺镇平安街道兴隆村', '', 1571815707),
(937, '152593399', '谢彩', '15271629508', '湖北省', '黄冈市', '黄州区', '东门路新桥街20号', '', 1571815789),
(938, '152593400', '乔治', '18999839403', '新疆维吾尔自治区', '乌鲁木齐市', '沙依巴克区', '如意苑放到对面美佳佳就可以因为我有时接不了电话', '', 1571891798),
(939, '152593401', '田冬梅', '15085021595', '贵州省', '遵义市', '仁怀市', '二合镇   大福酒业', '', 1571891965),
(940, '152593402', '婷宝宝', '13372365860', '浙江省', '台州市', '玉环市', '大麦屿台州银行旁新元大酒店', '', 1571892132),
(941, '152593403', '王慧', '13079929507', '新疆维吾尔自治区', '吐鲁番市', '高昌区', '312国道，西虹宾馆收', '', 1571892216),
(942, '152593404', '董宁馨', '17629977761', '河南省', '郑州市', '二七区', '贺江路汤姆之家汉堡店', '', 1571892288),
(943, '152593405', '杨婷', '13262732273', '黑龙江省', '哈尔滨市', '南岗区', '健兴路鲁商凤凰城6号楼二单元402室', '', 1571892381),
(944, '152593406', '何娟娟', '15099570228', '新疆维吾尔自治区', '乌鲁木齐市', '米东区', '古牧地西路街道新疆乌鲁木齐米东区广兴西街香缇美地13号楼1单元1403或放楼下康清超市', '', 1571892482),
(945, '152593407', '俸琴', '17377369821', '广东省', '深圳市', '龙岗区', '龙城街道龙西村委第三工业区贝仕达克', '', 1571892599),
(946, '252593395', '草莓', '15869819476', '山东省', '青岛市', '胶州市', '胶州市毛毡小区', '', 1571979295),
(947, '152593408', '孙喻阳', '17853605223', '山东省', '潍坊市', '潍城区', '望留街道 西环路 潍坊技师学院', '', 1571981036),
(948, '152593409', '蒿海霞', '13532666837', '广东省', '东莞市', '长安镇', '上沙安力科技园D十六栋', '', 1571981220),
(949, '152593410', '林意', '18656666269', '浙江省', '台州市', '路桥区', '路北街道马铺路599号阁格美甲', '', 1571981331),
(950, '152593411', '周美林', '18612070177', '广东省', '广州市', '白云区', '增槎路恒丰花园', '', 1571981418),
(951, '152593412', '杨清建', '18602382919', '重庆市', '重庆市', '大足区', '中熬镇圆通快递', '', 1571981563),
(952, '152593413', '王重阳', '17763076625', '湖北省', '荆州市', '监利县', '容城镇监利中学翔宇教育集团监利总校', '', 1571981636),
(953, '152593414', '薄荷糖', '13958120383', '浙江省', '杭州市', '下城区', '西文北苑3-1301', '', 1571981711),
(954, '152593415', '婷婷', '18322403921', '天津市', '天津市', '西青区', '王顶堤商贸城D1二楼橙区2号', '', 1571981779),
(955, '152593416', '刘洋', '13003331647', '江苏省', '无锡市', '江阴市', '陆桥陆东大街绿谷大食堂', '', 1571981845),
(956, '152593417', '严丽', '15883125233', '四川省', '宜宾市', '翠屏区', '东城街道咸熙街127号', '', 1571981901),
(957, '152593418', '王一静', '15236226853', '河南省', '洛阳市', '偃师市', '翟镇二里头', '', 1571987533),
(958, '152593419', '刘燕霞', '13774419938', '上海市', '上海市', '奉贤区', '胡桥镇寺胡路久江集团', '', 1571987682),
(959, '152593420', '范高阳', '18736222333', '河南省', '郑州市', '新郑市', '新华路街道新华路办事处白庙范银花超市', '', 1572093003),
(960, '152593421', '杨欢', '15871727570', '湖北省', '武汉市', '', '沌口经济技术开发区，枫树四路，汉阳满庭春，11栋丰巢快递柜，', '', 1572093069),
(961, '152593422', '王梓萱', '13455488261', '山东省', '泰安市', '肥城市', '阳光舜城小区东门门卫', '', 1572093149),
(962, '152593423', '吕妹', '15258556698', '浙江省', '绍兴市', '嵊州市', '仙湖路828号一号楼三楼', '', 1572093223),
(963, '152593424', '薛乐乐', '15175745547', '河北省', '保定市', '定兴县', '小北头村春凤超市', '', 1572093303),
(965, '152593425', '宋凌霄', '15966236380', '山东省', '聊城市', '阳谷县', '狮子楼街道金紫南苑售楼处对过阳谷县实验幼儿园', '', 1572154290),
(966, '152593426', '南宫念兮', '15759303582', '福建省', '厦门市', '翔安区', '新店镇 洪钟大道4566厦门海洋职业技术学院-学生公寓', '', 1572154436),
(967, '152593427', '吴佳錡', '18299380767', '新疆维吾尔自治区', '石河子市', '', '二十三小区65栋佳錡尚品', '', 1572154518),
(968, '152593428', '赵东洋', '13804314360', '吉林省', '长春市', '南关区', '大马路458号天鹅湖宾馆', '', 1572154636),
(969, '152593429', '陈碧云', '13400742853', '福建省', '厦门市', '海沧区', '新阳街道新按东社266号菜鸟驿站', '', 1572154713),
(970, '152593430', '郭莹莹', '18743403000', '吉林省', '四平市', '梨树县', '郭家店镇雄健健身', '', 1572154782),
(971, '152593431', '徐健辉', 'vivox27', '广东省', '深圳市', '宝安区', '街道固戍社区红湾三区七巷七栋', '', 1572154919),
(972, '152593432', '柯念慈', '13958653009', '浙江省', '台州市', '温岭市', '城西街道下洋应村92栋2号', '', 1572155035),
(973, '152593433', '范侠', '18324814373', '安徽省', '阜阳市', '太和县', '坟台镇坟台镇中心学校', '', 1572155149),
(974, '152593434', '刘丽芳', '18258172418', '浙江省', '杭州市', '下城区', '长庆街道凤起路环北丝稠城3楼306号', '', 1572155235),
(975, '152593435', '黎丽', '13788009858', '广西壮族自治区', '防城港市', '防城区', '峒中镇峒中村口岸大道146号', '', 1572155354),
(976, '152593436', '李庆旭', '17658150592', '山东省', '泰安市', '泰山区', '龙潭路179号，山东电力高等专科学校', '', 1572155545),
(977, '152593437', '许凯', '18971621601', '湖北省', '武汉市', '东西湖区', '金山大道沿海赛洛城六期 十三栋楼二单元楼，2802', '', 1572155744);

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_action`
--

CREATE TABLE `ns_order_action` (
  `action_id` int(11) NOT NULL COMMENT '动作id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '动作内容',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `order_status` int(11) NOT NULL COMMENT '订单大状态',
  `order_status_text` varchar(255) NOT NULL DEFAULT '' COMMENT '订单状态名称',
  `action_time` int(11) DEFAULT '0' COMMENT '操作时间'
) ENGINE=MEMORY AVG_ROW_LENGTH=1706 DEFAULT CHARSET=utf8 COMMENT='订单操作表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_goods`
--

CREATE TABLE `ns_order_goods` (
  `order_goods_id` int(11) UNSIGNED NOT NULL COMMENT '订单项ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL COMMENT 'skuID',
  `sku_name` varchar(50) NOT NULL COMMENT 'sku名称',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品成本价',
  `num` varchar(255) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `adjust_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '调整金额',
  `goods_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买人ID',
  `point_exchange_type` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换类型0.非积分兑换1.积分兑换',
  `goods_type` varchar(255) NOT NULL DEFAULT '1' COMMENT '商品类型',
  `promotion_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销ID',
  `promotion_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `shipping_status` int(11) NOT NULL DEFAULT '0' COMMENT '物流状态',
  `refund_type` int(11) NOT NULL DEFAULT '1' COMMENT '退款方式',
  `refund_require_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `refund_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `refund_shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '退款物流单号',
  `refund_shipping_company` varchar(255) NOT NULL DEFAULT '0' COMMENT '退款物流公司名称',
  `refund_real_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `refund_status` int(1) NOT NULL DEFAULT '0' COMMENT '退款状态',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `refund_time` int(11) DEFAULT '0' COMMENT '退款时间',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  `tmp_express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时物流公司',
  `tmp_express_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '批量打印时添加的临时物流公司id',
  `tmp_express_no` varchar(50) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时订单编号'
) ENGINE=InnoDB AVG_ROW_LENGTH=289 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_goods_express`
--

CREATE TABLE `ns_order_goods_express` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id_array` varchar(255) NOT NULL COMMENT '订单项商品组合列表',
  `express_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包裹名称  （包裹- 1 包裹 - 2）',
  `shipping_type` tinyint(4) NOT NULL COMMENT '发货方式1 需要物流 0无需物流',
  `express_company_id` int(11) NOT NULL COMMENT '快递公司id',
  `express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(50) NOT NULL COMMENT '运单编号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `shipping_time` int(11) DEFAULT '0' COMMENT '发货时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=606 DEFAULT CHARSET=utf8 COMMENT='商品订单物流信息表（多次发货）';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_goods_promotion_details`
--

CREATE TABLE `ns_order_goods_promotion_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `sku_id` int(11) NOT NULL COMMENT '商品skuid',
  `promotion_type` varbinary(255) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT '0' COMMENT '使用时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='订单商品优惠详情';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_payment`
--

CREATE TABLE `ns_order_payment` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付单编号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '执行支付的相关店铺ID（0平台）',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型1.商城订单2.交易商支付',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型关联ID',
  `pay_body` varchar(255) NOT NULL DEFAULT '' COMMENT '订单支付简介',
  `pay_detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单支付详情',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_type` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `trade_no` varchar(30) NOT NULL DEFAULT '' COMMENT '交易号，支付宝退款用，微信传入空'
) ENGINE=InnoDB AVG_ROW_LENGTH=963 DEFAULT CHARSET=utf8 COMMENT='订单支付表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_pickup`
--

CREATE TABLE `ns_order_pickup` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `buyer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '提货人姓名',
  `buyer_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '提货人电话',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '提货备注信息',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='订单自提点管理';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_promotion_details`
--

CREATE TABLE `ns_order_promotion_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `promotion_type_id` int(11) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `promotion_type` varchar(255) NOT NULL COMMENT '优惠类型',
  `promotion_name` varchar(50) NOT NULL COMMENT '该优惠活动的名称',
  `promotion_condition` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠使用条件说明',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT '0' COMMENT '使用时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=364 DEFAULT CHARSET=utf8 COMMENT='订单优惠详情';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_refund`
--

CREATE TABLE `ns_order_refund` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品表id',
  `refund_status` varchar(255) NOT NULL COMMENT '操作状态\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n流程状态(refund_status)	状态名称(refund_status_name)	操作时间\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n1	买家申请	发起了退款申请,等待卖家处理\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n2	等待买家退货	卖家已同意退款申请,等待买家退货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n3	等待卖家确认收货	买家已退货,等待卖家确认收货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n4	等待卖家确认退款	卖家同意退款\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n0	退款已成功	卖家退款给买家，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-1	退款已拒绝	卖家拒绝本次退款，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-2	退款已关闭	主动撤销退款，退款关闭\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-3	退款申请不通过	拒绝了本次退款申请,等待买家修改\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
  `action` varchar(255) NOT NULL COMMENT '退款操作内容描述',
  `action_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作方 1 买家 2 卖家',
  `action_userid` varchar(255) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `action_username` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `action_time` int(11) DEFAULT '0' COMMENT '操作时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=108 DEFAULT CHARSET=utf8 COMMENT='订单商品退货退款操作表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_refund_account_records`
--

CREATE TABLE `ns_order_refund_account_records` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项id',
  `refund_trade_no` varchar(55) NOT NULL COMMENT '退款交易号',
  `refund_money` decimal(10,2) NOT NULL COMMENT '退款金额',
  `refund_way` int(11) NOT NULL COMMENT '退款方式（1：微信，2：支付宝，10：线下）',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `refund_time` int(11) NOT NULL COMMENT '退款时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单退款账户记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_shipping_fee`
--

CREATE TABLE `ns_order_shipping_fee` (
  `shipping_fee_id` int(11) NOT NULL COMMENT '运费模板ID',
  `shipping_fee_name` varchar(30) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认模板',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司ID',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `province_id_array` text NOT NULL COMMENT '省ID组',
  `city_id_array` text NOT NULL COMMENT '市ID组',
  `weight_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用重量运费',
  `weight_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首重',
  `weight_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首重运费',
  `weight_xnum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '续重',
  `weight_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续重运费',
  `volume_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用体积计算运费',
  `volume_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首体积量',
  `volume_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首体积运费',
  `volume_xnum` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积量',
  `volume_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积运费',
  `bynum_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用计件方式运费',
  `bynum_snum` int(11) NOT NULL DEFAULT '0' COMMENT '首件',
  `bynum_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首件运费',
  `bynum_xnum` int(11) NOT NULL DEFAULT '1' COMMENT '续件',
  `bynum_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续件运费',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `update_time` int(11) DEFAULT '0' COMMENT '最后更新时间',
  `district_id_array` text COMMENT '区县ID组'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='运费模板';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_shop_return`
--

CREATE TABLE `ns_order_shop_return` (
  `shop_id` int(11) NOT NULL,
  `shop_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收件人',
  `seller_mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `seller_zipcode` varchar(20) NOT NULL DEFAULT '' COMMENT '邮编',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='店铺退货设置';

-- --------------------------------------------------------

--
-- 表的结构 `ns_pickup_point`
--

CREATE TABLE `ns_pickup_point` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8 COMMENT='自提点管理';

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_adv`
--

CREATE TABLE `ns_platform_adv` (
  `adv_id` mediumint(8) UNSIGNED NOT NULL COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) UNSIGNED NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL DEFAULT '' COMMENT '广告内容描述',
  `adv_url` text,
  `adv_image` varchar(1000) NOT NULL DEFAULT '' COMMENT '广告内容图片',
  `slide_sort` int(11) DEFAULT NULL,
  `click_num` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '广告点击率',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  `adv_code` text NOT NULL COMMENT '广告代码'
) ENGINE=InnoDB AVG_ROW_LENGTH=1170 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_adv_position`
--

CREATE TABLE `ns_platform_adv_position` (
  `ap_id` mediumint(8) UNSIGNED NOT NULL COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_intro` varchar(255) NOT NULL COMMENT '广告位简介',
  `ap_class` smallint(1) UNSIGNED NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) UNSIGNED NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) UNSIGNED NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_price` int(10) NOT NULL DEFAULT '0' COMMENT '广告位单价',
  `adv_num` int(10) NOT NULL DEFAULT '0' COMMENT '拥有的广告数',
  `click_num` int(10) NOT NULL DEFAULT '0' COMMENT '广告位点击率',
  `default_content` varchar(300) DEFAULT NULL,
  `ap_background_color` varchar(50) NOT NULL DEFAULT '#FFFFFF' COMMENT '广告位背景色 默认白色',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '广告位所在位置类型   1 pc端  2 手机端',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_del` int(11) DEFAULT '0',
  `ap_keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '广告位关键字'
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8 COMMENT='广告位表';

--
-- 转存表中的数据 `ns_platform_adv_position`
--

INSERT INTO `ns_platform_adv_position` (`ap_id`, `ap_name`, `ap_intro`, `ap_class`, `ap_display`, `is_use`, `ap_height`, `ap_width`, `ap_price`, `adv_num`, `click_num`, `default_content`, `ap_background_color`, `type`, `instance_id`, `is_del`, `ap_keyword`) VALUES
(1051, '商城首页最顶部广告位', '商城首页最顶部广告位', 0, 2, 1, 1000, 1000, 0, 0, 0, '', '#000000', 1, 0, 1, ''),
(1052, '商城首页logo右侧小广告', '商城首页logo右侧小广告', 0, 2, 1, 90, 170, 0, 0, 0, 'public/static/images/default_img_url/shouyelogo.png', '#FFFFFF', 1, 0, 1, ''),
(1053, '商城首页滚动图广告位', '商城首页滚动图广告位', 0, 2, 1, 443, 800, 0, 0, 0, '', '#FFFFFF', 1, 0, 1, ''),
(1054, '商城首页中部推荐广告位', '商城首页中部推荐广告位（140*242）', 0, 2, 1, 140, 242, 0, 0, 0, '', '', 1, 0, 1, ''),
(1056, '商城限时折扣轮播广告位', '商城限时折扣轮播广告位', 0, 2, 1, 443, 1903, 0, 0, 0, 'public/static/images/default_img_url/xianshizhekou.png', '#FFFFFF', 1, 0, 1, ''),
(1075, '商城品牌专区轮播广告位', '商城品牌专区轮播广告位', 0, 0, 1, 443, 1210, 0, 0, 0, 'public/static/images/default_img_url/pinpaizhuanqu.png', '#000000', 1, 0, 1, ''),
(1076, '商城积分中心轮播广告位', '商城积分中心轮播广告位', 0, 2, 1, 320, 910, 0, 0, 0, 'public/static/images/default_img_url/jifenzhongxin.jpg', '#000000', 1, 0, 1, ''),
(1102, '商城积分中心中部广告位', '商城积分中心中部广告位', 0, 2, 1, 60, 1210, 0, 0, 0, 'public/static/images/default_img_url/jifenzhongxinzhongbu.jpg', '#000000', 1, 0, 1, ''),
(1103, '商城登录页面轮播广告位', '商城登录页面轮播广告位', 0, 0, 1, 0, 0, 0, 0, 0, '', '', 1, 0, 1, ''),
(1105, '手机端首页轮播广告位', '手机端首页轮播广告位', 0, 1, 1, 175, 320, 0, 0, 0, 'public/static/images/default_img_url/waplunbo.png', '', 2, 0, 1, ''),
(1152, '手机端会员中心广告位', '手机端会员中心广告位', 0, 2, 1, 100, 750, 0, 0, 0, 'public/static/images/default_img_url/waphuiyuanzhongxin.png', '', 2, 0, 1, ''),
(1162, '手机端品牌专区广告位', '品牌专区广告', 0, 2, 1, 192, 720, 0, 0, 0, 'public/static/images/default_img_url/wappinpaizhuanqu.png', '', 2, 0, 1, ''),
(1163, '手机端限时折扣专区广告位', '限时折扣专区广告位', 0, 2, 1, 130, 720, 0, 0, 0, 'public/static/images/default_img_url/wapxianshizhekou.png', '', 2, 0, 1, ''),
(1164, '手机端首页商城热卖广告位', '手机端商城热卖', 0, 2, 1, 100, 100, 0, 0, 0, 'public/static/images/default_img_url/wapshangchengremai.png', '#000000', 2, 0, 1, ''),
(1165, '手机端积分中心广告位', '积分中心广告位', 0, 2, 1, 100, 100, 0, 0, 0, 'public/static/images/default_img_url/wapjifenzhongxin.png', '#000000', 2, 0, 1, ''),
(6666, '商城促销专区轮播广告位', '促销专区广告位', 0, 0, 1, 443, 1210, 0, 0, 0, 'upload/image_collection/1513820257.png', '#000000', 1, 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_block`
--

CREATE TABLE `ns_platform_block` (
  `block_id` int(10) UNSIGNED NOT NULL,
  `is_display` smallint(4) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `block_color` varchar(255) NOT NULL COMMENT '颜色风格',
  `sort` int(11) DEFAULT NULL,
  `block_name` varchar(50) NOT NULL DEFAULT '' COMMENT '板块名称',
  `block_short_name` varchar(50) DEFAULT NULL COMMENT '板块简称',
  `recommend_ad_image_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐单图广告位名称',
  `recommend_ad_image` int(11) NOT NULL DEFAULT '0' COMMENT '推荐单图广告位',
  `recommend_ad_slide_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐幻灯广告位名称',
  `recommend_ad_slide` int(11) NOT NULL COMMENT '推荐幻灯广告位',
  `recommend_ad_images_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位名称',
  `recommend_ad_images` int(11) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位',
  `recommend_brands` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐品牌',
  `recommend_categorys` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐商品分类',
  `recommend_goods_category_name_1` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_1` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_2` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_2` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_3` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_3` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `block_data` longtext COMMENT '板块数据',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8 COMMENT='首页促销板块';

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_goods_recommend`
--

CREATE TABLE `ns_platform_goods_recommend` (
  `recommend_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '推荐商品ID',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '推荐状态',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '推荐类型',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=442 DEFAULT CHARSET=utf8 COMMENT='平台商品推荐';

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_goods_recommend_class`
--

CREATE TABLE `ns_platform_goods_recommend_class` (
  `class_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `class_type` int(11) NOT NULL DEFAULT '1' COMMENT '推荐模块1.系统固有模块2.平台增加模块',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `sort` int(11) NOT NULL DEFAULT '255' COMMENT '排序号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `show_type` int(11) NOT NULL DEFAULT '0' COMMENT '展示类型  0电脑端  1手机端'
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8 COMMENT='店铺商品推荐类别';

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_help_class`
--

CREATE TABLE `ns_platform_help_class` (
  `class_id` int(11) NOT NULL COMMENT '表主键',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1.帮助类别2.会员协议类别3.开店协议类别',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `parent_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号'
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8 COMMENT='平台说明类型';

--
-- 转存表中的数据 `ns_platform_help_class`
--

INSERT INTO `ns_platform_help_class` (`class_id`, `type`, `class_name`, `parent_class_id`, `sort`) VALUES
(1, 1, '新手上路', 0, 1),
(2, 1, '配送与支付', 0, 2),
(3, 1, '会员中心', 0, 3),
(4, 1, '服务保证', 0, 4),
(5, 1, '联系我们', 0, 5);

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_help_document`
--

CREATE TABLE `ns_platform_help_document` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '表主键',
  `uid` int(11) NOT NULL COMMENT '最后修改人ID',
  `class_id` int(11) NOT NULL COMMENT '所属说明类型ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modufy_time` int(11) DEFAULT '0' COMMENT '修改时间',
  `is_visibility` int(11) DEFAULT '1' COMMENT '是否可见'
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8 COMMENT='平台说明内容';

--
-- 转存表中的数据 `ns_platform_help_document`
--

INSERT INTO `ns_platform_help_document` (`id`, `uid`, `class_id`, `title`, `link_url`, `sort`, `content`, `image`, `create_time`, `modufy_time`, `is_visibility`) VALUES
(1, 87, 1, '购物流程', '', 0, '', '', 0, 1498471779, 1),
(2, 2, 2, '支付方式说明', '', 5, '<p>支付方式说明</p>', '', 0, 1493810155, 1),
(3, 87, 3, '售后流程', '', 1, '', '', 0, 1499240296, 1),
(5, 2, 3, '资金管理', '', 6, '<p>资金管理</p>', '', 0, 1493964639, 1),
(6, 2, 3, '我的收藏', '', 7, '<p>我的收藏</p>', '', 0, 1493809215, 1),
(7, 2, 2, '货到付款区域', '', 3, '<p>货到付款区域</p>', '', 1487559901, 1493810113, 1),
(8, 2, 2, '配送支付智能查询', '', 4, '<p>配送支付智能查询</p>', '', 1487559942, 1493810133, 1),
(9, 2, 4, '退换货原则', '', 9, '<p>退换货原则</p>', '', 1487560238, 1493809406, 1),
(10, 2, 4, '售后服务保证', '', 9, '<p>售后服务保证</p>', '', 1487560263, 1493809427, 1),
(11, 2, 4, '产品质量保证', '', 10, '<p>产品质量保证</p>', '', 1487560296, 1493809443, 1),
(12, 2, 5, '网站故障报告', '', 11, '<p>网站故障报告</p>', '', 1487560338, 1493809546, 1),
(13, 87, 13, '订购方式', '', 2, '', '', 1493206148, 1498469763, 1),
(14, 1, 3, '我的订单', '', 8, '<p>我的订单</p>', '', 1493809066, 1497102958, 1),
(15, 2, 5, '选机咨询', '', 12, '<p>选机咨询</p>', '', 1493809482, 1493809565, 1),
(16, 2, 5, '投诉与建议', '', 13, '<p>投诉与建议</p>', '', 1493809511, 1493964721, 1),
(17, 87, 6, '用户注册协议', '', 0, '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Verdana, Lucida, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">牛酷商城用户注册协议本协议是您与牛酷商城网站（简称&quot;本站&quot;）所有者（以下简称为&quot;牛酷商城&quot;）之间就牛酷商城网站服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击&quot;同意并继续&quot;按钮后，本协议即构成对双方有约束力的法律文件。第1条 本站服务条款的确认和接纳1.1本站的各项电子服务的所有权和运作权归牛酷商城所有。用户同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。1.2用户点击同意本协议的，即视为用户确认自己具有享受本站服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。1.3如果您在18周岁以下，您只能在父母或监护人的监护参与下才能使用本站。第2条 本站服务2.1牛酷商城通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及本站规定的情况下，方有权使用本站的相关服务。2.2用户必须自行准备如下设备和承担如下开支：（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。第3条 用户信息3.1用户应自行诚信向本站提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且牛酷商城保留终止用户使用牛酷商城各项服务的权利。3.2用户在本站进行浏览、下单购物等活动时，涉及用户真实姓名/名称、通信地址、联系电话、电子邮箱等隐私信息的，本站将予以严格保密，除非得到用户的授权或法律另有规定，本站不会向外界披露用户隐私信息。第4条 用户依法言行义务本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；第5条 其他5.1牛酷商城网站所有者是指在政府部门依法许可或备案的牛酷商城网站经营主体。5.2您点击本协议下方的&quot;同意并继续&quot;按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。</span></p>', '', 1499325553, 1499325616, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_link`
--

CREATE TABLE `ns_platform_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT '索引id',
  `link_title` varchar(100) NOT NULL COMMENT '标题',
  `link_url` varchar(100) NOT NULL COMMENT '链接',
  `link_pic` varchar(100) NOT NULL COMMENT '图片',
  `link_sort` int(11) DEFAULT NULL,
  `is_blank` int(11) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开 1.是 2.否',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1.是 2.否'
) ENGINE=MyISAM AVG_ROW_LENGTH=50 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_point_config`
--

CREATE TABLE `ns_point_config` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启动',
  `convert_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '1积分对应金额',
  `desc` text NOT NULL COMMENT '积分说明',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='积分设置表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_bundling`
--

CREATE TABLE `ns_promotion_bundling` (
  `bl_id` int(11) NOT NULL COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `bl_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `shipping_fee_type` tinyint(1) NOT NULL COMMENT '运费承担方式 1卖家承担运费 2买家承担运费',
  `shipping_fee` decimal(10,2) NOT NULL COMMENT '运费',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_bundling_goods`
--

CREATE TABLE `ns_promotion_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_discount`
--

CREATE TABLE `ns_promotion_discount` (
  `discount_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `discount_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` text NOT NULL COMMENT '备注',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8 COMMENT='限时折扣';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_discount_goods`
--

CREATE TABLE `ns_promotion_discount_goods` (
  `discount_goods_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `discount_id` int(11) NOT NULL COMMENT '对应活动',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `discount` decimal(10,2) NOT NULL COMMENT '活动折扣或者减现信息',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` int(11) NOT NULL COMMENT '商品图片',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=712 DEFAULT CHARSET=utf8 COMMENT='限时折扣商品列表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_full_mail`
--

CREATE TABLE `ns_promotion_full_mail` (
  `mail_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启 0未开启 1已开启',
  `full_mail_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '包邮所需订单金额',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `no_mail_province_id_array` text NOT NULL COMMENT '不包邮省id组',
  `no_mail_city_id_array` text NOT NULL COMMENT '不包邮市id组'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='满额包邮';

--
-- 转存表中的数据 `ns_promotion_full_mail`
--

INSERT INTO `ns_promotion_full_mail` (`mail_id`, `shop_id`, `is_open`, `full_mail_money`, `create_time`, `modify_time`, `no_mail_province_id_array`, `no_mail_city_id_array`) VALUES
(1, 0, 0, '0.00', 1567741153, 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_gift`
--

CREATE TABLE `ns_promotion_gift` (
  `gift_id` int(10) UNSIGNED NOT NULL COMMENT '赠品活动id ',
  `days` int(10) UNSIGNED NOT NULL COMMENT '领取有效期(多少天)',
  `max_num` varchar(50) NOT NULL COMMENT '领取限制(次/人 (0表示不限领取次数))',
  `shop_id` varchar(100) NOT NULL COMMENT '店铺id',
  `gift_name` varchar(255) NOT NULL COMMENT '赠品活动名称',
  `start_time` int(11) DEFAULT '0' COMMENT '赠品有效期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '赠品有效期结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='赠品活动表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_gift_goods`
--

CREATE TABLE `ns_promotion_gift_goods` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'id ',
  `gift_id` int(10) UNSIGNED NOT NULL COMMENT '赠品id ',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='商品赠品表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_mansong`
--

CREATE TABLE `ns_promotion_mansong` (
  `mansong_id` int(10) UNSIGNED NOT NULL COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.普通优惠  2.多级优惠',
  `range_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1全部商品 0部分商品',
  `start_time` int(11) DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '活动结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8 COMMENT='满就送活动表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_mansong_goods`
--

CREATE TABLE `ns_promotion_mansong_goods` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `mansong_id` int(11) NOT NULL COMMENT '满减送ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动状态',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8 COMMENT='满减送商品';

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_mansong_rule`
--

CREATE TABLE `ns_promotion_mansong_rule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT '规则编号',
  `mansong_id` int(10) UNSIGNED NOT NULL COMMENT '活动编号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '级别价格(满多少)',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '减现金优惠金额（减多少金额）',
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0' COMMENT '免邮费',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '送积分数量（0表示不送）',
  `give_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '送优惠券的id（0表示不送）',
  `gift_id` int(11) NOT NULL COMMENT '礼品(赠品)id'
) ENGINE=InnoDB AVG_ROW_LENGTH=1170 DEFAULT CHARSET=utf8 COMMENT='满就送活动规则表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_reward_rule`
--

CREATE TABLE `ns_reward_rule` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `sign_point` int(11) NOT NULL DEFAULT '0' COMMENT '签到送积分',
  `share_point` int(11) NOT NULL DEFAULT '0' COMMENT '分享送积分',
  `reg_member_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 自己获得的积分',
  `reg_member_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上级获得的积分',
  `reg_member_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上级获得的积分',
  `reg_member_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上上级获得的积分',
  `reg_promoter_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 自己获得的积分',
  `reg_promoter_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上级获得的积分',
  `reg_promoter_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上级获得的积分',
  `reg_promoter_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上上级获得的积分',
  `reg_partner_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 自己获得的积分',
  `reg_partner_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上级获得的积分',
  `reg_partner_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上级获得的积分',
  `reg_partner_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上上级获得的积分',
  `into_store_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '进店领用优惠券  存入优惠券id(coupon_id)',
  `share_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '分享领用优惠券  存入优惠券id(coupon_id)',
  `click_point` int(11) NOT NULL DEFAULT '0' COMMENT '点赞送积分',
  `comment_point` int(11) NOT NULL DEFAULT '0' COMMENT '评论送积分'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='奖励规则表';

--
-- 转存表中的数据 `ns_reward_rule`
--

INSERT INTO `ns_reward_rule` (`shop_id`, `sign_point`, `share_point`, `reg_member_self_point`, `reg_member_one_point`, `reg_member_two_point`, `reg_member_three_point`, `reg_promoter_self_point`, `reg_promoter_one_point`, `reg_promoter_two_point`, `reg_promoter_three_point`, `reg_partner_self_point`, `reg_partner_one_point`, `reg_partner_two_point`, `reg_partner_three_point`, `into_store_coupon`, `share_coupon`, `click_point`, `comment_point`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop`
--

CREATE TABLE `ns_shop` (
  `shop_id` int(11) NOT NULL COMMENT '店铺索引id',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `shop_type` int(11) NOT NULL COMMENT '店铺类型等级',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `shop_group_id` int(11) NOT NULL COMMENT '店铺分类',
  `shop_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '店铺所在市ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `shop_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `shop_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `shop_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `shop_avatar` varchar(150) DEFAULT NULL COMMENT '店铺头像',
  `shop_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `shop_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `shop_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `shop_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `shop_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `shop_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `shop_domain_times` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '二级域名修改次数',
  `shop_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `shop_credit` int(10) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `shop_desccredit` float NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `shop_servicecredit` float NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `shop_deliverycredit` float NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `shop_collect` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `shop_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `shop_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `shop_sales` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺销售额（不计算退款）',
  `shop_account` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺账户余额',
  `shop_cash` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺可提现金额',
  `shop_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `live_store_name` varchar(255) DEFAULT NULL COMMENT '商铺名称',
  `live_store_address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `live_store_tel` varchar(255) DEFAULT NULL COMMENT '商铺电话',
  `live_store_bus` varchar(255) DEFAULT NULL COMMENT '公交线路',
  `shop_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `store_qtian` tinyint(1) DEFAULT '0' COMMENT '7天退换',
  `shop_zhping` tinyint(1) DEFAULT '0' COMMENT '正品保障',
  `shop_erxiaoshi` tinyint(1) DEFAULT '0' COMMENT '两小时发货',
  `shop_tuihuo` tinyint(1) DEFAULT '0' COMMENT '退货承诺',
  `shop_shiyong` tinyint(1) DEFAULT '0' COMMENT '试用中心',
  `shop_shiti` tinyint(1) DEFAULT '0' COMMENT '实体验证',
  `shop_xiaoxie` tinyint(1) DEFAULT '0' COMMENT '消协保证',
  `shop_huodaofk` tinyint(1) DEFAULT '0' COMMENT '货到付款',
  `shop_free_time` varchar(10) DEFAULT NULL COMMENT '商家配送时间',
  `shop_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `recommend_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐招商员用户id',
  `shop_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺公众号',
  `shop_create_time` int(11) DEFAULT '0' COMMENT '店铺时间',
  `shop_end_time` int(11) DEFAULT '0' COMMENT '店铺关闭时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='店铺数据表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_ad`
--

CREATE TABLE `ns_shop_ad` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `ad_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '类型 0 -- pc端  1-- 手机端 ',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色'
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 COMMENT='店铺广告设置';

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_coin_records`
--

CREATE TABLE `ns_shop_coin_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币数量',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '增加或减少类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺购物币记录';

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_express_address`
--

CREATE TABLE `ns_shop_express_address` (
  `express_address_id` int(11) NOT NULL COMMENT '物流地址id',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `contact` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '公司名称',
  `province` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地省',
  `city` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地市',
  `district` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地区县',
  `zipcode` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_consigner` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发货地址标记',
  `is_receiver` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收货地址标记',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期'
) ENGINE=InnoDB AVG_ROW_LENGTH=1092 DEFAULT CHARSET=utf8 COMMENT='物流地址';

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_group`
--

CREATE TABLE `ns_shop_group` (
  `shop_group_id` int(10) UNSIGNED NOT NULL COMMENT '分组ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_sort` int(11) NOT NULL DEFAULT '1' COMMENT '分组排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=2730 DEFAULT CHARSET=utf8 COMMENT='店铺分组表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_navigation`
--

CREATE TABLE `ns_shop_navigation` (
  `nav_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `nav_title` varchar(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `nav_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '纵向所在位置1.头部2.中部3底部',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `align` int(11) NOT NULL DEFAULT '1' COMMENT '横向所在位置1 左  2  右',
  `nav_type` int(11) DEFAULT '1',
  `is_blank` int(11) DEFAULT '0',
  `template_name` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8 COMMENT='店铺导航管理';

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_navigation_template`
--

CREATE TABLE `ns_shop_navigation_template` (
  `template_id` int(11) NOT NULL,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问路径',
  `is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `use_type` int(11) NOT NULL COMMENT '1 shop端 0wap端',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 COMMENT='导航 的 系统默认模板';

--
-- 转存表中的数据 `ns_shop_navigation_template`
--

INSERT INTO `ns_shop_navigation_template` (`template_id`, `template_name`, `template_url`, `is_use`, `use_type`, `create_time`) VALUES
(1, '首页', '/index', 1, 1, 1497706628),
(2, '限时折扣', '/index/discount', 1, 1, 1497706628),
(3, '品牌列表', '/goods/brandlist', 1, 1, 1497706628),
(4, '积分中心', '/goods/integralcenter', 1, 1, 1500717235),
(5, '标签专区', '/goods/promotionZone', 1, 1, 1500717235);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_order_account_records`
--

CREATE TABLE `ns_shop_order_account_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单项实际支付金额',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品平台佣金比率',
  `shop_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺获取金额',
  `platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台获取金额',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否产生退款',
  `refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `shop_refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺扣减余额',
  `platform_refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣减余额',
  `is_issue` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已经结算',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=655 DEFAULT CHARSET=utf8 COMMENT='店铺针对订单的金额分配';

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_weixin_share`
--

CREATE TABLE `ns_shop_weixin_share` (
  `shop_id` int(11) NOT NULL,
  `goods_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享价格标示',
  `goods_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享内容',
  `shop_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享标题',
  `shop_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享主题',
  `shop_param_3` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享内容',
  `qrcode_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享主题',
  `qrcode_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享内容'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='店铺分享内容设置';

--
-- 转存表中的数据 `ns_shop_weixin_share`
--

INSERT INTO `ns_shop_weixin_share` (`shop_id`, `goods_param_1`, `goods_param_2`, `shop_param_1`, `shop_param_2`, `shop_param_3`, `qrcode_param_1`, `qrcode_param_2`) VALUES
(0, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_supplier`
--

CREATE TABLE `ns_supplier` (
  `supplier_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `supplier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '供货商名称',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '供货商描述',
  `linkman_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `linkman_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `linkman_address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供货商表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_virtual_goods`
--

CREATE TABLE `ns_virtual_goods` (
  `virtual_goods_id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `virtual_code` varbinary(255) NOT NULL COMMENT '虚拟码',
  `virtual_goods_name` varchar(255) NOT NULL COMMENT '虚拟商品名称',
  `money` decimal(10,2) NOT NULL COMMENT '虚拟商品金额',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `buyer_nickname` varchar(255) NOT NULL COMMENT '买家名称',
  `order_goods_id` int(11) NOT NULL COMMENT '关联订单项id',
  `order_no` varchar(255) NOT NULL COMMENT '订单编号',
  `validity_period` int(11) NOT NULL COMMENT '有效期/天(0表示不限制)',
  `start_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `use_number` int(11) NOT NULL COMMENT '使用次数',
  `confine_use_number` int(11) NOT NULL COMMENT '限制使用次数',
  `use_status` tinyint(1) NOT NULL COMMENT '使用状态(-1:已过期,0:未使用,1:已使用)',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟商品列表(用户下单支成功后存放)';

-- --------------------------------------------------------

--
-- 表的结构 `ns_virtual_goods_group`
--

CREATE TABLE `ns_virtual_goods_group` (
  `virtual_goods_group_id` int(10) UNSIGNED NOT NULL COMMENT '虚拟商品分组id',
  `virtual_goods_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '虚拟商品分组名称',
  `interfaces` varchar(1000) DEFAULT '' COMMENT '接口调用地址（JSON）',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟商品分组表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_virtual_goods_type`
--

CREATE TABLE `ns_virtual_goods_type` (
  `virtual_goods_type_id` int(10) UNSIGNED NOT NULL COMMENT '虚拟商品类型id',
  `virtual_goods_group_id` int(11) NOT NULL COMMENT '关联虚拟商品分组id',
  `virtual_goods_type_name` varchar(255) NOT NULL COMMENT '虚拟商品类型名称',
  `validity_period` int(11) NOT NULL DEFAULT '0' COMMENT '有效期/天(0表示不限制)',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用0：禁用，1启用（禁用后要查询关联的虚拟商品给予弹出确认提示框，确认后将商品下架）',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `config_info` varchar(1000) NOT NULL COMMENT '配置信息（API接口、参数等）',
  `confine_use_number` int(11) NOT NULL DEFAULT '0' COMMENT '限制使用次数',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sys_addons`
--

CREATE TABLE `sys_addons` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `has_addonslist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有插件列表',
  `content` text NOT NULL COMMENT '详情',
  `config_hook` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义配置文件钩子',
  `create_time` int(11) DEFAULT '0' COMMENT '安装时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_album_class`
--

CREATE TABLE `sys_album_class` (
  `album_id` int(10) UNSIGNED NOT NULL COMMENT '相册id',
  `shop_id` int(10) NOT NULL DEFAULT '1' COMMENT '店铺id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级相册ID',
  `album_name` varchar(100) NOT NULL COMMENT '相册名称',
  `album_cover` varchar(255) NOT NULL DEFAULT '' COMMENT '相册封面',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='相册表';

--
-- 转存表中的数据 `sys_album_class`
--

INSERT INTO `sys_album_class` (`album_id`, `shop_id`, `pid`, `album_name`, `album_cover`, `is_default`, `sort`, `create_time`) VALUES
(30, 0, 0, '默认相册', '0', 1, 1, 1497064831);

-- --------------------------------------------------------

--
-- 表的结构 `sys_album_picture`
--

CREATE TABLE `sys_album_picture` (
  `pic_id` int(10) UNSIGNED NOT NULL COMMENT '相册图片表id',
  `shop_id` int(10) UNSIGNED DEFAULT '1' COMMENT '所属实例id',
  `album_id` int(10) UNSIGNED NOT NULL COMMENT '相册id',
  `is_wide` int(11) NOT NULL DEFAULT '0' COMMENT '是否宽屏',
  `pic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `pic_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标签',
  `pic_cover` varchar(255) NOT NULL COMMENT '原图图片路径',
  `pic_size` varchar(255) NOT NULL COMMENT '原图大小',
  `pic_spec` varchar(100) NOT NULL COMMENT '原图规格',
  `pic_cover_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图路径',
  `pic_size_big` varchar(255) NOT NULL DEFAULT '0' COMMENT '大图大小',
  `pic_spec_big` varchar(100) NOT NULL DEFAULT '' COMMENT '大图规格',
  `pic_cover_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '中图路径',
  `pic_size_mid` varchar(255) NOT NULL DEFAULT '0' COMMENT '中图大小',
  `pic_spec_mid` varchar(100) NOT NULL DEFAULT '' COMMENT '中图规格',
  `pic_cover_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图路径',
  `pic_size_small` varchar(255) NOT NULL DEFAULT '0' COMMENT '小图大小',
  `pic_spec_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图规格',
  `pic_cover_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图路径',
  `pic_size_micro` varchar(255) NOT NULL DEFAULT '0' COMMENT '微图大小',
  `pic_spec_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图规格',
  `upload_time` int(11) DEFAULT '0' COMMENT '图片上传时间',
  `upload_type` int(11) DEFAULT '1' COMMENT '图片外链',
  `domain` varchar(255) DEFAULT '' COMMENT '图片外链',
  `bucket` varchar(255) DEFAULT '' COMMENT '存储空间名称'
) ENGINE=InnoDB AVG_ROW_LENGTH=204 DEFAULT CHARSET=utf8 COMMENT='相册图片表';

--
-- 转存表中的数据 `sys_album_picture`
--

INSERT INTO `sys_album_picture` (`pic_id`, `shop_id`, `album_id`, `is_wide`, `pic_name`, `pic_tag`, `pic_cover`, `pic_size`, `pic_spec`, `pic_cover_big`, `pic_size_big`, `pic_spec_big`, `pic_cover_mid`, `pic_size_mid`, `pic_spec_mid`, `pic_cover_small`, `pic_size_small`, `pic_spec_small`, `pic_cover_micro`, `pic_size_micro`, `pic_spec_micro`, `upload_time`, `upload_type`, `domain`, `bucket`) VALUES
(1, 0, 30, 0, '8888', '8888', 'upload/goods/20190906/d93361825ea804801a9fc97a92c260c0.jpg', '1124,2108', '1124,2108', 'upload/goods/20190906/560a899911668642c26800047212bf3e1.jpg', '700,700', '700,700', 'upload/goods/20190906/560a899911668642c26800047212bf3e2.jpg', '360,360', '360,360', 'upload/goods/20190906/560a899911668642c26800047212bf3e3.jpg', '240,240', '240,240', 'upload/goods/20190906/560a899911668642c26800047212bf3e4.jpg', '60,60', '60,60', 1567741080, 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_area`
--

CREATE TABLE `sys_area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=2048 DEFAULT CHARSET=utf8 COMMENT='全部区域表';

--
-- 转存表中的数据 `sys_area`
--

INSERT INTO `sys_area` (`area_id`, `area_name`, `sort`) VALUES
(1, '华东', 0),
(2, '华北', 0),
(3, '华南', 0),
(4, '华中', 0),
(5, '东北', 0),
(6, '西北', 0),
(7, '西南', 0),
(8, '港澳台', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_city`
--

CREATE TABLE `sys_city` (
  `city_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=135 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_city`
--

INSERT INTO `sys_city` (`city_id`, `province_id`, `city_name`, `zipcode`, `sort`) VALUES
(1, 1, '北京市', '100000', 1),
(2, 2, '天津市', '100000', 0),
(3, 3, '石家庄市', '050000', 0),
(4, 3, '唐山市', '063000', 0),
(5, 3, '秦皇岛市', '066000', 0),
(6, 3, '邯郸市', '056000', 0),
(7, 3, '邢台市', '054000', 0),
(8, 3, '保定市', '071000', 0),
(9, 3, '张家口市', '075000', 0),
(10, 3, '承德市', '067000', 0),
(11, 3, '沧州市', '061000', 0),
(12, 3, '廊坊市', '065000', 0),
(13, 3, '衡水市', '053000', 0),
(14, 4, '太原市', '030000', 0),
(15, 4, '大同市', '037000', 0),
(16, 4, '阳泉市', '045000', 0),
(17, 4, '长治市', '046000', 0),
(18, 4, '晋城市', '048000', 0),
(19, 4, '朔州市', '036000', 0),
(20, 4, '晋中市', '030600', 0),
(21, 4, '运城市', '044000', 0),
(22, 4, '忻州市', '034000', 0),
(23, 4, '临汾市', '041000', 0),
(24, 4, '吕梁市', '030500', 0),
(25, 5, '呼和浩特市', '010000', 0),
(26, 5, '包头市', '014000', 0),
(27, 5, '乌海市', '016000', 0),
(28, 5, '赤峰市', '024000', 0),
(29, 5, '通辽市', '028000', 0),
(30, 5, '鄂尔多斯市', '010300', 0),
(31, 5, '呼伦贝尔市', '021000', 0),
(32, 5, '巴彦淖尔市', '014400', 0),
(33, 5, '乌兰察布市', '011800', 0),
(34, 5, '兴安盟', '137500', 0),
(35, 5, '锡林郭勒盟', '011100', 0),
(36, 5, '阿拉善盟', '016000', 0),
(37, 6, '沈阳市', '110000', 0),
(38, 6, '大连市', '116000', 0),
(39, 6, '鞍山市', '114000', 0),
(40, 6, '抚顺市', '113000', 0),
(41, 6, '本溪市', '117000', 0),
(42, 6, '丹东市', '118000', 0),
(43, 6, '锦州市', '121000', 0),
(44, 6, '营口市', '115000', 0),
(45, 6, '阜新市', '123000', 0),
(46, 6, '辽阳市', '111000', 0),
(47, 6, '盘锦市', '124000', 0),
(48, 6, '铁岭市', '112000', 0),
(49, 6, '朝阳市', '122000', 0),
(50, 6, '葫芦岛市', '125000', 0),
(51, 7, '长春市', '130000', 0),
(52, 7, '吉林市', '132000', 0),
(53, 7, '四平市', '136000', 0),
(54, 7, '辽源市', '136200', 0),
(55, 7, '通化市', '134000', 0),
(56, 7, '白山市', '134300', 0),
(57, 7, '松原市', '131100', 0),
(58, 7, '白城市', '137000', 0),
(59, 7, '延边朝鲜族自治州', '133000', 0),
(60, 8, '哈尔滨市', '150000', 0),
(61, 8, '齐齐哈尔市', '161000', 0),
(62, 8, '鸡西市', '158100', 0),
(63, 8, '鹤岗市', '154100', 0),
(64, 8, '双鸭山市', '155100', 0),
(65, 8, '大庆市', '163000', 0),
(66, 8, '伊春市', '152300', 0),
(67, 8, '佳木斯市', '154000', 0),
(68, 8, '七台河市', '154600', 0),
(69, 8, '牡丹江市', '157000', 0),
(70, 8, '黑河市', '164300', 0),
(71, 8, '绥化市', '152000', 0),
(72, 8, '大兴安岭地区', '165000', 0),
(73, 9, '上海市', '200000', 0),
(74, 10, '南京市', '210000', 0),
(75, 10, '无锡市', '214000', 0),
(76, 10, '徐州市', '221000', 0),
(77, 10, '常州市', '213000', 0),
(78, 10, '苏州市', '215000', 0),
(79, 10, '南通市', '226000', 0),
(80, 10, '连云港市', '222000', 0),
(81, 10, '淮安市', '223200', 0),
(82, 10, '盐城市', '224000', 0),
(83, 10, '扬州市', '225000', 0),
(84, 10, '镇江市', '212000', 0),
(85, 10, '泰州市', '225300', 0),
(86, 10, '宿迁市', '223800', 0),
(87, 11, '杭州市', '310000', 0),
(88, 11, '宁波市', '315000', 0),
(89, 11, '温州市', '325000', 0),
(90, 11, '嘉兴市', '314000', 0),
(91, 11, '湖州市', '313000', 0),
(92, 11, '绍兴市', '312000', 0),
(93, 11, '金华市', '321000', 0),
(94, 11, '衢州市', '324000', 0),
(95, 11, '舟山市', '316000', 0),
(96, 11, '台州市', '318000', 0),
(97, 11, '丽水市', '323000', 0),
(98, 12, '合肥市', '230000', 0),
(99, 12, '芜湖市', '241000', 0),
(100, 12, '蚌埠市', '233000', 0),
(101, 12, '淮南市', '232000', 0),
(102, 12, '马鞍山市', '243000', 0),
(103, 12, '淮北市', '235000', 0),
(104, 12, '铜陵市', '244000', 0),
(105, 12, '安庆市', '246000', 0),
(106, 12, '黄山市', '242700', 0),
(107, 12, '滁州市', '239000', 0),
(108, 12, '阜阳市', '236100', 0),
(109, 12, '宿州市', '234100', 0),
(110, 12, '巢湖市', '238000', 0),
(111, 12, '六安市', '237000', 0),
(112, 12, '亳州市', '236800', 0),
(113, 12, '池州市', '247100', 0),
(114, 12, '宣城市', '366000', 0),
(115, 13, '福州市', '350000', 0),
(116, 13, '厦门市', '361000', 0),
(117, 13, '莆田市', '351100', 0),
(118, 13, '三明市', '365000', 0),
(119, 13, '泉州市', '362000', 0),
(120, 13, '漳州市', '363000', 0),
(121, 13, '南平市', '353000', 0),
(122, 13, '龙岩市', '364000', 0),
(123, 13, '宁德市', '352100', 0),
(124, 14, '南昌市', '330000', 0),
(125, 14, '景德镇市', '333000', 0),
(126, 14, '萍乡市', '337000', 0),
(127, 14, '九江市', '332000', 0),
(128, 14, '新余市', '338000', 0),
(129, 14, '鹰潭市', '335000', 0),
(130, 14, '赣州市', '341000', 0),
(131, 14, '吉安市', '343000', 0),
(132, 14, '宜春市', '336000', 0),
(133, 14, '抚州市', '332900', 0),
(134, 14, '上饶市', '334000', 0),
(135, 15, '济南市', '250000', 0),
(136, 15, '青岛市', '266000', 0),
(137, 15, '淄博市', '255000', 0),
(138, 15, '枣庄市', '277100', 0),
(139, 15, '东营市', '257000', 0),
(140, 15, '烟台市', '264000', 0),
(141, 15, '潍坊市', '261000', 0),
(142, 15, '济宁市', '272100', 0),
(143, 15, '泰安市', '271000', 0),
(144, 15, '威海市', '265700', 0),
(145, 15, '日照市', '276800', 0),
(146, 15, '莱芜市', '271100', 0),
(147, 15, '临沂市', '276000', 0),
(148, 15, '德州市', '253000', 0),
(149, 15, '聊城市', '252000', 0),
(150, 15, '滨州市', '256600', 0),
(151, 15, '荷泽市', '255000', 0),
(152, 16, '郑州市', '450000', 0),
(153, 16, '开封市', '475000', 0),
(154, 16, '洛阳市', '471000', 0),
(155, 16, '平顶山市', '467000', 0),
(156, 16, '安阳市', '454900', 0),
(157, 16, '鹤壁市', '456600', 0),
(158, 16, '新乡市', '453000', 0),
(159, 16, '焦作市', '454100', 0),
(160, 16, '濮阳市', '457000', 0),
(161, 16, '许昌市', '461000', 0),
(162, 16, '漯河市', '462000', 0),
(163, 16, '三门峡市', '472000', 0),
(164, 16, '南阳市', '473000', 0),
(165, 16, '商丘市', '476000', 0),
(166, 16, '信阳市', '464000', 0),
(167, 16, '周口市', '466000', 0),
(168, 16, '驻马店市', '463000', 0),
(169, 17, '武汉市', '430000', 0),
(170, 17, '黄石市', '435000', 0),
(171, 17, '十堰市', '442000', 0),
(172, 17, '宜昌市', '443000', 0),
(173, 17, '襄樊市', '441000', 0),
(174, 17, '鄂州市', '436000', 0),
(175, 17, '荆门市', '448000', 0),
(176, 17, '孝感市', '432100', 0),
(177, 17, '荆州市', '434000', 0),
(178, 17, '黄冈市', '438000', 0),
(179, 17, '咸宁市', '437000', 0),
(180, 17, '随州市', '441300', 0),
(181, 17, '恩施土家族苗族自治州', '445000', 0),
(182, 17, '神农架', '442400', 0),
(183, 18, '长沙市', '410000', 0),
(184, 18, '株洲市', '412000', 0),
(185, 18, '湘潭市', '411100', 0),
(186, 18, '衡阳市', '421000', 0),
(187, 18, '邵阳市', '422000', 0),
(188, 18, '岳阳市', '414000', 0),
(189, 18, '常德市', '415000', 0),
(190, 18, '张家界市', '427000', 0),
(191, 18, '益阳市', '413000', 0),
(192, 18, '郴州市', '423000', 0),
(193, 18, '永州市', '425000', 0),
(194, 18, '怀化市', '418000', 0),
(195, 18, '娄底市', '417000', 0),
(196, 18, '湘西土家族苗族自治州', '416000', 0),
(197, 19, '广州市', '510000', 0),
(198, 19, '韶关市', '521000', 0),
(199, 19, '深圳市', '518000', 0),
(200, 19, '珠海市', '519000', 0),
(201, 19, '汕头市', '515000', 0),
(202, 19, '佛山市', '528000', 0),
(203, 19, '江门市', '529000', 0),
(204, 19, '湛江市', '524000', 0),
(205, 19, '茂名市', '525000', 0),
(206, 19, '肇庆市', '526000', 0),
(207, 19, '惠州市', '516000', 0),
(208, 19, '梅州市', '514000', 0),
(209, 19, '汕尾市', '516600', 1),
(210, 19, '河源市', '517000', 0),
(211, 19, '阳江市', '529500', 0),
(212, 19, '清远市', '511500', 0),
(213, 19, '东莞市', '511700', 0),
(214, 19, '中山市', '528400', 0),
(215, 19, '潮州市', '515600', 0),
(216, 19, '揭阳市', '522000', 0),
(217, 19, '云浮市', '527300', 0),
(218, 20, '南宁市', '530000', 0),
(219, 20, '柳州市', '545000', 0),
(220, 20, '桂林市', '541000', 0),
(221, 20, '梧州市', '543000', 0),
(222, 20, '北海市', '536000', 0),
(223, 20, '防城港市', '538000', 0),
(224, 20, '钦州市', '535000', 0),
(225, 20, '贵港市', '537100', 0),
(226, 20, '玉林市', '537000', 0),
(227, 20, '百色市', '533000', 0),
(228, 20, '贺州市', '542800', 0),
(229, 20, '河池市', '547000', 0),
(230, 20, '来宾市', '546100', 0),
(231, 20, '崇左市', '532200', 0),
(232, 21, '海口市', '570000', 0),
(233, 21, '三亚市', '572000', 0),
(234, 22, '重庆市', '400000', 0),
(235, 23, '成都市', '610000', 0),
(236, 23, '自贡市', '643000', 0),
(237, 23, '攀枝花市', '617000', 0),
(238, 23, '泸州市', '646100', 0),
(239, 23, '德阳市', '618000', 0),
(240, 23, '绵阳市', '621000', 0),
(241, 23, '广元市', '628000', 0),
(242, 23, '遂宁市', '629000', 0),
(243, 23, '内江市', '641000', 0),
(244, 23, '乐山市', '614000', 0),
(245, 23, '南充市', '637000', 0),
(246, 23, '眉山市', '612100', 0),
(247, 23, '宜宾市', '644000', 0),
(248, 23, '广安市', '638000', 0),
(249, 23, '达州市', '635000', 0),
(250, 23, '雅安市', '625000', 0),
(251, 23, '巴中市', '635500', 0),
(252, 23, '资阳市', '641300', 0),
(253, 23, '阿坝藏族羌族自治州', '624600', 0),
(254, 23, '甘孜藏族自治州', '626000', 0),
(255, 23, '凉山彝族自治州', '615000', 0),
(256, 24, '贵阳市', '55000', 0),
(257, 24, '六盘水市', '553000', 0),
(258, 24, '遵义市', '563000', 0),
(259, 24, '安顺市', '561000', 0),
(260, 24, '铜仁地区', '554300', 0),
(261, 24, '黔西南布依族苗族自治州', '551500', 0),
(262, 24, '毕节地区', '551700', 0),
(263, 24, '黔东南苗族侗族自治州', '551500', 0),
(264, 24, '黔南布依族苗族自治州', '550100', 0),
(265, 25, '昆明市', '650000', 0),
(266, 25, '曲靖市', '655000', 0),
(267, 25, '玉溪市', '653100', 0),
(268, 25, '保山市', '678000', 0),
(269, 25, '昭通市', '657000', 0),
(270, 25, '丽江市', '674100', 0),
(271, 25, '思茅市', '665000', 0),
(272, 25, '临沧市', '677000', 0),
(273, 25, '楚雄彝族自治州', '675000', 0),
(274, 25, '红河哈尼族彝族自治州', '654400', 0),
(275, 25, '文山壮族苗族自治州', '663000', 0),
(276, 25, '西双版纳傣族自治州', '666200', 0),
(277, 25, '大理白族自治州', '671000', 0),
(278, 25, '德宏傣族景颇族自治州', '678400', 0),
(279, 25, '怒江傈僳族自治州', '671400', 0),
(280, 25, '迪庆藏族自治州', '674400', 0),
(281, 26, '拉萨市', '850000', 0),
(282, 26, '昌都地区', '854000', 0),
(283, 26, '山南地区', '856000', 0),
(284, 26, '日喀则地区', '857000', 0),
(285, 26, '那曲地区', '852000', 0),
(286, 26, '阿里地区', '859100', 0),
(287, 26, '林芝地区', '860100', 0),
(288, 27, '西安市', '710000', 0),
(289, 27, '铜川市', '727000', 0),
(290, 27, '宝鸡市', '721000', 0),
(291, 27, '咸阳市', '712000', 0),
(292, 27, '渭南市', '714000', 0),
(293, 27, '延安市', '716000', 0),
(294, 27, '汉中市', '723000', 0),
(295, 27, '榆林市', '719000', 0),
(296, 27, '安康市', '725000', 0),
(297, 27, '商洛市', '711500', 0),
(298, 28, '兰州市', '730000', 0),
(299, 28, '嘉峪关市', '735100', 0),
(300, 28, '金昌市', '737100', 0),
(301, 28, '白银市', '730900', 0),
(302, 28, '天水市', '741000', 0),
(303, 28, '武威市', '733000', 0),
(304, 28, '张掖市', '734000', 0),
(305, 28, '平凉市', '744000', 0),
(306, 28, '酒泉市', '735000', 0),
(307, 28, '庆阳市', '744500', 0),
(308, 28, '定西市', '743000', 0),
(309, 28, '陇南市', '742100', 0),
(310, 28, '临夏回族自治州', '731100', 0),
(311, 28, '甘南藏族自治州', '747000', 0),
(312, 29, '西宁市', '810000', 0),
(313, 29, '海东地区', '810600', 0),
(314, 29, '海北藏族自治州', '810300', 0),
(315, 29, '黄南藏族自治州', '811300', 0),
(316, 29, '海南藏族自治州', '813000', 0),
(317, 29, '果洛藏族自治州', '814000', 0),
(318, 29, '玉树藏族自治州', '815000', 0),
(319, 29, '海西蒙古族藏族自治州', '817000', 0),
(320, 30, '银川市', '750000', 0),
(321, 30, '石嘴山市', '753000', 0),
(322, 30, '吴忠市', '751100', 0),
(323, 30, '固原市', '756000', 0),
(324, 30, '中卫市', '751700', 0),
(325, 31, '乌鲁木齐市', '830000', 0),
(326, 31, '克拉玛依市', '834000', 0),
(327, 31, '吐鲁番地区', '838000', 0),
(328, 31, '哈密地区', '839000', 0),
(329, 31, '昌吉回族自治州', '831100', 0),
(330, 31, '博尔塔拉蒙古自治州', '833400', 0),
(331, 31, '巴音郭楞蒙古自治州', '841000', 0),
(332, 31, '阿克苏地区', '843000', 0),
(333, 31, '克孜勒苏柯尔克孜自治州', '835600', 0),
(334, 31, '喀什地区', '844000', 0),
(335, 31, '和田地区', '848000', 0),
(336, 31, '伊犁哈萨克自治州', '833200', 0),
(337, 31, '塔城地区', '834700', 0),
(338, 31, '阿勒泰地区', '836500', 0),
(339, 31, '石河子市', '832000', 0),
(340, 31, '阿拉尔市', '843300', 0),
(341, 31, '图木舒克市', '843900', 0),
(342, 31, '五家渠市', '831300', 0),
(343, 32, '香港特别行政区', '000000', 0),
(344, 33, '澳门特别行政区', '000000', 0),
(345, 34, '台湾省', '000000', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_config`
--

CREATE TABLE `sys_config` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0不启用',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=963 DEFAULT CHARSET=utf8 COMMENT='第三方配置表';

--
-- 转存表中的数据 `sys_config`
--

INSERT INTO `sys_config` (`id`, `instance_id`, `key`, `value`, `desc`, `is_use`, `create_time`, `modify_time`) VALUES
(12, 0, 'USERNOTICE', '', '', 1, 1487830081, 1497102938),
(13, 0, 'HOTKEY', '', '', 1, 1487831749, 1497105229),
(14, 0, 'DEFAULTKEY', '', '', 1, 1487831788, 1497105235),
(17, 0, 'QQLOGIN', '{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/b2c1.01.niushop.com.cn\",\"CALLBACK\":\"http:\\/\\/b2c1.01.niushop.com.cn\\/wap\\/login\\/callback\"}', 'qq', 0, 1488350925, 1497105447),
(18, 0, 'WCHAT', '{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/b2c1.01.niushop.com.cn\",\"CALLBACK\":\"http:\\/\\/b2c1.01.niushop.com.cn\\/wap\\/Login\\/callback\"}', '微信', 0, 1488350947, 1497105440),
(21, 0, 'ALIPAY', '{\"ali_partnerid\":\"\",\"ali_seller\":\"\",\"ali_key\":\"\"}', '', 0, 1488442697, 1497105409),
(22, 0, 'EMAILMESSAGE', '{\"email_host\":\"smtp.163.com\",\"email_port\":\"465\",\"email_addr\":\"\",\"email_id\":\"\",\"email_pass\":\"\"}', '', 0, 1488524450, 1498907460),
(27, 0, 'WXOPENPLATFORM', '', '', 1, 1490845979, 1496903672),
(28, 0, 'LOGINVERIFYCODE', '', '', 1, 1491014899, 1498736286),
(31, 0, 'COIN_CONFIG', '', '购物币现金转化关系', 1, 1492396593, 1496903672),
(38, 0, 'ORDER_BUY_CLOSE_TIME', '60', '订单自动关闭时间', 1, 1499391774, 1498904013),
(39, 0, 'ORDER_DELIVERY_COMPLETE_TIME', '7', '收货后多长时间自动完成', 1, 1499391779, 1498904013),
(40, 0, 'ORDER_AUTO_DELIVERY', '14', '订单多长时间自动完成', 1, 1499391781, 1498904013),
(41, 0, 'ORDER_BALANCE_PAY', '0', '是否开启余额支付', 1, 1499391784, 1498904013),
(42, 0, 'ORDER_INVOICE_TAX', '0', '发票税率', 1, 1499391786, 1498904013),
(43, 0, 'ORDER_INVOICE_CONTENT', '', '发票内容', 1, 1499391789, 1498904013),
(44, 0, 'ORDER_SHOW_BUY_RECORD', '0', '是否显示购买记录', 1, 1499391791, 1498904013),
(45, 0, 'SEO_TITLE', '', '标题附加字', 1, 1496751194, 1497090304),
(46, 0, 'SEO_META', '', '商城关键词', 1, 1496751194, 1497090304),
(47, 0, 'SEO_DESC', '', '关键词描述', 1, 1496751194, 1497090304),
(48, 0, 'SEO_OTHER', '', '其他页头信息', 1, 1496751194, 1497090304),
(107, 0, 'ORDER_DELIVERY_PAY', '', '是否开启货到付款', 1, 1496825466, 1498904013),
(108, 0, 'WITHDRAW_BALANCE', '', '会员余额提现设置', 1, 1496830716, 1498893253),
(109, 0, 'REGISTER_INTEGRAL', '0', '注册送积分', 1, 1496981877, 1498739145),
(111, 0, 'SHARE_INTEGRAL', '0', '分享送积分', 1, 1496981877, 1498739145),
(112, 0, 'SIGN_INTEGRAL', '0', '签到送积分', 1, 1496983370, 1498739145),
(116, 0, 'LOGINVERIFYCODE', '', '', 1, 1497085371, 1498736286),
(122, 0, 'HOTKEY', '', '', 1, 1497087566, 1497105229),
(123, 0, 'DEFAULTKEY', '', '', 1, 1497087582, 1497105235),
(125, 0, 'WPAY', '{\"appid\":\"\",\"appkey\":\"\",\"mch_id\":\"\",\"mch_key\":\"\"}', '', 0, 1497087123, 1498882635),
(127, 0, 'SHOPWCHAT', '{\"appid\":\"\",\"appsecret\":\"\"}', '', 1, 1497088090, 1498736290),
(128, 0, 'BUYER_SELF_LIFTING', '0', '是否开启买家自提', 1, 1498730475, 1498904013),
(129, 0, 'ORDER_SELLER_DISPATCHING', '1', '是否开启商家配送', 1, 1498730475, 1498904013),
(130, 0, 'SHOPPING_BACK_POINTS', '3', '购物返积分设置', 1, 1498730475, 1498904013),
(136, 0, 'MOBILEMESSAGE', '', '', 0, 1498894954, 1498909195),
(137, 0, 'REGISTERANDVISIT', '{\"is_register\":\"1\",\"register_info\":\"plain\",\"name_keyword\":\"\",\"pwd_len\":\"5\",\"pwd_complexity\":\"\",\"terms_of_service\":\"\"}', '', 1, 1499310581, 1499391801),
(138, 0, 'SERVICE_ADDR', '{\"service_addr\":\"\"}', '美洽客服链接地址设置', 0, 1517904041, 0),
(139, 0, 'DEFAULT_IMAGE', '{\"default_goods_img\":\"upload/web_common/3b22fee90512e91bfc1586e016a7d8ea_360_360.png\",\"default_headimg\":\"upload/web_common/419b57e5802bd1f3b8fdedb81fdb5fce_360_360.png\"}', '默认图片', 1, 0, 0),
(140, 0, 'USE_PC_TEMPLATE', 'blue', '当前使用的PC端模板文件夹', 1, 1567673604, 1567673604),
(141, 0, 'UPLOAD_TYPE', '1', '上传方式 1 本地  2 七牛', 1, 1567741078, 0),
(142, 0, 'IMG_THUMB', '{\"thumb_type\":\"2\",\"upload_size\":\"0\",\"upload_ext\":\"gif,jpg,jpeg,bmp,png\"}', 'thumb_type(缩略)  3 居中裁剪 2 缩放后填充 4 左上角裁剪 5 右下角裁剪 6 固定尺寸缩放', 1, 1567741078, 0),
(143, 0, 'QINIU_CONFIG', '{\"Accesskey\":\"\",\"Secretkey\":\"\",\"Bucket\":\"\",\"QiniuUrl\":\"\"}', '七牛云存储参数配置', 1, 1568873740, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_custom_template`
--

CREATE TABLE `sys_custom_template` (
  `id` int(11) NOT NULL COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_name` varchar(250) DEFAULT NULL COMMENT '自定义模板名称（暂时预留）',
  `template_data` text NOT NULL COMMENT '模板数据（JSON格式）',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `modify_time` int(11) DEFAULT NULL COMMENT '修改时间戳',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 0 不启用 1 启用'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='手机端自定义模板';

-- --------------------------------------------------------

--
-- 表的结构 `sys_district`
--

CREATE TABLE `sys_district` (
  `district_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=50 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_district`
--

INSERT INTO `sys_district` (`district_id`, `city_id`, `district_name`, `sort`) VALUES
(1, 1, '东城区', 0),
(2, 1, '西城区', 0),
(3, 1, '崇文区', 0),
(4, 1, '宣武区', 0),
(5, 1, '朝阳区', 0),
(6, 1, '丰台区', 0),
(7, 1, '石景山区', 0),
(8, 1, '海淀区', 0),
(9, 1, '门头沟区', 0),
(10, 1, '房山区', 0),
(11, 1, '通州区', 0),
(12, 1, '顺义区', 0),
(13, 1, '昌平区', 0),
(14, 1, '大兴区', 0),
(15, 1, '怀柔区', 0),
(16, 1, '平谷区', 0),
(17, 1, '密云县', 0),
(18, 1, '延庆县', 0),
(19, 2, '和平区', 0),
(20, 2, '河东区', 0),
(21, 2, '河西区', 0),
(22, 2, '南开区', 0),
(23, 2, '河北区', 0),
(24, 2, '红桥区', 0),
(25, 2, '塘沽区', 0),
(26, 2, '汉沽区', 0),
(27, 2, '大港区', 0),
(28, 2, '东丽区', 0),
(29, 2, '西青区', 0),
(30, 2, '津南区', 0),
(31, 2, '北辰区', 0),
(32, 2, '武清区', 0),
(33, 2, '宝坻区', 0),
(34, 2, '宁河县', 0),
(35, 2, '静海县', 0),
(36, 2, '蓟县', 0),
(37, 3, '长安区', 0),
(38, 3, '桥东区', 0),
(39, 3, '桥西区', 0),
(40, 3, '新华区', 0),
(41, 3, '井陉矿区', 0),
(42, 3, '裕华区', 0),
(43, 3, '井陉县', 0),
(44, 3, '正定县', 0),
(45, 3, '栾城县', 0),
(46, 3, '行唐县', 0),
(47, 3, '灵寿县', 0),
(48, 3, '高邑县', 0),
(49, 3, '深泽县', 0),
(50, 3, '赞皇县', 0),
(51, 3, '无极县', 0),
(52, 3, '平山县', 0),
(53, 3, '元氏县', 0),
(54, 3, '赵县', 0),
(55, 3, '辛集市', 0),
(56, 3, '藁城市', 0),
(57, 3, '晋州市', 0),
(58, 3, '新乐市', 0),
(59, 3, '鹿泉市', 0),
(60, 4, '路南区', 0),
(61, 4, '路北区', 0),
(62, 4, '古冶区', 0),
(63, 4, '开平区', 0),
(64, 4, '丰南区', 0),
(65, 4, '丰润区', 0),
(66, 4, '滦县', 0),
(67, 4, '滦南县', 0),
(68, 4, '乐亭县', 0),
(69, 4, '迁西县', 0),
(70, 4, '玉田县', 0),
(71, 4, '唐海县', 0),
(72, 4, '遵化市', 0),
(73, 4, '迁安市', 0),
(74, 5, '海港区', 0),
(75, 5, '山海关区', 0),
(76, 5, '北戴河区', 0),
(77, 5, '青龙满族自治县', 0),
(78, 5, '昌黎县', 0),
(79, 5, '抚宁县', 0),
(80, 5, '卢龙县', 0),
(81, 6, '邯山区', 0),
(82, 6, '丛台区', 0),
(83, 6, '复兴区', 0),
(84, 6, '峰峰矿区', 0),
(85, 6, '邯郸县', 0),
(86, 6, '临漳县', 0),
(87, 6, '成安县', 0),
(88, 6, '大名县', 0),
(89, 6, '涉县', 0),
(90, 6, '磁县', 0),
(91, 6, '肥乡县', 0),
(92, 6, '永年县', 0),
(93, 6, '邱县', 0),
(94, 6, '鸡泽县', 0),
(95, 6, '广平县', 0),
(96, 6, '馆陶县', 0),
(97, 6, '魏县', 0),
(98, 6, '曲周县', 0),
(99, 6, '武安市', 0),
(100, 7, '桥东区', 0),
(101, 7, '桥西区', 0),
(102, 7, '邢台县', 0),
(103, 7, '临城县', 0),
(104, 7, '内丘县', 0),
(105, 7, '柏乡县', 0),
(106, 7, '隆尧县', 0),
(107, 7, '任县', 0),
(108, 7, '南和县', 0),
(109, 7, '宁晋县', 0),
(110, 7, '巨鹿县', 0),
(111, 7, '新河县', 0),
(112, 7, '广宗县', 0),
(113, 7, '平乡县', 0),
(114, 7, '威县', 0),
(115, 7, '清河县', 0),
(116, 7, '临西县', 0),
(117, 7, '南宫市', 0),
(118, 7, '沙河市', 0),
(119, 8, '新市区', 0),
(120, 8, '北市区', 0),
(121, 8, '南市区', 0),
(122, 8, '满城县', 0),
(123, 8, '清苑县', 0),
(124, 8, '涞水县', 0),
(125, 8, '阜平县', 0),
(126, 8, '徐水县', 0),
(127, 8, '定兴县', 0),
(128, 8, '唐县', 0),
(129, 8, '高阳县', 0),
(130, 8, '容城县', 0),
(131, 8, '涞源县', 0),
(132, 8, '望都县', 0),
(133, 8, '安新县', 0),
(134, 8, '易县', 0),
(135, 8, '曲阳县', 0),
(136, 8, '蠡县', 0),
(137, 8, '顺平县', 0),
(138, 8, '博野县', 0),
(139, 8, '雄县', 0),
(140, 8, '涿州市', 0),
(141, 8, '定州市', 0),
(142, 8, '安国市', 0),
(143, 8, '高碑店市', 0),
(144, 9, '桥东区', 0),
(145, 9, '桥西区', 0),
(146, 9, '宣化区', 0),
(147, 9, '下花园区', 0),
(148, 9, '宣化县', 0),
(149, 9, '张北县', 0),
(150, 9, '康保县', 0),
(151, 9, '沽源县', 0),
(152, 9, '尚义县', 0),
(153, 9, '蔚县', 0),
(154, 9, '阳原县', 0),
(155, 9, '怀安县', 0),
(156, 9, '万全县', 0),
(157, 9, '怀来县', 0),
(158, 9, '涿鹿县', 0),
(159, 9, '赤城县', 0),
(160, 9, '崇礼县', 0),
(161, 10, '双桥区', 0),
(162, 10, '双滦区', 0),
(163, 10, '鹰手营子矿区', 0),
(164, 10, '承德县', 0),
(165, 10, '兴隆县', 0),
(166, 10, '平泉县', 0),
(167, 10, '滦平县', 0),
(168, 10, '隆化县', 0),
(169, 10, '丰宁满族自治县', 0),
(170, 10, '宽城满族自治县', 0),
(171, 10, '围场满族蒙古族自治县', 0),
(172, 11, '新华区', 0),
(173, 11, '运河区', 0),
(174, 11, '沧县', 0),
(175, 11, '青县', 0),
(176, 11, '东光县', 0),
(177, 11, '海兴县', 0),
(178, 11, '盐山县', 0),
(179, 11, '肃宁县', 0),
(180, 11, '南皮县', 0),
(181, 11, '吴桥县', 0),
(182, 11, '献县', 0),
(183, 11, '孟村回族自治县', 0),
(184, 11, '泊头市', 0),
(185, 11, '任丘市', 0),
(186, 11, '黄骅市', 0),
(187, 11, '河间市', 0),
(188, 12, '安次区', 0),
(189, 12, '广阳区', 0),
(190, 12, '固安县', 0),
(191, 12, '永清县', 0),
(192, 12, '香河县', 0),
(193, 12, '大城县', 0),
(194, 12, '文安县', 0),
(195, 12, '大厂回族自治县', 0),
(196, 12, '霸州市', 0),
(197, 12, '三河市', 0),
(198, 13, '桃城区', 0),
(199, 13, '枣强县', 0),
(200, 13, '武邑县', 0),
(201, 13, '武强县', 0),
(202, 13, '饶阳县', 0),
(203, 13, '安平县', 0),
(204, 13, '故城县', 0),
(205, 13, '景县', 0),
(206, 13, '阜城县', 0),
(207, 13, '冀州市', 0),
(208, 13, '深州市', 0),
(209, 14, '小店区', 0),
(210, 14, '迎泽区', 0),
(211, 14, '杏花岭区', 0),
(212, 14, '尖草坪区', 0),
(213, 14, '万柏林区', 0),
(214, 14, '晋源区', 0),
(215, 14, '清徐县', 0),
(216, 14, '阳曲县', 0),
(217, 14, '娄烦县', 0),
(218, 14, '古交市', 0),
(219, 15, '城区', 0),
(220, 15, '矿区', 0),
(221, 15, '南郊区', 0),
(222, 15, '新荣区', 0),
(223, 15, '阳高县', 0),
(224, 15, '天镇县', 0),
(225, 15, '广灵县', 0),
(226, 15, '灵丘县', 0),
(227, 15, '浑源县', 0),
(228, 15, '左云县', 0),
(229, 15, '大同县', 0),
(230, 16, '城区', 0),
(231, 16, '矿区', 0),
(232, 16, '郊区', 0),
(233, 16, '平定县', 0),
(234, 16, '盂县', 0),
(235, 17, '城区', 0),
(236, 17, '郊区', 0),
(237, 17, '长治县', 0),
(238, 17, '襄垣县', 0),
(239, 17, '屯留县', 0),
(240, 17, '平顺县', 0),
(241, 17, '黎城县', 0),
(242, 17, '壶关县', 0),
(243, 17, '长子县', 0),
(244, 17, '武乡县', 0),
(245, 17, '沁县', 0),
(246, 17, '沁源县', 0),
(247, 17, '潞城市', 0),
(248, 18, '城区', 0),
(249, 18, '沁水县', 0),
(250, 18, '阳城县', 0),
(251, 18, '陵川县', 0),
(252, 18, '泽州县', 0),
(253, 18, '高平市', 0),
(254, 19, '朔城区', 0),
(255, 19, '平鲁区', 0),
(256, 19, '山阴县', 0),
(257, 19, '应县', 0),
(258, 19, '右玉县', 0),
(259, 19, '怀仁县', 0),
(260, 20, '榆次区', 0),
(261, 20, '榆社县', 0),
(262, 20, '左权县', 0),
(263, 20, '和顺县', 0),
(264, 20, '昔阳县', 0),
(265, 20, '寿阳县', 0),
(266, 20, '太谷县', 0),
(267, 20, '祁县', 0),
(268, 20, '平遥县', 0),
(269, 20, '灵石县', 0),
(270, 20, '介休市', 0),
(271, 21, '盐湖区', 0),
(272, 21, '临猗县', 0),
(273, 21, '万荣县', 0),
(274, 21, '闻喜县', 0),
(275, 21, '稷山县', 0),
(276, 21, '新绛县', 0),
(277, 21, '绛县', 0),
(278, 21, '垣曲县', 0),
(279, 21, '夏县', 0),
(280, 21, '平陆县', 0),
(281, 21, '芮城县', 0),
(282, 21, '永济市', 0),
(283, 21, '河津市', 0),
(284, 22, '忻府区', 0),
(285, 22, '定襄县', 0),
(286, 22, '五台县', 0),
(287, 22, '代县', 0),
(288, 22, '繁峙县', 0),
(289, 22, '宁武县', 0),
(290, 22, '静乐县', 0),
(291, 22, '神池县', 0),
(292, 22, '五寨县', 0),
(293, 22, '岢岚县', 0),
(294, 22, '河曲县', 0),
(295, 22, '保德县', 0),
(296, 22, '偏关县', 0),
(297, 22, '原平市', 0),
(298, 23, '尧都区', 0),
(299, 23, '曲沃县', 0),
(300, 23, '翼城县', 0),
(301, 23, '襄汾县', 0),
(302, 23, '洪洞县', 0),
(303, 23, '古县', 0),
(304, 23, '安泽县', 0),
(305, 23, '浮山县', 0),
(306, 23, '吉县', 0),
(307, 23, '乡宁县', 0),
(308, 23, '大宁县', 0),
(309, 23, '隰县', 0),
(310, 23, '永和县', 0),
(311, 23, '蒲县', 0),
(312, 23, '汾西县', 0),
(313, 23, '侯马市', 0),
(314, 23, '霍州市', 0),
(315, 24, '离石区', 0),
(316, 24, '文水县', 0),
(317, 24, '交城县', 0),
(318, 24, '兴县', 0),
(319, 24, '临县', 0),
(320, 24, '柳林县', 0),
(321, 24, '石楼县', 0),
(322, 24, '岚县', 0),
(323, 24, '方山县', 0),
(324, 24, '中阳县', 0),
(325, 24, '交口县', 0),
(326, 24, '孝义市', 0),
(327, 24, '汾阳市', 0),
(328, 25, '新城区', 0),
(329, 25, '回民区', 0),
(330, 25, '玉泉区', 0),
(331, 25, '赛罕区', 0),
(332, 25, '土默特左旗', 0),
(333, 25, '托克托县', 0),
(334, 25, '和林格尔县', 0),
(335, 25, '清水河县', 0),
(336, 25, '武川县', 0),
(337, 26, '东河区', 0),
(338, 26, '昆都仑区', 0),
(339, 26, '青山区', 0),
(340, 26, '石拐区', 0),
(341, 26, '白云矿区', 0),
(342, 26, '九原区', 0),
(343, 26, '土默特右旗', 0),
(344, 26, '固阳县', 0),
(345, 26, '达尔罕茂明安联合旗', 0),
(346, 27, '海勃湾区', 0),
(347, 27, '海南区', 0),
(348, 27, '乌达区', 0),
(349, 28, '红山区', 0),
(350, 28, '元宝山区', 0),
(351, 28, '松山区', 0),
(352, 28, '阿鲁科尔沁旗', 0),
(353, 28, '巴林左旗', 0),
(354, 28, '巴林右旗', 0),
(355, 28, '林西县', 0),
(356, 28, '克什克腾旗', 0),
(357, 28, '翁牛特旗', 0),
(358, 28, '喀喇沁旗', 0),
(359, 28, '宁城县', 0),
(360, 28, '敖汉旗', 0),
(361, 29, '科尔沁区', 0),
(362, 29, '科尔沁左翼中旗', 0),
(363, 29, '科尔沁左翼后旗', 0),
(364, 29, '开鲁县', 0),
(365, 29, '库伦旗', 0),
(366, 29, '奈曼旗', 0),
(367, 29, '扎鲁特旗', 0),
(368, 29, '霍林郭勒市', 0),
(369, 30, '东胜区', 0),
(370, 30, '达拉特旗', 0),
(371, 30, '准格尔旗', 0),
(372, 30, '鄂托克前旗', 0),
(373, 30, '鄂托克旗', 0),
(374, 30, '杭锦旗', 0),
(375, 30, '乌审旗', 0),
(376, 30, '伊金霍洛旗', 0),
(377, 31, '海拉尔区', 0),
(378, 31, '阿荣旗', 0),
(379, 31, '莫力达瓦达斡尔族自治旗', 0),
(380, 31, '鄂伦春自治旗', 0),
(381, 31, '鄂温克族自治旗', 0),
(382, 31, '陈巴尔虎旗', 0),
(383, 31, '新巴尔虎左旗', 0),
(384, 31, '新巴尔虎右旗', 0),
(385, 31, '满洲里市', 0),
(386, 31, '牙克石市', 0),
(387, 31, '扎兰屯市', 0),
(388, 31, '额尔古纳市', 0),
(389, 31, '根河市', 0),
(390, 32, '临河区', 0),
(391, 32, '五原县', 0),
(392, 32, '磴口县', 0),
(393, 32, '乌拉特前旗', 0),
(394, 32, '乌拉特中旗', 0),
(395, 32, '乌拉特后旗', 0),
(396, 32, '杭锦后旗', 0),
(397, 33, '集宁区', 0),
(398, 33, '卓资县', 0),
(399, 33, '化德县', 0),
(400, 33, '商都县', 0),
(401, 33, '兴和县', 0),
(402, 33, '凉城县', 0),
(403, 33, '察哈尔右翼前旗', 0),
(404, 33, '察哈尔右翼中旗', 0),
(405, 33, '察哈尔右翼后旗', 0),
(406, 33, '四子王旗', 0),
(407, 33, '丰镇市', 0),
(408, 34, '乌兰浩特市', 0),
(409, 34, '阿尔山市', 0),
(410, 34, '科尔沁右翼前旗', 0),
(411, 34, '科尔沁右翼中旗', 0),
(412, 34, '扎赉特旗', 0),
(413, 34, '突泉县', 0),
(414, 35, '二连浩特市', 0),
(415, 35, '锡林浩特市', 0),
(416, 35, '阿巴嘎旗', 0),
(417, 35, '苏尼特左旗', 0),
(418, 35, '苏尼特右旗', 0),
(419, 35, '东乌珠穆沁旗', 0),
(420, 35, '西乌珠穆沁旗', 0),
(421, 35, '太仆寺旗', 0),
(422, 35, '镶黄旗', 0),
(423, 35, '正镶白旗', 0),
(424, 35, '正蓝旗', 0),
(425, 35, '多伦县', 0),
(426, 36, '阿拉善左旗', 0),
(427, 36, '阿拉善右旗', 0),
(428, 36, '额济纳旗', 0),
(429, 37, '和平区', 0),
(430, 37, '沈河区', 0),
(431, 37, '大东区', 0),
(432, 37, '皇姑区', 0),
(433, 37, '铁西区', 0),
(434, 37, '苏家屯区', 0),
(435, 37, '东陵区', 0),
(436, 37, '新城子区', 0),
(437, 37, '于洪区', 0),
(438, 37, '辽中县', 0),
(439, 37, '康平县', 0),
(440, 37, '法库县', 0),
(441, 37, '新民市', 0),
(442, 38, '中山区', 0),
(443, 38, '西岗区', 0),
(444, 38, '沙河口区', 0),
(445, 38, '甘井子区', 0),
(446, 38, '旅顺口区', 0),
(447, 38, '金州区', 0),
(448, 38, '长海县', 0),
(449, 38, '瓦房店市', 0),
(450, 38, '普兰店市', 0),
(451, 38, '庄河市', 0),
(452, 39, '铁东区', 0),
(453, 39, '铁西区', 0),
(454, 39, '立山区', 0),
(455, 39, '千山区', 0),
(456, 39, '台安县', 0),
(457, 39, '岫岩满族自治县', 0),
(458, 39, '海城市', 0),
(459, 40, '新抚区', 0),
(460, 40, '东洲区', 0),
(461, 40, '望花区', 0),
(462, 40, '顺城区', 0),
(463, 40, '抚顺县', 0),
(464, 40, '新宾满族自治县', 0),
(465, 40, '清原满族自治县', 0),
(466, 41, '平山区', 0),
(467, 41, '溪湖区', 0),
(468, 41, '明山区', 0),
(469, 41, '南芬区', 0),
(470, 41, '本溪满族自治县', 0),
(471, 41, '桓仁满族自治县', 0),
(472, 42, '元宝区', 0),
(473, 42, '振兴区', 0),
(474, 42, '振安区', 0),
(475, 42, '宽甸满族自治县', 0),
(476, 42, '东港市', 0),
(477, 42, '凤城市', 0),
(478, 43, '古塔区', 0),
(479, 43, '凌河区', 0),
(480, 43, '太和区', 0),
(481, 43, '黑山县', 0),
(482, 43, '义县', 0),
(483, 43, '凌海市', 0),
(484, 43, '北宁市', 0),
(485, 44, '站前区', 0),
(486, 44, '西市区', 0),
(487, 44, '鲅鱼圈区', 0),
(488, 44, '老边区', 0),
(489, 44, '盖州市', 0),
(490, 44, '大石桥市', 0),
(491, 45, '海州区', 0),
(492, 45, '新邱区', 0),
(493, 45, '太平区', 0),
(494, 45, '清河门区', 0),
(495, 45, '细河区', 0),
(496, 45, '阜新蒙古族自治县', 0),
(497, 45, '彰武县', 0),
(498, 46, '白塔区', 0),
(499, 46, '文圣区', 0),
(500, 46, '宏伟区', 0),
(501, 46, '弓长岭区', 0),
(502, 46, '太子河区', 0),
(503, 46, '辽阳县', 0),
(504, 46, '灯塔市', 0),
(505, 47, '双台子区', 0),
(506, 47, '兴隆台区', 0),
(507, 47, '大洼县', 0),
(508, 47, '盘山县', 0),
(509, 48, '银州区', 0),
(510, 48, '清河区', 0),
(511, 48, '铁岭县', 0),
(512, 48, '西丰县', 0),
(513, 48, '昌图县', 0),
(514, 48, '调兵山市', 0),
(515, 48, '开原市', 0),
(516, 49, '双塔区', 0),
(517, 49, '龙城区', 0),
(518, 49, '朝阳县', 0),
(519, 49, '建平县', 0),
(520, 49, '喀喇沁左翼蒙古族自治县', 0),
(521, 49, '北票市', 0),
(522, 49, '凌源市', 0),
(523, 50, '连山区', 0),
(524, 50, '龙港区', 0),
(525, 50, '南票区', 0),
(526, 50, '绥中县', 0),
(527, 50, '建昌县', 0),
(528, 50, '兴城市', 0),
(529, 51, '南关区', 0),
(530, 51, '宽城区', 0),
(531, 51, '朝阳区', 0),
(532, 51, '二道区', 0),
(533, 51, '绿园区', 0),
(534, 51, '双阳区', 0),
(535, 51, '农安县', 0),
(536, 51, '九台市', 0),
(537, 51, '榆树市', 0),
(538, 51, '德惠市', 0),
(539, 52, '昌邑区', 0),
(540, 52, '龙潭区', 0),
(541, 52, '船营区', 0),
(542, 52, '丰满区', 0),
(543, 52, '永吉县', 0),
(544, 52, '蛟河市', 0),
(545, 52, '桦甸市', 0),
(546, 52, '舒兰市', 0),
(547, 52, '磐石市', 0),
(548, 53, '铁西区', 0),
(549, 53, '铁东区', 0),
(550, 53, '梨树县', 0),
(551, 53, '伊通满族自治县', 0),
(552, 53, '公主岭市', 0),
(553, 53, '双辽市', 0),
(554, 54, '龙山区', 0),
(555, 54, '西安区', 0),
(556, 54, '东丰县', 0),
(557, 54, '东辽县', 0),
(558, 55, '东昌区', 0),
(559, 55, '二道江区', 0),
(560, 55, '通化县', 0),
(561, 55, '辉南县', 0),
(562, 55, '柳河县', 0),
(563, 55, '梅河口市', 0),
(564, 55, '集安市', 0),
(565, 56, '八道江区', 0),
(566, 56, '抚松县', 0),
(567, 56, '靖宇县', 0),
(568, 56, '长白朝鲜族自治县', 0),
(569, 56, '江源县', 0),
(570, 56, '临江市', 0),
(571, 57, '宁江区', 0),
(572, 57, '前郭尔罗斯蒙古族自治县', 0),
(573, 57, '长岭县', 0),
(574, 57, '乾安县', 0),
(575, 57, '扶余县', 0),
(576, 58, '洮北区', 0),
(577, 58, '镇赉县', 0),
(578, 58, '通榆县', 0),
(579, 58, '洮南市', 0),
(580, 58, '大安市', 0),
(581, 59, '延吉市', 0),
(582, 59, '图们市', 0),
(583, 59, '敦化市', 0),
(584, 59, '珲春市', 0),
(585, 59, '龙井市', 0),
(586, 59, '和龙市', 0),
(587, 59, '汪清县', 0),
(588, 59, '安图县', 0),
(589, 60, '道里区', 0),
(590, 60, '南岗区', 0),
(591, 60, '道外区', 0),
(592, 60, '香坊区', 0),
(593, 60, '动力区', 0),
(594, 60, '平房区', 0),
(595, 60, '松北区', 0),
(596, 60, '呼兰区', 0),
(597, 60, '依兰县', 0),
(598, 60, '方正县', 0),
(599, 60, '宾县', 0),
(600, 60, '巴彦县', 0),
(601, 60, '木兰县', 0),
(602, 60, '通河县', 0),
(603, 60, '延寿县', 0),
(604, 60, '阿城市', 0),
(605, 60, '双城市', 0),
(606, 60, '尚志市', 0),
(607, 60, '五常市', 0),
(608, 61, '龙沙区', 0),
(609, 61, '建华区', 0),
(610, 61, '铁锋区', 0),
(611, 61, '昂昂溪区', 0),
(612, 61, '富拉尔基区', 0),
(613, 61, '碾子山区', 0),
(614, 61, '梅里斯达斡尔族区', 0),
(615, 61, '龙江县', 0),
(616, 61, '依安县', 0),
(617, 61, '泰来县', 0),
(618, 61, '甘南县', 0),
(619, 61, '富裕县', 0),
(620, 61, '克山县', 0),
(621, 61, '克东县', 0),
(622, 61, '拜泉县', 0),
(623, 61, '讷河市', 0),
(624, 62, '鸡冠区', 0),
(625, 62, '恒山区', 0),
(626, 62, '滴道区', 0),
(627, 62, '梨树区', 0),
(628, 62, '城子河区', 0),
(629, 62, '麻山区', 0),
(630, 62, '鸡东县', 0),
(631, 62, '虎林市', 0),
(632, 62, '密山市', 0),
(633, 63, '向阳区', 0),
(634, 63, '工农区', 0),
(635, 63, '南山区', 0),
(636, 63, '兴安区', 0),
(637, 63, '东山区', 0),
(638, 63, '兴山区', 0),
(639, 63, '萝北县', 0),
(640, 63, '绥滨县', 0),
(641, 64, '尖山区', 0),
(642, 64, '岭东区', 0),
(643, 64, '四方台区', 0),
(644, 64, '宝山区', 0),
(645, 64, '集贤县', 0),
(646, 64, '友谊县', 0),
(647, 64, '宝清县', 0),
(648, 64, '饶河县', 0),
(649, 65, '萨尔图区', 0),
(650, 65, '龙凤区', 0),
(651, 65, '让胡路区', 0),
(652, 65, '红岗区', 0),
(653, 65, '大同区', 0),
(654, 65, '肇州县', 0),
(655, 65, '肇源县', 0),
(656, 65, '林甸县', 0),
(657, 65, '杜尔伯特蒙古族自治县', 0),
(658, 66, '伊春区', 0),
(659, 66, '南岔区', 0),
(660, 66, '友好区', 0),
(661, 66, '西林区', 0),
(662, 66, '翠峦区', 0),
(663, 66, '新青区', 0),
(664, 66, '美溪区', 0),
(665, 66, '金山屯区', 0),
(666, 66, '五营区', 0),
(667, 66, '乌马河区', 0),
(668, 66, '汤旺河区', 0),
(669, 66, '带岭区', 0),
(670, 66, '乌伊岭区', 0),
(671, 66, '红星区', 0),
(672, 66, '上甘岭区', 0),
(673, 66, '嘉荫县', 0),
(674, 66, '铁力市', 0),
(675, 67, '永红区', 0),
(676, 67, '向阳区', 0),
(677, 67, '前进区', 0),
(678, 67, '东风区', 0),
(679, 67, '郊区', 0),
(680, 67, '桦南县', 0),
(681, 67, '桦川县', 0),
(682, 67, '汤原县', 0),
(683, 67, '抚远县', 0),
(684, 67, '同江市', 0),
(685, 67, '富锦市', 0),
(686, 68, '新兴区', 0),
(687, 68, '桃山区', 0),
(688, 68, '茄子河区', 0),
(689, 68, '勃利县', 0),
(690, 69, '东安区', 0),
(691, 69, '阳明区', 0),
(692, 69, '爱民区', 0),
(693, 69, '西安区', 0),
(694, 69, '东宁县', 0),
(695, 69, '林口县', 0),
(696, 69, '绥芬河市', 0),
(697, 69, '海林市', 0),
(698, 69, '宁安市', 0),
(699, 69, '穆棱市', 0),
(700, 70, '爱辉区', 0),
(701, 70, '嫩江县', 0),
(702, 70, '逊克县', 0),
(703, 70, '孙吴县', 0),
(704, 70, '北安市', 0),
(705, 70, '五大连池市', 0),
(706, 71, '北林区', 0),
(707, 71, '望奎县', 0),
(708, 71, '兰西县', 0),
(709, 71, '青冈县', 0),
(710, 71, '庆安县', 0),
(711, 71, '明水县', 0),
(712, 71, '绥棱县', 0),
(713, 71, '安达市', 0),
(714, 71, '肇东市', 0),
(715, 71, '海伦市', 0),
(716, 72, '呼玛县', 0),
(717, 72, '塔河县', 0),
(718, 72, '漠河县', 0),
(719, 73, '黄浦区', 0),
(720, 73, '卢湾区', 0),
(721, 73, '徐汇区', 0),
(722, 73, '长宁区', 0),
(723, 73, '静安区', 0),
(724, 73, '普陀区', 0),
(725, 73, '闸北区', 0),
(726, 73, '虹口区', 0),
(727, 73, '杨浦区', 0),
(728, 73, '闵行区', 0),
(729, 73, '宝山区', 0),
(730, 73, '嘉定区', 0),
(731, 73, '浦东新区', 0),
(732, 73, '金山区', 0),
(733, 73, '松江区', 0),
(734, 73, '青浦区', 0),
(735, 73, '南汇区', 0),
(736, 73, '奉贤区', 0),
(737, 73, '崇明县', 0),
(738, 74, '玄武区', 0),
(739, 74, '白下区', 0),
(740, 74, '秦淮区', 0),
(741, 74, '建邺区', 0),
(742, 74, '鼓楼区', 0),
(743, 74, '下关区', 0),
(744, 74, '浦口区', 0),
(745, 74, '栖霞区', 0),
(746, 74, '雨花台区', 0),
(747, 74, '江宁区', 0),
(748, 74, '六合区', 0),
(749, 74, '溧水县', 0),
(750, 74, '高淳县', 0),
(751, 75, '崇安区', 0),
(752, 75, '南长区', 0),
(753, 75, '北塘区', 0),
(754, 75, '锡山区', 0),
(755, 75, '惠山区', 0),
(756, 75, '滨湖区', 0),
(757, 75, '江阴市', 0),
(758, 75, '宜兴市', 0),
(759, 76, '鼓楼区', 0),
(760, 76, '云龙区', 0),
(761, 76, '九里区', 0),
(762, 76, '贾汪区', 0),
(763, 76, '泉山区', 0),
(764, 76, '丰县', 0),
(765, 76, '沛县', 0),
(766, 76, '铜山县', 0),
(767, 76, '睢宁县', 0),
(768, 76, '新沂市', 0),
(769, 76, '邳州市', 0),
(770, 77, '天宁区', 0),
(771, 77, '钟楼区', 0),
(772, 77, '戚墅堰区', 0),
(773, 77, '新北区', 0),
(774, 77, '武进区', 0),
(775, 77, '溧阳市', 0),
(776, 77, '金坛市', 0),
(777, 78, '沧浪区', 0),
(778, 78, '平江区', 0),
(779, 78, '金阊区', 0),
(780, 78, '虎丘区', 0),
(781, 78, '吴中区', 0),
(782, 78, '相城区', 0),
(783, 78, '常熟市', 0),
(784, 78, '张家港市', 0),
(785, 78, '昆山市', 0),
(786, 78, '吴江市', 0),
(787, 78, '太仓市', 0),
(788, 79, '崇川区', 0),
(789, 79, '港闸区', 0),
(790, 79, '海安县', 0),
(791, 79, '如东县', 0),
(792, 79, '启东市', 0),
(793, 79, '如皋市', 0),
(794, 79, '通州市', 0),
(795, 79, '海门市', 0),
(796, 80, '连云区', 0),
(797, 80, '新浦区', 0),
(798, 80, '海州区', 0),
(799, 80, '赣榆县', 0),
(800, 80, '东海县', 0),
(801, 80, '灌云县', 0),
(802, 80, '灌南县', 0),
(803, 81, '清河区', 0),
(804, 81, '楚州区', 0),
(805, 81, '淮阴区', 0),
(806, 81, '清浦区', 0),
(807, 81, '涟水县', 0),
(808, 81, '洪泽县', 0),
(809, 81, '盱眙县', 0),
(810, 81, '金湖县', 0),
(811, 82, '亭湖区', 0),
(812, 82, '盐都区', 0),
(813, 82, '响水县', 0),
(814, 82, '滨海县', 0),
(815, 82, '阜宁县', 0),
(816, 82, '射阳县', 0),
(817, 82, '建湖县', 0),
(818, 82, '东台市', 0),
(819, 82, '大丰市', 0),
(820, 83, '广陵区', 0),
(821, 83, '邗江区', 0),
(822, 83, '维扬区', 0),
(823, 83, '宝应县', 0),
(824, 83, '仪征市', 0),
(825, 83, '高邮市', 0),
(826, 83, '江都市', 0),
(827, 84, '京口区', 0),
(828, 84, '润州区', 0),
(829, 84, '丹徒区', 0),
(830, 84, '丹阳市', 0),
(831, 84, '扬中市', 0),
(832, 84, '句容市', 0),
(833, 85, '海陵区', 0),
(834, 85, '高港区', 0),
(835, 85, '兴化市', 0),
(836, 85, '靖江市', 0),
(837, 85, '泰兴市', 0),
(838, 85, '姜堰市', 0),
(839, 86, '宿城区', 0),
(840, 86, '宿豫区', 0),
(841, 86, '沭阳县', 0),
(842, 86, '泗阳县', 0),
(843, 86, '泗洪县', 0),
(844, 87, '上城区', 0),
(845, 87, '下城区', 0),
(846, 87, '江干区', 0),
(847, 87, '拱墅区', 0),
(848, 87, '西湖区', 0),
(849, 87, '滨江区', 0),
(850, 87, '萧山区', 0),
(851, 87, '余杭区', 0),
(852, 87, '桐庐县', 0),
(853, 87, '淳安县', 0),
(854, 87, '建德市', 0),
(855, 87, '富阳市', 0),
(856, 87, '临安市', 0),
(857, 88, '海曙区', 0),
(858, 88, '江东区', 0),
(859, 88, '江北区', 0),
(860, 88, '北仑区', 0),
(861, 88, '镇海区', 0),
(862, 88, '鄞州区', 0),
(863, 88, '象山县', 0),
(864, 88, '宁海县', 0),
(865, 88, '余姚市', 0),
(866, 88, '慈溪市', 0),
(867, 88, '奉化市', 0),
(868, 89, '鹿城区', 0),
(869, 89, '龙湾区', 0),
(870, 89, '瓯海区', 0),
(871, 89, '洞头县', 0),
(872, 89, '永嘉县', 0),
(873, 89, '平阳县', 0),
(874, 89, '苍南县', 0),
(875, 89, '文成县', 0),
(876, 89, '泰顺县', 0),
(877, 89, '瑞安市', 0),
(878, 89, '乐清市', 0),
(879, 90, '秀城区', 0),
(880, 90, '秀洲区', 0),
(881, 90, '嘉善县', 0),
(882, 90, '海盐县', 0),
(883, 90, '海宁市', 0),
(884, 90, '平湖市', 0),
(885, 90, '桐乡市', 0),
(886, 91, '吴兴区', 0),
(887, 91, '南浔区', 0),
(888, 91, '德清县', 0),
(889, 91, '长兴县', 0),
(890, 91, '安吉县', 0),
(891, 92, '越城区', 0),
(892, 92, '绍兴县', 0),
(893, 92, '新昌县', 0),
(894, 92, '诸暨市', 0),
(895, 92, '上虞市', 0),
(896, 92, '嵊州市', 0),
(897, 93, '婺城区', 0),
(898, 93, '金东区', 0),
(899, 93, '武义县', 0),
(900, 93, '浦江县', 0),
(901, 93, '磐安县', 0),
(902, 93, '兰溪市', 0),
(903, 93, '义乌市', 0),
(904, 93, '东阳市', 0),
(905, 93, '永康市', 0),
(906, 94, '柯城区', 0),
(907, 94, '衢江区', 0),
(908, 94, '常山县', 0),
(909, 94, '开化县', 0),
(910, 94, '龙游县', 0),
(911, 94, '江山市', 0),
(912, 95, '定海区', 0),
(913, 95, '普陀区', 0),
(914, 95, '岱山县', 0),
(915, 95, '嵊泗县', 0),
(916, 96, '椒江区', 0),
(917, 96, '黄岩区', 0),
(918, 96, '路桥区', 0),
(919, 96, '玉环县', 0),
(920, 96, '三门县', 0),
(921, 96, '天台县', 0),
(922, 96, '仙居县', 0),
(923, 96, '温岭市', 0),
(924, 96, '临海市', 0),
(925, 97, '莲都区', 0),
(926, 97, '青田县', 0),
(927, 97, '缙云县', 0),
(928, 97, '遂昌县', 0),
(929, 97, '松阳县', 0),
(930, 97, '云和县', 0),
(931, 97, '庆元县', 0),
(932, 97, '景宁畲族自治县', 0),
(933, 97, '龙泉市', 0),
(934, 98, '瑶海区', 0),
(935, 98, '庐阳区', 0),
(936, 98, '蜀山区', 0),
(937, 98, '包河区', 0),
(938, 98, '长丰县', 0),
(939, 98, '肥东县', 0),
(940, 98, '肥西县', 0),
(941, 99, '镜湖区', 0),
(942, 99, '马塘区', 0),
(943, 99, '新芜区', 0),
(944, 99, '鸠江区', 0),
(945, 99, '芜湖县', 0),
(946, 99, '繁昌县', 0),
(947, 99, '南陵县', 0),
(948, 100, '龙子湖区', 0),
(949, 100, '蚌山区', 0),
(950, 100, '禹会区', 0),
(951, 100, '淮上区', 0),
(952, 100, '怀远县', 0),
(953, 100, '五河县', 0),
(954, 100, '固镇县', 0),
(955, 101, '大通区', 0),
(956, 101, '田家庵区', 0),
(957, 101, '谢家集区', 0),
(958, 101, '八公山区', 0),
(959, 101, '潘集区', 0),
(960, 101, '凤台县', 0),
(961, 102, '金家庄区', 0),
(962, 102, '花山区', 0),
(963, 102, '雨山区', 0),
(964, 102, '当涂县', 0),
(965, 103, '杜集区', 0),
(966, 103, '相山区', 0),
(967, 103, '烈山区', 0),
(968, 103, '濉溪县', 0),
(969, 104, '铜官山区', 0),
(970, 104, '狮子山区', 0),
(971, 104, '郊区', 0),
(972, 104, '铜陵县', 0),
(973, 105, '迎江区', 0),
(974, 105, '大观区', 0),
(975, 105, '郊区', 0),
(976, 105, '怀宁县', 0),
(977, 105, '枞阳县', 0),
(978, 105, '潜山县', 0),
(979, 105, '太湖县', 0),
(980, 105, '宿松县', 0),
(981, 105, '望江县', 0),
(982, 105, '岳西县', 0),
(983, 105, '桐城市', 0),
(984, 106, '屯溪区', 0),
(985, 106, '黄山区', 0),
(986, 106, '徽州区', 0),
(987, 106, '歙县', 0),
(988, 106, '休宁县', 0),
(989, 106, '黟县', 0),
(990, 106, '祁门县', 0),
(991, 107, '琅琊区', 0),
(992, 107, '南谯区', 0),
(993, 107, '来安县', 0),
(994, 107, '全椒县', 0),
(995, 107, '定远县', 0),
(996, 107, '凤阳县', 0),
(997, 107, '天长市', 0),
(998, 107, '明光市', 0),
(999, 108, '颍州区', 0),
(1000, 108, '颍东区', 0),
(1001, 108, '颍泉区', 0),
(1002, 108, '临泉县', 0),
(1003, 108, '太和县', 0),
(1004, 108, '阜南县', 0),
(1005, 108, '颍上县', 0),
(1006, 108, '界首市', 0),
(1007, 109, '埇桥区', 0),
(1008, 109, '砀山县', 0),
(1009, 109, '萧县', 0),
(1010, 109, '灵璧县', 0),
(1011, 109, '泗县', 0),
(1012, 110, '居巢区', 0),
(1013, 110, '庐江县', 0),
(1014, 110, '无为县', 0),
(1015, 110, '含山县', 0),
(1016, 110, '和县', 0),
(1017, 111, '金安区', 0),
(1018, 111, '裕安区', 0),
(1019, 111, '寿县', 0),
(1020, 111, '霍邱县', 0),
(1021, 111, '舒城县', 0),
(1022, 111, '金寨县', 0),
(1023, 111, '霍山县', 0),
(1024, 112, '谯城区', 0),
(1025, 112, '涡阳县', 0),
(1026, 112, '蒙城县', 0),
(1027, 112, '利辛县', 0),
(1028, 113, '贵池区', 0),
(1029, 113, '东至县', 0),
(1030, 113, '石台县', 0),
(1031, 113, '青阳县', 0),
(1032, 114, '宣州区', 0),
(1033, 114, '郎溪县', 0),
(1034, 114, '广德县', 0),
(1035, 114, '泾县', 0),
(1036, 114, '绩溪县', 0),
(1037, 114, '旌德县', 0),
(1038, 114, '宁国市', 0),
(1039, 115, '鼓楼区', 0),
(1040, 115, '台江区', 0),
(1041, 115, '仓山区', 0),
(1042, 115, '马尾区', 0),
(1043, 115, '晋安区', 0),
(1044, 115, '闽侯县', 0),
(1045, 115, '连江县', 0),
(1046, 115, '罗源县', 0),
(1047, 115, '闽清县', 0),
(1048, 115, '永泰县', 0),
(1049, 115, '平潭县', 0),
(1050, 115, '福清市', 0),
(1051, 115, '长乐市', 0),
(1052, 116, '思明区', 0),
(1053, 116, '海沧区', 0),
(1054, 116, '湖里区', 0),
(1055, 116, '集美区', 0),
(1056, 116, '同安区', 0),
(1057, 116, '翔安区', 0),
(1058, 117, '城厢区', 0),
(1059, 117, '涵江区', 0),
(1060, 117, '荔城区', 0),
(1061, 117, '秀屿区', 0),
(1062, 117, '仙游县', 0),
(1063, 118, '梅列区', 0),
(1064, 118, '三元区', 0),
(1065, 118, '明溪县', 0),
(1066, 118, '清流县', 0),
(1067, 118, '宁化县', 0),
(1068, 118, '大田县', 0),
(1069, 118, '尤溪县', 0),
(1070, 118, '沙县', 0),
(1071, 118, '将乐县', 0),
(1072, 118, '泰宁县', 0),
(1073, 118, '建宁县', 0),
(1074, 118, '永安市', 0),
(1075, 119, '鲤城区', 0),
(1076, 119, '丰泽区', 0),
(1077, 119, '洛江区', 0),
(1078, 119, '泉港区', 0),
(1079, 119, '惠安县', 0),
(1080, 119, '安溪县', 0),
(1081, 119, '永春县', 0),
(1082, 119, '德化县', 0),
(1083, 119, '金门县', 0),
(1084, 119, '石狮市', 0),
(1085, 119, '晋江市', 0),
(1086, 119, '南安市', 0),
(1087, 120, '芗城区', 0),
(1088, 120, '龙文区', 0),
(1089, 120, '云霄县', 0),
(1090, 120, '漳浦县', 0),
(1091, 120, '诏安县', 0),
(1092, 120, '长泰县', 0),
(1093, 120, '东山县', 0),
(1094, 120, '南靖县', 0),
(1095, 120, '平和县', 0),
(1096, 120, '华安县', 0),
(1097, 120, '龙海市', 0),
(1098, 121, '延平区', 0),
(1099, 121, '顺昌县', 0),
(1100, 121, '浦城县', 0),
(1101, 121, '光泽县', 0),
(1102, 121, '松溪县', 0),
(1103, 121, '政和县', 0),
(1104, 121, '邵武市', 0),
(1105, 121, '武夷山市', 0),
(1106, 121, '建瓯市', 0),
(1107, 121, '建阳市', 0),
(1108, 122, '新罗区', 0),
(1109, 122, '长汀县', 0),
(1110, 122, '永定县', 0),
(1111, 122, '上杭县', 0),
(1112, 122, '武平县', 0),
(1113, 122, '连城县', 0),
(1114, 122, '漳平市', 0),
(1115, 123, '蕉城区', 0),
(1116, 123, '霞浦县', 0),
(1117, 123, '古田县', 0),
(1118, 123, '屏南县', 0),
(1119, 123, '寿宁县', 0),
(1120, 123, '周宁县', 0),
(1121, 123, '柘荣县', 0),
(1122, 123, '福安市', 0),
(1123, 123, '福鼎市', 0),
(1124, 124, '东湖区', 0),
(1125, 124, '西湖区', 0),
(1126, 124, '青云谱区', 0),
(1127, 124, '湾里区', 0),
(1128, 124, '青山湖区', 0),
(1129, 124, '南昌县', 0),
(1130, 124, '新建县', 0),
(1131, 124, '安义县', 0),
(1132, 124, '进贤县', 0),
(1133, 125, '昌江区', 0),
(1134, 125, '珠山区', 0),
(1135, 125, '浮梁县', 0),
(1136, 125, '乐平市', 0),
(1137, 126, '安源区', 0),
(1138, 126, '湘东区', 0),
(1139, 126, '莲花县', 0),
(1140, 126, '上栗县', 0),
(1141, 126, '芦溪县', 0),
(1142, 127, '庐山区', 0),
(1143, 127, '浔阳区', 0),
(1144, 127, '九江县', 0),
(1145, 127, '武宁县', 0),
(1146, 127, '修水县', 0),
(1147, 127, '永修县', 0),
(1148, 127, '德安县', 0),
(1149, 127, '星子县', 0),
(1150, 127, '都昌县', 0),
(1151, 127, '湖口县', 0),
(1152, 127, '彭泽县', 0),
(1153, 127, '瑞昌市', 0),
(1154, 128, '渝水区', 0),
(1155, 128, '分宜县', 0),
(1156, 129, '月湖区', 0),
(1157, 129, '余江县', 0),
(1158, 129, '贵溪市', 0),
(1159, 130, '章贡区', 0),
(1160, 130, '赣县', 0),
(1161, 130, '信丰县', 0),
(1162, 130, '大余县', 0),
(1163, 130, '上犹县', 0),
(1164, 130, '崇义县', 0),
(1165, 130, '安远县', 0),
(1166, 130, '龙南县', 0),
(1167, 130, '定南县', 0),
(1168, 130, '全南县', 0),
(1169, 130, '宁都县', 0),
(1170, 130, '于都县', 0),
(1171, 130, '兴国县', 0),
(1172, 130, '会昌县', 0),
(1173, 130, '寻乌县', 0),
(1174, 130, '石城县', 0),
(1175, 130, '瑞金市', 0),
(1176, 130, '南康市', 0),
(1177, 131, '吉州区', 0),
(1178, 131, '青原区', 0),
(1179, 131, '吉安县', 0),
(1180, 131, '吉水县', 0),
(1181, 131, '峡江县', 0),
(1182, 131, '新干县', 0),
(1183, 131, '永丰县', 0),
(1184, 131, '泰和县', 0),
(1185, 131, '遂川县', 0),
(1186, 131, '万安县', 0),
(1187, 131, '安福县', 0),
(1188, 131, '永新县', 0),
(1189, 131, '井冈山市', 0),
(1190, 132, '袁州区', 0),
(1191, 132, '奉新县', 0),
(1192, 132, '万载县', 0),
(1193, 132, '上高县', 0),
(1194, 132, '宜丰县', 0),
(1195, 132, '靖安县', 0),
(1196, 132, '铜鼓县', 0),
(1197, 132, '丰城市', 0),
(1198, 132, '樟树市', 0),
(1199, 132, '高安市', 0),
(1200, 133, '临川区', 0),
(1201, 133, '南城县', 0),
(1202, 133, '黎川县', 0),
(1203, 133, '南丰县', 0),
(1204, 133, '崇仁县', 0),
(1205, 133, '乐安县', 0),
(1206, 133, '宜黄县', 0),
(1207, 133, '金溪县', 0),
(1208, 133, '资溪县', 0),
(1209, 133, '东乡县', 0),
(1210, 133, '广昌县', 0),
(1211, 134, '信州区', 0),
(1212, 134, '上饶县', 0),
(1213, 134, '广丰县', 0),
(1214, 134, '玉山县', 0),
(1215, 134, '铅山县', 0),
(1216, 134, '横峰县', 0),
(1217, 134, '弋阳县', 0),
(1218, 134, '余干县', 0),
(1219, 134, '鄱阳县', 0),
(1220, 134, '万年县', 0),
(1221, 134, '婺源县', 0),
(1222, 134, '德兴市', 0),
(1223, 135, '历下区', 0),
(1224, 135, '市中区', 0),
(1225, 135, '槐荫区', 0),
(1226, 135, '天桥区', 0),
(1227, 135, '历城区', 0),
(1228, 135, '长清区', 0),
(1229, 135, '平阴县', 0),
(1230, 135, '济阳县', 0),
(1231, 135, '商河县', 0),
(1232, 135, '章丘市', 0),
(1233, 136, '市南区', 0),
(1234, 136, '市北区', 0),
(1235, 136, '四方区', 0),
(1236, 136, '黄岛区', 0),
(1237, 136, '崂山区', 0),
(1238, 136, '李沧区', 0),
(1239, 136, '城阳区', 0),
(1240, 136, '胶州市', 0),
(1241, 136, '即墨市', 0),
(1242, 136, '平度市', 0),
(1243, 136, '胶南市', 0),
(1244, 136, '莱西市', 0),
(1245, 137, '淄川区', 0),
(1246, 137, '张店区', 0),
(1247, 137, '博山区', 0),
(1248, 137, '临淄区', 0),
(1249, 137, '周村区', 0),
(1250, 137, '桓台县', 0),
(1251, 137, '高青县', 0),
(1252, 137, '沂源县', 0),
(1253, 138, '市中区', 0),
(1254, 138, '薛城区', 0),
(1255, 138, '峄城区', 0),
(1256, 138, '台儿庄区', 0),
(1257, 138, '山亭区', 0),
(1258, 138, '滕州市', 0),
(1259, 139, '东营区', 0),
(1260, 139, '河口区', 0),
(1261, 139, '垦利县', 0),
(1262, 139, '利津县', 0),
(1263, 139, '广饶县', 0),
(1264, 140, '芝罘区', 0),
(1265, 140, '福山区', 0),
(1266, 140, '牟平区', 0),
(1267, 140, '莱山区', 0),
(1268, 140, '长岛县', 0),
(1269, 140, '龙口市', 0),
(1270, 140, '莱阳市', 0),
(1271, 140, '莱州市', 0),
(1272, 140, '蓬莱市', 0),
(1273, 140, '招远市', 0),
(1274, 140, '栖霞市', 0),
(1275, 140, '海阳市', 0),
(1276, 141, '潍城区', 0),
(1277, 141, '寒亭区', 0),
(1278, 141, '坊子区', 0),
(1279, 141, '奎文区', 0),
(1280, 141, '临朐县', 0),
(1281, 141, '昌乐县', 0),
(1282, 141, '青州市', 0),
(1283, 141, '诸城市', 0),
(1284, 141, '寿光市', 0),
(1285, 141, '安丘市', 0),
(1286, 141, '高密市', 0),
(1287, 141, '昌邑市', 0),
(1288, 142, '市中区', 0),
(1289, 142, '任城区', 0),
(1290, 142, '微山县', 0),
(1291, 142, '鱼台县', 0),
(1292, 142, '金乡县', 0),
(1293, 142, '嘉祥县', 0),
(1294, 142, '汶上县', 0),
(1295, 142, '泗水县', 0),
(1296, 142, '梁山县', 0),
(1297, 142, '曲阜市', 0),
(1298, 142, '兖州市', 0),
(1299, 142, '邹城市', 0),
(1300, 143, '泰山区', 0),
(1301, 143, '岱岳区', 0),
(1302, 143, '宁阳县', 0),
(1303, 143, '东平县', 0),
(1304, 143, '新泰市', 0),
(1305, 143, '肥城市', 0),
(1306, 144, '环翠区', 0),
(1307, 144, '文登市', 0),
(1308, 144, '荣成市', 0),
(1309, 144, '乳山市', 0),
(1310, 145, '东港区', 0),
(1311, 145, '岚山区', 0),
(1312, 145, '五莲县', 0),
(1313, 145, '莒县', 0),
(1314, 146, '莱城区', 0),
(1315, 146, '钢城区', 0),
(1316, 147, '兰山区', 0),
(1317, 147, '罗庄区', 0),
(1318, 147, '河东区', 0),
(1319, 147, '沂南县', 0),
(1320, 147, '郯城县', 0),
(1321, 147, '沂水县', 0),
(1322, 147, '苍山县', 0),
(1323, 147, '费县', 0),
(1324, 147, '平邑县', 0),
(1325, 147, '莒南县', 0),
(1326, 147, '蒙阴县', 0),
(1327, 147, '临沭县', 0),
(1328, 148, '德城区', 0),
(1329, 148, '陵县', 0),
(1330, 148, '宁津县', 0),
(1331, 148, '庆云县', 0),
(1332, 148, '临邑县', 0),
(1333, 148, '齐河县', 0),
(1334, 148, '平原县', 0),
(1335, 148, '夏津县', 0),
(1336, 148, '武城县', 0),
(1337, 148, '乐陵市', 0),
(1338, 148, '禹城市', 0),
(1339, 149, '东昌府区', 0),
(1340, 149, '阳谷县', 0),
(1341, 149, '莘县', 0),
(1342, 149, '茌平县', 0),
(1343, 149, '东阿县', 0),
(1344, 149, '冠县', 0),
(1345, 149, '高唐县', 0),
(1346, 149, '临清市', 0),
(1347, 150, '滨城区', 0),
(1348, 150, '惠民县', 0),
(1349, 150, '阳信县', 0),
(1350, 150, '无棣县', 0),
(1351, 150, '沾化县', 0),
(1352, 150, '博兴县', 0),
(1353, 150, '邹平县', 0),
(1354, 151, '牡丹区', 0),
(1355, 151, '曹县', 0),
(1356, 151, '单县', 0),
(1357, 151, '成武县', 0),
(1358, 151, '巨野县', 0),
(1359, 151, '郓城县', 0),
(1360, 151, '鄄城县', 0),
(1361, 151, '定陶县', 0),
(1362, 151, '东明县', 0),
(1363, 152, '中原区', 0),
(1364, 152, '二七区', 0),
(1365, 152, '管城回族区', 0),
(1366, 152, '金水区', 0),
(1367, 152, '上街区', 0),
(1368, 152, '惠济区', 0),
(1369, 152, '中牟县', 0),
(1370, 152, '巩义市', 0),
(1371, 152, '荥阳市', 0),
(1372, 152, '新密市', 0),
(1373, 152, '新郑市', 0),
(1374, 152, '登封市', 0),
(1375, 153, '龙亭区', 0),
(1376, 153, '顺河回族区', 0),
(1377, 153, '鼓楼区', 0),
(1378, 153, '南关区', 0),
(1379, 153, '郊区', 0),
(1380, 153, '杞县', 0),
(1381, 153, '通许县', 0),
(1382, 153, '尉氏县', 0),
(1383, 153, '开封县', 0),
(1384, 153, '兰考县', 0),
(1385, 154, '老城区', 0),
(1386, 154, '西工区', 0),
(1387, 154, '廛河回族区', 0),
(1388, 154, '涧西区', 0),
(1389, 154, '吉利区', 0),
(1390, 154, '洛龙区', 0),
(1391, 154, '孟津县', 0),
(1392, 154, '新安县', 0),
(1393, 154, '栾川县', 0),
(1394, 154, '嵩县', 0),
(1395, 154, '汝阳县', 0),
(1396, 154, '宜阳县', 0),
(1397, 154, '洛宁县', 0),
(1398, 154, '伊川县', 0),
(1399, 154, '偃师市', 0),
(1400, 155, '新华区', 0),
(1401, 155, '卫东区', 0),
(1402, 155, '石龙区', 0),
(1403, 155, '湛河区', 0),
(1404, 155, '宝丰县', 0),
(1405, 155, '叶县', 0),
(1406, 155, '鲁山县', 0),
(1407, 155, '郏县', 0),
(1408, 155, '舞钢市', 0),
(1409, 155, '汝州市', 0),
(1410, 156, '文峰区', 0),
(1411, 156, '北关区', 0),
(1412, 156, '殷都区', 0),
(1413, 156, '龙安区', 0),
(1414, 156, '安阳县', 0),
(1415, 156, '汤阴县', 0),
(1416, 156, '滑县', 0),
(1417, 156, '内黄县', 0),
(1418, 156, '林州市', 0),
(1419, 157, '鹤山区', 0),
(1420, 157, '山城区', 0),
(1421, 157, '淇滨区', 0),
(1422, 157, '浚县', 0),
(1423, 157, '淇县', 0),
(1424, 158, '红旗区', 0),
(1425, 158, '卫滨区', 0),
(1426, 158, '凤泉区', 0),
(1427, 158, '牧野区', 0),
(1428, 158, '新乡县', 0),
(1429, 158, '获嘉县', 0),
(1430, 158, '原阳县', 0),
(1431, 158, '延津县', 0),
(1432, 158, '封丘县', 0),
(1433, 158, '长垣县', 0),
(1434, 158, '卫辉市', 0),
(1435, 158, '辉县市', 0),
(1436, 159, '解放区', 0),
(1437, 159, '中站区', 0),
(1438, 159, '马村区', 0),
(1439, 159, '山阳区', 0),
(1440, 159, '修武县', 0),
(1441, 159, '博爱县', 0),
(1442, 159, '武陟县', 0),
(1443, 159, '温县', 0),
(1444, 159, '济源市', 0),
(1445, 159, '沁阳市', 0),
(1446, 159, '孟州市', 0),
(1447, 160, '华龙区', 0),
(1448, 160, '清丰县', 0),
(1449, 160, '南乐县', 0),
(1450, 160, '范县', 0),
(1451, 160, '台前县', 0),
(1452, 160, '濮阳县', 0),
(1453, 161, '魏都区', 0),
(1454, 161, '许昌县', 0),
(1455, 161, '鄢陵县', 0),
(1456, 161, '襄城县', 0),
(1457, 161, '禹州市', 0),
(1458, 161, '长葛市', 0),
(1459, 162, '源汇区', 0),
(1460, 162, '郾城区', 0),
(1461, 162, '召陵区', 0),
(1462, 162, '舞阳县', 0),
(1463, 162, '临颍县', 0),
(1464, 163, '市辖区', 0),
(1465, 163, '湖滨区', 0),
(1466, 163, '渑池县', 0),
(1467, 163, '陕县', 0),
(1468, 163, '卢氏县', 0),
(1469, 163, '义马市', 0),
(1470, 163, '灵宝市', 0),
(1471, 164, '宛城区', 0),
(1472, 164, '卧龙区', 0),
(1473, 164, '南召县', 0),
(1474, 164, '方城县', 0),
(1475, 164, '西峡县', 0),
(1476, 164, '镇平县', 0),
(1477, 164, '内乡县', 0),
(1478, 164, '淅川县', 0),
(1479, 164, '社旗县', 0),
(1480, 164, '唐河县', 0),
(1481, 164, '新野县', 0),
(1482, 164, '桐柏县', 0),
(1483, 164, '邓州市', 0),
(1484, 165, '梁园区', 0),
(1485, 165, '睢阳区', 0),
(1486, 165, '民权县', 0),
(1487, 165, '睢县', 0),
(1488, 165, '宁陵县', 0),
(1489, 165, '柘城县', 0),
(1490, 165, '虞城县', 0),
(1491, 165, '夏邑县', 0),
(1492, 165, '永城市', 0),
(1493, 166, '浉河区', 0),
(1494, 166, '平桥区', 0),
(1495, 166, '罗山县', 0),
(1496, 166, '光山县', 0),
(1497, 166, '新县', 0),
(1498, 166, '商城县', 0),
(1499, 166, '固始县', 0),
(1500, 166, '潢川县', 0),
(1501, 166, '淮滨县', 0),
(1502, 166, '息县', 0),
(1503, 167, '川汇区', 0),
(1504, 167, '扶沟县', 0),
(1505, 167, '西华县', 0),
(1506, 167, '商水县', 0),
(1507, 167, '沈丘县', 0),
(1508, 167, '郸城县', 0),
(1509, 167, '淮阳县', 0),
(1510, 167, '太康县', 0),
(1511, 167, '鹿邑县', 0),
(1512, 167, '项城市', 0),
(1513, 168, '驿城区', 0),
(1514, 168, '西平县', 0),
(1515, 168, '上蔡县', 0),
(1516, 168, '平舆县', 0),
(1517, 168, '正阳县', 0),
(1518, 168, '确山县', 0),
(1519, 168, '泌阳县', 0),
(1520, 168, '汝南县', 0),
(1521, 168, '遂平县', 0),
(1522, 168, '新蔡县', 0),
(1523, 169, '江岸区', 0),
(1524, 169, '江汉区', 0),
(1525, 169, '硚口区', 0),
(1526, 169, '汉阳区', 0),
(1527, 169, '武昌区', 0),
(1528, 169, '青山区', 0),
(1529, 169, '洪山区', 0),
(1530, 169, '东西湖区', 0),
(1531, 169, '汉南区', 0),
(1532, 169, '蔡甸区', 0),
(1533, 169, '江夏区', 0),
(1534, 169, '黄陂区', 0),
(1535, 169, '新洲区', 0),
(1536, 170, '黄石港区', 0),
(1537, 170, '西塞山区', 0),
(1538, 170, '下陆区', 0),
(1539, 170, '铁山区', 0),
(1540, 170, '阳新县', 0),
(1541, 170, '大冶市', 0),
(1542, 171, '茅箭区', 0),
(1543, 171, '张湾区', 0),
(1544, 171, '郧县', 0),
(1545, 171, '郧西县', 0),
(1546, 171, '竹山县', 0),
(1547, 171, '竹溪县', 0),
(1548, 171, '房县', 0),
(1549, 171, '丹江口市', 0),
(1550, 172, '西陵区', 0),
(1551, 172, '伍家岗区', 0),
(1552, 172, '点军区', 0),
(1553, 172, '猇亭区', 0),
(1554, 172, '夷陵区', 0),
(1555, 172, '远安县', 0),
(1556, 172, '兴山县', 0),
(1557, 172, '秭归县', 0),
(1558, 172, '长阳土家族自治县', 0),
(1559, 172, '五峰土家族自治县', 0),
(1560, 172, '宜都市', 0),
(1561, 172, '当阳市', 0),
(1562, 172, '枝江市', 0),
(1563, 173, '襄城区', 0),
(1564, 173, '樊城区', 0),
(1565, 173, '襄阳区', 0),
(1566, 173, '南漳县', 0),
(1567, 173, '谷城县', 0),
(1568, 173, '保康县', 0),
(1569, 173, '老河口市', 0),
(1570, 173, '枣阳市', 0),
(1571, 173, '宜城市', 0),
(1572, 174, '梁子湖区', 0),
(1573, 174, '华容区', 0),
(1574, 174, '鄂城区', 0),
(1575, 175, '东宝区', 0),
(1576, 175, '掇刀区', 0),
(1577, 175, '京山县', 0),
(1578, 175, '沙洋县', 0),
(1579, 175, '钟祥市', 0),
(1580, 176, '孝南区', 0),
(1581, 176, '孝昌县', 0),
(1582, 176, '大悟县', 0),
(1583, 176, '云梦县', 0),
(1584, 176, '应城市', 0),
(1585, 176, '安陆市', 0),
(1586, 176, '汉川市', 0),
(1587, 177, '沙市区', 0),
(1588, 177, '荆州区', 0),
(1589, 177, '公安县', 0),
(1590, 177, '监利县', 0),
(1591, 177, '江陵县', 0),
(1592, 177, '石首市', 0),
(1593, 177, '洪湖市', 0),
(1594, 177, '松滋市', 0),
(1595, 178, '黄州区', 0),
(1596, 178, '团风县', 0),
(1597, 178, '红安县', 0),
(1598, 178, '罗田县', 0),
(1599, 178, '英山县', 0),
(1600, 178, '浠水县', 0),
(1601, 178, '蕲春县', 0),
(1602, 178, '黄梅县', 0),
(1603, 178, '麻城市', 0),
(1604, 178, '武穴市', 0),
(1605, 179, '咸安区', 0),
(1606, 179, '嘉鱼县', 0),
(1607, 179, '通城县', 0),
(1608, 179, '崇阳县', 0),
(1609, 179, '通山县', 0),
(1610, 179, '赤壁市', 0),
(1611, 180, '曾都区', 0),
(1612, 180, '广水市', 0),
(1613, 181, '恩施市', 0),
(1614, 181, '利川市', 0),
(1615, 181, '建始县', 0),
(1616, 181, '巴东县', 0),
(1617, 181, '宣恩县', 0),
(1618, 181, '咸丰县', 0),
(1619, 181, '来凤县', 0),
(1620, 181, '鹤峰县', 0),
(1621, 182, '仙桃市', 0),
(1622, 182, '潜江市', 0),
(1623, 182, '天门市', 0),
(1624, 182, '神农架林区', 0),
(1625, 183, '芙蓉区', 0),
(1626, 183, '天心区', 0),
(1627, 183, '岳麓区', 0),
(1628, 183, '开福区', 0),
(1629, 183, '雨花区', 0),
(1630, 183, '长沙县', 0),
(1631, 183, '望城县', 0),
(1632, 183, '宁乡县', 0),
(1633, 183, '浏阳市', 0),
(1634, 184, '荷塘区', 0),
(1635, 184, '芦淞区', 0),
(1636, 184, '石峰区', 0),
(1637, 184, '天元区', 0),
(1638, 184, '株洲县', 0),
(1639, 184, '攸县', 0),
(1640, 184, '茶陵县', 0),
(1641, 184, '炎陵县', 0),
(1642, 184, '醴陵市', 0),
(1643, 185, '雨湖区', 0),
(1644, 185, '岳塘区', 0),
(1645, 185, '湘潭县', 0),
(1646, 185, '湘乡市', 0),
(1647, 185, '韶山市', 0),
(1648, 186, '珠晖区', 0),
(1649, 186, '雁峰区', 0),
(1650, 186, '石鼓区', 0),
(1651, 186, '蒸湘区', 0),
(1652, 186, '南岳区', 0),
(1653, 186, '衡阳县', 0),
(1654, 186, '衡南县', 0),
(1655, 186, '衡山县', 0),
(1656, 186, '衡东县', 0),
(1657, 186, '祁东县', 0),
(1658, 186, '耒阳市', 0),
(1659, 186, '常宁市', 0),
(1660, 187, '双清区', 0),
(1661, 187, '大祥区', 0),
(1662, 187, '北塔区', 0),
(1663, 187, '邵东县', 0),
(1664, 187, '新邵县', 0),
(1665, 187, '邵阳县', 0),
(1666, 187, '隆回县', 0),
(1667, 187, '洞口县', 0),
(1668, 187, '绥宁县', 0),
(1669, 187, '新宁县', 0),
(1670, 187, '城步苗族自治县', 0),
(1671, 187, '武冈市', 0),
(1672, 188, '岳阳楼区', 0),
(1673, 188, '云溪区', 0),
(1674, 188, '君山区', 0),
(1675, 188, '岳阳县', 0),
(1676, 188, '华容县', 0),
(1677, 188, '湘阴县', 0),
(1678, 188, '平江县', 0),
(1679, 188, '汨罗市', 0),
(1680, 188, '临湘市', 0),
(1681, 189, '武陵区', 0),
(1682, 189, '鼎城区', 0),
(1683, 189, '安乡县', 0),
(1684, 189, '汉寿县', 0),
(1685, 189, '澧县', 0),
(1686, 189, '临澧县', 0),
(1687, 189, '桃源县', 0),
(1688, 189, '石门县', 0),
(1689, 189, '津市市', 0),
(1690, 190, '永定区', 0),
(1691, 190, '武陵源区', 0),
(1692, 190, '慈利县', 0),
(1693, 190, '桑植县', 0),
(1694, 191, '资阳区', 0),
(1695, 191, '赫山区', 0),
(1696, 191, '南县', 0),
(1697, 191, '桃江县', 0),
(1698, 191, '安化县', 0),
(1699, 191, '沅江市', 0),
(1700, 192, '北湖区', 0),
(1701, 192, '苏仙区', 0),
(1702, 192, '桂阳县', 0),
(1703, 192, '宜章县', 0),
(1704, 192, '永兴县', 0),
(1705, 192, '嘉禾县', 0),
(1706, 192, '临武县', 0),
(1707, 192, '汝城县', 0),
(1708, 192, '桂东县', 0),
(1709, 192, '安仁县', 0),
(1710, 192, '资兴市', 0),
(1711, 193, '芝山区', 0),
(1712, 193, '冷水滩区', 0),
(1713, 193, '祁阳县', 0),
(1714, 193, '东安县', 0),
(1715, 193, '双牌县', 0),
(1716, 193, '道县', 0),
(1717, 193, '江永县', 0),
(1718, 193, '宁远县', 0),
(1719, 193, '蓝山县', 0),
(1720, 193, '新田县', 0),
(1721, 193, '江华瑶族自治县', 0),
(1722, 194, '鹤城区', 0),
(1723, 194, '中方县', 0),
(1724, 194, '沅陵县', 0),
(1725, 194, '辰溪县', 0),
(1726, 194, '溆浦县', 0),
(1727, 194, '会同县', 0),
(1728, 194, '麻阳苗族自治县', 0),
(1729, 194, '新晃侗族自治县', 0),
(1730, 194, '芷江侗族自治县', 0),
(1731, 194, '靖州苗族侗族自治县', 0),
(1732, 194, '通道侗族自治县', 0),
(1733, 194, '洪江市', 0),
(1734, 195, '娄星区', 0),
(1735, 195, '双峰县', 0),
(1736, 195, '新化县', 0),
(1737, 195, '冷水江市', 0),
(1738, 195, '涟源市', 0),
(1739, 196, '吉首市', 0),
(1740, 196, '泸溪县', 0),
(1741, 196, '凤凰县', 0),
(1742, 196, '花垣县', 0),
(1743, 196, '保靖县', 0),
(1744, 196, '古丈县', 0),
(1745, 196, '永顺县', 0),
(1746, 196, '龙山县', 0),
(1747, 197, '东山区', 0),
(1748, 197, '荔湾区', 0),
(1749, 197, '越秀区', 0),
(1750, 197, '海珠区', 0),
(1751, 197, '天河区', 0),
(1752, 197, '芳村区', 0),
(1753, 197, '白云区', 0),
(1754, 197, '黄埔区', 0),
(1755, 197, '番禺区', 0),
(1756, 197, '花都区', 0),
(1757, 197, '增城市', 0),
(1759, 198, '武江区', 0),
(1760, 198, '浈江区', 0),
(1761, 198, '曲江区', 0),
(1762, 198, '始兴县', 0),
(1763, 198, '仁化县', 0),
(1764, 198, '翁源县', 0),
(1765, 198, '乳源瑶族自治县', 0),
(1766, 198, '新丰县', 0),
(1767, 198, '乐昌市', 0),
(1768, 198, '南雄市', 0),
(1769, 199, '罗湖区', 0),
(1770, 199, '福田区', 0),
(1771, 199, '南山区', 0),
(1772, 199, '宝安区', 0),
(1773, 199, '龙岗区', 0),
(1774, 199, '盐田区', 0),
(1775, 200, '香洲区', 0),
(1776, 200, '斗门区', 0),
(1777, 200, '金湾区', 0),
(1778, 201, '龙湖区', 0),
(1779, 201, '金平区', 0),
(1780, 201, '濠江区', 0),
(1781, 201, '潮阳区', 0),
(1782, 201, '潮南区', 0),
(1783, 201, '澄海区', 0),
(1784, 201, '南澳县', 0),
(1785, 202, '禅城区', 0),
(1786, 202, '南海区', 0),
(1787, 202, '顺德区', 0),
(1788, 202, '三水区', 0),
(1789, 202, '高明区', 0),
(1790, 203, '蓬江区', 0),
(1791, 203, '江海区', 0),
(1792, 203, '新会区', 0),
(1793, 203, '台山市', 0),
(1794, 203, '开平市', 0),
(1795, 203, '鹤山市', 0),
(1796, 203, '恩平市', 0),
(1797, 204, '赤坎区', 0),
(1798, 204, '霞山区', 0),
(1799, 204, '坡头区', 0),
(1800, 204, '麻章区', 0),
(1801, 204, '遂溪县', 0),
(1802, 204, '徐闻县', 0),
(1803, 204, '廉江市', 0),
(1804, 204, '雷州市', 0),
(1805, 204, '吴川市', 0),
(1806, 205, '茂南区', 0),
(1807, 205, '茂港区', 0),
(1808, 205, '电白县', 0),
(1809, 205, '高州市', 0),
(1810, 205, '化州市', 0),
(1811, 205, '信宜市', 0),
(1812, 206, '端州区', 0),
(1813, 206, '鼎湖区', 0),
(1814, 206, '广宁县', 0),
(1815, 206, '怀集县', 0),
(1816, 206, '封开县', 0),
(1817, 206, '德庆县', 0),
(1818, 206, '高要市', 0),
(1819, 206, '四会市', 0),
(1820, 207, '惠城区', 0),
(1821, 207, '惠阳区', 0),
(1822, 207, '博罗县', 0),
(1823, 207, '惠东县', 0),
(1824, 207, '龙门县', 0),
(1825, 208, '梅江区', 0),
(1826, 208, '梅县', 0),
(1827, 208, '大埔县', 0),
(1828, 208, '丰顺县', 0),
(1829, 208, '五华县', 0),
(1830, 208, '平远县', 0),
(1831, 208, '蕉岭县', 0),
(1832, 208, '兴宁市', 0),
(1833, 209, '城区', 0),
(1834, 209, '海丰县', 0),
(1835, 209, '陆河县', 0),
(1836, 209, '陆丰市', 0),
(1837, 210, '源城区', 0),
(1838, 210, '紫金县', 0),
(1839, 210, '龙川县', 0),
(1840, 210, '连平县', 0),
(1841, 210, '和平县', 0),
(1842, 210, '东源县', 0),
(1843, 211, '江城区', 0),
(1844, 211, '阳西县', 0),
(1845, 211, '阳东县', 0),
(1846, 211, '阳春市', 0),
(1847, 212, '清城区', 0),
(1848, 212, '佛冈县', 0),
(1849, 212, '阳山县', 0),
(1850, 212, '连山壮族瑶族自治县', 0),
(1851, 212, '连南瑶族自治县', 0),
(1852, 212, '清新县', 0),
(1853, 212, '英德市', 0),
(1854, 212, '连州市', 0),
(1855, 215, '湘桥区', 0),
(1856, 215, '潮安县', 0),
(1857, 215, '饶平县', 0),
(1858, 216, '榕城区', 0),
(1859, 216, '揭东县', 0),
(1860, 216, '揭西县', 0),
(1861, 216, '惠来县', 0),
(1862, 216, '普宁市', 0),
(1863, 217, '云城区', 0),
(1864, 217, '新兴县', 0),
(1865, 217, '郁南县', 0),
(1866, 217, '云安县', 0),
(1867, 217, '罗定市', 0),
(1868, 218, '兴宁区', 0),
(1869, 218, '青秀区', 0),
(1870, 218, '江南区', 0),
(1871, 218, '西乡塘区', 0),
(1872, 218, '良庆区', 0),
(1873, 218, '邕宁区', 0),
(1874, 218, '武鸣县', 0),
(1875, 218, '隆安县', 0),
(1876, 218, '马山县', 0),
(1877, 218, '上林县', 0),
(1878, 218, '宾阳县', 0),
(1879, 218, '横县', 0),
(1880, 219, '城中区', 0),
(1881, 219, '鱼峰区', 0),
(1882, 219, '柳南区', 0),
(1883, 219, '柳北区', 0),
(1884, 219, '柳江县', 0),
(1885, 219, '柳城县', 0),
(1886, 219, '鹿寨县', 0),
(1887, 219, '融安县', 0),
(1888, 219, '融水苗族自治县', 0),
(1889, 219, '三江侗族自治县', 0),
(1890, 220, '秀峰区', 0),
(1891, 220, '叠彩区', 0),
(1892, 220, '象山区', 0),
(1893, 220, '七星区', 0),
(1894, 220, '雁山区', 0),
(1895, 220, '阳朔县', 0),
(1896, 220, '临桂县', 0),
(1897, 220, '灵川县', 0),
(1898, 220, '全州县', 0),
(1899, 220, '兴安县', 0),
(1900, 220, '永福县', 0),
(1901, 220, '灌阳县', 0),
(1902, 220, '龙胜各族自治县', 0),
(1903, 220, '资源县', 0),
(1904, 220, '平乐县', 0),
(1905, 220, '荔蒲县', 0),
(1906, 220, '恭城瑶族自治县', 0),
(1907, 221, '万秀区', 0),
(1908, 221, '蝶山区', 0),
(1909, 221, '长洲区', 0),
(1910, 221, '苍梧县', 0),
(1911, 221, '藤县', 0),
(1912, 221, '蒙山县', 0),
(1913, 221, '岑溪市', 0),
(1914, 222, '海城区', 0),
(1915, 222, '银海区', 0),
(1916, 222, '铁山港区', 0),
(1917, 222, '合浦县', 0),
(1918, 223, '港口区', 0),
(1919, 223, '防城区', 0),
(1920, 223, '上思县', 0),
(1921, 223, '东兴市', 0),
(1922, 224, '钦南区', 0),
(1923, 224, '钦北区', 0),
(1924, 224, '灵山县', 0),
(1925, 224, '浦北县', 0),
(1926, 225, '港北区', 0),
(1927, 225, '港南区', 0),
(1928, 225, '覃塘区', 0),
(1929, 225, '平南县', 0),
(1930, 225, '桂平市', 0),
(1931, 226, '玉州区', 0),
(1932, 226, '容县', 0),
(1933, 226, '陆川县', 0),
(1934, 226, '博白县', 0),
(1935, 226, '兴业县', 0),
(1936, 226, '北流市', 0),
(1937, 227, '右江区', 0),
(1938, 227, '田阳县', 0),
(1939, 227, '田东县', 0),
(1940, 227, '平果县', 0),
(1941, 227, '德保县', 0),
(1942, 227, '靖西县', 0),
(1943, 227, '那坡县', 0),
(1944, 227, '凌云县', 0),
(1945, 227, '乐业县', 0),
(1946, 227, '田林县', 0),
(1947, 227, '西林县', 0),
(1948, 227, '隆林各族自治县', 0),
(1949, 228, '八步区', 0),
(1950, 228, '昭平县', 0),
(1951, 228, '钟山县', 0),
(1952, 228, '富川瑶族自治县', 0),
(1953, 229, '金城江区', 0),
(1954, 229, '南丹县', 0),
(1955, 229, '天峨县', 0),
(1956, 229, '凤山县', 0),
(1957, 229, '东兰县', 0),
(1958, 229, '罗城仫佬族自治县', 0),
(1959, 229, '环江毛南族自治县', 0),
(1960, 229, '巴马瑶族自治县', 0),
(1961, 229, '都安瑶族自治县', 0),
(1962, 229, '大化瑶族自治县', 0),
(1963, 229, '宜州市', 0),
(1964, 230, '兴宾区', 0),
(1965, 230, '忻城县', 0),
(1966, 230, '象州县', 0),
(1967, 230, '武宣县', 0),
(1968, 230, '金秀瑶族自治县', 0),
(1969, 230, '合山市', 0),
(1970, 231, '江洲区', 0),
(1971, 231, '扶绥县', 0),
(1972, 231, '宁明县', 0),
(1973, 231, '龙州县', 0),
(1974, 231, '大新县', 0),
(1975, 231, '天等县', 0),
(1976, 231, '凭祥市', 0),
(1977, 232, '秀英区', 0),
(1978, 232, '龙华区', 0),
(1979, 232, '琼山区', 0),
(1980, 232, '美兰区', 0),
(1981, 233, '五指山市', 0),
(1982, 233, '琼海市', 0),
(1983, 233, '儋州市', 0),
(1984, 233, '文昌市', 0),
(1985, 233, '万宁市', 0),
(1986, 233, '东方市', 0),
(1987, 233, '定安县', 0),
(1988, 233, '屯昌县', 0),
(1989, 233, '澄迈县', 0),
(1990, 233, '临高县', 0),
(1991, 233, '白沙黎族自治县', 0),
(1992, 233, '昌江黎族自治县', 0),
(1993, 233, '乐东黎族自治县', 0),
(1994, 233, '陵水黎族自治县', 0),
(1995, 233, '保亭黎族苗族自治县', 0),
(1996, 233, '琼中黎族苗族自治县', 0),
(1997, 233, '西沙群岛', 0),
(1998, 233, '南沙群岛', 0),
(1999, 233, '中沙群岛的岛礁及其海域', 0),
(2000, 234, '万州区', 0),
(2001, 234, '涪陵区', 0),
(2002, 234, '渝中区', 0),
(2003, 234, '大渡口区', 0),
(2004, 234, '江北区', 0),
(2005, 234, '沙坪坝区', 0),
(2006, 234, '九龙坡区', 0),
(2007, 234, '南岸区', 0),
(2008, 234, '北碚区', 0),
(2009, 234, '万盛区', 0),
(2010, 234, '双桥区', 0),
(2011, 234, '渝北区', 0),
(2012, 234, '巴南区', 0),
(2013, 234, '黔江区', 0),
(2014, 234, '长寿区', 0),
(2015, 234, '綦江县', 0),
(2016, 234, '潼南县', 0),
(2017, 234, '铜梁县', 0),
(2018, 234, '大足县', 0),
(2019, 234, '荣昌县', 0),
(2020, 234, '璧山县', 0),
(2021, 234, '梁平县', 0),
(2022, 234, '城口县', 0),
(2023, 234, '丰都县', 0),
(2024, 234, '垫江县', 0),
(2025, 234, '武隆县', 0),
(2026, 234, '忠县', 0),
(2027, 234, '开县', 0),
(2028, 234, '云阳县', 0),
(2029, 234, '奉节县', 0),
(2030, 234, '巫山县', 0),
(2031, 234, '巫溪县', 0),
(2032, 234, '石柱土家族自治县', 0),
(2033, 234, '秀山土家族苗族自治县', 0),
(2034, 234, '酉阳土家族苗族自治县', 0),
(2035, 234, '彭水苗族土家族自治县', 0),
(2036, 234, '江津市', 0),
(2037, 234, '合川市', 0),
(2038, 234, '永川市', 0),
(2039, 234, '南川市', 0),
(2040, 235, '锦江区', 0),
(2041, 235, '青羊区', 0),
(2042, 235, '金牛区', 0),
(2043, 235, '武侯区', 0),
(2044, 235, '成华区', 0),
(2045, 235, '龙泉驿区', 0),
(2046, 235, '青白江区', 0),
(2047, 235, '新都区', 0),
(2048, 235, '温江区', 0),
(2049, 235, '金堂县', 0),
(2050, 235, '双流县', 0),
(2051, 235, '郫县', 0),
(2052, 235, '大邑县', 0),
(2053, 235, '蒲江县', 0),
(2054, 235, '新津县', 0),
(2055, 235, '都江堰市', 0),
(2056, 235, '彭州市', 0),
(2057, 235, '邛崃市', 0),
(2058, 235, '崇州市', 0),
(2059, 236, '自流井区', 0),
(2060, 236, '贡井区', 0),
(2061, 236, '大安区', 0),
(2062, 236, '沿滩区', 0),
(2063, 236, '荣县', 0),
(2064, 236, '富顺县', 0),
(2065, 237, '东区', 0),
(2066, 237, '西区', 0),
(2067, 237, '仁和区', 0),
(2068, 237, '米易县', 0),
(2069, 237, '盐边县', 0),
(2070, 238, '江阳区', 0),
(2071, 238, '纳溪区', 0),
(2072, 238, '龙马潭区', 0),
(2073, 238, '泸县', 0),
(2074, 238, '合江县', 0),
(2075, 238, '叙永县', 0),
(2076, 238, '古蔺县', 0),
(2077, 239, '旌阳区', 0),
(2078, 239, '中江县', 0),
(2079, 239, '罗江县', 0),
(2080, 239, '广汉市', 0),
(2081, 239, '什邡市', 0),
(2082, 239, '绵竹市', 0),
(2083, 240, '涪城区', 0),
(2084, 240, '游仙区', 0),
(2085, 240, '三台县', 0),
(2086, 240, '盐亭县', 0),
(2087, 240, '安县', 0),
(2088, 240, '梓潼县', 0),
(2089, 240, '北川羌族自治县', 0),
(2090, 240, '平武县', 0),
(2091, 240, '江油市', 0),
(2092, 241, '市中区', 0),
(2093, 241, '元坝区', 0),
(2094, 241, '朝天区', 0),
(2095, 241, '旺苍县', 0),
(2096, 241, '青川县', 0),
(2097, 241, '剑阁县', 0),
(2098, 241, '苍溪县', 0),
(2099, 242, '船山区', 0),
(2100, 242, '安居区', 0),
(2101, 242, '蓬溪县', 0),
(2102, 242, '射洪县', 0),
(2103, 242, '大英县', 0),
(2104, 243, '市中区', 0),
(2105, 243, '东兴区', 0),
(2106, 243, '威远县', 0),
(2107, 243, '资中县', 0),
(2108, 243, '隆昌县', 0),
(2109, 244, '市中区', 0),
(2110, 244, '沙湾区', 0),
(2111, 244, '五通桥区', 0),
(2112, 244, '金口河区', 0),
(2113, 244, '犍为县', 0),
(2114, 244, '井研县', 0),
(2115, 244, '夹江县', 0),
(2116, 244, '沐川县', 0),
(2117, 244, '峨边彝族自治县', 0),
(2118, 244, '马边彝族自治县', 0),
(2119, 244, '峨眉山市', 0),
(2120, 245, '顺庆区', 0),
(2121, 245, '高坪区', 0),
(2122, 245, '嘉陵区', 0),
(2123, 245, '南部县', 0),
(2124, 245, '营山县', 0),
(2125, 245, '蓬安县', 0),
(2126, 245, '仪陇县', 0),
(2127, 245, '西充县', 0),
(2128, 245, '阆中市', 0),
(2129, 246, '东坡区', 0),
(2130, 246, '仁寿县', 0),
(2131, 246, '彭山县', 0),
(2132, 246, '洪雅县', 0),
(2133, 246, '丹棱县', 0),
(2134, 246, '青神县', 0),
(2135, 247, '翠屏区', 0),
(2136, 247, '宜宾县', 0),
(2137, 247, '南溪县', 0),
(2138, 247, '江安县', 0),
(2139, 247, '长宁县', 0),
(2140, 247, '高县', 0),
(2141, 247, '珙县', 0),
(2142, 247, '筠连县', 0),
(2143, 247, '兴文县', 0),
(2144, 247, '屏山县', 0),
(2145, 248, '广安区', 0),
(2146, 248, '岳池县', 0),
(2147, 248, '武胜县', 0),
(2148, 248, '邻水县', 0),
(2149, 248, '华蓥市', 0),
(2150, 249, '通川区', 0),
(2151, 249, '达县', 0),
(2152, 249, '宣汉县', 0),
(2153, 249, '开江县', 0),
(2154, 249, '大竹县', 0),
(2155, 249, '渠县', 0),
(2156, 249, '万源市', 0),
(2157, 250, '雨城区', 0),
(2158, 250, '名山县', 0),
(2159, 250, '荥经县', 0),
(2160, 250, '汉源县', 0),
(2161, 250, '石棉县', 0),
(2162, 250, '天全县', 0),
(2163, 250, '芦山县', 0),
(2164, 250, '宝兴县', 0),
(2165, 251, '巴州区', 0),
(2166, 251, '通江县', 0),
(2167, 251, '南江县', 0),
(2168, 251, '平昌县', 0),
(2169, 252, '雁江区', 0),
(2170, 252, '安岳县', 0),
(2171, 252, '乐至县', 0),
(2172, 252, '简阳市', 0),
(2173, 253, '汶川县', 0),
(2174, 253, '理县', 0),
(2175, 253, '茂县', 0),
(2176, 253, '松潘县', 0),
(2177, 253, '九寨沟县', 0),
(2178, 253, '金川县', 0),
(2179, 253, '小金县', 0),
(2180, 253, '黑水县', 0),
(2181, 253, '马尔康县', 0),
(2182, 253, '壤塘县', 0),
(2183, 253, '阿坝县', 0),
(2184, 253, '若尔盖县', 0),
(2185, 253, '红原县', 0),
(2186, 254, '康定县', 0),
(2187, 254, '泸定县', 0),
(2188, 254, '丹巴县', 0),
(2189, 254, '九龙县', 0),
(2190, 254, '雅江县', 0),
(2191, 254, '道孚县', 0),
(2192, 254, '炉霍县', 0),
(2193, 254, '甘孜县', 0),
(2194, 254, '新龙县', 0),
(2195, 254, '德格县', 0),
(2196, 254, '白玉县', 0),
(2197, 254, '石渠县', 0),
(2198, 254, '色达县', 0),
(2199, 254, '理塘县', 0),
(2200, 254, '巴塘县', 0),
(2201, 254, '乡城县', 0),
(2202, 254, '稻城县', 0),
(2203, 254, '得荣县', 0),
(2204, 255, '西昌市', 0),
(2205, 255, '木里藏族自治县', 0),
(2206, 255, '盐源县', 0),
(2207, 255, '德昌县', 0),
(2208, 255, '会理县', 0),
(2209, 255, '会东县', 0),
(2210, 255, '宁南县', 0),
(2211, 255, '普格县', 0),
(2212, 255, '布拖县', 0),
(2213, 255, '金阳县', 0),
(2214, 255, '昭觉县', 0),
(2215, 255, '喜德县', 0),
(2216, 255, '冕宁县', 0),
(2217, 255, '越西县', 0),
(2218, 255, '甘洛县', 0),
(2219, 255, '美姑县', 0),
(2220, 255, '雷波县', 0),
(2221, 256, '南明区', 0),
(2222, 256, '云岩区', 0),
(2223, 256, '花溪区', 0),
(2224, 256, '乌当区', 0),
(2225, 256, '白云区', 0),
(2226, 256, '小河区', 0),
(2227, 256, '开阳县', 0),
(2228, 256, '息烽县', 0),
(2229, 256, '修文县', 0),
(2230, 256, '清镇市', 0),
(2231, 257, '钟山区', 0),
(2232, 257, '六枝特区', 0),
(2233, 257, '水城县', 0),
(2234, 257, '盘县', 0),
(2235, 258, '红花岗区', 0),
(2236, 258, '汇川区', 0),
(2237, 258, '遵义县', 0),
(2238, 258, '桐梓县', 0),
(2239, 258, '绥阳县', 0),
(2240, 258, '正安县', 0),
(2241, 258, '道真仡佬族苗族自治县', 0),
(2242, 258, '务川仡佬族苗族自治县', 0),
(2243, 258, '凤冈县', 0),
(2244, 258, '湄潭县', 0),
(2245, 258, '余庆县', 0),
(2246, 258, '习水县', 0),
(2247, 258, '赤水市', 0),
(2248, 258, '仁怀市', 0),
(2249, 259, '西秀区', 0),
(2250, 259, '平坝县', 0),
(2251, 259, '普定县', 0),
(2252, 259, '镇宁布依族苗族自治县', 0),
(2253, 259, '关岭布依族苗族自治县', 0),
(2254, 259, '紫云苗族布依族自治县', 0),
(2255, 260, '铜仁市', 0),
(2256, 260, '江口县', 0),
(2257, 260, '玉屏侗族自治县', 0),
(2258, 260, '石阡县', 0),
(2259, 260, '思南县', 0),
(2260, 260, '印江土家族苗族自治县', 0),
(2261, 260, '德江县', 0),
(2262, 260, '沿河土家族自治县', 0),
(2263, 260, '松桃苗族自治县', 0),
(2264, 260, '万山特区', 0),
(2265, 261, '兴义市', 0),
(2266, 261, '兴仁县', 0),
(2267, 261, '普安县', 0),
(2268, 261, '晴隆县', 0),
(2269, 261, '贞丰县', 0),
(2270, 261, '望谟县', 0),
(2271, 261, '册亨县', 0),
(2272, 261, '安龙县', 0),
(2273, 262, '毕节市', 0),
(2274, 262, '大方县', 0),
(2275, 262, '黔西县', 0),
(2276, 262, '金沙县', 0),
(2277, 262, '织金县', 0),
(2278, 262, '纳雍县', 0),
(2279, 262, '威宁彝族回族苗族自治县', 0),
(2280, 262, '赫章县', 0),
(2281, 263, '凯里市', 0),
(2282, 263, '黄平县', 0),
(2283, 263, '施秉县', 0),
(2284, 263, '三穗县', 0),
(2285, 263, '镇远县', 0),
(2286, 263, '岑巩县', 0),
(2287, 263, '天柱县', 0),
(2288, 263, '锦屏县', 0),
(2289, 263, '剑河县', 0),
(2290, 263, '台江县', 0),
(2291, 263, '黎平县', 0),
(2292, 263, '榕江县', 0),
(2293, 263, '从江县', 0),
(2294, 263, '雷山县', 0),
(2295, 263, '麻江县', 0),
(2296, 263, '丹寨县', 0),
(2297, 264, '都匀市', 0),
(2298, 264, '福泉市', 0),
(2299, 264, '荔波县', 0),
(2300, 264, '贵定县', 0),
(2301, 264, '瓮安县', 0),
(2302, 264, '独山县', 0),
(2303, 264, '平塘县', 0),
(2304, 264, '罗甸县', 0),
(2305, 264, '长顺县', 0),
(2306, 264, '龙里县', 0),
(2307, 264, '惠水县', 0),
(2308, 264, '三都水族自治县', 0),
(2309, 265, '五华区', 0),
(2310, 265, '盘龙区', 0),
(2311, 265, '官渡区', 0),
(2312, 265, '西山区', 0),
(2313, 265, '东川区', 0),
(2314, 265, '呈贡县', 0),
(2315, 265, '晋宁县', 0),
(2316, 265, '富民县', 0),
(2317, 265, '宜良县', 0),
(2318, 265, '石林彝族自治县', 0),
(2319, 265, '嵩明县', 0),
(2320, 265, '禄劝彝族苗族自治县', 0),
(2321, 265, '寻甸回族彝族自治县', 0),
(2322, 265, '安宁市', 0),
(2323, 266, '麒麟区', 0),
(2324, 266, '马龙县', 0),
(2325, 266, '陆良县', 0),
(2326, 266, '师宗县', 0),
(2327, 266, '罗平县', 0),
(2328, 266, '富源县', 0),
(2329, 266, '会泽县', 0),
(2330, 266, '沾益县', 0),
(2331, 266, '宣威市', 0),
(2332, 267, '红塔区', 0),
(2333, 267, '江川县', 0),
(2334, 267, '澄江县', 0),
(2335, 267, '通海县', 0),
(2336, 267, '华宁县', 0),
(2337, 267, '易门县', 0),
(2338, 267, '峨山彝族自治县', 0),
(2339, 267, '新平彝族傣族自治县', 0),
(2340, 267, '元江哈尼族彝族傣族自治县', 0),
(2341, 268, '隆阳区', 0),
(2342, 268, '施甸县', 0),
(2343, 268, '腾冲县', 0),
(2344, 268, '龙陵县', 0),
(2345, 268, '昌宁县', 0),
(2346, 269, '昭阳区', 0),
(2347, 269, '鲁甸县', 0),
(2348, 269, '巧家县', 0),
(2349, 269, '盐津县', 0),
(2350, 269, '大关县', 0),
(2351, 269, '永善县', 0),
(2352, 269, '绥江县', 0),
(2353, 269, '镇雄县', 0),
(2354, 269, '彝良县', 0),
(2355, 269, '威信县', 0),
(2356, 269, '水富县', 0),
(2357, 270, '古城区', 0),
(2358, 270, '玉龙纳西族自治县', 0),
(2359, 270, '永胜县', 0),
(2360, 270, '华坪县', 0),
(2361, 270, '宁蒗彝族自治县', 0),
(2362, 271, '翠云区', 0),
(2363, 271, '普洱哈尼族彝族自治县', 0),
(2364, 271, '墨江哈尼族自治县', 0),
(2365, 271, '景东彝族自治县', 0),
(2366, 271, '景谷傣族彝族自治县', 0),
(2367, 271, '镇沅彝族哈尼族拉祜族自治县', 0),
(2368, 271, '江城哈尼族彝族自治县', 0),
(2369, 271, '孟连傣族拉祜族佤族自治县', 0),
(2370, 271, '澜沧拉祜族自治县', 0),
(2371, 271, '西盟佤族自治县', 0),
(2372, 272, '临翔区', 0),
(2373, 272, '凤庆县', 0),
(2374, 272, '云县', 0),
(2375, 272, '永德县', 0),
(2376, 272, '镇康县', 0),
(2377, 272, '双江拉祜族佤族布朗族傣族自治县', 0),
(2378, 272, '耿马傣族佤族自治县', 0),
(2379, 272, '沧源佤族自治县', 0),
(2380, 273, '楚雄市', 0),
(2381, 273, '双柏县', 0),
(2382, 273, '牟定县', 0),
(2383, 273, '南华县', 0),
(2384, 273, '姚安县', 0),
(2385, 273, '大姚县', 0),
(2386, 273, '永仁县', 0),
(2387, 273, '元谋县', 0),
(2388, 273, '武定县', 0),
(2389, 273, '禄丰县', 0),
(2390, 274, '个旧市', 0),
(2391, 274, '开远市', 0),
(2392, 274, '蒙自县', 0),
(2393, 274, '屏边苗族自治县', 0),
(2394, 274, '建水县', 0),
(2395, 274, '石屏县', 0),
(2396, 274, '弥勒县', 0),
(2397, 274, '泸西县', 0),
(2398, 274, '元阳县', 0),
(2399, 274, '红河县', 0),
(2400, 274, '金平苗族瑶族傣族自治县', 0),
(2401, 274, '绿春县', 0),
(2402, 274, '河口瑶族自治县', 0),
(2403, 275, '文山县', 0),
(2404, 275, '砚山县', 0),
(2405, 275, '西畴县', 0),
(2406, 275, '麻栗坡县', 0),
(2407, 275, '马关县', 0),
(2408, 275, '丘北县', 0),
(2409, 275, '广南县', 0),
(2410, 275, '富宁县', 0),
(2411, 276, '景洪市', 0),
(2412, 276, '勐海县', 0),
(2413, 276, '勐腊县', 0),
(2414, 277, '大理市', 0),
(2415, 277, '漾濞彝族自治县', 0),
(2416, 277, '祥云县', 0),
(2417, 277, '宾川县', 0),
(2418, 277, '弥渡县', 0),
(2419, 277, '南涧彝族自治县', 0),
(2420, 277, '巍山彝族回族自治县', 0),
(2421, 277, '永平县', 0),
(2422, 277, '云龙县', 0),
(2423, 277, '洱源县', 0),
(2424, 277, '剑川县', 0),
(2425, 277, '鹤庆县', 0),
(2426, 278, '瑞丽市', 0),
(2427, 278, '潞西市', 0),
(2428, 278, '梁河县', 0),
(2429, 278, '盈江县', 0),
(2430, 278, '陇川县', 0),
(2431, 279, '泸水县', 0),
(2432, 279, '福贡县', 0),
(2433, 279, '贡山独龙族怒族自治县', 0),
(2434, 279, '兰坪白族普米族自治县', 0),
(2435, 280, '香格里拉县', 0),
(2436, 280, '德钦县', 0),
(2437, 280, '维西傈僳族自治县', 0),
(2438, 281, '城关区', 0),
(2439, 281, '林周县', 0),
(2440, 281, '当雄县', 0),
(2441, 281, '尼木县', 0),
(2442, 281, '曲水县', 0),
(2443, 281, '堆龙德庆县', 0),
(2444, 281, '达孜县', 0),
(2445, 281, '墨竹工卡县', 0),
(2446, 282, '昌都县', 0),
(2447, 282, '江达县', 0),
(2448, 282, '贡觉县', 0),
(2449, 282, '类乌齐县', 0),
(2450, 282, '丁青县', 0),
(2451, 282, '察雅县', 0);
INSERT INTO `sys_district` (`district_id`, `city_id`, `district_name`, `sort`) VALUES
(2452, 282, '八宿县', 0),
(2453, 282, '左贡县', 0),
(2454, 282, '芒康县', 0),
(2455, 282, '洛隆县', 0),
(2456, 282, '边坝县', 0),
(2457, 283, '乃东县', 0),
(2458, 283, '扎囊县', 0),
(2459, 283, '贡嘎县', 0),
(2460, 283, '桑日县', 0),
(2461, 283, '琼结县', 0),
(2462, 283, '曲松县', 0),
(2463, 283, '措美县', 0),
(2464, 283, '洛扎县', 0),
(2465, 283, '加查县', 0),
(2466, 283, '隆子县', 0),
(2467, 283, '错那县', 0),
(2468, 283, '浪卡子县', 0),
(2469, 284, '日喀则市', 0),
(2470, 284, '南木林县', 0),
(2471, 284, '江孜县', 0),
(2472, 284, '定日县', 0),
(2473, 284, '萨迦县', 0),
(2474, 284, '拉孜县', 0),
(2475, 284, '昂仁县', 0),
(2476, 284, '谢通门县', 0),
(2477, 284, '白朗县', 0),
(2478, 284, '仁布县', 0),
(2479, 284, '康马县', 0),
(2480, 284, '定结县', 0),
(2481, 284, '仲巴县', 0),
(2482, 284, '亚东县', 0),
(2483, 284, '吉隆县', 0),
(2484, 284, '聂拉木县', 0),
(2485, 284, '萨嘎县', 0),
(2486, 284, '岗巴县', 0),
(2487, 285, '那曲县', 0),
(2488, 285, '嘉黎县', 0),
(2489, 285, '比如县', 0),
(2490, 285, '聂荣县', 0),
(2491, 285, '安多县', 0),
(2492, 285, '申扎县', 0),
(2493, 285, '索县', 0),
(2494, 285, '班戈县', 0),
(2495, 285, '巴青县', 0),
(2496, 285, '尼玛县', 0),
(2497, 286, '普兰县', 0),
(2498, 286, '札达县', 0),
(2499, 286, '噶尔县', 0),
(2500, 286, '日土县', 0),
(2501, 286, '革吉县', 0),
(2502, 286, '改则县', 0),
(2503, 286, '措勤县', 0),
(2504, 287, '林芝县', 0),
(2505, 287, '工布江达县', 0),
(2506, 287, '米林县', 0),
(2507, 287, '墨脱县', 0),
(2508, 287, '波密县', 0),
(2509, 287, '察隅县', 0),
(2510, 287, '朗县', 0),
(2511, 288, '新城区', 0),
(2512, 288, '碑林区', 0),
(2513, 288, '莲湖区', 0),
(2514, 288, '灞桥区', 0),
(2515, 288, '未央区', 0),
(2516, 288, '雁塔区', 0),
(2517, 288, '阎良区', 0),
(2518, 288, '临潼区', 0),
(2519, 288, '长安区', 0),
(2520, 288, '蓝田县', 0),
(2521, 288, '周至县', 0),
(2522, 288, '户县', 0),
(2523, 288, '高陵县', 0),
(2524, 289, '王益区', 0),
(2525, 289, '印台区', 0),
(2526, 289, '耀州区', 0),
(2527, 289, '宜君县', 0),
(2528, 290, '渭滨区', 0),
(2529, 290, '金台区', 0),
(2530, 290, '陈仓区', 0),
(2531, 290, '凤翔县', 0),
(2532, 290, '岐山县', 0),
(2533, 290, '扶风县', 0),
(2534, 290, '眉县', 0),
(2535, 290, '陇县', 0),
(2536, 290, '千阳县', 0),
(2537, 290, '麟游县', 0),
(2538, 290, '凤县', 0),
(2539, 290, '太白县', 0),
(2540, 291, '秦都区', 0),
(2541, 291, '杨凌区', 0),
(2542, 291, '渭城区', 0),
(2543, 291, '三原县', 0),
(2544, 291, '泾阳县', 0),
(2545, 291, '乾县', 0),
(2546, 291, '礼泉县', 0),
(2547, 291, '永寿县', 0),
(2548, 291, '彬县', 0),
(2549, 291, '长武县', 0),
(2550, 291, '旬邑县', 0),
(2551, 291, '淳化县', 0),
(2552, 291, '武功县', 0),
(2553, 291, '兴平市', 0),
(2554, 292, '临渭区', 0),
(2555, 292, '华县', 0),
(2556, 292, '潼关县', 0),
(2557, 292, '大荔县', 0),
(2558, 292, '合阳县', 0),
(2559, 292, '澄城县', 0),
(2560, 292, '蒲城县', 0),
(2561, 292, '白水县', 0),
(2562, 292, '富平县', 0),
(2563, 292, '韩城市', 0),
(2564, 292, '华阴市', 0),
(2565, 293, '宝塔区', 0),
(2566, 293, '延长县', 0),
(2567, 293, '延川县', 0),
(2568, 293, '子长县', 0),
(2569, 293, '安塞县', 0),
(2570, 293, '志丹县', 0),
(2571, 293, '吴旗县', 0),
(2572, 293, '甘泉县', 0),
(2573, 293, '富县', 0),
(2574, 293, '洛川县', 0),
(2575, 293, '宜川县', 0),
(2576, 293, '黄龙县', 0),
(2577, 293, '黄陵县', 0),
(2578, 294, '汉台区', 0),
(2579, 294, '南郑县', 0),
(2580, 294, '城固县', 0),
(2581, 294, '洋县', 0),
(2582, 294, '西乡县', 0),
(2583, 294, '勉县', 0),
(2584, 294, '宁强县', 0),
(2585, 294, '略阳县', 0),
(2586, 294, '镇巴县', 0),
(2587, 294, '留坝县', 0),
(2588, 294, '佛坪县', 0),
(2589, 295, '榆阳区', 0),
(2590, 295, '神木县', 0),
(2591, 295, '府谷县', 0),
(2592, 295, '横山县', 0),
(2593, 295, '靖边县', 0),
(2594, 295, '定边县', 0),
(2595, 295, '绥德县', 0),
(2596, 295, '米脂县', 0),
(2597, 295, '佳县', 0),
(2598, 295, '吴堡县', 0),
(2599, 295, '清涧县', 0),
(2600, 295, '子洲县', 0),
(2601, 296, '汉滨区', 0),
(2602, 296, '汉阴县', 0),
(2603, 296, '石泉县', 0),
(2604, 296, '宁陕县', 0),
(2605, 296, '紫阳县', 0),
(2606, 296, '岚皋县', 0),
(2607, 296, '平利县', 0),
(2608, 296, '镇坪县', 0),
(2609, 296, '旬阳县', 0),
(2610, 296, '白河县', 0),
(2611, 297, '商州区', 0),
(2612, 297, '洛南县', 0),
(2613, 297, '丹凤县', 0),
(2614, 297, '商南县', 0),
(2615, 297, '山阳县', 0),
(2616, 297, '镇安县', 0),
(2617, 297, '柞水县', 0),
(2618, 298, '城关区', 0),
(2619, 298, '七里河区', 0),
(2620, 298, '西固区', 0),
(2621, 298, '安宁区', 0),
(2622, 298, '红古区', 0),
(2623, 298, '永登县', 0),
(2624, 298, '皋兰县', 0),
(2625, 298, '榆中县', 0),
(2626, 300, '金川区', 0),
(2627, 300, '永昌县', 0),
(2628, 301, '白银区', 0),
(2629, 301, '平川区', 0),
(2630, 301, '靖远县', 0),
(2631, 301, '会宁县', 0),
(2632, 301, '景泰县', 0),
(2633, 302, '秦城区', 0),
(2634, 302, '北道区', 0),
(2635, 302, '清水县', 0),
(2636, 302, '秦安县', 0),
(2637, 302, '甘谷县', 0),
(2638, 302, '武山县', 0),
(2639, 302, '张家川回族自治县', 0),
(2640, 303, '凉州区', 0),
(2641, 303, '民勤县', 0),
(2642, 303, '古浪县', 0),
(2643, 303, '天祝藏族自治县', 0),
(2644, 304, '甘州区', 0),
(2645, 304, '肃南裕固族自治县', 0),
(2646, 304, '民乐县', 0),
(2647, 304, '临泽县', 0),
(2648, 304, '高台县', 0),
(2649, 304, '山丹县', 0),
(2650, 305, '崆峒区', 0),
(2651, 305, '泾川县', 0),
(2652, 305, '灵台县', 0),
(2653, 305, '崇信县', 0),
(2654, 305, '华亭县', 0),
(2655, 305, '庄浪县', 0),
(2656, 305, '静宁县', 0),
(2657, 306, '肃州区', 0),
(2658, 306, '金塔县', 0),
(2659, 306, '安西县', 0),
(2660, 306, '肃北蒙古族自治县', 0),
(2661, 306, '阿克塞哈萨克族自治县', 0),
(2662, 306, '玉门市', 0),
(2663, 306, '敦煌市', 0),
(2664, 307, '西峰区', 0),
(2665, 307, '庆城县', 0),
(2666, 307, '环县', 0),
(2667, 307, '华池县', 0),
(2668, 307, '合水县', 0),
(2669, 307, '正宁县', 0),
(2670, 307, '宁县', 0),
(2671, 307, '镇原县', 0),
(2672, 308, '安定区', 0),
(2673, 308, '通渭县', 0),
(2674, 308, '陇西县', 0),
(2675, 308, '渭源县', 0),
(2676, 308, '临洮县', 0),
(2677, 308, '漳县', 0),
(2678, 308, '岷县', 0),
(2679, 309, '武都区', 0),
(2680, 309, '成县', 0),
(2681, 309, '文县', 0),
(2682, 309, '宕昌县', 0),
(2683, 309, '康县', 0),
(2684, 309, '西和县', 0),
(2685, 309, '礼县', 0),
(2686, 309, '徽县', 0),
(2687, 309, '两当县', 0),
(2688, 310, '临夏市', 0),
(2689, 310, '临夏县', 0),
(2690, 310, '康乐县', 0),
(2691, 310, '永靖县', 0),
(2692, 310, '广河县', 0),
(2693, 310, '和政县', 0),
(2694, 310, '东乡族自治县', 0),
(2695, 310, '积石山保安族东乡族撒拉族自治县', 0),
(2696, 311, '合作市', 0),
(2697, 311, '临潭县', 0),
(2698, 311, '卓尼县', 0),
(2699, 311, '舟曲县', 0),
(2700, 311, '迭部县', 0),
(2701, 311, '玛曲县', 0),
(2702, 311, '碌曲县', 0),
(2703, 311, '夏河县', 0),
(2704, 312, '城东区', 0),
(2705, 312, '城中区', 0),
(2706, 312, '城西区', 0),
(2707, 312, '城北区', 0),
(2708, 312, '大通回族土族自治县', 0),
(2709, 312, '湟中县', 0),
(2710, 312, '湟源县', 0),
(2711, 313, '平安县', 0),
(2712, 313, '民和回族土族自治县', 0),
(2713, 313, '乐都县', 0),
(2714, 313, '互助土族自治县', 0),
(2715, 313, '化隆回族自治县', 0),
(2716, 313, '循化撒拉族自治县', 0),
(2717, 314, '门源回族自治县', 0),
(2718, 314, '祁连县', 0),
(2719, 314, '海晏县', 0),
(2720, 314, '刚察县', 0),
(2721, 315, '同仁县', 0),
(2722, 315, '尖扎县', 0),
(2723, 315, '泽库县', 0),
(2724, 315, '河南蒙古族自治县', 0),
(2725, 316, '共和县', 0),
(2726, 316, '同德县', 0),
(2727, 316, '贵德县', 0),
(2728, 316, '兴海县', 0),
(2729, 316, '贵南县', 0),
(2730, 317, '玛沁县', 0),
(2731, 317, '班玛县', 0),
(2732, 317, '甘德县', 0),
(2733, 317, '达日县', 0),
(2734, 317, '久治县', 0),
(2735, 317, '玛多县', 0),
(2736, 318, '玉树县', 0),
(2737, 318, '杂多县', 0),
(2738, 318, '称多县', 0),
(2739, 318, '治多县', 0),
(2740, 318, '囊谦县', 0),
(2741, 318, '曲麻莱县', 0),
(2742, 319, '格尔木市', 0),
(2743, 319, '德令哈市', 0),
(2744, 319, '乌兰县', 0),
(2745, 319, '都兰县', 0),
(2746, 319, '天峻县', 0),
(2747, 320, '兴庆区', 0),
(2748, 320, '西夏区', 0),
(2749, 320, '金凤区', 0),
(2750, 320, '永宁县', 0),
(2751, 320, '贺兰县', 0),
(2752, 320, '灵武市', 0),
(2753, 321, '大武口区', 0),
(2754, 321, '惠农区', 0),
(2755, 321, '平罗县', 0),
(2756, 322, '利通区', 0),
(2757, 322, '盐池县', 0),
(2758, 322, '同心县', 0),
(2759, 322, '青铜峡市', 0),
(2760, 323, '原州区', 0),
(2761, 323, '西吉县', 0),
(2762, 323, '隆德县', 0),
(2763, 323, '泾源县', 0),
(2764, 323, '彭阳县', 0),
(2765, 324, '沙坡头区', 0),
(2766, 324, '中宁县', 0),
(2767, 324, '海原县', 0),
(2768, 325, '天山区', 0),
(2769, 325, '沙依巴克区', 0),
(2770, 325, '新市区', 0),
(2771, 325, '水磨沟区', 0),
(2772, 325, '头屯河区', 0),
(2773, 325, '达坂城区', 0),
(2774, 325, '东山区', 0),
(2775, 325, '乌鲁木齐县', 0),
(2776, 326, '独山子区', 0),
(2777, 326, '克拉玛依区', 0),
(2778, 326, '白碱滩区', 0),
(2779, 326, '乌尔禾区', 0),
(2780, 327, '吐鲁番市', 0),
(2781, 327, '鄯善县', 0),
(2782, 327, '托克逊县', 0),
(2783, 328, '哈密市', 0),
(2784, 328, '巴里坤哈萨克自治县', 0),
(2785, 328, '伊吾县', 0),
(2786, 329, '昌吉市', 0),
(2787, 329, '阜康市', 0),
(2788, 329, '米泉市', 0),
(2789, 329, '呼图壁县', 0),
(2790, 329, '玛纳斯县', 0),
(2791, 329, '奇台县', 0),
(2792, 329, '吉木萨尔县', 0),
(2793, 329, '木垒哈萨克自治县', 0),
(2794, 330, '博乐市', 0),
(2795, 330, '精河县', 0),
(2796, 330, '温泉县', 0),
(2797, 331, '库尔勒市', 0),
(2798, 331, '轮台县', 0),
(2799, 331, '尉犁县', 0),
(2800, 331, '若羌县', 0),
(2801, 331, '且末县', 0),
(2802, 331, '焉耆回族自治县', 0),
(2803, 331, '和静县', 0),
(2804, 331, '和硕县', 0),
(2805, 331, '博湖县', 0),
(2806, 332, '阿克苏市', 0),
(2807, 332, '温宿县', 0),
(2808, 332, '库车县', 0),
(2809, 332, '沙雅县', 0),
(2810, 332, '新和县', 0),
(2811, 332, '拜城县', 0),
(2812, 332, '乌什县', 0),
(2813, 332, '阿瓦提县', 0),
(2814, 332, '柯坪县', 0),
(2815, 333, '阿图什市', 0),
(2816, 333, '阿克陶县', 0),
(2817, 333, '阿合奇县', 0),
(2818, 333, '乌恰县', 0),
(2819, 334, '喀什市', 0),
(2820, 334, '疏附县', 0),
(2821, 334, '疏勒县', 0),
(2822, 334, '英吉沙县', 0),
(2823, 334, '泽普县', 0),
(2824, 334, '莎车县', 0),
(2825, 334, '叶城县', 0),
(2826, 334, '麦盖提县', 0),
(2827, 334, '岳普湖县', 0),
(2828, 334, '伽师县', 0),
(2829, 334, '巴楚县', 0),
(2830, 334, '塔什库尔干塔吉克自治县', 0),
(2831, 335, '和田市', 0),
(2832, 335, '和田县', 0),
(2833, 335, '墨玉县', 0),
(2834, 335, '皮山县', 0),
(2835, 335, '洛浦县', 0),
(2836, 335, '策勒县', 0),
(2837, 335, '于田县', 0),
(2838, 335, '民丰县', 0),
(2839, 336, '伊宁市', 0),
(2840, 336, '奎屯市', 0),
(2841, 336, '伊宁县', 0),
(2842, 336, '察布查尔锡伯自治县', 0),
(2843, 336, '霍城县', 0),
(2844, 336, '巩留县', 0),
(2845, 336, '新源县', 0),
(2846, 336, '昭苏县', 0),
(2847, 336, '特克斯县', 0),
(2848, 336, '尼勒克县', 0),
(2849, 337, '塔城市', 0),
(2850, 337, '乌苏市', 0),
(2851, 337, '额敏县', 0),
(2852, 337, '沙湾县', 0),
(2853, 337, '托里县', 0),
(2854, 337, '裕民县', 0),
(2855, 337, '和布克赛尔蒙古自治县', 0),
(2856, 338, '阿勒泰市', 0),
(2857, 338, '布尔津县', 0),
(2858, 338, '富蕴县', 0),
(2859, 338, '福海县', 0),
(2860, 338, '哈巴河县', 0),
(2861, 338, '青河县', 0),
(2862, 338, '吉木乃县', 0),
(2867, 352, '宛平县', 1),
(2868, 352, '111111', 5),
(2869, 345, '台北', 2);

-- --------------------------------------------------------

--
-- 表的结构 `sys_hooks`
--

CREATE TABLE `sys_hooks` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型  1 视图 2 控制器',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(2) DEFAULT '1',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM AVG_ROW_LENGTH=65 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_hooks`
--

INSERT INTO `sys_hooks` (`id`, `name`, `description`, `type`, `addons`, `status`, `update_time`) VALUES
(23, 'login', '第三方登录', 1, 'Oauthlogin', 1, 1499327900),
(24, 'sms', '短信', 1, 'sms', 1, 1499487808),
(26, 'wxtemplatemsg', '微信模板消息设置', 1, 'wxtemplatemsg', 1, 1500013768),
(27, 'orderCreateSuccess', '订单创建成功', 2, 'wxtemplatemsg', 1, 1500025515),
(29, 'orderDeliverySuccess', '订单发货成功', 2, 'wxtemplatemsg', 1, 1500448695),
(30, 'orderPaySuccess', '订单付款成功', 2, 'wxtemplatemsg', 1, 1500448963),
(31, 'orderRefundApplyCreateSuccess', '订单申请退款创建成功', 2, 'wxtemplatemsg', 1, 1500449386),
(32, 'orderRefundSuccess', '订单退款成功', 2, 'wxtemplatemsg', 1, 1500450437),
(33, 'userWithdrawApplyCreateSuccess', '会员提现申请创建成功', 2, 'wxtemplatemsg', 1, 1500450601),
(34, 'userLoginSuccess', '用户登陆成功', 2, '', 1, 1500619318),
(35, 'userAddSuccess', '基础用户添加成功后', 2, '', 1, 1500619587),
(36, 'memberRegisterSuccess', '会员注册成功', 2, '', 1, 1500619688),
(37, 'memberLevelSaveSuccess', '会员等级保存成功', 2, '', 1, 1500620008),
(38, 'memberWithdrawApplyCreateSuccess', '会员提现申请创建成功', 2, '', 1, 1500620146),
(39, 'memberWithdrawAuditAgree', '会员提现审核通过', 2, '', 1, 1500620297),
(40, 'goodsSaveSuccess', '商品保存成功', 2, '', 1, 1500620784),
(41, 'goodsSaveBefore', '商品保存之前', 2, '', 1, 1500620803),
(42, 'goodsDeleteBefore', '商品删除之前', 2, '', 1, 1500621085),
(43, 'goodsDeleteSuccess', '商品删除成功', 2, '', 1, 1500621109),
(44, 'goodsOnlineSuccess', '商品上架成功', 2, '', 1, 1500621131),
(45, 'goodsOfflineSuccess', '商品下架成功', 2, '', 1, 1500621142),
(55, 'goodsCategorySaveSuccess', '商品分类保存成功', 2, '', 1, 1500621379),
(56, 'goodsCategoryDeleteSuccess', '商品分类删除成功', 2, '', 1, 1500621397),
(57, 'goodsBrandSaveSuccess', '商品品牌保存成功', 2, '', 1, 1500621414),
(58, 'goodsBrandDeleteSuccess', '商品品牌删除成功', 2, '', 1, 1500621428),
(59, 'goodsGroupSaveSuccess', '商品分组保存成功', 2, '', 1, 1500621441),
(60, 'goodsGroupDeleteSuccess', '商品分组删除成功', 2, '', 1, 1500621455),
(61, 'goodsSpecSaveSuccess', '商品规格保存成功', 2, '', 1, 1500621470),
(62, 'goodsSpecDeleteSuccess', '商品规格删除成功', 2, '', 1, 1500621483),
(63, 'goodsAttributeSaveSuccess', '商品类型保存成功', 2, '', 1, 1500621495),
(64, 'goodsAttributeDeleteSuccess', '商品类型删除成功', 2, '', 1, 1500621506);

-- --------------------------------------------------------

--
-- 表的结构 `sys_instance`
--

CREATE TABLE `sys_instance` (
  `instance_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `instance_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例名',
  `instance_typeid` int(11) NOT NULL DEFAULT '2' COMMENT '实例类型ID',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '实例二维码',
  `remark` text COMMENT '实例简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1365 DEFAULT CHARSET=utf8 COMMENT='系统实例表';

--
-- 转存表中的数据 `sys_instance`
--

INSERT INTO `sys_instance` (`instance_id`, `instance_name`, `instance_typeid`, `qrcode`, `remark`, `create_time`) VALUES
(19, 'Niushop开源商城', 1, '', '\'\'', 1477541018);

-- --------------------------------------------------------

--
-- 表的结构 `sys_instance_type`
--

CREATE TABLE `sys_instance_type` (
  `instance_typeid` int(10) UNSIGNED NOT NULL COMMENT '实例类型ID',
  `type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例类型名称',
  `type_module_array` text NOT NULL COMMENT '实例类型权限',
  `type_desc` text NOT NULL COMMENT '实例类型说明',
  `type_sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='实例类型';

-- --------------------------------------------------------

--
-- 表的结构 `sys_module`
--

CREATE TABLE `sys_module` (
  `module_id` int(10) UNSIGNED NOT NULL COMMENT '模块ID',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `module` varchar(255) NOT NULL DEFAULT 'admin' COMMENT '项目名',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器名',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法名',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级模块ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '深度等级',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单',
  `is_dev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `desc` text COMMENT '模块描述',
  `module_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '模块图片',
  `icon_class` varchar(255) NOT NULL DEFAULT '' COMMENT '矢量图class',
  `is_control_auth` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否控制权限',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=606 DEFAULT CHARSET=utf8 COMMENT='系统模块表';

--
-- 转存表中的数据 `sys_module`
--

INSERT INTO `sys_module` (`module_id`, `module_name`, `module`, `controller`, `method`, `pid`, `level`, `url`, `is_menu`, `is_dev`, `sort`, `desc`, `module_picture`, `icon_class`, `is_control_auth`, `create_time`, `modify_time`) VALUES
(120, '系统', 'admin', 'system', 'modulelist', 0, 1, 'system/modulelist', 1, 0, 999, '\'\'', '', '', 1, 1477454152, 1477794717),
(121, '模块列表', 'admin', 'system', 'modulelist', 120, 2, 'system/modulelist', 1, 0, 2, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2352&highlight=%E6%A8%A1%E5%9D%97%E5%88%97%E8%A1%A8\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2352&highlight=%E6%A8%A1%E5%9D%97%E5%88%97%E8%A1%A8</a>', '', '', 1, 0, NULL),
(122, '添加模块', 'admin', 'system', 'addmodule', 121, 3, 'system/addmodule', 0, 0, 1, '添加模块', '', '', 1, 0, 1479976597),
(123, '修改模块', 'admin', 'system', 'editmodule', 121, 3, 'system/editmodule', 0, 0, 2, '修改模块', '', '', 1, 0, 1479976646),
(126, '管理员列表', 'admin', 'auth', 'userlist', 218, 2, 'auth/userlist', 1, 0, 5, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2386&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2386&extra=page%3D1</a>', '', '', 1, 0, 1484650663),
(127, '用户列表', 'admin', 'auth', 'userlist', 126, 3, 'auth/userlist', 0, 0, 1, NULL, '', '', 1, 0, NULL),
(128, '权限组', 'admin', 'auth', 'authgrouplist', 126, 3, 'auth/authgrouplist', 0, 0, 2, '用户组', '', '', 1, 0, 1479976919),
(129, '删除模块', 'admin', 'system', 'delmodule', 121, 3, 'system/delmodule', 0, 0, 0, '模块列表', '', '', 1, 1477618350, 1479976723),
(133, '添加用户组', 'admin', 'auth', 'addusergroup', 128, 3, 'auth/addusergroup', 0, 0, 2, '用户组', '', '', 1, 1477628544, 1479977008),
(137, '会员', 'admin', 'member', 'memberlist', 0, 1, 'member/memberlist', 0, 0, 4, '', '', '', 1, 1477994717, 1567673545),
(139, '相册管理', 'admin', 'system', 'albumlist', 149, 2, 'system/albumlist', 0, 0, 10, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2312&amp;extra=page%3D2&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2312&amp;extra=page%3D2&lt;/a&gt;', '', '', 1, 1478158094, 1568613643),
(144, '编辑用户', 'admin', 'auth', 'edituser', 127, 3, 'auth/edituser', 0, 0, 5, '用户', '', '', 1, 1478837447, 1479976963),
(145, '会员列表', 'admin', 'member', 'memberlist', 137, 2, 'member/memberlist', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2321&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2321&extra=page%3D2</a>', '', '', 1, 1478846113, 1478846203),
(149, '商品', 'admin', 'goods', 'goodslist', 0, 1, 'goods/goodslist', 1, 0, 1, '商品模块', '', '', 1, 1479268148, 1493973167),
(150, '商品列表', 'admin', 'goods', 'goodslist', 149, 2, 'goods/goodslist', 0, 0, 1, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2301&amp;extra=page%3D3&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2301&amp;extra=page%3D3&lt;/a&gt;', '', '', 0, 1479268236, 1568613523),
(151, '商品发布', 'admin', 'goods', 'addgoods', 149, 2, 'goods/addgoods', 0, 0, 2, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2302&amp;extra=page%3D3&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2302&amp;extra=page%3D3&lt;/a&gt;', '', '', 1, 1479268307, 1568613540),
(169, '图片管理', 'admin', 'system', 'albumpicturelist', 139, 3, 'system/albumpicturelist', 0, 0, 5, 'sfgsdf', '', '', 1, 1479464708, 1479976790),
(170, '添加运费模板', 'admin', 'express', 'transportationadd', 164, 3, 'express/transportationadd', 0, 0, 1, '添加运费模板', '', '', 1, 1479700610, 1484894376),
(171, '商品标签', 'admin', 'goods', 'goodsgrouplist', 149, 2, 'goods/goodsgrouplist', 0, 0, 3, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2307&amp;extra=page%3D2&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2307&amp;extra=page%3D2&lt;/a&gt;', '', '', 1, 1479873298, 1568613587),
(172, '添加商品标签', 'admin', 'goods', 'addgoodsgroup', 171, 3, 'goods/addgoodsgroup', 0, 0, 6, '添加商品分组', '', '', 1, 1479873424, 1479960243),
(176, '运费模板修改', 'admin', 'express', 'transportationedit', 164, 3, 'express/transportationedit', 0, 0, 6, 'sd', '', '', 1, 1480040625, NULL),
(179, '营销', 'admin', 'promotion', 'coupontypelist', 0, 1, 'promotion/coupontypelist', 0, 0, 3, '优惠券类型列表', '', '', 1, 1480491652, 1567673530),
(180, '优惠券', 'admin', 'promotion', 'coupontypelist', 179, 2, 'promotion/coupontypelist', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2315&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2315&extra=page%3D2</a>', '', '', 1, 1480491846, NULL),
(184, '订单', 'admin', 'order', 'orderlist', 0, 1, 'order/orderlist', 0, 0, 2, '订单列表', '', '', 1, 1480563137, 1568195737),
(185, '订单列表', 'admin', 'order', 'orderlist', 184, 2, 'order/orderlist', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2314&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2314&extra=page%3D2</a>', '', '', 1, 1480563210, NULL),
(186, '添加优惠券', 'admin', 'promotion', 'addcoupontype', 180, 3, 'promotion/addcoupontype', 1, 0, 2, '添加优惠券类型', '', '', 1, 1480573171, NULL),
(187, '修改优惠券', 'admin', 'promotion', 'updatecoupontype', 180, 3, 'promotion/updatecoupontype', 1, 0, 3, '修改优惠券类型', '', '', 1, 1480904943, NULL),
(189, '物流公司', 'admin', 'express', 'expresscompany', 529, 3, 'express/expresscompany', 0, 0, 60, '物流公司', '', '', 1, 1481254866, 1484894344),
(190, '订单详情', 'admin', 'order', 'orderdetail', 185, 3, 'order/orderdetail', 0, 0, 1, '订单详情', '', '', 1, 1481258173, NULL),
(191, '添加物流公司', 'admin', 'express', 'addexpresscompany', 529, 3, 'express/addexpresscompany', 1, 0, 1, '添加物流公司', '', '', 1, 1481267828, NULL),
(192, '物流公司修改', 'admin', 'express', 'updateexpresscompany', 529, 3, 'express/updateexpresscompany', 1, 0, 2, '物流公司修改排序', '', '', 1, 1481271808, NULL),
(194, '退款详情', 'admin', 'order', 'orderrefunddetail', 185, 3, 'order/orderrefunddetail', 0, 0, 2, '退款详情', '', '', 1, 1481872074, NULL),
(195, '赠品', 'admin', 'promotion', 'giftlist', 179, 2, 'promotion/giftlist', 0, 0, 3, '', '', '', 1, 1482113074, 1494215988),
(196, '添加赠品', 'admin', 'promotion', 'addgift', 195, 3, 'promotion/addgift', 1, 0, 0, '添加赠品', '', '', 1, 1482113664, 1482117539),
(197, '修改赠品', 'admin', 'promotion', 'updategift', 195, 3, 'promotion/updategift', 1, 0, 0, '修改赠品', '', '', 1, 1482113715, 1482117558),
(198, '满减送', 'admin', 'promotion', 'mansonglist', 179, 2, 'promotion/mansonglist', 1, 0, 4, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2317&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2317&extra=page%3D2</a>', '', '', 1, 1482138580, 1482138597),
(199, '添加满减满送', 'admin', 'promotion', 'addmansong', 198, 3, 'promotion/addmansong', 1, 0, 0, '满减送', '', '', 1, 1482140311, NULL),
(200, '编辑满减送', 'admin', 'promotion', 'updatemansong', 198, 3, 'promotion/updatemansong', 1, 0, 1, '编辑满减送', '', '', 1, 1482907059, NULL),
(201, '限时折扣', 'admin', 'promotion', 'getdiscountlist', 179, 2, 'promotion/getdiscountlist', 1, 0, 5, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2318&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2318&extra=page%3D2</a>', '', '', 1, 1483949283, NULL),
(202, '添加限时折扣', 'admin', 'promotion', 'adddiscount', 201, 3, 'promotion/adddiscount', 1, 0, 0, '添加限时折扣', '', '', 1, 1483951104, NULL),
(203, '修改限时折扣', 'admin', 'promotion', 'updatediscount', 201, 3, 'promotion/updatediscount', 1, 0, 1, '修改限时折扣', '', '', 1, 1483951151, 1483958451),
(210, '修改商品标签', 'admin', 'goods', 'updategoodsgroup', 171, 3, 'goods/updategoodsgroup', 0, 0, 2, '修改商品分组', '', '', 1, 1484120298, 1484125917),
(218, '设置', 'admin', 'config', 'webconfig', 0, 1, 'config/webconfig', 1, 0, 11, '店铺设置', '', '', 1, 1484617355, 1493348177),
(221, '支付配置', 'admin', 'config', 'paymentconfig', 10094, 3, 'config/paymentconfig', 0, 0, 2, '支付配置', '\'\'', '', 1, 1484623427, 1496820428),
(334, '咨询管理', 'admin', 'saleservice', 'consultlist', 149, 2, 'saleservice/consultlist', 0, 0, 8, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2310&amp;extra=page%3D2&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2310&amp;extra=page%3D2&lt;/a&gt;', '', '', 1, 1488875702, 1568613799),
(335, '微信', 'admin', 'wchat', 'config', 0, 1, 'wchat/config', 0, 0, 8, '微信', '', '', 1, 1488945338, 1567673628),
(336, '公众号管理', 'admin', 'wchat', 'config', 335, 2, 'wchat/config', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2326&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2326&extra=page%3D2</a>', '', '', 1, 1488945416, NULL),
(339, '微信菜单管理', 'admin', 'wchat', 'menu', 335, 2, 'wchat/menu', 1, 0, 2, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2327&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2327&extra=page%3D2</a>', '', '', 1, 1489046481, NULL),
(340, '推广二维码管理', 'admin', 'wchat', 'weixinqrcodetemplate', 335, 2, 'wchat/weixinqrcodetemplate', 1, 0, 3, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2328&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2328&extra=page%3D2</a>', '', '', 1, 1489046596, 1490153341),
(341, '回复设置', 'admin', 'wchat', 'replayconfig', 335, 2, 'wchat/replayconfig', 1, 0, 4, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2329&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2329&extra=page%3D2</a>', '', '', 1, 1489046662, NULL),
(342, '消息素材管理', 'admin', 'wchat', 'materialmessage', 335, 2, 'wchat/materialmessage', 1, 0, 6, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2330&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2330&extra=page%3D2</a>', '', '', 1, 1489046731, NULL),
(343, '分享内容设置', 'admin', 'wchat', 'shareconfig', 335, 2, 'wchat/shareconfig', 1, 0, 7, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2332&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2332&extra=page%3D2</a>', '', '', 1, 1489046804, NULL),
(358, '自定义推广二维码', 'admin', 'wchat', 'qrcode', 340, 3, 'wchat/qrcode', 0, 0, 1, '自定义二维码', '', '', 1, 1490153257, 1490153278),
(359, '添加回复', 'admin', 'wchat', 'addorupdatekeyreplay', 341, 3, 'wchat/addorupdatekeyreplay', 1, 0, 1, '', '', '', 1, 1490236498, NULL),
(360, '添加用户', 'admin', 'auth', 'adduser', 127, 3, 'auth/adduser', 0, 0, 1, '添加用户', '', '', 1, 1490236731, NULL),
(361, '一键关注设置', 'admin', 'wchat', 'onekeysubscribe', 335, 2, 'wchat/onekeysubscribe', 0, 0, 6, '一键关注设置', '', '', 1, 1490318979, 1496386363),
(381, '广告管理', 'admin', 'system', 'shopadvlist', 477, 2, 'system/shopadvlist', 1, 0, 6, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2375&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2375&extra=page%3D1</a>', '', '', 1, 1490774263, 1496320676),
(382, '广告管理', 'admin', 'system', 'shopadvlist', 381, 3, 'system/shopadvlist', 0, 0, 0, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2375&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2375&extra=page%3D1</a>', '', '', 1, 1490785255, NULL),
(383, '添加广告位', 'admin', 'system', 'addshopadvposition', 381, 3, 'system/addshopadvposition', 0, 0, 0, '添加广告位', '', '', 1, 1490835009, NULL),
(387, '广告位编辑', 'admin', 'system', 'updateshopadvposition', 381, 3, 'system/updateshopadvposition', 1, 0, 0, '广告位编辑', '', '', 1, 1490851266, NULL),
(388, '添加广告', 'admin', 'system', 'addshopadv', 381, 3, 'system/addshopadv', 0, 0, 0, '添加广告', '', '', 1, 1490854140, NULL),
(389, '广告编辑', 'admin', 'system', 'updateshopadv', 381, 3, 'system/updateshopadv', 0, 0, 0, '', '', '', 1, 1490857038, NULL),
(390, '促销版块', 'admin', 'system', 'goodsrecommendclass', 10004, 3, 'system/goodsrecommendclass', 0, 0, 10, '促销版块管理', '', '', 1, 1490861814, 1496320694),
(392, '首页楼层', 'admin', 'system', 'blocklist', 10004, 3, 'system/blocklist', 0, 0, 11, '', '', '', 1, 1490947012, 1496320711),
(394, '添加楼层', 'admin', 'system', 'addblock', 10004, 3, 'system/addblock', 0, 0, 0, '', '', '', 1, 1490948318, NULL),
(395, '楼层编辑', 'admin', 'system', 'updateblock', 10004, 3, 'system/updateblock', 0, 0, 0, '', '', '', 1, 1490948388, 1490952538),
(398, '个人资料', 'admin', 'auth', 'userdetail', 126, 2, 'auth/userdetail', 1, 0, 0, '个人资料', '', '', 0, 1491029995, 1494298490),
(403, '销售排行', 'admin', 'account', 'shopgoodssalesrank', 409, 2, 'account/shopgoodssalesrank', 0, 0, 9, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2390&amp;extra=page%3D1&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2390&amp;extra=page%3D1&lt;/a&gt;', '', '', 1, 1491040090, 1568121580),
(405, '商品销售统计', 'admin', 'account', 'shopgoodsaccountlist', 403, 3, 'account/shopgoodsaccountlist', 0, 0, 6, '商品销售统计', '', '', 1, 1491042742, NULL),
(409, '数据', 'admin', 'account', 'shopsalesaccount', 0, 1, 'account/shopsalesaccount', 1, 0, 7, '资产', '', '', 1, 1493281488, 1493974412),
(418, '网站设置', 'admin', 'config', 'webconfig', 528, 3, 'config/webconfig', 0, 0, 2, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2342&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2342&extra=page%3D2</a>', '', '', 1, 1492755047, NULL),
(419, '商品分类', 'admin', 'goods', 'goodscategorylist', 149, 2, 'goods/goodscategorylist', 1, 0, 2, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2303&extra=page%3D3\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2303&extra=page%3D3</a>', '', '', 1, 1492755701, NULL),
(420, '添加商品分类', 'admin', 'goods', 'addgoodscategory', 419, 3, 'goods/addgoodscategory', 1, 0, 2, '添加商品分类', '', '', 1, 1492755811, 1492755828),
(421, '修改商品分类', 'admin', 'goods', 'updategoodscategory', 419, 3, 'goods/updategoodscategory', 1, 0, 1, '修改商品分类', '', '', 1, 1492755920, NULL),
(422, '删除商品分类', 'admin', 'goods', 'deletegoodscategory', 419, 3, 'goods/deletegoodscategory', 1, 0, 2, '删除商品分类', '', '', 1, 1492755973, NULL),
(423, '商品品牌', 'admin', 'goods', 'goodsbrandlist', 149, 2, 'goods/goodsbrandlist', 0, 0, 3, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2304&amp;extra=page%3D3&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2304&amp;extra=page%3D3&lt;/a&gt;', '', '', 1, 1492756038, 1568613573),
(424, '添加商品品牌', 'admin', 'goods', 'addgoodsbrand', 423, 3, 'goods/addgoodsbrand', 1, 0, 1, '添加商品品牌', '', '', 1, 1492756096, NULL),
(425, '修改商品品牌', 'admin', 'goods', 'updategoodsbrand', 423, 3, 'goods/updategoodsbrand', 1, 0, 4, '修改商品品牌', '', '', 1, 1492756169, NULL),
(427, '导航管理', 'admin', 'config', 'shopnavigationlist', 477, 2, 'config/shopnavigationlist', 1, 0, 2, '导航', '', '', 1, 1492761752, 1496320733),
(428, '添加导航', 'admin', 'config', 'addshopnavigation', 427, 3, 'config/addshopnavigation', 0, 0, 1, '添加导航', '', '', 0, 1492761909, NULL),
(429, '修改导航', 'admin', 'config', 'updateshopnavigation', 427, 3, 'config/updateshopnavigation', 0, 0, 2, '修改导航', '', '', 0, 1492762515, NULL),
(430, '友情链接', 'admin', 'config', 'linklist', 477, 2, 'config/linklist', 1, 0, 10, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2381&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2381&extra=page%3D1</a>', '', '', 1, 1492765269, 1496320750),
(431, '文章管理', 'admin', 'cms', 'articlelist', 477, 2, 'cms/articlelist', 1, 0, 7, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2378&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2378&extra=page%3D1</a>', '', '', 1, 1492782512, 1492782619),
(432, '文章列表', 'admin', 'cms', 'articlelist', 431, 3, 'cms/articlelist', 0, 0, 1, '文章列表', '', '', 1, 1492782808, 1492782837),
(433, '文章分类', 'admin', 'cms', 'articleclasslist', 431, 3, 'cms/articleclasslist', 0, 0, 2, '文章列表', '', '', 1, 1492782934, 1492782952),
(434, '评论列表', 'admin', 'cms', 'commentarticle', 431, 2, 'cms/commentarticle', 0, 0, 3, '评论列表', '', '', 1, 1492782991, 1497084797),
(436, '添加友情链接', 'admin', 'config', 'addlink', 430, 3, 'config/addlink', 0, 0, 1, '添加友情链接', '', '', 1, 1493190273, 1493190306),
(437, '编辑友情链接', 'admin', 'config', 'updatelink', 430, 3, 'config/updatelink', 0, 0, 2, '编辑友情链接', '', '', 1, 1493192018, NULL),
(439, '通知系统', 'admin', 'config', 'notifyindex', 528, 3, 'config/notifyindex', 0, 0, 26, 'messageConfig', '', '', 1, 1493194795, 1496722814),
(440, '帮助类型', 'admin', 'config', 'helpclass', 530, 3, 'config/helpclass', 0, 0, 10, '帮助类型', '', '', 1, 1493199934, 1496320786),
(441, '帮助内容', 'admin', 'config', 'helpdocument', 530, 3, 'config/helpdocument', 0, 0, 18, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2380&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2380&extra=page%3D1</a>', '', '', 1, 1493201598, 1496320803),
(442, '添加帮助类型', 'admin', 'config', 'addhelpclass', 530, 3, 'config/addhelpclass', 0, 0, 1, '添加帮助类型', '', '', 1, 1493201673, NULL),
(443, '修改帮助内容', 'admin', 'config', 'updatedocument', 530, 3, 'config/updatedocument', 0, 0, 2, 'updateDocument.html', '', '', 1, 1493203409, NULL),
(444, '添加帮助内容', 'admin', 'config', 'adddocument', 530, 3, 'config/adddocument', 0, 0, 2, 'aaddDocument', '', '', 1, 1493205866, NULL),
(445, '首页公告', 'admin', 'config', 'usernotice', 477, 2, 'config/usernotice', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2370&page=1&extra=#pid6025\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2370&page=1&extra=#pid6025</a>', '', '', 1, 1493206256, 1496321121),
(446, '积分管理', 'admin', 'promotion', 'pointconfig', 179, 2, 'promotion/pointconfig', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2316&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2316&extra=page%3D2</a>', '', '', 1, 1493206530, 1496894015),
(447, '粉丝列表', 'admin', 'member', 'weixinfanslist', 335, 2, 'member/weixinfanslist', 1, 0, 10, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2322&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2322&extra=page%3D2</a>', '', '', 1, 1493278702, NULL),
(450, '修改消息素材', 'admin', 'wchat', 'updatemedia', 342, 3, 'wchat/updatemedia', 1, 0, 1, '', '', '', 1, 1493282078, 1493282297),
(451, '添加消息素材', 'admin', 'wchat', 'addmedia', 342, 3, 'wchat/addmedia', 1, 0, 1, '', '', '', 1, 1493282371, NULL),
(452, '添加文章', 'admin', 'cms', 'addarticle', 431, 3, 'cms/addarticle', 0, 0, 4, '', '', '', 1, 1493287571, 1493289825),
(454, '销售统计', 'admin', 'account', 'orderaccountcount', 409, 2, 'account/orderaccountcount', 0, 0, 6, '', '', '', 1, 1493289961, 1493981704),
(455, '修改文章', 'admin', 'cms', 'updatearticle', 431, 3, 'cms/updatearticle', 0, 0, 2, '', '', '', 1, 1493343780, NULL),
(456, '第三方登录', 'admin', 'config', 'partylogin', 528, 3, 'config/partylogin', 0, 0, 25, '', '', '', 1, 1493347646, 1496903436),
(457, '销售明细', 'admin', 'account', 'orderrecordslist', 454, 3, 'account/orderrecordslist', 0, 0, 2, '', '', '', 1, 1493705080, 1493705419),
(459, '销售概况', 'admin', 'account', 'shopsalesaccount', 409, 2, 'account/shopsalesaccount', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2387&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2387&extra=page%3D1</a>', '', '', 1, 1493776001, 1493974321),
(460, '热卖商品', 'admin', 'account', 'bestsellergoods', 463, 3, 'account/bestsellergoods', 0, 0, 1, '', '', '', 1, 1493867120, 1493972190),
(461, '同行热卖', 'admin', 'account', 'shopgoodsgroupsalecount', 409, 2, 'account/shopgoodsgroupsalecount', 1, 0, 4, '', '', '', 1, 1493946658, 1493950999),
(462, '运营报告', 'admin', 'account', 'shopreport', 409, 2, 'account/shopreport', 1, 0, 5, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2389&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2389&extra=page%3D1</a>', '', '', 1, 1493947412, NULL),
(463, '商品分析', 'admin', 'account', 'shopgoodssaleslist', 409, 2, 'account/shopgoodssaleslist', 0, 0, 2, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2325&amp;extra=page%3D2&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2325&amp;extra=page%3D2&lt;/a&gt;', '', '', 1, 1493949799, 1568121563),
(467, '首页', 'admin', 'index', 'index', 0, 1, 'index/index', 1, 0, 0, '', '', '', 0, 1494485612, 1497071676),
(469, '满额包邮', 'admin', 'promotion', 'fullshipping', 179, 2, 'promotion/fullshipping', 1, 0, 6, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2320&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2320&extra=page%3D2</a>', '', '', 1, 1494928162, NULL),
(471, '商家地址', 'admin', 'order', 'returnsetting', 529, 3, 'order/returnsetting', 0, 0, 70, '退货设置', '', '', 1, 1496215760, 1496216046),
(472, '添加或修改', 'admin', 'order', 'addreturn', 529, 3, 'order/addreturn', 1, 0, 1, '添加退货', '', '', 1, 1496215892, 1496216067),
(474, '首页公告', 'admin', 'config', 'updatenotice', 10005, 3, 'config/updatenotice', 0, 0, 15, '公告', '', '', 1, 1496291567, 1496320766),
(477, '网站', 'admin', 'config', 'shopnavigationlist', 0, 1, 'config/usernotice', 0, 0, 9, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2371&amp;extra=page%3D1&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2371&amp;extra=page%3D1&lt;/a&gt;', '', '', 1, 1496303515, 1567673637),
(478, '商品评价', 'admin', 'goods', 'goodscomment', 149, 2, 'goods/goodscomment', 0, 0, 8, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2311&amp;extra=page%3D2&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2311&amp;extra=page%3D2&lt;/a&gt;', '', '', 1, 1496310914, 1568613812),
(479, '商品规格', 'admin', 'goods', 'goodsspeclist', 149, 2, 'goods/goodsspeclist', 0, 0, 6, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2306&amp;extra=page%3D3&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2306&amp;extra=page%3D3&lt;/a&gt;', '', '', 1, 1496314078, 1568613605),
(480, '添加商品规格', 'admin', 'goods', 'addgoodsspec', 479, 3, 'goods/addgoodsspec', 0, 0, 1, '', '', '', 1, 1496368895, NULL),
(481, '修改商品规格', 'admin', 'goods', 'updategoodsspec', 479, 3, 'goods/updategoodsspec', 0, 0, 0, '', '', '', 1, 1496386955, NULL),
(482, '商品类型', 'admin', 'goods', 'attributelist', 149, 2, 'goods/attributelist', 0, 0, 7, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2309&amp;extra=page%3D2&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2309&amp;extra=page%3D2&lt;/a&gt;', '', '', 1, 1496392434, 1568613708),
(484, '添加商品类型', 'admin', 'goods', 'addattributeservice', 482, 3, 'goods/addattributeservice', 0, 0, 0, '', '', '', 1, 1496395497, 1496457873),
(485, '修改商品类型', 'admin', 'goods', 'updategoodsattribute', 482, 3, 'goods/updategoodsattribute', 0, 0, 0, '', '', '', 1, 1496396084, NULL),
(486, '地区管理', 'admin', 'config', 'areamanagement', 529, 3, 'config/areamanagement', 0, 0, 50, '', '', '', 1, 1496452390, NULL),
(487, '模板编辑', 'admin', 'express', 'expresstemplate', 529, 3, 'express/expresstemplate', 0, 0, 0, '', '', '', 1, 1496459993, NULL),
(488, '会员等级', 'admin', 'member', 'memberlevellist', 137, 2, 'member/memberlevellist', 1, 0, 3, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2323&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2323&extra=page%3D2</a>', '', '', 1, 1496462360, NULL),
(489, '添加等级', 'admin', 'member', 'addmemberlevel', 488, 3, 'member/addmemberlevel', 1, 0, 1, '添加等级', '', '', 1, 1496483895, NULL),
(490, '修改等级', 'admin', 'member', 'updatememberlevel', 488, 3, 'member/updatememberlevel', 1, 0, 0, '修改等级', '', '', 1, 1496483933, 1496485692),
(491, '专题列表', 'admin', 'cms', 'topiclist', 477, 2, 'cms/topiclist', 1, 0, 8, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2379&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2379&extra=page%3D1</a>', '', '', 1, 1496630179, 1496632713),
(492, '添加专题', 'admin', 'cms', 'addtopic', 491, 3, 'cms/addtopic', 1, 0, 1, '添加专题', '', '', 1, 1496630640, 1496632753),
(493, '修改专题', 'admin', 'cms', 'updatetopic', 491, 3, 'cms/updatetopic', 1, 0, 2, '修改专题', '', '', 1, 1496630696, 1496632781),
(494, '购物设置', 'admin', 'config', 'shopset', 10094, 3, 'config/shopset', 0, 0, 1, '购物设置', '', '', 1, 1496716845, 1496717062),
(495, '邮件设置', 'admin', 'config', 'messageconfig', 439, 3, 'config/messageconfig', 0, 0, 0, '', '', '', 1, 1496731597, NULL),
(496, '短信设置', 'admin', 'config', 'messageconfig', 439, 3, 'config/messageconfig', 0, 0, 0, '', '', '', 1, 1496731636, NULL),
(497, '会员积分明细', 'admin', 'member', 'pointdetail', 145, 3, 'member/pointdetail', 0, 0, 0, '', '', '', 1, 1496739472, NULL),
(498, '会员余额明细', 'admin', 'member', 'accountdetail', 145, 3, 'member/accountdetail', 0, 0, 0, '', '', '', 1, 1496744512, NULL),
(499, 'seo设置', 'admin', 'config', 'seoconfig', 528, 3, 'config/seoconfig', 0, 0, 2, 'seo设置', '', '', 1, 1496750885, 1496751054),
(501, '微信支付', 'admin', 'config', 'payconfig', 221, 3, 'config/payconfig', 1, 0, 1, '微信支付', '', '', 1, 1496821450, NULL),
(502, '支付宝支付', 'admin', 'config', 'payaliconfig', 221, 3, 'config/payaliconfig', 1, 0, 2, '支付宝支付', '', '', 1, 1496821780, NULL),
(503, '会员提现设置', 'admin', 'config', 'memberwithdrawsetting', 504, 3, 'config/memberwithdrawsetting', 0, 0, 0, '会员提现设置', '', '', 1, 1496821934, 1496822222),
(504, '会员提现', 'admin', 'member', 'usercommissionwithdrawlist', 137, 2, 'member/usercommissionwithdrawlist', 1, 0, 4, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2324&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2324&extra=page%3D2</a>', '', '', 1, 1496822171, 1496822242),
(506, '模板管理', 'admin', 'config', 'notifytemplate', 439, 3, 'config/notifytemplate', 0, 0, 0, '', '', '', 1, 1496886539, 1496974268),
(509, '积分管理', 'admin', 'member', 'pointlist', 137, 2, 'member/pointlist', 1, 0, 5, '', '', '', 1, 1496906007, 1496906222),
(510, '余额管理', 'admin', 'member', 'accountlist', 137, 2, 'member/accountlist', 1, 0, 6, '', '', '', 1, 1496906142, 1496906242),
(512, '微信登录', 'admin', 'config', 'loginconfig', 456, 3, 'config/loginconfig', 1, 0, 2, '微信登录', '', '', 1, 1496907149, 1496907569),
(513, 'qq登录', 'admin', 'config', 'loginconfig', 456, 3, 'config/loginconfig', 1, 0, 1, 'qq登录', '', '', 1, 1496907238, 1496907552),
(515, '欢迎页', 'admin', 'index', 'index', 467, 2, 'index/index', 1, 0, 0, '欢迎页', '', '', 0, 1496979062, NULL),
(518, '回收站列表', 'admin', 'goods', 'recyclelist', 150, 3, 'goods/recyclelist', 0, 0, 2, '', '', '', 1, 1497445996, 1497445996),
(519, '货到付款地区管理', 'admin', 'config', 'distributionareamanagement', 529, 3, 'config/distributionareamanagement', 0, 0, 24, '', '', '', 1, 1497706614, 1497706614),
(520, '自提点管理', 'admin', 'shop', 'pickuppointlist', 529, 3, 'shop/pickuppointlist', 0, 0, 80, '', '', '', 1, 1498135759, 1498135759),
(521, '添加自提点', 'admin', 'shop', 'addpickuppoint', 529, 3, 'shop/addpickuppoint', 0, 0, 0, '', '', '', 1, 1498135759, 1498135759),
(522, '修改自提点', 'admin', 'shop', 'updatepickuppoint', 529, 3, 'shop/updatepickuppoint', 0, 0, 0, '', '', '', 1, 1498135759, 1498135759),
(523, '物流跟踪设置', 'admin', 'config', 'expressmessage', 529, 3, 'config/expressmessage', 0, 0, 100, '', '', '', 1, 1498198990, 1498198990),
(524, '在线更新', 'admin', 'upgrade', 'onlineupdate', 10000, 2, 'upgrade/onlineupdate', 1, 0, 30, '', '', '', 1, 1498733102, 1498733102),
(525, '运费模板列表', 'admin', 'express', 'freighttemplatelist', 529, 3, 'express/freighttemplatelist', 0, 0, 0, '', '', '', 1, 1498733102, 1498733102),
(526, '编辑运费模板', 'admin', 'express', 'freighttemplateedit', 529, 3, 'express/freighttemplateedit', 0, 0, 2, '', '', '', 1, 1498733102, 1498733102),
(527, '注册与访问', 'admin', 'config', 'registerAndVisit', 528, 3, 'config/registerandvisit', 0, 0, 20, '', '', '', 1, 1498874511, 1498874511),
(528, '基础设置', 'admin', 'config', 'webconfig', 218, 2, 'config/webconfig', 1, 0, 1, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2342&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2342&extra=page%3D2</a>', '', '', 1, 1499343015, 1499343015),
(529, '物流配送', 'admin', 'express', 'expresscompany', 218, 2, 'express/expresscompany', 1, 0, 3, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2350&extra=page%3D2\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2350&extra=page%3D2</a>', '', '', 1, 1499343015, 1499343015),
(530, '站点帮助', 'admin', 'config', 'helpclass', 477, 2, 'config/helpdocument', 1, 0, 9, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2380&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2380&extra=page%3D1</a>', '', '', 1, 1499343015, 1499343015),
(10000, 'NIU云', 'admin', 'upgrade', 'onlineupdate', 0, 1, 'upgrade/onlineupdate', 0, 0, 100, '', '', '', 1, 1499343016, 1567673493),
(10001, '供货商', 'admin', 'member', 'supplierlist', 149, 2, 'member/supplierlist', 0, 0, 7, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2308&amp;extra=page%3D2&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2308&amp;extra=page%3D2&lt;/a&gt;', '', '', 1, 1499853120, 1568613657),
(10002, '添加供货商', 'admin', 'member', 'addsupplier', 10001, 3, 'member/addsupplier', 1, 0, 0, '', '', '', 1, 1499853120, 1499853120),
(10003, '修改供货商', 'admin', 'member', 'updatesupplier', 10001, 3, 'member/updatesupplier', 1, 0, 1, '', '', '', 1, 1499853120, 1499853120),
(10004, '店铺装修', 'admin', 'config', 'pctemplate', 477, 2, 'config/pctemplate', 1, 0, 4, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2373&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2373&extra=page%3D1</a>', '', '', 1, 1500608761, 1500608761),
(10005, '搜索', 'admin', 'config', 'searchconfig', 477, 2, 'config/searchconfig', 1, 0, 5, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2374&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2374&extra=page%3D1</a>', '', '', 1, 1500608765, 1500608765),
(10006, '促销版块', 'admin', 'system', 'goodsrecommendclassmobile', 10005, 3, 'system/goodsrecommendclassmobile', 0, 0, 20, '', '', '', 1, 1500608766, 1500608766),
(10007, '授权信息', 'admin', 'upgrade', 'devolutioninfo', 10000, 2, 'upgrade/devolutioninfo', 1, 0, 40, '', '', '', 1, 1500608776, 1500608776),
(10009, '插件管理', 'admin', 'extend', 'addonslist', 10000, 2, 'extend/addonslist', 1, 0, 41, '', '', '', 1, 1500633040, NULL),
(10010, '钩子管理', 'admin', 'extend', 'hookslist', 10000, 2, 'extend/hookslist', 1, 0, 42, '', '', '', 1, 1500633096, NULL),
(10011, '插件列表', 'admin', 'extend', 'pluginlist', 10008, 2, 'extend/pluginlist', 0, 0, 3, '', '', '', 1, 1500633141, NULL),
(10012, '添加钩子', 'admin', 'extend', 'addhooks', 10010, 3, 'extend/addhooks', 1, 0, 0, '', '', '', 1, 1500633268, NULL),
(10013, '修改钩子', 'admin', 'extend', 'updatehooks', 10010, 3, 'extend/updatehooks', 1, 0, 0, '', '', '', 1, 1500633326, NULL),
(10014, '插件配置', 'admin', 'extend', 'pluginconfig', 10008, 2, 'extend/pluginconfig', 0, 0, 4, '', '', '', 1, 1500633368, NULL),
(10015, '插件配置', 'admin', 'extend', 'addonsconfig', 10008, 2, 'extend/addonsconfig', 0, 0, 5, '', '', '', 1, 1500633398, NULL),
(10016, '自提点运费', 'admin', 'shop', 'pickuppointfreight', 529, 3, 'shop/pickuppointfreight', 1, 0, 4, '', '', '', 1, 1501809931, 1501809931),
(10017, '版权', 'admin', 'config', 'copyrightinfo', 528, 3, 'config/copyrightinfo', 0, 0, 8, '', '', '', 1, 1501810329, 1501810329),
(10018, '手机模板', 'admin', 'config', 'waptemplate', 10005, 3, 'config/waptemplate', 0, 0, 3, '', '', '', 1, 1501923272, 1501923272),
(10019, '客服', 'admin', 'config', 'customservice', 528, 3, 'config/customservice', 0, 0, 28, '', '', '', 1, 1502539867, 1502539867),
(10021, '手机端模板', 'admin', 'config', 'fixedtemplate', 10004, 3, 'config/fixedtemplate', 0, 0, 2, '', '', '', 1, 1502539867, 1502539867),
(10023, '商品楼层', 'admin', 'system', 'goodscategoryblock', 477, 2, 'system/goodscategoryblock', 1, 0, 3, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2372&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2372&extra=page%3D1</a>', '', '', 1, 0, 0),
(10024, '电脑端模板', 'admin', 'config', 'pctemplate', 10004, 3, 'config/pctemplate', 1, 0, 1, '', '', '', 1, 1504697788, 1504697788),
(10075, '商家通知', 'admin', 'config', 'businessnotifytemplate', 439, 3, 'config/businessnotifytemplate', 0, 0, 0, '', '', '', 1, 1505870490, 0),
(10077, '数据库管理', 'admin', 'dbdatabase', 'databaselist', 218, 2, 'dbdatabase/databaselist', 1, 0, 4, '相关教程：<a href=\"http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2385&extra=page%3D1\" target=\"_blank\">http://bbs.niushop.com.cn/forum.php?mod=viewthread&tid=2385&extra=page%3D1</a>', '', '', 1, 1506132536, 0),
(10078, '数据库恢复', 'admin', 'dbdatabase', 'importdatalist', 10077, 3, 'dbdatabase/importdatalist', 0, 0, 0, '', '', '', 1, 1506132758, 0),
(10079, 'SQL执行与导入', 'admin', 'dbdatabase', 'sqlfilequery', 10077, 3, 'dbdatabase/sqlfilequery', 0, 0, 0, '', '', '', 1, 1506132811, 0),
(10080, '添加首页公告', 'admin', 'config', 'addhomenotice', 445, 3, 'config/addhomenotice', 0, 0, 1, '', '', '', 1, 1508152805, 0),
(10081, '公告编辑', 'admin', 'config', 'updatehomenotice', 445, 3, 'config/updatehomenotice', 0, 0, 2, '', '', '', 1, 1508208576, 0),
(10082, '上传设置', 'admin', 'config', 'pictureuploadsetting', 528, 3, 'config/pictureuploadsetting', 0, 0, 21, '', '', '', 1, 1508152805, 0),
(10083, '系统更新', 'admin', 'upgrade', 'upgradePatch', 524, 3, 'upgrade/upgradepatch', 0, 0, 0, '', '', '', 1, 1508572839, 0),
(10084, '伪静态路由', 'admin', 'config', 'customPseudoStaticRule', 528, 3, 'config/customPseudoStaticRule', 0, 0, 24, '', '', '', 1, 1509941657, 0),
(10085, '编辑路由规则', 'admin', 'config', 'updateRoutingRule', 10084, 3, 'config/updateRoutingRule', 0, 0, 0, '', '', '', 1, 1509958647, 0),
(10086, '添加路由规则', 'admin', 'config', 'addRoutingRules', 10084, 3, 'config/addRoutingRules', 0, 0, 0, '', '', '', 1, 1509951666, 1509959648),
(10087, '广告位管理', 'admin', 'system', 'shopadvpositionlist', 381, 3, 'system/shopadvpositionlist', 0, 0, 0, '', '', '', 1, 1512180137, 0),
(10088, '虚拟商品类型', 'admin', 'goods', 'virtualgoodstypelist', 149, 2, 'goods/virtualgoodstypelist', 0, 0, 3, '相关教程：&lt;a href=&quot;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2305&amp;extra=page%3D3&quot; target=&quot;_blank&quot;&gt;http://bbs.niushop.com.cn/forum.php?mod=viewthread&amp;tid=2305&amp;extra=page%3D3&lt;/a&gt;', '', '', 1, 1512180139, 1568613557),
(10089, '编辑虚拟商品类型', 'admin', 'goods', 'editvirtualgoodstype', 10088, 3, 'goods/editvirtualgoodstype', 0, 0, 1, '', '', '', 1, 1512180139, 0),
(10090, '虚拟订单', 'admin', 'order', 'virtualorderlist', 184, 2, 'order/virtualorderlist', 0, 0, 2, '', '', '', 1, 1512180139, 1567673721),
(10091, '虚拟订单详情', 'admin', 'order', 'virtualorderdetail', 10090, 3, 'order/virtualorderdetail', 0, 0, 2, '', '', '', 1, 1512180139, 0),
(10092, '手机端自定义模板', 'admin', 'config', 'wapcustomTemplateList', 10004, 3, 'config/wapcustomTemplateList', 1, 0, 3, '手机端自定义模板', '', '', 1, 1517904079, 0),
(10093, '自定义模板编辑', 'admin', 'config', 'wapCustomTemplateEdit', 10004, 3, 'config/wapCustomTemplateEdit', 1, 0, 4, '手机端自定义模板编辑', '', '', 1, 1517904079, 0),
(10094, '交易设置', 'admin', 'config', 'shopset', 218, 2, 'config/shopset', 1, 0, 2, '相关教程：<a href=\"http://bbs.niushop.com.cn/thread-2384-1-1.html\" target=\"_blank\">http://bbs.niushop.com.cn/thread-2384-1-1.html</a>\"', '', '', 1, 1517904080, 0),
(10095, '运营', 'admin', 'config', 'visitConfig', 528, 3, 'config/visitconfig', 1, 0, 2, '访问设置', '', '', 1, 1517904080, 0),
(10096, '用户操作日志', 'admin', 'Member', 'userOperationLogList', 126, 2, 'Member/userOperationLogList', 1, 0, 10, '用户操作日志', '', '', 1, 1517904080, 0),
(10097, '转账配置', 'admin', 'config', 'transferAccountsSetting', 10094, 3, 'config/transferAccountsSetting', 0, 0, 4, '转账配置', '', '', 1, 1517904080, 0),
(10098, '奖励规则', 'admin', 'promotion', 'integral', 179, 2, 'promotion/integral', 1, 0, 10, '奖励规则', '', '', 1, 1517904080, 0),
(10099, '一键关注设置', 'admin', 'wchat', 'keyConcernConfig', 335, 2, 'wchat/keyConcernConfig', 1, 0, 12, '一键关注设置', '', '', 1, 1517904080, 0),
(10100, '商家服务', 'admin', 'config', 'merchantService', 528, 3, 'config/merchantService', 0, 0, 0, '商家服务', '', '', 1, 1517904080, 0),
(10102, '添加订单', 'admin', 'order', 'addorder', 184, 2, 'order/addorder', 1, 0, 3, '添加订单', '', '', 1, 1567653531, 1567653854),
(10103, '订单号', 'admin', 'ordernum', 'ordernumlist', 0, 1, 'ordernum/ordernumlist', 1, 0, 12, '订单编号', '', '', 1, 1567690827, 1567690964),
(10104, '订单号列表', 'admin', 'ordernum', 'ordernumlist', 10103, 2, 'ordernum/ordernumlist', 1, 0, 1, '订单号列表', '', '', 1, 1567691186, 0),
(10105, '添加订单号', 'admin', 'ordernum', 'ordernumadd', 10103, 2, 'ordernum/ordernumadd', 1, 0, 2, '添加订单号', '', '', 1, 1567691253, 0),
(10106, '手机壳', 'admin', 'ke', 'kelist', 0, 1, 'ke/kelist', 1, 0, 13, '手机壳', '', '', 1, 1567738243, 0),
(10107, '手机壳列表', 'admin', 'ke', 'kelist', 10106, 2, 'ke/kelist', 1, 0, 1, '手机壳列表', '', '', 1, 1567738705, 0),
(10108, '添加手机壳', 'admin', 'ke', 'addke', 10106, 2, 'ke/addke', 1, 0, 2, '添加手机壳', '', '', 1, 1567738764, 0),
(10109, '修改订单号', 'admin', 'ordernum', 'ordernumedit', 10103, 2, 'ordernum/ordernumedit', 0, 0, 3, '修改订单号', '', '', 1, 1567922574, 0),
(10110, '手机壳统计', 'admin', 'ke', 'tongji', 10106, 2, 'ke/tongji', 1, 0, 3, '手机壳统计', '', '', 1, 1568165993, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice`
--

CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL COMMENT '主键',
  `shopid` int(11) NOT NULL COMMENT '店铺ID（单店版为0）',
  `notice_message` varchar(255) DEFAULT '' COMMENT '公告内容',
  `is_enable` tinyint(1) DEFAULT '0' COMMENT '是否启用（0：隐藏，1：显示）'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='网站公告';

--
-- 转存表中的数据 `sys_notice`
--

INSERT INTO `sys_notice` (`id`, `shopid`, `notice_message`, `is_enable`) VALUES
(7, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice_records`
--

CREATE TABLE `sys_notice_records` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `send_type` int(11) NOT NULL DEFAULT '0' COMMENT '发送类型 1 短信发送  2邮箱发送',
  `send_account` varchar(255) NOT NULL DEFAULT '' COMMENT '发送账号',
  `send_config` text NOT NULL COMMENT '发送的配置信息',
  `records_type` int(11) NOT NULL DEFAULT '0' COMMENT '记录类型  1充值成功 2确认订单 3付款成功 4下单成功 5订单发货 6商家提醒退款订单 7 商家提醒订单提醒 8充值成功',
  `notice_title` varchar(255) NOT NULL DEFAULT '' COMMENT '通知标题',
  `notice_context` text NOT NULL COMMENT '通知内容',
  `is_send` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否发送  0未发送   1发送成功  2发送失败',
  `send_message` varchar(255) NOT NULL DEFAULT '' COMMENT '发送返回结果',
  `create_date` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `send_date` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知记录';

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice_template`
--

CREATE TABLE `sys_notice_template` (
  `template_id` int(11) NOT NULL COMMENT '模板id',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_content` text NOT NULL COMMENT '模板名称',
  `sign_name` varchar(50) NOT NULL DEFAULT '' COMMENT '签名',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型',
  `notification_mode` text NOT NULL COMMENT '通知方式'
) ENGINE=InnoDB AVG_ROW_LENGTH=1170 DEFAULT CHARSET=utf8 COMMENT='通知模版设置';

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice_template_item`
--

CREATE TABLE `sys_notice_template_item` (
  `id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL DEFAULT '' COMMENT '项名称',
  `show_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `replace_name` varchar(50) NOT NULL DEFAULT '' COMMENT '替换字段名字',
  `type_ids` varchar(255) NOT NULL COMMENT '关联type类型',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB AVG_ROW_LENGTH=1820 DEFAULT CHARSET=utf8 COMMENT='通知模板项';

--
-- 转存表中的数据 `sys_notice_template_item`
--

INSERT INTO `sys_notice_template_item` (`id`, `item_name`, `show_name`, `replace_name`, `type_ids`, `order`) VALUES
(1, '商场名称', '{商场名称}', 'shopname', 'after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order', 0),
(2, '用户名称', '{用户名称}', 'username', 'after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,bind_mobile,bind_email,order_remind,refund_order', 1),
(5, '商品名称', '{商品名称}', 'goodsname', 'order_deliver', 4),
(6, '商品规格', '{商品规格}', 'goodssku', 'order_deliver', 5),
(7, '主订单号', '{主订单号}', 'orderno', 'create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order', 6),
(8, '订单金额', '{订单金额}', 'ordermoney', 'create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order', 7),
(9, '商品金额', '{商品金额}', 'goodsmoney', 'create_order,pay_success,order_deliver', 8),
(10, '验证码', '{验证码}', 'number', 'register_validate,forgot_password,bind_mobile,bind_email', 9),
(11, '充值金额', '{充值金额}', 'rechargemoney', 'recharge_success', 0),
(12, '物流公司', '{物流公司}', 'expresscompany', 'order_deliver', 0),
(13, '快递编号', '{快递编号}', 'expressno', 'order_deliver', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice_template_type`
--

CREATE TABLE `sys_notice_template_type` (
  `type_id` int(11) NOT NULL,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型'
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8 COMMENT='通知模板类型';

--
-- 转存表中的数据 `sys_notice_template_type`
--

INSERT INTO `sys_notice_template_type` (`type_id`, `template_name`, `template_code`, `template_type`, `notify_type`) VALUES
(1, '注册成功', 'after_register', 'all', 'user'),
(2, '注册验证', 'register_validate', 'all', 'user'),
(3, '充值成功', 'recharge_success', 'all', 'user'),
(4, '确认订单', 'confirm_order', 'all', 'user'),
(5, '付款成功', 'pay_success', 'all', 'user'),
(6, '下单成功', 'create_order', 'all', 'user'),
(7, '订单发货', 'order_deliver', 'all', 'user'),
(8, '找回密码', 'forgot_password', 'all', 'user'),
(9, '手机绑定', 'bind_mobile', 'sms', 'user'),
(10, '邮箱绑定', 'bind_email', 'email', 'user'),
(11, '退款订单', 'refund_order', 'all', 'business'),
(12, '订单提醒', 'order_remind', 'all', 'business'),
(13, '充值成功', 'recharge_success', 'all', 'business');

-- --------------------------------------------------------

--
-- 表的结构 `sys_province`
--

CREATE TABLE `sys_province` (
  `province_id` int(11) NOT NULL,
  `area_id` tinyint(4) NOT NULL DEFAULT '0',
  `province_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=481 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_province`
--

INSERT INTO `sys_province` (`province_id`, `area_id`, `province_name`, `sort`) VALUES
(1, 2, '北京市', 1),
(2, 2, '天津市', 0),
(3, 2, '河北省', 0),
(4, 2, '山西省', 0),
(5, 2, '内蒙古自治区', 0),
(6, 5, '辽宁省', 0),
(7, 5, '吉林省', 0),
(8, 5, '黑龙江省', 0),
(9, 1, '上海市', 0),
(10, 1, '江苏省', 0),
(11, 1, '浙江省', 0),
(12, 1, '安徽省', 0),
(13, 3, '福建省', 0),
(14, 1, '江西省', 0),
(15, 2, '山东省', 0),
(16, 4, '河南省', 0),
(17, 4, '湖北省', 0),
(18, 4, '湖南省', 0),
(19, 3, '广东省', 0),
(20, 3, '广西壮族自治区', 0),
(21, 3, '海南省', 0),
(22, 7, '重庆市', 0),
(23, 7, '四川省', 0),
(24, 7, '贵州省', 0),
(25, 7, '云南省', 0),
(26, 7, '西藏自治区', 0),
(27, 6, '陕西省', 0),
(28, 6, '甘肃省', 0),
(29, 6, '青海省', 0),
(30, 6, '宁夏回族自治区', 0),
(31, 6, '新疆维吾尔自治区', 0),
(32, 8, '香港特别行政区', 0),
(33, 8, '澳门特别行政区', 0),
(34, 8, '台湾省', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_url_route`
--

CREATE TABLE `sys_url_route` (
  `routeid` int(10) UNSIGNED NOT NULL,
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '伪静态路由规则',
  `route` varchar(255) NOT NULL DEFAULT '' COMMENT '路由地址',
  `is_open` int(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统默认',
  `route_model` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配置伪静态使用的模块1.shop2.wap3.admin',
  `remark` text NOT NULL COMMENT '简介'
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8 COMMENT='系统伪静态路由';

--
-- 转存表中的数据 `sys_url_route`
--

INSERT INTO `sys_url_route` (`routeid`, `rule`, `route`, `is_open`, `is_system`, `route_model`, `remark`) VALUES
(1, 'goods', 'shop/goods/goodsinfo', 1, 1, 1, ''),
(2, 'list', 'shop/goods/goodslist', 1, 1, 1, ''),
(3, 'brands', 'shop/goods/brandlist', 1, 1, 1, ''),
(4, 'integralcenter', 'shop/goods/integralcenter', 1, 1, 1, ''),
(5, 'discount', 'shop/index/discount', 1, 1, 1, ''),
(7, 'membercenter', 'shop/member/index', 1, 0, 1, ''),
(8, 'article', 'shop/cms/articleclassinfo', 1, 1, 1, '文章详情');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE `sys_user` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例信息',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码（MD5）',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态  用户状态默认为1',
  `user_headimg` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统后台用户 0 不是 1 是',
  `is_member` int(11) NOT NULL DEFAULT '0' COMMENT '是否是前台会员',
  `user_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `user_tel_bind` int(1) NOT NULL DEFAULT '0' COMMENT '手机号是否绑定 0 未绑定 1 绑定 ',
  `user_qq` varchar(255) DEFAULT '' COMMENT 'qq号',
  `qq_openid` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq互联id',
  `qq_info` varchar(2000) NOT NULL DEFAULT '' COMMENT 'qq账号相关信息',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_email_bind` int(1) NOT NULL DEFAULT '0' COMMENT '是否邮箱绑定',
  `wx_openid` varchar(255) DEFAULT NULL COMMENT '微信用户openid',
  `wx_is_sub` int(1) NOT NULL DEFAULT '0' COMMENT '微信用户是否关注',
  `wx_info` varchar(2000) DEFAULT NULL COMMENT '微信用户信息',
  `other_info` varchar(255) DEFAULT NULL COMMENT '附加信息',
  `current_login_ip` varchar(255) DEFAULT NULL COMMENT '当前登录ip',
  `current_login_type` int(11) DEFAULT NULL COMMENT '当前登录的操作终端类型',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录ip',
  `last_login_type` int(11) DEFAULT NULL COMMENT '上次登录的操作终端类型',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `sex` smallint(6) DEFAULT '0' COMMENT '性别 0保密 1男 2女',
  `location` varchar(255) DEFAULT '' COMMENT '所在地',
  `nick_name` varchar(50) DEFAULT '牛酷用户' COMMENT '用户昵称',
  `wx_unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信unionid',
  `qrcode_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `wx_sub_time` int(11) DEFAULT '0' COMMENT '微信用户关注时间',
  `wx_notsub_time` int(11) DEFAULT '0' COMMENT '微信用户取消关注时间',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `current_login_time` int(11) DEFAULT '0' COMMENT '当前登录时间',
  `last_login_time` int(11) DEFAULT '0' COMMENT '上次登录时间',
  `birthday` int(11) DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=372 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`uid`, `instance_id`, `user_name`, `user_password`, `user_status`, `user_headimg`, `is_system`, `is_member`, `user_tel`, `user_tel_bind`, `user_qq`, `qq_openid`, `qq_info`, `user_email`, `user_email_bind`, `wx_openid`, `wx_is_sub`, `wx_info`, `other_info`, `current_login_ip`, `current_login_type`, `last_login_ip`, `last_login_type`, `login_num`, `real_name`, `sex`, `location`, `nick_name`, `wx_unionid`, `qrcode_template_id`, `wx_sub_time`, `wx_notsub_time`, `reg_time`, `current_login_time`, `last_login_time`, `birthday`) VALUES
(2, 0, 'admin', '86c3af337be36f155063a5e367ff9eec', 1, '', 1, 1, '', 0, '', '', '', '', 0, NULL, 0, NULL, NULL, '223.74.156.91', 1, '223.74.156.91', 1, 163, '', 0, '', '牛酷用户', '', 0, 0, 0, 2019, 1572339764, 1572325532, 0),
(3, 0, 'tonyyonghu', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 0, 1, '', 0, '1154771388', '', '', '', 0, '', 0, '', '', '127.0.0.1', 1, '127.0.0.1', 1, 3, '朱飞', 1, '打发第三方', 'tonyyonghu', '', 0, 0, 0, 1567741143, 1567764089, 1567763894, -28800),
(4, 0, 'tony', '86c3af337be36f155063a5e367ff9eec', 1, '', 1, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '113.91.37.57', 1, '113.91.38.7', 1, 65, '', 0, '', 'tony', '', 0, 0, 0, 1568873838, 1571990876, 1571813566, 0),
(5, 0, 'cc112233', '90a1693fbc726cd84731a03267f60665', 1, '', 0, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '49.118.90.98', 1, '', 0, 1, '', 0, '', 'cc112233', '', 0, 0, 0, 1570211784, 1570211785, 0, 0),
(6, 0, 'cc123456', '90a1693fbc726cd84731a03267f60665', 1, '', 0, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '49.118.90.98', 1, '', 0, 1, '', 0, '', 'cc123456', '', 0, 0, 0, 1570211835, 1570211835, 0, 0),
(7, 0, 'tonyonghu', '0fd42ae10e31884b056a00ca015c9a4c', 1, '', 0, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '183.12.240.7', 1, '', 0, 1, '', 0, '', 'tonyonghu', '', 0, 0, 0, 1571034323, 1571034323, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_admin`
--

CREATE TABLE `sys_user_admin` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'user用户ID',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `group_id_array` int(11) NOT NULL DEFAULT '0' COMMENT '系统用户组',
  `is_admin` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统管理员组',
  `admin_status` int(11) DEFAULT '1' COMMENT '状态 默认为1',
  `desc` text COMMENT '附加信息'
) ENGINE=InnoDB AVG_ROW_LENGTH=910 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

--
-- 转存表中的数据 `sys_user_admin`
--

INSERT INTO `sys_user_admin` (`uid`, `admin_name`, `group_id_array`, `is_admin`, `admin_status`, `desc`) VALUES
(1, '管理员', 1, 1, 1, NULL),
(2, '管理员', 2, 1, 1, NULL),
(4, 'tony', 3, 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_group`
--

CREATE TABLE `sys_user_group` (
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `group_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户组状态',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统用户组',
  `module_id_array` text NOT NULL COMMENT '系统模块ID组，用，隔开',
  `desc` text COMMENT '描述',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=963 DEFAULT CHARSET=utf8 COMMENT='系统用户组表';

--
-- 转存表中的数据 `sys_user_group`
--

INSERT INTO `sys_user_group` (`group_id`, `instance_id`, `group_name`, `group_status`, `is_system`, `module_id_array`, `desc`, `create_time`, `modify_time`) VALUES
(1, 0, '管理员组', 1, 1, '120,121,122,123,126,127,128,129,133,137,139,144,145,149,151,169,170,171,172,176,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,221,334,335,336,339,340,341,342,343,358,359,360,361,381,382,383,387,388,389,390,392,394,395,403,405,409,418,419,420,421,422,423,424,425,427,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,450,451,452,454,455,456,457,459,460,461,462,463,469,471,472,474,477,478,479,480,481,482,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,501,502,503,504,506,507,508,509,510,512,513,517,518,519,520,521,522,523,524,525,526,527,528,529,530,10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10021,10022,10023,10024,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091', NULL, 2018, 0),
(2, 0, '管理员组', 1, 1, '120,121,122,123,126,127,128,129,133,137,139,144,145,149,151,169,170,171,172,176,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,221,334,335,336,339,340,341,342,343,358,359,360,361,381,382,383,387,388,389,390,392,394,395,403,405,409,418,419,420,421,422,423,424,425,427,430,431,432,433,434,436,437,439,440,441,442,443,444,445,446,447,450,451,452,454,455,456,457,459,460,461,462,463,469,471,472,474,477,478,479,480,481,482,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,501,502,503,504,506,509,510,512,513,518,519,520,521,522,523,524,525,526,527,528,529,530,10000,10001,10002,10003,10004,10005,10006,10007,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10021,10023,10024,10075,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100', NULL, 2019, 0),
(3, 0, '手机壳组', 1, 0, '120,121,122,123,129,137,145,497,498,488,489,490,504,503,509,510,149,139,169,151,171,172,210,334,419,420,421,422,423,424,425,478,479,480,481,482,484,485,10001,10002,10003,10088,10089,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,10098,184,185,190,194,10090,10091,10102,218,126,127,128,10096,528,418,439,456,499,527,10017,10019,10082,10084,10095,10100,529,189,191,192,471,472,486,487,519,520,521,522,523,525,526,10016,10077,10078,10079,10094,221,494,10097,335,336,339,340,358,341,359,342,450,451,343,361,447,10099,409,403,405,454,457,459,461,462,463,460,477,381,382,383,387,388,389,10087,427,430,436,437,431,432,433,434,452,455,445,10080,10081,491,492,493,530,440,441,442,443,444,10004,390,392,394,395,10021,10024,10092,10093,10005,474,10006,10018,10023,10000,524,10083,10007,10009,10010,10012,10013,10103,10104,10105,10109,10106,10107,10108,10110', '', 1568874175, 1568874190);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_log`
--

CREATE TABLE `sys_user_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `is_system` int(11) NOT NULL DEFAULT '1' COMMENT '是否是后台操作',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '操作控制器',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '操作方案',
  `data` text COMMENT '传输数据',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=82 DEFAULT CHARSET=utf8 COMMENT='用户操作日志';

-- --------------------------------------------------------

--
-- 表的结构 `sys_version_devolution`
--

CREATE TABLE `sys_version_devolution` (
  `id` int(11) UNSIGNED NOT NULL,
  `devolution_username` varchar(255) NOT NULL DEFAULT '' COMMENT '授权账户',
  `devolution_password` varchar(255) NOT NULL DEFAULT '' COMMENT '授权密码',
  `create_date` int(11) DEFAULT '0' COMMENT '更新时间',
  `devolution_code` varchar(255) NOT NULL DEFAULT '' COMMENT '授权码'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='用户授权信息';

-- --------------------------------------------------------

--
-- 表的结构 `sys_version_patch`
--

CREATE TABLE `sys_version_patch` (
  `patch_id` int(11) UNSIGNED NOT NULL,
  `patch_type` int(11) NOT NULL DEFAULT '1' COMMENT '补丁类型  1. B2C单用户商城 2.B2C 单用户分销商城 3 B2B2C多用户商城',
  `patch_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁类型名称',
  `patch_release` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁编号',
  `patch_name` varchar(255) NOT NULL DEFAULT '' COMMENT '补丁标题',
  `patch_no` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '版本号',
  `patch_file_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁文件名称',
  `patch_log` text NOT NULL COMMENT '版本补丁更新日志',
  `patch_file_size` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补丁文件大小',
  `is_up` int(11) NOT NULL DEFAULT '2' COMMENT '是否升级  1代表已升级  0未升级 2全部',
  `modify_date` int(11) DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本补丁管理';

-- --------------------------------------------------------

--
-- 表的结构 `sys_version_update_records`
--

CREATE TABLE `sys_version_update_records` (
  `id` int(11) UNSIGNED NOT NULL,
  `auth_no` varchar(255) NOT NULL DEFAULT '' COMMENT '授权码',
  `update_type` int(11) NOT NULL DEFAULT '1' COMMENT '更新方式1. 线下2.在线',
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '当前版本',
  `update_version` varchar(255) NOT NULL DEFAULT '' COMMENT '升级版本',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `version_type` varchar(255) NOT NULL DEFAULT 'b2c' COMMENT '升级版本',
  `remark` text NOT NULL COMMENT '更新说明',
  `is_complete` int(11) NOT NULL DEFAULT '0' COMMENT '是否更新完成'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本升级记录表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_website`
--

CREATE TABLE `sys_website` (
  `website_id` int(10) UNSIGNED NOT NULL COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `web_desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '网站描述',
  `key_words` varchar(255) NOT NULL DEFAULT '' COMMENT '网站关键字',
  `web_icp` varchar(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `style_id_pc` int(10) NOT NULL DEFAULT '2' COMMENT '前台网站风格（1：热情洋溢模板，2：蓝色清爽版）',
  `web_address` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系地址',
  `web_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公众号二维码',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺网址',
  `web_email` varchar(255) NOT NULL DEFAULT '' COMMENT '网站邮箱',
  `web_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系方式',
  `web_qq` varchar(255) NOT NULL DEFAULT '' COMMENT '网站qq号',
  `web_weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '网站微信号',
  `web_status` int(10) NOT NULL DEFAULT '1' COMMENT '网站运营状态1.开启 2.关闭 ',
  `third_count` text NOT NULL COMMENT '第三方统计',
  `close_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '站点关闭原因',
  `wap_status` int(10) NOT NULL DEFAULT '1' COMMENT '手机端运营状态 1.开启2.关闭',
  `style_id_admin` int(10) DEFAULT '4' COMMENT '后台网站风格（3：旧模板，4：新模板）',
  `create_time` int(11) DEFAULT '0' COMMENT '网站创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '网站修改时间',
  `url_type` int(11) NOT NULL DEFAULT '0' COMMENT '网站访问模式',
  `web_popup_title` varchar(50) NOT NULL DEFAULT '' COMMENT '网站弹出框标题',
  `web_wechat_share_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '微信分享logo',
  `web_gov_record` varchar(60) NOT NULL DEFAULT '' COMMENT '网站公安备案信息',
  `web_gov_record_url` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公安备案跳转链接地址',
  `is_show_follow` smallint(1) NOT NULL DEFAULT '1' COMMENT 'wap端是否显示顶部关注'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='网站信息表';

--
-- 转存表中的数据 `sys_website`
--

INSERT INTO `sys_website` (`website_id`, `title`, `logo`, `web_desc`, `key_words`, `web_icp`, `style_id_pc`, `web_address`, `web_qrcode`, `web_url`, `web_email`, `web_phone`, `web_qq`, `web_weixin`, `web_status`, `third_count`, `close_reason`, `wap_status`, `style_id_admin`, `create_time`, `modify_time`, `url_type`, `web_popup_title`, `web_wechat_share_logo`, `web_gov_record`, `web_gov_record_url`, `is_show_follow`) VALUES
(1, '手机壳商城系统', 'public/static/images/default_img_url/logo.png', '开源商城', '', '', 1, '山西省太原市', 'public/static/images/default_img_url/qrcode.png', 'http://www.tangguotai.com/', '', '400-886-7993', '', '', 1, '', '对不起，牛酷商城维护中，大家敬请期待...', 1, 4, 1477452112, 1571033948, 0, '', '', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sys_web_style`
--

CREATE TABLE `sys_web_style` (
  `style_id` int(10) UNSIGNED NOT NULL,
  `style_name` varchar(50) NOT NULL DEFAULT '' COMMENT '样式名称',
  `style_path` varchar(255) NOT NULL DEFAULT '' COMMENT '样式路径',
  `stye_img` varchar(255) NOT NULL DEFAULT '' COMMENT '样式图片路径',
  `desc` text COMMENT '备注',
  `type` int(11) DEFAULT '1' COMMENT '1：前台样式，2：后台样式',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='网站前台样式表';

--
-- 转存表中的数据 `sys_web_style`
--

INSERT INTO `sys_web_style` (`style_id`, `style_name`, `style_path`, `stye_img`, `desc`, `type`, `create_time`, `modify_time`) VALUES
(1, '热情洋溢', 'default', '', NULL, 1, 0, 0),
(2, '蓝色清爽', 'blue', '', NULL, 1, 0, 0),
(4, '简约版', 'adminblue', '', '', 2, 1500608775, 1500608775);

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_auth`
--

CREATE TABLE `sys_weixin_auth` (
  `id` int(10) UNSIGNED NOT NULL,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `authorizer_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的appid  授权之后不用刷新',
  `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺授权之后的刷新token，每月刷新',
  `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的公众号token，只有2小时',
  `func_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '授权项目',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号头像url',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号原始账号',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始名称',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号二维码url',
  `auth_time` int(11) DEFAULT '0' COMMENT '授权时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='店铺(实例)微信公众账号授权';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_default_replay`
--

CREATE TABLE `sys_weixin_default_replay` (
  `id` int(10) UNSIGNED NOT NULL,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='关注时回复';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_fans`
--

CREATE TABLE `sys_weixin_fans` (
  `fans_id` int(11) NOT NULL COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  `subscribe_date` int(11) DEFAULT '0' COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT '0' COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT '0' COMMENT '粉丝信息最后更新时间'
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8 COMMENT='微信公众号获取粉丝列表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_follow_replay`
--

CREATE TABLE `sys_weixin_follow_replay` (
  `id` int(10) UNSIGNED NOT NULL,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='关注时回复';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_functions_button`
--

CREATE TABLE `sys_weixin_functions_button` (
  `button_id` int(11) NOT NULL COMMENT '主键id',
  `instance_id` int(11) NOT NULL COMMENT '实例',
  `button_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `keyname` varchar(20) NOT NULL DEFAULT '' COMMENT '触发关键词',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '触发网址',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发次数',
  `is_enabled` int(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_system` int(1) DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期'
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8 COMMENT='微信功能按钮';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_instance_msg`
--

CREATE TABLE `sys_weixin_instance_msg` (
  `id` int(11) NOT NULL COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` bit(1) DEFAULT b'0' COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字'
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8 COMMENT='微信实例消息';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_key_replay`
--

CREATE TABLE `sys_weixin_key_replay` (
  `id` int(10) UNSIGNED NOT NULL,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `key` varchar(255) NOT NULL COMMENT '关键词',
  `match_type` tinyint(4) NOT NULL COMMENT '匹配类型1模糊匹配2全部匹配',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='关键词回复';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_media`
--

CREATE TABLE `sys_weixin_media` (
  `media_id` int(11) UNSIGNED NOT NULL COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id店铺id',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型1文本(项表无内容) 2单图文 3多图文',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期'
) ENGINE=InnoDB AVG_ROW_LENGTH=1170 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_media_item`
--

CREATE TABLE `sys_weixin_media_item` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'id',
  `media_id` int(11) NOT NULL COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(50) NOT NULL COMMENT '作者',
  `cover` varchar(200) NOT NULL COMMENT '图文消息封面',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT '封面图片显示在正文中',
  `summary` text,
  `content` text NOT NULL COMMENT '正文',
  `content_source_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数'
) ENGINE=InnoDB AVG_ROW_LENGTH=712 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_menu`
--

CREATE TABLE `sys_weixin_menu` (
  `menu_id` int(11) NOT NULL COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `menu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `ico` varchar(32) NOT NULL DEFAULT '' COMMENT '菜图标单',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `menu_event_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1普通url 2 图文素材 3 功能',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '图文消息ID',
  `menu_event_url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单url',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期'
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8 COMMENT='微设置->微店菜单';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_msg_template`
--

CREATE TABLE `sys_weixin_msg_template` (
  `id` int(11) NOT NULL COMMENT '主键',
  `template_no` varchar(55) NOT NULL COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `contents` varchar(255) NOT NULL DEFAULT '' COMMENT '内容示例',
  `template_id` varchar(55) DEFAULT '' COMMENT '模版id',
  `headtext` varchar(255) DEFAULT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) DEFAULT NULL COMMENT '底部文字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息模版';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_qrcode_template`
--

CREATE TABLE `sys_weixin_qrcode_template` (
  `id` int(11) NOT NULL COMMENT '实例ID',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图片',
  `nick_font_color` varchar(255) NOT NULL DEFAULT '#000' COMMENT '昵称字体颜色',
  `nick_font_size` smallint(6) NOT NULL DEFAULT '12' COMMENT '昵称字体大小',
  `is_logo_show` smallint(6) NOT NULL DEFAULT '1' COMMENT 'logo是否显示',
  `header_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部左边距',
  `header_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部上边距',
  `name_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称左边距',
  `name_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称上边距',
  `logo_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo左边距',
  `logo_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo上边距',
  `code_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码左边距',
  `code_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码上边距',
  `is_check` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除  0未删除 1删除',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '模板样式路径'
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 COMMENT='微信推广二维码模板管理';

--
-- 转存表中的数据 `sys_weixin_qrcode_template`
--

INSERT INTO `sys_weixin_qrcode_template` (`id`, `instance_id`, `background`, `nick_font_color`, `nick_font_size`, `is_logo_show`, `header_left`, `header_top`, `name_left`, `name_top`, `logo_left`, `logo_top`, `code_left`, `code_top`, `is_check`, `is_remove`, `template_url`) VALUES
(1, 0, 'public/static/images/qrcode_bg/qrcode_bg.png', '#2b2b2b', 23, 1, '93px', '467px', '159px', '479px', '98px', '319px', '89px', '88px', 1, 0, 'public/static/images/qrcode_bg/template_bg_img.png');

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_user_msg`
--

CREATE TABLE `sys_weixin_user_msg` (
  `msg_id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `msg_type` varchar(255) NOT NULL,
  `content` text,
  `is_replay` int(11) NOT NULL DEFAULT '0' COMMENT '是否回复',
  `create_time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_user_msg_replay`
--

CREATE TABLE `sys_weixin_user_msg_replay` (
  `replay_id` int(10) UNSIGNED NOT NULL,
  `msg_id` int(11) NOT NULL,
  `replay_uid` int(11) NOT NULL COMMENT '当前客服uid',
  `replay_type` varchar(255) NOT NULL,
  `content` text,
  `replay_time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息回复表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_wexin_onekeysubscribe`
--

CREATE TABLE `sys_wexin_onekeysubscribe` (
  `instance_id` int(11) NOT NULL COMMENT '实例ID',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '一键关注url'
) ENGINE=InnoDB AVG_ROW_LENGTH=2048 DEFAULT CHARSET=utf8 COMMENT='微信一键关注设置';

--
-- 转储表的索引
--

--
-- 表的索引 `nc_cms_article`
--
ALTER TABLE `nc_cms_article`
  ADD PRIMARY KEY (`article_id`);

--
-- 表的索引 `nc_cms_article_class`
--
ALTER TABLE `nc_cms_article_class`
  ADD PRIMARY KEY (`class_id`);

--
-- 表的索引 `nc_cms_comment`
--
ALTER TABLE `nc_cms_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- 表的索引 `nc_cms_topic`
--
ALTER TABLE `nc_cms_topic`
  ADD PRIMARY KEY (`topic_id`);

--
-- 表的索引 `ns_account`
--
ALTER TABLE `ns_account`
  ADD PRIMARY KEY (`account_id`);

--
-- 表的索引 `ns_account_assistant_records`
--
ALTER TABLE `ns_account_assistant_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_account_order_records`
--
ALTER TABLE `ns_account_order_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_account_period`
--
ALTER TABLE `ns_account_period`
  ADD PRIMARY KEY (`period_id`);

--
-- 表的索引 `ns_account_records`
--
ALTER TABLE `ns_account_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_account_return_records`
--
ALTER TABLE `ns_account_return_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_account_withdraw_records`
--
ALTER TABLE `ns_account_withdraw_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_account_withdraw_user_records`
--
ALTER TABLE `ns_account_withdraw_user_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_attribute`
--
ALTER TABLE `ns_attribute`
  ADD PRIMARY KEY (`attr_id`);

--
-- 表的索引 `ns_attribute_value`
--
ALTER TABLE `ns_attribute_value`
  ADD PRIMARY KEY (`attr_value_id`);

--
-- 表的索引 `ns_cart`
--
ALTER TABLE `ns_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `member_id` (`buyer_id`);

--
-- 表的索引 `ns_click_fabulous`
--
ALTER TABLE `ns_click_fabulous`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_consult`
--
ALTER TABLE `ns_consult`
  ADD PRIMARY KEY (`consult_id`);

--
-- 表的索引 `ns_consult_type`
--
ALTER TABLE `ns_consult_type`
  ADD PRIMARY KEY (`ct_id`);

--
-- 表的索引 `ns_coupon`
--
ALTER TABLE `ns_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- 表的索引 `ns_coupon_goods`
--
ALTER TABLE `ns_coupon_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_coupon_type`
--
ALTER TABLE `ns_coupon_type`
  ADD PRIMARY KEY (`coupon_type_id`);

--
-- 表的索引 `ns_express_company`
--
ALTER TABLE `ns_express_company`
  ADD PRIMARY KEY (`co_id`);

--
-- 表的索引 `ns_express_shipping`
--
ALTER TABLE `ns_express_shipping`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `IDX_express_shipping_co_id` (`co_id`),
  ADD KEY `IDX_express_shipping_shopId` (`shop_id`);

--
-- 表的索引 `ns_express_shipping_items`
--
ALTER TABLE `ns_express_shipping_items`
  ADD PRIMARY KEY (`sid`,`field_name`);

--
-- 表的索引 `ns_express_shipping_items_library`
--
ALTER TABLE `ns_express_shipping_items_library`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `ns_gift_grant_records`
--
ALTER TABLE `ns_gift_grant_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_goods`
--
ALTER TABLE `ns_goods`
  ADD PRIMARY KEY (`goods_id`),
  ADD KEY `UK_ns_goods_brand_id` (`brand_id`),
  ADD KEY `UK_ns_goods_category_id` (`category_id`),
  ADD KEY `UK_ns_goods_category_id_1` (`category_id_1`),
  ADD KEY `UK_ns_goods_category_id_2` (`category_id_2`),
  ADD KEY `UK_ns_goods_category_id_3` (`category_id_3`),
  ADD KEY `UK_ns_goods_extend_category_id` (`extend_category_id`),
  ADD KEY `UK_ns_goods_extend_category_id_1` (`extend_category_id_1`),
  ADD KEY `UK_ns_goods_extend_category_id_2` (`extend_category_id_2`),
  ADD KEY `UK_ns_goods_extend_category_id_3` (`extend_category_id_3`),
  ADD KEY `UK_ns_goods_goods_attribute_id` (`goods_attribute_id`),
  ADD KEY `UK_ns_goods_group_id_array` (`group_id_array`),
  ADD KEY `UK_ns_goods_promotion_price` (`promotion_price`);

--
-- 表的索引 `ns_goods_attribute`
--
ALTER TABLE `ns_goods_attribute`
  ADD PRIMARY KEY (`attr_id`),
  ADD KEY `UK_ns_goods_attribute_attr_value_id` (`attr_value_id`);

--
-- 表的索引 `ns_goods_attribute_value`
--
ALTER TABLE `ns_goods_attribute_value`
  ADD PRIMARY KEY (`attr_value_id`),
  ADD KEY `IDX_category_propvalues_c_pId` (`attr_id`),
  ADD KEY `IDX_category_propvalues_orders` (`sort`),
  ADD KEY `IDX_category_propvalues_value` (`attr_value`),
  ADD KEY `UK_ns_goods_attribute_value_attr_value_id` (`attr_value_id`);

--
-- 表的索引 `ns_goods_brand`
--
ALTER TABLE `ns_goods_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- 表的索引 `ns_goods_category`
--
ALTER TABLE `ns_goods_category`
  ADD PRIMARY KEY (`category_id`);

--
-- 表的索引 `ns_goods_category_block`
--
ALTER TABLE `ns_goods_category_block`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_goods_comment`
--
ALTER TABLE `ns_goods_comment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_goods_evaluate`
--
ALTER TABLE `ns_goods_evaluate`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_goods_group`
--
ALTER TABLE `ns_goods_group`
  ADD PRIMARY KEY (`group_id`);

--
-- 表的索引 `ns_goods_sku`
--
ALTER TABLE `ns_goods_sku`
  ADD PRIMARY KEY (`sku_id`);

--
-- 表的索引 `ns_goods_sku_picture`
--
ALTER TABLE `ns_goods_sku_picture`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_goods_spec`
--
ALTER TABLE `ns_goods_spec`
  ADD PRIMARY KEY (`spec_id`),
  ADD KEY `IDX_category_props_categoryId` (`shop_id`),
  ADD KEY `IDX_category_props_orders` (`sort`);

--
-- 表的索引 `ns_goods_spec_value`
--
ALTER TABLE `ns_goods_spec_value`
  ADD PRIMARY KEY (`spec_value_id`),
  ADD KEY `IDX_category_propvalues_c_pId` (`spec_id`),
  ADD KEY `IDX_category_propvalues_orders` (`sort`),
  ADD KEY `IDX_category_propvalues_value` (`spec_value_name`);

--
-- 表的索引 `ns_ke`
--
ALTER TABLE `ns_ke`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_member`
--
ALTER TABLE `ns_member`
  ADD PRIMARY KEY (`uid`);

--
-- 表的索引 `ns_member_account`
--
ALTER TABLE `ns_member_account`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_member_account_records`
--
ALTER TABLE `ns_member_account_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_member_balance_withdraw`
--
ALTER TABLE `ns_member_balance_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_member_bank_account`
--
ALTER TABLE `ns_member_bank_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_member_bank_account_uid` (`uid`);

--
-- 表的索引 `ns_member_express_address`
--
ALTER TABLE `ns_member_express_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_member_express_address_uid` (`uid`);

--
-- 表的索引 `ns_member_favorites`
--
ALTER TABLE `ns_member_favorites`
  ADD PRIMARY KEY (`log_id`);

--
-- 表的索引 `ns_member_gift`
--
ALTER TABLE `ns_member_gift`
  ADD PRIMARY KEY (`gift_id`);

--
-- 表的索引 `ns_member_level`
--
ALTER TABLE `ns_member_level`
  ADD PRIMARY KEY (`level_id`);

--
-- 表的索引 `ns_member_recharge`
--
ALTER TABLE `ns_member_recharge`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_notice`
--
ALTER TABLE `ns_notice`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_order`
--
ALTER TABLE `ns_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `UK_ns_order_buyer_id` (`buyer_id`),
  ADD KEY `UK_ns_order_order_no` (`order_no`),
  ADD KEY `UK_ns_order_pay_status` (`pay_status`),
  ADD KEY `UK_ns_order_status` (`order_status`);

--
-- 表的索引 `ns_ordernum`
--
ALTER TABLE `ns_ordernum`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_order_action`
--
ALTER TABLE `ns_order_action`
  ADD PRIMARY KEY (`action_id`);

--
-- 表的索引 `ns_order_goods`
--
ALTER TABLE `ns_order_goods`
  ADD PRIMARY KEY (`order_goods_id`),
  ADD KEY `UK_ns_order_goods_buyer_id` (`buyer_id`),
  ADD KEY `UK_ns_order_goods_goods_id` (`goods_id`),
  ADD KEY `UK_ns_order_goods_order_id` (`order_id`),
  ADD KEY `UK_ns_order_goods_promotion_id` (`promotion_id`),
  ADD KEY `UK_ns_order_goods_sku_id` (`sku_id`);

--
-- 表的索引 `ns_order_goods_express`
--
ALTER TABLE `ns_order_goods_express`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UK_ns_order_goods_express_order_goods_id_array` (`order_goods_id_array`),
  ADD KEY `UK_ns_order_goods_express_order_id` (`order_id`),
  ADD KEY `UK_ns_order_goods_express_uid` (`uid`);

--
-- 表的索引 `ns_order_goods_promotion_details`
--
ALTER TABLE `ns_order_goods_promotion_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ns_order_goods_promotion_d_order_id` (`order_id`),
  ADD KEY `IDX_ns_order_goods_promotion_d_promotion_id` (`promotion_id`),
  ADD KEY `IDX_ns_order_goods_promotion_d_promotion_type` (`promotion_type`),
  ADD KEY `IDX_ns_order_goods_promotion_d_sku_id` (`sku_id`);

--
-- 表的索引 `ns_order_payment`
--
ALTER TABLE `ns_order_payment`
  ADD KEY `IDX_ns_order_payment_out_trade_no` (`out_trade_no`),
  ADD KEY `IDX_ns_order_payment_pay_status` (`pay_status`),
  ADD KEY `IDX_ns_order_payment_pay_type` (`pay_type`),
  ADD KEY `IDX_ns_order_payment_shop_id` (`shop_id`);

--
-- 表的索引 `ns_order_pickup`
--
ALTER TABLE `ns_order_pickup`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_order_promotion_details`
--
ALTER TABLE `ns_order_promotion_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UK_ns_order_promotion_details_order_id` (`order_id`),
  ADD KEY `UK_ns_order_promotion_details_promotion_id` (`promotion_id`),
  ADD KEY `UK_ns_order_promotion_details_promotion_type` (`promotion_type`),
  ADD KEY `UK_ns_order_promotion_details_promotion_type_id` (`promotion_type_id`);

--
-- 表的索引 `ns_order_refund`
--
ALTER TABLE `ns_order_refund`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_order_refund_account_records`
--
ALTER TABLE `ns_order_refund_account_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_order_shipping_fee`
--
ALTER TABLE `ns_order_shipping_fee`
  ADD PRIMARY KEY (`shipping_fee_id`);

--
-- 表的索引 `ns_order_shop_return`
--
ALTER TABLE `ns_order_shop_return`
  ADD PRIMARY KEY (`shop_id`);

--
-- 表的索引 `ns_pickup_point`
--
ALTER TABLE `ns_pickup_point`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_platform_adv`
--
ALTER TABLE `ns_platform_adv`
  ADD PRIMARY KEY (`adv_id`);

--
-- 表的索引 `ns_platform_adv_position`
--
ALTER TABLE `ns_platform_adv_position`
  ADD PRIMARY KEY (`ap_id`);

--
-- 表的索引 `ns_platform_block`
--
ALTER TABLE `ns_platform_block`
  ADD PRIMARY KEY (`block_id`);

--
-- 表的索引 `ns_platform_goods_recommend`
--
ALTER TABLE `ns_platform_goods_recommend`
  ADD PRIMARY KEY (`recommend_id`);

--
-- 表的索引 `ns_platform_goods_recommend_class`
--
ALTER TABLE `ns_platform_goods_recommend_class`
  ADD PRIMARY KEY (`class_id`);

--
-- 表的索引 `ns_platform_help_class`
--
ALTER TABLE `ns_platform_help_class`
  ADD PRIMARY KEY (`class_id`);

--
-- 表的索引 `ns_platform_help_document`
--
ALTER TABLE `ns_platform_help_document`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_platform_link`
--
ALTER TABLE `ns_platform_link`
  ADD PRIMARY KEY (`link_id`);

--
-- 表的索引 `ns_point_config`
--
ALTER TABLE `ns_point_config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_promotion_bundling`
--
ALTER TABLE `ns_promotion_bundling`
  ADD PRIMARY KEY (`bl_id`);

--
-- 表的索引 `ns_promotion_bundling_goods`
--
ALTER TABLE `ns_promotion_bundling_goods`
  ADD PRIMARY KEY (`bl_goods_id`);

--
-- 表的索引 `ns_promotion_discount`
--
ALTER TABLE `ns_promotion_discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- 表的索引 `ns_promotion_discount_goods`
--
ALTER TABLE `ns_promotion_discount_goods`
  ADD PRIMARY KEY (`discount_goods_id`);

--
-- 表的索引 `ns_promotion_full_mail`
--
ALTER TABLE `ns_promotion_full_mail`
  ADD PRIMARY KEY (`mail_id`);

--
-- 表的索引 `ns_promotion_gift`
--
ALTER TABLE `ns_promotion_gift`
  ADD PRIMARY KEY (`gift_id`);

--
-- 表的索引 `ns_promotion_gift_goods`
--
ALTER TABLE `ns_promotion_gift_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_promotion_mansong`
--
ALTER TABLE `ns_promotion_mansong`
  ADD PRIMARY KEY (`mansong_id`);

--
-- 表的索引 `ns_promotion_mansong_goods`
--
ALTER TABLE `ns_promotion_mansong_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_promotion_mansong_rule`
--
ALTER TABLE `ns_promotion_mansong_rule`
  ADD PRIMARY KEY (`rule_id`);

--
-- 表的索引 `ns_reward_rule`
--
ALTER TABLE `ns_reward_rule`
  ADD PRIMARY KEY (`shop_id`);

--
-- 表的索引 `ns_shop`
--
ALTER TABLE `ns_shop`
  ADD PRIMARY KEY (`shop_id`);

--
-- 表的索引 `ns_shop_ad`
--
ALTER TABLE `ns_shop_ad`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_shop_coin_records`
--
ALTER TABLE `ns_shop_coin_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_shop_express_address`
--
ALTER TABLE `ns_shop_express_address`
  ADD PRIMARY KEY (`express_address_id`);

--
-- 表的索引 `ns_shop_group`
--
ALTER TABLE `ns_shop_group`
  ADD PRIMARY KEY (`shop_group_id`);

--
-- 表的索引 `ns_shop_navigation`
--
ALTER TABLE `ns_shop_navigation`
  ADD PRIMARY KEY (`nav_id`);

--
-- 表的索引 `ns_shop_navigation_template`
--
ALTER TABLE `ns_shop_navigation_template`
  ADD PRIMARY KEY (`template_id`);

--
-- 表的索引 `ns_shop_order_account_records`
--
ALTER TABLE `ns_shop_order_account_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ns_shop_weixin_share`
--
ALTER TABLE `ns_shop_weixin_share`
  ADD PRIMARY KEY (`shop_id`);

--
-- 表的索引 `ns_supplier`
--
ALTER TABLE `ns_supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- 表的索引 `ns_virtual_goods`
--
ALTER TABLE `ns_virtual_goods`
  ADD PRIMARY KEY (`virtual_goods_id`);

--
-- 表的索引 `ns_virtual_goods_group`
--
ALTER TABLE `ns_virtual_goods_group`
  ADD PRIMARY KEY (`virtual_goods_group_id`);

--
-- 表的索引 `ns_virtual_goods_type`
--
ALTER TABLE `ns_virtual_goods_type`
  ADD PRIMARY KEY (`virtual_goods_type_id`);

--
-- 表的索引 `sys_addons`
--
ALTER TABLE `sys_addons`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_album_class`
--
ALTER TABLE `sys_album_class`
  ADD PRIMARY KEY (`album_id`);

--
-- 表的索引 `sys_album_picture`
--
ALTER TABLE `sys_album_picture`
  ADD PRIMARY KEY (`pic_id`);

--
-- 表的索引 `sys_area`
--
ALTER TABLE `sys_area`
  ADD PRIMARY KEY (`area_id`);

--
-- 表的索引 `sys_city`
--
ALTER TABLE `sys_city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `IDX_g_city_CityName` (`city_name`);

--
-- 表的索引 `sys_config`
--
ALTER TABLE `sys_config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_custom_template`
--
ALTER TABLE `sys_custom_template`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_district`
--
ALTER TABLE `sys_district`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `IDX_g_district_DistrictName` (`district_name`);

--
-- 表的索引 `sys_hooks`
--
ALTER TABLE `sys_hooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 表的索引 `sys_instance`
--
ALTER TABLE `sys_instance`
  ADD PRIMARY KEY (`instance_id`);

--
-- 表的索引 `sys_instance_type`
--
ALTER TABLE `sys_instance_type`
  ADD PRIMARY KEY (`instance_typeid`);

--
-- 表的索引 `sys_module`
--
ALTER TABLE `sys_module`
  ADD PRIMARY KEY (`module_id`);

--
-- 表的索引 `sys_notice`
--
ALTER TABLE `sys_notice`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_notice_records`
--
ALTER TABLE `sys_notice_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_notice_template`
--
ALTER TABLE `sys_notice_template`
  ADD PRIMARY KEY (`template_id`);

--
-- 表的索引 `sys_notice_template_item`
--
ALTER TABLE `sys_notice_template_item`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_notice_template_type`
--
ALTER TABLE `sys_notice_template_type`
  ADD PRIMARY KEY (`type_id`);

--
-- 表的索引 `sys_province`
--
ALTER TABLE `sys_province`
  ADD PRIMARY KEY (`province_id`),
  ADD KEY `IDX_g_province_ProvinceName` (`province_name`);

--
-- 表的索引 `sys_url_route`
--
ALTER TABLE `sys_url_route`
  ADD PRIMARY KEY (`routeid`);

--
-- 表的索引 `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `IDX_sys_user_user_email` (`user_email`),
  ADD KEY `IDX_sys_user_user_name` (`user_name`),
  ADD KEY `IDX_sys_user_user_password` (`user_password`),
  ADD KEY `IDX_sys_user_user_tel` (`user_tel`),
  ADD KEY `IDX_sys_user_wx_openid` (`wx_openid`),
  ADD KEY `IDX_sys_user_wx_unionid` (`wx_unionid`);

--
-- 表的索引 `sys_user_admin`
--
ALTER TABLE `sys_user_admin`
  ADD PRIMARY KEY (`uid`);

--
-- 表的索引 `sys_user_group`
--
ALTER TABLE `sys_user_group`
  ADD PRIMARY KEY (`group_id`);

--
-- 表的索引 `sys_user_log`
--
ALTER TABLE `sys_user_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_version_devolution`
--
ALTER TABLE `sys_version_devolution`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_version_patch`
--
ALTER TABLE `sys_version_patch`
  ADD PRIMARY KEY (`patch_id`);

--
-- 表的索引 `sys_version_update_records`
--
ALTER TABLE `sys_version_update_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_website`
--
ALTER TABLE `sys_website`
  ADD PRIMARY KEY (`website_id`);

--
-- 表的索引 `sys_web_style`
--
ALTER TABLE `sys_web_style`
  ADD PRIMARY KEY (`style_id`);

--
-- 表的索引 `sys_weixin_auth`
--
ALTER TABLE `sys_weixin_auth`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_weixin_default_replay`
--
ALTER TABLE `sys_weixin_default_replay`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_weixin_fans`
--
ALTER TABLE `sys_weixin_fans`
  ADD PRIMARY KEY (`fans_id`),
  ADD KEY `IDX_sys_weixin_fans_openid` (`openid`),
  ADD KEY `IDX_sys_weixin_fans_unionid` (`unionid`);

--
-- 表的索引 `sys_weixin_follow_replay`
--
ALTER TABLE `sys_weixin_follow_replay`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_weixin_functions_button`
--
ALTER TABLE `sys_weixin_functions_button`
  ADD PRIMARY KEY (`button_id`);

--
-- 表的索引 `sys_weixin_instance_msg`
--
ALTER TABLE `sys_weixin_instance_msg`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_weixin_key_replay`
--
ALTER TABLE `sys_weixin_key_replay`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_weixin_media`
--
ALTER TABLE `sys_weixin_media`
  ADD PRIMARY KEY (`media_id`),
  ADD UNIQUE KEY `id` (`media_id`);

--
-- 表的索引 `sys_weixin_media_item`
--
ALTER TABLE `sys_weixin_media_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`media_id`);

--
-- 表的索引 `sys_weixin_menu`
--
ALTER TABLE `sys_weixin_menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `IDX_biz_shop_menu_orders` (`sort`),
  ADD KEY `IDX_biz_shop_menu_shopId` (`instance_id`);

--
-- 表的索引 `sys_weixin_msg_template`
--
ALTER TABLE `sys_weixin_msg_template`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_weixin_qrcode_template`
--
ALTER TABLE `sys_weixin_qrcode_template`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_weixin_user_msg`
--
ALTER TABLE `sys_weixin_user_msg`
  ADD PRIMARY KEY (`msg_id`);

--
-- 表的索引 `sys_weixin_user_msg_replay`
--
ALTER TABLE `sys_weixin_user_msg_replay`
  ADD PRIMARY KEY (`replay_id`);

--
-- 表的索引 `sys_wexin_onekeysubscribe`
--
ALTER TABLE `sys_wexin_onekeysubscribe`
  ADD PRIMARY KEY (`instance_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `nc_cms_article`
--
ALTER TABLE `nc_cms_article`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章编号';

--
-- 使用表AUTO_INCREMENT `nc_cms_article_class`
--
ALTER TABLE `nc_cms_article_class`
  MODIFY `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类编号 ';

--
-- 使用表AUTO_INCREMENT `nc_cms_comment`
--
ALTER TABLE `nc_cms_comment`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论编号';

--
-- 使用表AUTO_INCREMENT `nc_cms_topic`
--
ALTER TABLE `nc_cms_topic`
  MODIFY `topic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '专题编号';

--
-- 使用表AUTO_INCREMENT `ns_account`
--
ALTER TABLE `ns_account`
  MODIFY `account_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID';

--
-- 使用表AUTO_INCREMENT `ns_account_assistant_records`
--
ALTER TABLE `ns_account_assistant_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_account_order_records`
--
ALTER TABLE `ns_account_order_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_account_period`
--
ALTER TABLE `ns_account_period`
  MODIFY `period_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID';

--
-- 使用表AUTO_INCREMENT `ns_account_records`
--
ALTER TABLE `ns_account_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_account_return_records`
--
ALTER TABLE `ns_account_return_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_account_withdraw_records`
--
ALTER TABLE `ns_account_withdraw_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_account_withdraw_user_records`
--
ALTER TABLE `ns_account_withdraw_user_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_attribute`
--
ALTER TABLE `ns_attribute`
  MODIFY `attr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品属性ID';

--
-- 使用表AUTO_INCREMENT `ns_attribute_value`
--
ALTER TABLE `ns_attribute_value`
  MODIFY `attr_value_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '属性值ID';

--
-- 使用表AUTO_INCREMENT `ns_cart`
--
ALTER TABLE `ns_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id';

--
-- 使用表AUTO_INCREMENT `ns_click_fabulous`
--
ALTER TABLE `ns_click_fabulous`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id';

--
-- 使用表AUTO_INCREMENT `ns_consult`
--
ALTER TABLE `ns_consult`
  MODIFY `consult_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '咨询编号';

--
-- 使用表AUTO_INCREMENT `ns_consult_type`
--
ALTER TABLE `ns_consult_type`
  MODIFY `ct_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '咨询类型id';

--
-- 使用表AUTO_INCREMENT `ns_coupon`
--
ALTER TABLE `ns_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id';

--
-- 使用表AUTO_INCREMENT `ns_coupon_goods`
--
ALTER TABLE `ns_coupon_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_coupon_type`
--
ALTER TABLE `ns_coupon_type`
  MODIFY `coupon_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券类型Id';

--
-- 使用表AUTO_INCREMENT `ns_express_company`
--
ALTER TABLE `ns_express_company`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号';

--
-- 使用表AUTO_INCREMENT `ns_express_shipping`
--
ALTER TABLE `ns_express_shipping`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '运单模版id';

--
-- 使用表AUTO_INCREMENT `ns_express_shipping_items_library`
--
ALTER TABLE `ns_express_shipping_items_library`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流模版打印项库ID', AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `ns_gift_grant_records`
--
ALTER TABLE `ns_gift_grant_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_goods`
--
ALTER TABLE `ns_goods`
  MODIFY `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ns_goods_attribute`
--
ALTER TABLE `ns_goods_attribute`
  MODIFY `attr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_goods_attribute_value`
--
ALTER TABLE `ns_goods_attribute_value`
  MODIFY `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID';

--
-- 使用表AUTO_INCREMENT `ns_goods_brand`
--
ALTER TABLE `ns_goods_brand`
  MODIFY `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '索引ID';

--
-- 使用表AUTO_INCREMENT `ns_goods_category`
--
ALTER TABLE `ns_goods_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `ns_goods_category_block`
--
ALTER TABLE `ns_goods_category_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `ns_goods_comment`
--
ALTER TABLE `ns_goods_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id';

--
-- 使用表AUTO_INCREMENT `ns_goods_evaluate`
--
ALTER TABLE `ns_goods_evaluate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID';

--
-- 使用表AUTO_INCREMENT `ns_goods_group`
--
ALTER TABLE `ns_goods_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ns_goods_sku`
--
ALTER TABLE `ns_goods_sku`
  MODIFY `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ns_goods_sku_picture`
--
ALTER TABLE `ns_goods_sku_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_goods_spec`
--
ALTER TABLE `ns_goods_spec`
  MODIFY `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID';

--
-- 使用表AUTO_INCREMENT `ns_goods_spec_value`
--
ALTER TABLE `ns_goods_spec_value`
  MODIFY `spec_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID';

--
-- 使用表AUTO_INCREMENT `ns_ke`
--
ALTER TABLE `ns_ke`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1080;

--
-- 使用表AUTO_INCREMENT `ns_member_account`
--
ALTER TABLE `ns_member_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_member_account_records`
--
ALTER TABLE `ns_member_account_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_member_balance_withdraw`
--
ALTER TABLE `ns_member_balance_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_member_bank_account`
--
ALTER TABLE `ns_member_bank_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_member_express_address`
--
ALTER TABLE `ns_member_express_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `ns_member_favorites`
--
ALTER TABLE `ns_member_favorites`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录ID';

--
-- 使用表AUTO_INCREMENT `ns_member_gift`
--
ALTER TABLE `ns_member_gift`
  MODIFY `gift_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_member_level`
--
ALTER TABLE `ns_member_level`
  MODIFY `level_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '等级ID', AUTO_INCREMENT=48;

--
-- 使用表AUTO_INCREMENT `ns_member_recharge`
--
ALTER TABLE `ns_member_recharge`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_notice`
--
ALTER TABLE `ns_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id';

--
-- 使用表AUTO_INCREMENT `ns_order`
--
ALTER TABLE `ns_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ns_ordernum`
--
ALTER TABLE `ns_ordernum`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=978;

--
-- 使用表AUTO_INCREMENT `ns_order_action`
--
ALTER TABLE `ns_order_action`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动作id';

--
-- 使用表AUTO_INCREMENT `ns_order_goods`
--
ALTER TABLE `ns_order_goods`
  MODIFY `order_goods_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单项ID';

--
-- 使用表AUTO_INCREMENT `ns_order_goods_express`
--
ALTER TABLE `ns_order_goods_express`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_order_goods_promotion_details`
--
ALTER TABLE `ns_order_goods_promotion_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_order_pickup`
--
ALTER TABLE `ns_order_pickup`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_order_promotion_details`
--
ALTER TABLE `ns_order_promotion_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_order_refund`
--
ALTER TABLE `ns_order_refund`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `ns_order_refund_account_records`
--
ALTER TABLE `ns_order_refund_account_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id';

--
-- 使用表AUTO_INCREMENT `ns_order_shipping_fee`
--
ALTER TABLE `ns_order_shipping_fee`
  MODIFY `shipping_fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板ID';

--
-- 使用表AUTO_INCREMENT `ns_pickup_point`
--
ALTER TABLE `ns_pickup_point`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_platform_adv`
--
ALTER TABLE `ns_platform_adv`
  MODIFY `adv_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号';

--
-- 使用表AUTO_INCREMENT `ns_platform_adv_position`
--
ALTER TABLE `ns_platform_adv_position`
  MODIFY `ap_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告位置id', AUTO_INCREMENT=6667;

--
-- 使用表AUTO_INCREMENT `ns_platform_block`
--
ALTER TABLE `ns_platform_block`
  MODIFY `block_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_platform_goods_recommend`
--
ALTER TABLE `ns_platform_goods_recommend`
  MODIFY `recommend_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_platform_goods_recommend_class`
--
ALTER TABLE `ns_platform_goods_recommend_class`
  MODIFY `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_platform_help_class`
--
ALTER TABLE `ns_platform_help_class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `ns_platform_help_document`
--
ALTER TABLE `ns_platform_help_document`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表主键', AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `ns_platform_link`
--
ALTER TABLE `ns_platform_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引id';

--
-- 使用表AUTO_INCREMENT `ns_point_config`
--
ALTER TABLE `ns_point_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_promotion_bundling`
--
ALTER TABLE `ns_promotion_bundling`
  MODIFY `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID';

--
-- 使用表AUTO_INCREMENT `ns_promotion_bundling_goods`
--
ALTER TABLE `ns_promotion_bundling_goods`
  MODIFY `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id';

--
-- 使用表AUTO_INCREMENT `ns_promotion_discount`
--
ALTER TABLE `ns_promotion_discount`
  MODIFY `discount_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_promotion_discount_goods`
--
ALTER TABLE `ns_promotion_discount_goods`
  MODIFY `discount_goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_promotion_full_mail`
--
ALTER TABLE `ns_promotion_full_mail`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ns_promotion_gift`
--
ALTER TABLE `ns_promotion_gift`
  MODIFY `gift_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '赠品活动id ';

--
-- 使用表AUTO_INCREMENT `ns_promotion_gift_goods`
--
ALTER TABLE `ns_promotion_gift_goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id ';

--
-- 使用表AUTO_INCREMENT `ns_promotion_mansong`
--
ALTER TABLE `ns_promotion_mansong`
  MODIFY `mansong_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '满送活动编号';

--
-- 使用表AUTO_INCREMENT `ns_promotion_mansong_goods`
--
ALTER TABLE `ns_promotion_mansong_goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_promotion_mansong_rule`
--
ALTER TABLE `ns_promotion_mansong_rule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则编号';

--
-- 使用表AUTO_INCREMENT `ns_shop_ad`
--
ALTER TABLE `ns_shop_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_shop_coin_records`
--
ALTER TABLE `ns_shop_coin_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_shop_express_address`
--
ALTER TABLE `ns_shop_express_address`
  MODIFY `express_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流地址id';

--
-- 使用表AUTO_INCREMENT `ns_shop_group`
--
ALTER TABLE `ns_shop_group`
  MODIFY `shop_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分组ID';

--
-- 使用表AUTO_INCREMENT `ns_shop_navigation`
--
ALTER TABLE `ns_shop_navigation`
  MODIFY `nav_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ns_shop_navigation_template`
--
ALTER TABLE `ns_shop_navigation_template`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `ns_shop_order_account_records`
--
ALTER TABLE `ns_shop_order_account_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_supplier`
--
ALTER TABLE `ns_supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ns_virtual_goods`
--
ALTER TABLE `ns_virtual_goods`
  MODIFY `virtual_goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id';

--
-- 使用表AUTO_INCREMENT `ns_virtual_goods_group`
--
ALTER TABLE `ns_virtual_goods_group`
  MODIFY `virtual_goods_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '虚拟商品分组id';

--
-- 使用表AUTO_INCREMENT `ns_virtual_goods_type`
--
ALTER TABLE `ns_virtual_goods_type`
  MODIFY `virtual_goods_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '虚拟商品类型id';

--
-- 使用表AUTO_INCREMENT `sys_addons`
--
ALTER TABLE `sys_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sys_album_class`
--
ALTER TABLE `sys_album_class`
  MODIFY `album_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '相册id', AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `sys_album_picture`
--
ALTER TABLE `sys_album_picture`
  MODIFY `pic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '相册图片表id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sys_area`
--
ALTER TABLE `sys_area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `sys_city`
--
ALTER TABLE `sys_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- 使用表AUTO_INCREMENT `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=144;

--
-- 使用表AUTO_INCREMENT `sys_custom_template`
--
ALTER TABLE `sys_custom_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `sys_district`
--
ALTER TABLE `sys_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2870;

--
-- 使用表AUTO_INCREMENT `sys_hooks`
--
ALTER TABLE `sys_hooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=65;

--
-- 使用表AUTO_INCREMENT `sys_instance`
--
ALTER TABLE `sys_instance`
  MODIFY `instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `sys_instance_type`
--
ALTER TABLE `sys_instance_type`
  MODIFY `instance_typeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '实例类型ID';

--
-- 使用表AUTO_INCREMENT `sys_module`
--
ALTER TABLE `sys_module`
  MODIFY `module_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模块ID', AUTO_INCREMENT=10111;

--
-- 使用表AUTO_INCREMENT `sys_notice`
--
ALTER TABLE `sys_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `sys_notice_records`
--
ALTER TABLE `sys_notice_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_notice_template`
--
ALTER TABLE `sys_notice_template`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id';

--
-- 使用表AUTO_INCREMENT `sys_notice_template_item`
--
ALTER TABLE `sys_notice_template_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `sys_notice_template_type`
--
ALTER TABLE `sys_notice_template_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `sys_province`
--
ALTER TABLE `sys_province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `sys_url_route`
--
ALTER TABLE `sys_url_route`
  MODIFY `routeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `sys_user_group`
--
ALTER TABLE `sys_user_group`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `sys_user_log`
--
ALTER TABLE `sys_user_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `sys_version_devolution`
--
ALTER TABLE `sys_version_devolution`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_version_patch`
--
ALTER TABLE `sys_version_patch`
  MODIFY `patch_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_version_update_records`
--
ALTER TABLE `sys_version_update_records`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_website`
--
ALTER TABLE `sys_website`
  MODIFY `website_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sys_web_style`
--
ALTER TABLE `sys_web_style`
  MODIFY `style_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sys_weixin_auth`
--
ALTER TABLE `sys_weixin_auth`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_weixin_default_replay`
--
ALTER TABLE `sys_weixin_default_replay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_weixin_fans`
--
ALTER TABLE `sys_weixin_fans`
  MODIFY `fans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID';

--
-- 使用表AUTO_INCREMENT `sys_weixin_follow_replay`
--
ALTER TABLE `sys_weixin_follow_replay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_weixin_functions_button`
--
ALTER TABLE `sys_weixin_functions_button`
  MODIFY `button_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id';

--
-- 使用表AUTO_INCREMENT `sys_weixin_instance_msg`
--
ALTER TABLE `sys_weixin_instance_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `sys_weixin_key_replay`
--
ALTER TABLE `sys_weixin_key_replay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_weixin_media`
--
ALTER TABLE `sys_weixin_media`
  MODIFY `media_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图文消息id';

--
-- 使用表AUTO_INCREMENT `sys_weixin_media_item`
--
ALTER TABLE `sys_weixin_media_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `sys_weixin_menu`
--
ALTER TABLE `sys_weixin_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `sys_weixin_msg_template`
--
ALTER TABLE `sys_weixin_msg_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `sys_weixin_qrcode_template`
--
ALTER TABLE `sys_weixin_qrcode_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实例ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sys_weixin_user_msg`
--
ALTER TABLE `sys_weixin_user_msg`
  MODIFY `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_weixin_user_msg_replay`
--
ALTER TABLE `sys_weixin_user_msg_replay`
  MODIFY `replay_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
