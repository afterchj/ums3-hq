package com.tp.web.vo;

import java.util.Date;

public class LogCountMarketClientInstallForm {
	private String logDate;
	private String fm;
	private Long installed;
	private Long distinctInstalled;
	private Date createDate;

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
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

	public Long getDistinctInstalled() {
		return distinctInstalled;
	}

	public void setDistinctInstalled(Long distinctInstalled) {
		this.distinctInstalled = distinctInstalled;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
