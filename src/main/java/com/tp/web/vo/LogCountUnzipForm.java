package com.tp.web.vo;

import java.util.Date;

public class LogCountUnzipForm {
	private String appName;
	private Long unzip;
	private String fm;
	private String logDate;
	private Date createDate;

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public Long getUnzip() {
		return unzip;
	}

	public void setUnzip(Long unzip) {
		this.unzip = unzip;
	}

	public String getFm() {
		return fm;
	}

	public void setFm(String fm) {
		this.fm = fm;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
