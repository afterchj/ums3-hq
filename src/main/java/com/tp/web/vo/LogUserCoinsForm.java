package com.tp.web.vo;

import java.io.Serializable;
import java.util.Date;

public class LogUserCoinsForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String uid;
	private String uno;
	private Integer coinsHistory;
	private Integer coinsAvail;
	private Integer coinsAdd;
	private Integer coinsDeduct;
	private String logDate;
	private Date createTime;
	private Integer rank;
	private String type;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUno() {
		return uno;
	}

	public void setUno(String uno) {
		this.uno = uno;
	}

	public Integer getCoinsHistory() {
		return coinsHistory;
	}

	public void setCoinsHistory(Integer coinsHistory) {
		this.coinsHistory = coinsHistory;
	}

	public Integer getCoinsAvail() {
		return coinsAvail;
	}

	public void setCoinsAvail(Integer coinsAvail) {
		this.coinsAvail = coinsAvail;
	}

	public Integer getCoinsAdd() {
		return coinsAdd;
	}

	public void setCoinsAdd(Integer coinsAdd) {
		this.coinsAdd = coinsAdd;
	}

	public Integer getCoinsDeduct() {
		return coinsDeduct;
	}

	public void setCoinsDeduct(Integer coinsDeduct) {
		this.coinsDeduct = coinsDeduct;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
