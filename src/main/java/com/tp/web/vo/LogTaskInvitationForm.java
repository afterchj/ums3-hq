package com.tp.web.vo;

import java.io.Serializable;
import java.util.Date;

public class LogTaskInvitationForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String invitator;
	private String serialno;
	private Long guest;
	private Integer dayTaskNum;
	private Integer totalTaskNum;
	private Date createTime;
	private String logDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getInvitator() {
		return invitator;
	}

	public void setInvitator(String invitator) {
		this.invitator = invitator;
	}

	public String getSerialno() {
		return serialno;
	}

	public void setSerialno(String serialno) {
		this.serialno = serialno;
	}

	public Long getGuest() {
		return guest;
	}

	public void setGuest(Long guest) {
		this.guest = guest;
	}

	public Integer getDayTaskNum() {
		return dayTaskNum;
	}

	public void setDayTaskNum(Integer dayTaskNum) {
		this.dayTaskNum = dayTaskNum;
	}

	public Integer getTotalTaskNum() {
		return totalTaskNum;
	}

	public void setTotalTaskNum(Integer totalTaskNum) {
		this.totalTaskNum = totalTaskNum;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}
}
