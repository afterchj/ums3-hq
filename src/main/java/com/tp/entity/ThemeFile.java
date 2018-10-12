package com.tp.entity;

import com.google.common.collect.Lists;
import com.tp.utils.ConvertUtils;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * 文件基础关系实体
 *
 */
@Entity
@Table(name = "f_file")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ThemeFile extends LongIDEntity {

    private String name;
    private String title;
    private Long uxSize;
    private Long apkSize;
    private BigDecimal price;
    private String uxHvga;
    private String uxWvga;
    private String apkPath;
    private String uxPath;
    private String dtype;
    private String marketURL;
    private String version;
    private String iconPath;
    private String adPath;
    private String preWebPath;
    private String preClientPath;
    private String createTime;
    private String modifyTime;

    private String downloadURL;
    private Long totalDownload;
    private Long ishot;
    private Long isnew;
    private Long percent;

    private List<FileTag> fileTags = Lists.newArrayList();

    private List<ThemeThirdURL> thirdURLs = Lists.newArrayList();
    private List<CateItem> cates = Lists.newArrayList();
    private List<FileInfo> fileInfo = Lists.newArrayList();
    private List<FileStoreInfo> infoStore = Lists.newArrayList();
    private List<ShelfFileLink> shelfFiles = Lists.newArrayList();
    private List<TopicFileLink> topicFiles=Lists.newArrayList();
    private List<FileMarketValue> marketValues = Lists.newArrayList();
    private List<Store> stores = Lists.newArrayList();

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

    public Long getUxSize() {
        return uxSize;
    }

    public void setUxSize(Long uxSize) {
        this.uxSize = uxSize;
    }

    public Long getApkSize() {
        return apkSize;
    }

    public void setApkSize(Long apkSize) {
        this.apkSize = apkSize;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Column(name = "ux_h_path")
    public String getUxHvga() {
        return uxHvga;
    }

    public void setUxHvga(String uxHvga) {
        this.uxHvga = uxHvga;
    }

    @Column(name = "ux_w_path")
    public String getUxWvga() {
        return uxWvga;
    }

    public void setUxWvga(String uxWvga) {
        this.uxWvga = uxWvga;
    }

    public String getApkPath() {
        return apkPath;
    }

    public void setApkPath(String apkPath) {
        this.apkPath = apkPath;
    }

    public String getUxPath() {
        return uxPath;
    }

    public void setUxPath(String uxPath) {
        this.uxPath = uxPath;
    }

    public Long getPercent() {
        return percent;
    }

    public void setPercent(Long percent) {
        this.percent = percent;
    }

    public String getDtype() {
        return dtype;
    }

    public void setDtype(String dtype) {
        this.dtype = dtype;
    }

    public String getIconPath() {
        return iconPath;
    }

    public void setIconPath(String iconPath) {
        this.iconPath = iconPath;
    }

    public String getAdPath() {
        return adPath;
    }

    public void setAdPath(String adPath) {
        this.adPath = adPath;
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

    @Column(name = "market_url")
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

    @Column(name="is_hot")
    public Long getIshot() {
        return ishot;
    }

    public void setIshot(Long ishot) {
        this.ishot = ishot;
    }

    @Column(name="is_new")
    public Long getIsnew() {
        return isnew;
    }

    public void setIsnew(Long isnew) {
        this.isnew = isnew;
    }

    @Transient
    public String getDownloadURL() {
        return downloadURL;
    }

    public void setDownloadURL(String downloadURL) {
        this.downloadURL = downloadURL;
    }

    @OneToMany(mappedBy = "theme", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE}, orphanRemoval = true)
    public List<ThemeThirdURL> getThirdURLs() {
        return thirdURLs;
    }

    public void setThirdURLs(List<ThemeThirdURL> thirdURLs) {
        this.thirdURLs = thirdURLs;
    }

    @OneToMany(mappedBy = "theme", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE}, orphanRemoval = true)
    public List<FileInfo> getFileInfo() {
        return fileInfo;
    }

    public void setFileInfo(List<FileInfo> fileInfo) {
        this.fileInfo = fileInfo;
    }

    @OneToMany(mappedBy = "theme", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE}, orphanRemoval = true)
    public List<FileStoreInfo> getInfoStore() {
        return infoStore;
    }

    public void setInfoStore(List<FileStoreInfo> infoStore) {
        this.infoStore = infoStore;
    }

    @OneToMany(mappedBy = "theme", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE}, orphanRemoval = true)
    public List<ShelfFileLink> getShelfFiles() {
        return shelfFiles;
    }

    public void setShelfFiles(List<ShelfFileLink> shelfFiles) {
        this.shelfFiles = shelfFiles;
    }

    @OneToMany(mappedBy = "theme", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE}, orphanRemoval = true)
    public List<TopicFileLink> getTopicFiles() {
        return topicFiles;
    }

    public void setTopicFiles(List<TopicFileLink> topicFiles) {
        this.topicFiles = topicFiles;
    }

    @OneToMany(mappedBy = "theme", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE}, orphanRemoval = true)
    public List<FileMarketValue> getMarketValues() {
        return marketValues;
    }

    public void setMarketValues(List<FileMarketValue> marketValues) {
        this.marketValues = marketValues;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "f_category_file", joinColumns = {@JoinColumn(name = "file_id")}, inverseJoinColumns = {@JoinColumn(name = "category_id")})
    public List<CateItem> getCates() {
		return cates;
	}

	public void setCates(List<CateItem> cates) {
		this.cates = cates;
	}
    
    
    
    @ManyToMany
    @JoinTable(name = "f_file_store", joinColumns = {@JoinColumn(name = "f_id")}, inverseJoinColumns = {@JoinColumn(name = "s_id")})
    @Fetch(FetchMode.SUBSELECT)
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    public List<Store> getStores() {
        return stores;
    }

    public void setStores(List<Store> stores) {
        this.stores = stores;
    }

    @ManyToMany
    @JoinTable(name = "f_file_tag", joinColumns = {@JoinColumn(name = "file_id")}, inverseJoinColumns = {@JoinColumn(name = "tag_id")})
    @Fetch(FetchMode.SUBSELECT)
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    public List<FileTag> getFileTags() {
        return fileTags;
    }

    public void setFileTags(List<FileTag> fileTags) {
        this.fileTags = fileTags;
    }

    @Transient
    public String getTagNames() {
        return ConvertUtils.convertElementPropertyToString(fileTags, "name", ",");
    }

    @Transient
    public List<Long> getCheckedTagIds(){
        return ConvertUtils.convertElementPropertyToList(fileTags,"id");
    }

    @SuppressWarnings("unchecked")
    @Transient
    public List<Long> getCheckedCategoryIds() {
        return ConvertUtils.convertElementPropertyToList(cates, "id");
    }

    @SuppressWarnings("unchecked")
    @Transient
    public List<Long> getCheckedStoreIds() {
        return ConvertUtils.convertElementPropertyToList(stores, "id");
    }


    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((super.id == null) ? 0 : super.id.hashCode());
		return result;
	}

	public Long getTotalDownload() {
		return totalDownload;
	}

	public void setTotalDownload(Long totalDownload) {
		this.totalDownload = totalDownload;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof ThemeFile))
			return false;
		ThemeFile other = (ThemeFile) obj;
		if (super.id == null) {
			if (other.getId() != null)
				return false;
		} else if (!super.id.equals(other.getId()))
			return false;
		return true;
	}

}
