/**
 * Niushop商城系统 - 团队十年电商经验汇集巨献!
 * =========================================================
 * Copy right 2015-2025 山西牛酷信息科技有限公司, 保留所有权利。
 * ----------------------------------------------
 * 官方网址: http://www.niushop.com.cn
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用。
 * 任何企业和个人不允许对程序代码以任何形式任何目的再发布。
 * =========================================================
 * @author : 小学生wyj
 * @date : 2017年5月24日 12:13:28
 * @version : v1.0.0.0
 * 添加商品标签
 */

//模块输入信息验证
function verify(group_name){
	if(group_name == ''){
		$("#ordernum").parent().next().show();
		$("#ordernum").focus();
		return false;
	}else{
		$(".error").hide();
	}
	return true;
}

var flag = false;//防止重复提交
//添加模块
function addordersAjax() {
	var ordernum = $("#ordernum").val();
	var shouhuouser = $("#shouhuouser").val();
	var mobile = $("#mobile").val();
	var citypicker = $("#city-picker3").val();
	var address = $("#address").val();
	var descs = $("#descs").val();
	
	
//	if($("#is_visible").prop("checked")){
//		var is_visible = 1;
//	}else{
//		var is_visible = 0;
//	}
	var is_visible = 1;
	
	if(verify(ordernum)){
		if(flag){
			return false;
		}
		flag = true;
		$.ajax({
			type : "post",
			url : __URL(ADMINMAIN+"/ordernum/ordernumAdd"),
			data : {
				'ordernum' : ordernum,
				'shouhuouser' : shouhuouser,
				'mobile' : mobile,
				'citypicker' : citypicker,
				'address' : address,
				'descs' : descs
			},
			success : function(data) {
				if (data["code"] > 0) {
					showMessage('success', "订单编号添加成功",__URL(ADMINMAIN+'/ordernum/ordernumlist'));
				}else{
					showMessage('error', "订单编号添加失败");
					flag = false;
				}
			}
		});
	}
}
//修改模块
function editordersAjax() {
	var id = $("#id").val();
	var ordernum = $("#ordernum").val();
	var shouhuouser = $("#shouhuouser").val();
	var mobile = $("#mobile").val();
	var citypicker = $("#city-picker3").val();
	var address = $("#address").val();
	var desc = $("#desc").val();
//	if($("#is_visible").prop("checked")){
//		var is_visible = 1;
//	}else{
//		var is_visible = 0;
//	}
	var is_visible = 1;
	if(verify(ordernum)){
		if(flag){
			return false;
		}
		flag =true;
		$.ajax({
			type : "post",
			url : __URL(ADMINMAIN+"/ordernum/ordernumEdit"),
			data : {
				'id' : id,
				'ordernum' : group_name,
				'shouhuouser' : shouhuouser,
				'mobile' : mobile,
				'citypicker' : citypicker,
				'address' : address,
				'desc' : desc
			},
			success : function(data) {
				console.log(data);
				if (data["code"] > 0) {
					showMessage('success', "订单号修改成功",__URL(ADMINMAIN+'/ordernum/ordernumlist'));
				}else{
					showMessage('error', "订单号修改失败");
					flag = false;
				}	
			}
		});
	}
}

//图片上传
function imgUpload(){
	OpenPricureDialog("PopPicure", ADMINMAIN,1);
}

function PopUpCallBack(img_id,img_src){
	$("#imgLogo").attr("src",__IMG(img_src));
	$("#group_pic").val(img_id);
}