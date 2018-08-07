package com.tp.entity;

import com.google.common.collect.Lists;
import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "f_market")
public class Market extends LongIDEntity {
	private String name;
	private String value;
	private String pkName;
	private String marketKey;

	private List<ThemeFile> themes = Lists.newArrayList();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getPkName() {
		return pkName;
	}

	public void setPkName(String pkName) {
		this.pkName = pkName;
	}

	public String getMarketKey() {
		return marketKey;
	}

	public void setMarketKey(String marketKey) {
		this.marketKey = marketKey;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "f_market_file", joinColumns = { @JoinColumn(name = "m_id") }, inverseJoinColumns = { @JoinColumn(name = "f_id") })
	public List<ThemeFile> getThemes() {
		return themes;
	}

	public void setThemes(List<ThemeFile> themes) {
		this.themes = themes;
	}

	@Override
	public String toString() {

		return ToStringBuilder.reflectionToString(this);
	}
}
