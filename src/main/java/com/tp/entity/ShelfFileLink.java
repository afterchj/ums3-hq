package com.tp.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;

@Entity
@Table(name = "f_file_shelf")
public class ShelfFileLink extends LongIDEntity {

	private Shelf shelf;
	private ThemeFile theme;

	private long sort;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "s_id")
	public Shelf getShelf() {
		return shelf;
	}

	public void setShelf(Shelf shelf) {
		this.shelf = shelf;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "f_id")
	public ThemeFile getTheme() {
		return theme;
	}

	public void setTheme(ThemeFile theme) {
		this.theme = theme;
	}

	public long getSort() {
		return sort;
	}

	public void setSort(long sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {

		return ToStringBuilder.reflectionToString(this);
	}
}
