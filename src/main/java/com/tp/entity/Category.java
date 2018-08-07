package com.tp.entity;

import com.google.common.collect.Lists;

import javax.persistence.*;
import java.util.List;

@Entity
@DiscriminatorValue("category")
public class Category extends CateItem {

	private List<ThemeFile> files = Lists.newArrayList();
	private List<CategoryInfo> infos = Lists.newArrayList();

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "f_category_file", joinColumns = { @JoinColumn(name = "category_id") }, inverseJoinColumns = { @JoinColumn(name = "file_id") })
	public List<ThemeFile> getFiles() {
		return files;
	}

	public void setFiles(List<ThemeFile> files) {
		this.files = files;
	}

	@OneToMany(mappedBy = "category", fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE }, orphanRemoval = true)
	public List<CategoryInfo> getInfos() {
		return infos;
	}

	public void setInfos(List<CategoryInfo> infos) {
		this.infos = infos;
	}

//	@Override
//	public String toString() {
//		return ToStringBuilder.reflectionToString(this);
//	}
}
