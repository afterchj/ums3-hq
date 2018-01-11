package com.tp.entity.account;

import java.util.Map;

import com.google.common.collect.Maps;

public enum Permission {

	USER_VIEW("user:view", "查看用戶"), USER_EDIT("user:edit", "修改用户"),
	
	MEMBER_VIEW("member:view", "查看会员"), MEMBER_EDIT("member:edit", "修改会员"),
	
	WORK_VIEW("work:view", "查看作品"), WORK_EDIT("work:edit", "修改作品"),

	GROUP_VIEW("group:view", "查看权限组"), GROUP_EDIT("group:edit", "修改权限组"),
	
	GOODS_DELETE("goods:delete", "删除交易商品"), GOODS_EDIT("goods:edit", "修改交易商品"),
	
	ORDERCONFIG_DELETE("orderConfig:delete", "删除订单配置"), ORDERCONFIG_EDIT("orderConfig:edit", "修改订单配置"),
	
	ORDER_EDIT("order:edit", "修改订单"),

	FILE_VIEW("file:view", "查看文件"), FILE_EDIT("file:edit", "修改文件"),
	
	TRADE_VIEW("trade:view", "查看交易"),

	STORE_VIEW("store:view", "查看商店"), STORE_EDIT("store:edit", "修改商店"),

	CATEGORY_VIEW("category:view", "查看分类"), CATEGORY_EDIT("category:edit", "修改分类"),

    REPORT_CONTENT_VIEW("report_store:view","查看商店日报"),

    REPORT_CLIENT_VIEW("report:view","查看客户端日报"),

    REPORT_GET_CLIENT("report_get_client:view","查看内容引导客户端日报"),

    REPORT_UNZIP_CONTENT("report_unzip:view","查看内容安装日报"),

    REPORT_CLIENT_INSTALL("report_install:view","查看客户端安装日报"),

    REPORT_CLIENT_INSTALL_BY_CONTENT("report_install_by_content:view","查看客户端通过内容安装日报"),
	
	FEEDBACK_VIEW("feedback:view","查看反馈"),FEEDBACK_EDIT("feedback:edit","修改反馈"),
	
	NAVIGATION_VIEW("navigation:view","查看导航"),NAVIGATION_EDIT("navigation:edit","修改导航");

	private static Map<String, Permission> valueMap = Maps.newHashMap();

	public String value;
	public String displayName;
	
	public static void main(String[] args) {
		for (Permission permission : Permission.values()) {
			System.out.println(permission.value + " " + permission.displayName);
		}
	}

	static {
		for (Permission permission : Permission.values()) {
			valueMap.put(permission.value, permission);
		}
	}

	Permission(String value, String displayName) {
		this.value = value;
		this.displayName = displayName;
	}

	public static Permission parse(String value) {
		return valueMap.get(value);
	}

	public String getValue() {
		return value;
	}

	public String getDisplayName() {
		return displayName;
	}
}
