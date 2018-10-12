package com.tp.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

/**
 * 文件多语言描述
 * 
 * @author ken
 * 
 */
@Entity
@Table(name = "f_file_info")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FileInfo extends LongIDEntity {

	private String title;
	private String shortDescription;
	private String longDescription;
	private String author;
	private String language;
	private Long price;

	private ThemeFile theme;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "f_id")
	@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
	public ThemeFile getTheme() {
		return theme;
	}

	public void setTheme(ThemeFile theme) {
		this.theme = theme;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof FileStoreInfo))
			return false;
		FileInfo that = (FileInfo) obj;
		return that.getLanguage().equals(this.getLanguage()) && that.getTheme().getId().equals(this.getTheme().getId())
				|| that.getId().equals(this.getId());
	}

	@Override
	public int hashCode() {
		assert false : "hashCode not designed";
		return 42; // any arbitrary constant will do
	}

//	@Override
//	public String toString() {
//		return ToStringBuilder.reflectionToString(this);
//	}
}
