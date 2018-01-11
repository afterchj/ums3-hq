package com.tp.web.vo;

import java.io.Serializable;

//总体积分日志	log_base_coins	log_
//序号	字段名	类型	长度	NULL	说明
//1	id	varchar	32	no	主键ID    uuid
//2	log_date	varchar	32	no	日志时间
//3	incre_user	int	11	no	新增用户数
//4	total_user	int	11	no	总用户数
//5	earn_times	int	11	no	今日积分累加次数
//6	earn_user	int	11	no	今天积分累加用户数
//7	earn_coins	int	11	no	今日积分累加总数
//8	deduct_times	int	11	no	今日积分消费次数
//9	deduct_user	int	11	no	今日积分消费用户数
//10	deduct_coins	int	11	no	今日积分消费总数

public class LogBaseCoinsForm implements Serializable{

	private static final long serialVersionUID = 1L;
	private String id;
	private String logDate;
	private Integer increUser;
	private Integer totalUser;
	private Integer earnTimes;
	private Integer earnUser;
	private Integer earnCoins;
	private Integer deductTimes;
	private Integer deductUser;
	private Integer deductCoins;

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

	public Integer getEarnTimes() {
		return earnTimes;
	}

	public void setEarnTimes(Integer earnTimes) {
		this.earnTimes = earnTimes;
	}

	public Integer getEarnUser() {
		return earnUser;
	}

	public void setEarnUser(Integer earnUser) {
		this.earnUser = earnUser;
	}

	public Integer getEarnCoins() {
		return earnCoins;
	}

	public void setEarnCoins(Integer earnCoins) {
		this.earnCoins = earnCoins;
	}

	public Integer getDeductTimes() {
		return deductTimes;
	}

	public void setDeductTimes(Integer deductTimes) {
		this.deductTimes = deductTimes;
	}

	public Integer getDeductUser() {
		return deductUser;
	}

	public void setDeductUser(Integer deductUser) {
		this.deductUser = deductUser;
	}

	public Integer getDeductCoins() {
		return deductCoins;
	}

	public void setDeductCoins(Integer deductCoins) {
		this.deductCoins = deductCoins;
	}
}
