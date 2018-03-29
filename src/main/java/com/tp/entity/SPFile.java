package com.tp.entity;

import com.tp.entity.video.SPItem;

import javax.persistence.*;
import java.util.List;

/**
 * 视频主题实体类
 */
@Entity
@Table(name = "sp_file")
public class SPFile extends LongIDEntity {

    private static final long serialVersionUID = 1L;
    //视频名称
    private String name;
    //视频大小(单位：M)
    private Double size;
    //视频时长(单位：s)
    private Integer duration;
    //视频下载地址
    private String downloadPath;
    //视频封面地址
    private String iconPath;
    //视频标签
    private String lable;
    //创建时间
    private String createTime;
    //修改时间
    private String modifyTime;
    //上架时间
    private String onshelfTime;
    //是否最新(0-不是(默认)，1-是)
    private Integer isHot;
    //是否最热(0-不是(默认)，1-是)
    private Integer isNew;
    //是否推荐(0-不推荐(默认)，1-推荐)
    private Integer isRecommend;
    //是否审核(0-待审核，1-审核成功，2：审核失败)
    private Integer isCheck;
    //天天锁屏用户uid
    private String uid;
    //是否上架
    private long status;
    //其他(预留字段)
    private String other;
    //头像路径
    private String icon;
    //昵称
    private String nickname;

    private List<SPItem> items;

    @Column(name = "name", length = 50, nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "size", length = 5, nullable = true)
    public Double getSize() {
        return size;
    }

    public void setSize(Double size) {
        this.size = size;
    }

    @Column(name = "duration", length = 11, nullable = true)
    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }


    @Column(name = "download_path", length = 255, nullable = true)
    public String getDownloadPath() {
        return downloadPath;
    }

    public void setDownloadPath(String downloadPath) {
        this.downloadPath = downloadPath;
    }

    @Column(name = "icon_path", length = 255, nullable = true)
    public String getIconPath() {
        return iconPath;
    }

    public void setIconPath(String iconPath) {
        this.iconPath = iconPath;
    }

    @Column(name = "lable", length = 255, nullable = true)
    public String getLable() {
        return lable;
    }

    public void setLable(String lable) {
        this.lable = lable;
    }

    @Column(name = "create_time", length = 30, nullable = false)
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Column(name = "modify_time", length = 30, nullable = true)
    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }

    @Column(name = "is_hot", length = 2, nullable = false)
    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    @Column(name = "is_new", length = 2, nullable = false)
    public Integer getIsNew() {
        return isNew;
    }

    public void setIsNew(Integer isNew) {
        this.isNew = isNew;
    }

    @Column(name = "is_recommend", length = 2, nullable = false)
    public Integer getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Integer isRecommend) {
        this.isRecommend = isRecommend;
    }

    @Column(name = "other", length = 255, nullable = true)
    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    @Column(name = "onshelf_time", length = 30, nullable = true)
    public String getOnshelfTime() {
        return onshelfTime;
    }

    public void setOnshelfTime(String onshelfTime) {
        this.onshelfTime = onshelfTime;
    }

    @Column(name = "is_check", length = 2, nullable = true)
    public Integer getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(Integer isCheck) {
        this.isCheck = isCheck;
    }

    @Column(name = "uid", length = 32, nullable = true)
    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    @Column(nullable = false, columnDefinition = "INT default 0")
    public long getStatus() {
        return status;
    }

    public void setStatus(long status) {
        this.status = status;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "sp_category_file", joinColumns = {@JoinColumn(name = "file_id")}, inverseJoinColumns = {@JoinColumn(name = "category_id")})
    public List<SPItem> getItems() {
        return items;
    }

    public void setItems(List<SPItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "SPFile{" +
                "name='" + name + '\'' +
                ", size=" + size + '\'' +
                ", duration=" + duration + '\'' +
                ", downloadPath='" + downloadPath + '\'' +
                ", iconPath='" + iconPath + '\'' +
                ", lable='" + lable + '\'' +
                ", createTime='" + createTime + '\'' +
                ", modifyTime='" + modifyTime + '\'' +
                ", onshelfTime='" + onshelfTime + '\'' +
                ", isHot=" + isHot + '\'' +
                ", isNew=" + isNew + '\'' +
                ", isRecommend=" + isRecommend + '\'' +
                ", isCheck=" + isCheck + '\'' +
                ", uid=" + uid + '\'' +
                ", status=" + uid + '\'' +
                ", icon=" + icon + '\'' +
                ", nickname=" + nickname + '\'' +
                ", other='" + other + '\'' +
                ", items=" + items +
                '}';
    }
}
