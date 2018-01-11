package com.tp.web.vo;

import java.io.Serializable;

public class LogPerTaskForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String taskId;
	private String taskName;
	private Integer income;
	private String logDate;
	private Integer accomplishUser;
	private Integer accomplishTimes;
	private String type;
	private String settingId;
	private String taskDate;

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public Integer getIncome() {
		return income;
	}

	public void setIncome(Integer income) {
		this.income = income;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public Integer getAccomplishUser() {
		return accomplishUser;
	}

	public void setAccomplishUser(Integer accomplishUser) {
		this.accomplishUser = accomplishUser;
	}

	public Integer getAccomplishTimes() {
		return accomplishTimes;
	}

	public void setAccomplishTimes(Integer accomplishTimes) {
		this.accomplishTimes = accomplishTimes;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSettingId() {
		return settingId;
	}

	public void setSettingId(String settingId) {
		this.settingId = settingId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTaskDate() {
		return taskDate;
	}

	public void setTaskDate(String taskDate) {
		this.taskDate = taskDate;
	}

}
