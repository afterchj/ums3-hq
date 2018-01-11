package com.tp.web.vo;

import java.util.Date;

public class LogCountStoreForm {

	private String logDate;
	private String themeName;
	private Long totalVisit;
	private Long totalDown;
	private Date createDate;

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	public Long getTotalVisit() {
		return totalVisit;
	}

	public void setTotalVisit(Long totalVisit) {
		this.totalVisit = totalVisit;
	}

	public Long getTotalDown() {
		return totalDown;
	}

	public void setTotalDown(Long totalDown) {
		this.totalDown = totalDown;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
