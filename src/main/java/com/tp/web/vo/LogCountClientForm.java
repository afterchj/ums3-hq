package com.tp.web.vo;

import java.util.Date;

public class LogCountClientForm {
	private Long id;
	private Date createDate;
	private String logDate;
	private Long openCount;
	private Long totalUser;
	private Long openUser;
	private Long incrementUser;
	private Long totalDownload;
	private Long visitStoreCount;
	private Long visitStoreUser;
	private Long totalInstall;
	private Long installWithfm;
	private Long installNonfm;
	private Long installUser;
	private Long takeTimes;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public Long getOpenCount() {
		return openCount;
	}

	public void setOpenCount(Long openCount) {
		this.openCount = openCount;
	}

	public Long getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(Long totalUser) {
		this.totalUser = totalUser;
	}

	public Long getOpenUser() {
		return openUser;
	}

	public void setOpenUser(Long openUser) {
		this.openUser = openUser;
	}

	public Long getIncrementUser() {
		return incrementUser;
	}

	public void setIncrementUser(Long incrementUser) {
		this.incrementUser = incrementUser;
	}

	public Long getTotalDownload() {
		return totalDownload;
	}

	public void setTotalDownload(Long totalDownload) {
		this.totalDownload = totalDownload;
	}

	public Long getVisitStoreCount() {
		return visitStoreCount;
	}

	public void setVisitStoreCount(Long visitStoreCount) {
		this.visitStoreCount = visitStoreCount;
	}

	public Long getVisitStoreUser() {
		return visitStoreUser;
	}

	public void setVisitStoreUser(Long visitStoreUser) {
		this.visitStoreUser = visitStoreUser;
	}

	public Long getTotalInstall() {
		return totalInstall;
	}

	public void setTotalInstall(Long totalInstall) {
		this.totalInstall = totalInstall;
	}

	public Long getInstallWithfm() {
		return installWithfm;
	}

	public void setInstallWithfm(Long installWithfm) {
		this.installWithfm = installWithfm;
	}

	public Long getInstallNonfm() {
		return installNonfm;
	}

	public void setInstallNonfm(Long installNonfm) {
		this.installNonfm = installNonfm;
	}

	public Long getInstallUser() {
		return installUser;
	}

	public void setInstallUser(Long installUser) {
		this.installUser = installUser;
	}

	public Long getTakeTimes() {
		return takeTimes;
	}

	public void setTakeTimes(Long takeTimes) {
		this.takeTimes = takeTimes;
	}
}
