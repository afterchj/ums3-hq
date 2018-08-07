package com.tp.entity;

import com.google.common.collect.Lists;
import com.tp.utils.ConvertUtils;

import javax.persistence.*;
import java.util.List;

@Entity
@DiscriminatorValue("Store")
public class Store extends CateItem {

	private List<FileStoreInfo> fileStoreInfo = Lists.newArrayList();
	private List<Shelf> shelfs = Lists.newArrayList();

	private List<ThemeFile> themes = Lists.newArrayList();

	@OneToMany(mappedBy = "store", cascade = { CascadeType.REMOVE }, fetch = FetchType.LAZY, orphanRemoval = true)
	public List<Shelf> getShelfs() {
		return shelfs;
	}

	public void setShelfs(List<Shelf> shelfs) {
		this.shelfs = shelfs;
	}

	@OneToMany(mappedBy = "store", cascade = { CascadeType.REMOVE }, fetch = FetchType.LAZY, orphanRemoval = true)
	public List<FileStoreInfo> getFileStoreInfo() {
		return fileStoreInfo;
	}

	public void setFileStoreInfo(List<FileStoreInfo> fileStoreInfo) {
		this.fileStoreInfo = fileStoreInfo;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "f_file_store", joinColumns = { @JoinColumn(name = "s_id") }, inverseJoinColumns = { @JoinColumn(name = "f_id") })
	@OrderBy("createTime DESC ")
    public List<ThemeFile> getThemes() {
		return themes;
	}
	
	public void setThemes(List<ThemeFile> themes) {
		this.themes = themes;
	}

	@Transient
	public String getCategoryNames() {
		return ConvertUtils.convertElementPropertyToString(shelfs, "name", ",");
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof Store))
			return false;
		Store that = (Store) obj;
		return that.getName().equals(this.getName());
	}

	@Override
	public int hashCode() {
		assert false : "hashCode not designed";
		return 42; // any arbitrary constant will do
	}

//	@Override
//	public String toString() {
////		return "fileStoreInfo : " + fileStoreInfo.size() + "shelfs:" + shelfs.size();
////		return ToStringBuilder.reflectionToString(this);
//	}
}
