package com.tp.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;

@Entity
@DiscriminatorValue("cateInfo")
public class CategoryInfo extends CateItem {

	private Category category;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {

		return ToStringBuilder.reflectionToString(this);
	}
}
