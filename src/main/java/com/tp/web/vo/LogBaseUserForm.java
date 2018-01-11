package com.tp.web.vo;

import java.io.Serializable;

public class LogBaseUserForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String logDate;
	private Integer increUser;
	private Integer totalUser;
	private Integer increCoinsUser;
	private Integer totalCoinsUser;
	private Integer effecUser;
	private Integer increEffecUser;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public Integer getIncreUser() {
		return increUser;
	}

	public void setIncreUser(Integer increUser) {
		this.increUser = increUser;
	}

	public Integer getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(Integer totalUser) {
		this.totalUser = totalUser;
	}

	public Integer getIncreCoinsUser() {
		return increCoinsUser;
	}

	public void setIncreCoinsUser(Integer increCoinsUser) {
		this.increCoinsUser = increCoinsUser;
	}

	public Integer getTotalCoinsUser() {
		return totalCoinsUser;
	}

	public void setTotalCoinsUser(Integer totalCoinsUser) {
		this.totalCoinsUser = totalCoinsUser;
	}

	public Integer getEffecUser() {
		return effecUser;
	}

	public void setEffecUser(Integer effecUser) {
		this.effecUser = effecUser;
	}

	public Integer getIncreEffecUser() {
		return increEffecUser;
	}

	public void setIncreEffecUser(Integer increEffecUser) {
		this.increEffecUser = increEffecUser;
	}

}
