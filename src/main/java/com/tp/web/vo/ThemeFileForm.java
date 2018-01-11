package com.tp.web.vo;

import java.io.Serializable;


public class ThemeFileForm implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String name;
    private String title;
    private Long apkSize;
    private String apkPath;
    private String dtype;
    private String marketURL;
    private String version;
    private String iconPath;
    private String preWebPath;
    private String preClientPath;
    private String createTime;
    private String modifyTime;
	private String downloadURL;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getApkSize() {
		return apkSize;
	}

	public void setApkSize(Long apkSize) {
		this.apkSize = apkSize;
	}

	public String getApkPath() {
		return apkPath;
	}

	public void setApkPath(String apkPath) {
		this.apkPath = apkPath;
	}

	public String getDtype() {
		return dtype;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}

	public String getMarketURL() {
		return marketURL;
	}

	public void setMarketURL(String marketURL) {
		this.marketURL = marketURL;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getIconPath() {
		return iconPath;
	}

	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

	public String getPreWebPath() {
		return preWebPath;
	}

	public void setPreWebPath(String preWebPath) {
		this.preWebPath = preWebPath;
	}

	public String getPreClientPath() {
		return preClientPath;
	}

	public void setPreClientPath(String preClientPath) {
		this.preClientPath = preClientPath;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getDownloadURL() {
		return downloadURL;
	}

	public void setDownloadURL(String downloadURL) {
		this.downloadURL = downloadURL;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
