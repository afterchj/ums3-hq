package com.tp.web.vo;

import java.util.Date;

public class LogCountCIFCForm {

	private String logDate;
	private String appName;
	private String fm;
	private Long installed;
	private Date createDate;

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getFm() {
		return fm;
	}

	public void setFm(String fm) {
		this.fm = fm;
	}

	public Long getInstalled() {
		return installed;
	}

	public void setInstalled(Long installed) {
		this.installed = installed;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
