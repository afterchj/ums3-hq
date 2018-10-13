package com.tp.utils;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class Constants {

	private static PropertiesLoader propertiesLoader = new PropertiesLoader("classpath:/setup.properties");

	public static String LOCKER_STORAGE;
	public static String CLIENT_STORAGE;
	public static String POLL_STORAGE;
	public static String CATEGROY_STORAGE;
	public static String TOMCAT_SHOW ;
	public static String STATIC_SHOW ;
	
	public static final int ORDER_UNDEALED = 0;
	public static final int ORDER_SUCCESS = 1;
	public static final int ORDER_FAIL = 2;
	
	public static Boolean HTTPCLIENT_PROXY ;
	public static String HTTPCLIENT_PROXY_HOST;
	public static Integer HTTPCLIENT_PROXY_PORT;
	
	public static String ORDER_DEALER_QB_URL;
	
	public static final Integer BATCH_SIZE = propertiesLoader.getInteger("hibernate.batch.size", 200);
	
	public static final Integer CLIENT_LOG_COUNT_INTERVAL = propertiesLoader.getInteger("log.client.count.interval");

	public static String WORK_PIC;
	
	public final static String[] IMG_EXTENSION = { "jpg", "jpeg", "gif", "bmp", "png" ,".mp4"};

	public static final String ENCODE_UTF_8 = "UTF-8";

	public static final String DOT_SEPARATOR = ".";

	public static final String ST_LOCK = "lock";
	public static final String JP_LOCKER = "jplocker";
	public static final String DM_LOCKER = "dmlocker";

	public static final String ID_LOCK = "lockId";
	public static final String ID_JPLOCKER = "jplockerId";

	//============客户端参数===========================================================//
	public static final String PARA_LANGUAGE = "l";
	public static final String PARA_DOWNLOAD_METHOD = "dm";
	public static final String PARA_FROM_MARKET = "fm";
	public static final String PARA_IMEI = "imei";
	public static final String PARA_IMSI = "imsi";
	public static final String PARA_STORE_TYPE = "st";
	public static final String PARA_CLIENT_VERSION = "v";
	public static final String PARA_CONTENT_VERSION = "cv";
	public static final String PARA_CLIENT_TYPE = "ct";
	public static final String PARA_RESOLUTION = "r";
	public static final String PARA_OPERATORS = "op";
	public static final String PARA_NET_ENVIRONMENT = "net";
	public static final String PARA_AUTO_SWITCH = "as";
	public static final String PARA_SAFETYLOCK = "sl";
	public static final String PARA_MACHINE_MODEL = "model";
	public static final String PARA_DO_TYPE = "do";
	public static final String PARA_APP_NAME = "app";
	public static final String PARA_BCID = "bcid";
	public static final String PARA_URL = "url";
	public static final String PARA_FROM = "f";

	//=======================================================================================//

	public static final String QUERY_STRING = "queryString";
	public static final String METHOD_AD_XML = "adXml";
	public static final String METHOD_GET_CLIENT = "getClient";
	public static final String METHOD_EXECUTE = "execute";
	public static final String METHOD_DETAILS = "details";

	public static final String LOCKER_STANDARD = "lock";
	public static final String LOCKER_JP = "jplocker";
	public static final String LOCKER_DM = "dm";

	public static final String LENVOL_STORE = "com.lenovo.leos.appstore";
	public static final String OPPO_NEARME = "com.oppo.market";
	public static final String MARKET_GOOGLE = "com.android.vending";
	
	public static final int ENABLE = 1;
	public static final int DISABLE = 0;
	
	public static final String FILE_LOCK = "0";
	public static final String FILE_DIY = "1";
	public static final String FILE_APP = "2";
	

	public enum Language {
		ZH("zh"), EN("en"), JP("jp"), JA("ja");
		private String value;

		Language(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}
	}

	public static String getDomain() {
		HttpServletRequest request = Struts2Utils.getRequest();
		StringBuilder buffer = new StringBuilder();
		buffer.append("http://").append(request.getServerName())
//                .append(":").append(request.getLocalPort())
				.append(request.getContextPath());
		return buffer.toString();
	}

	public static String getLocal() {
		Locale local = ServletActionContext.getContext().getLocale();
		return local.getLanguage();
	}

	public enum Operator {
		/**
		 * 联通
		 */
		LT("lt"),
		/**
		 * 电信
		 */
		DX("dx"),
		/**
		 * 移动
		 */
		YD("yd");
		private String value;

		Operator(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}
	}

	//2013-11-15 新增内容.
	public static final Integer ROWS_PER_SHEET = propertiesLoader.getInteger("excel.RowsPerSheet", Integer.MAX_VALUE);
	public static final String EXCEL_CLIENTINSTALL_PRIORITY = propertiesLoader.getProperty("excel.clientinstall.priority", "");
	public static final Integer EXCEL_CLIENTINSTALL_DEFAULT_INTERVAL = propertiesLoader.getInteger("excel.clientinstall.default.interval", 10);
}
