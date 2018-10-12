package com.tp.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;

@Entity
@Table(name = "f_market_info")
public class FileMarketValue extends LongIDEntity {

	private String keyName;
	private String keyValue;
	private ThemeFile theme;
	private Market market;

	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "theme_id")
	public ThemeFile getTheme() {
		return theme;
	}

	public void setTheme(ThemeFile theme) {
		this.theme = theme;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "market_id")
	public Market getMarket() {
		return market;
	}

	public void setMarket(Market market) {
		this.market = market;
	}

	@Override
	public String toString() {

		return ToStringBuilder.reflectionToString(this);
	}
}
