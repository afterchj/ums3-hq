package com.tp.entity.video;

import com.tp.entity.LongIDEntity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by hongjian.chen on 2017/12/29.
 */

@Entity
@Table(name = "sp_category")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class SPItem extends LongIDEntity implements Serializable {

    protected String name;
    protected String value;
    protected String icon;
    protected String description;
    private String dtype;
    private Long status=0l;

    private SPItem parent;
    private List<SPItem> children;
    private List<SPFile> files;

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

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDtype() {
        return dtype;
    }

    public void setDtype(String dtype) {
        this.dtype = dtype;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    public SPItem getParent() {
        return parent;
    }

    public void setParent(SPItem parent) {
        this.parent = parent;
    }


    @OneToMany(cascade = {CascadeType.ALL}, mappedBy = "parent")
    public List<SPItem> getChildren() {
        return children;
    }

    public void setChildren(List<SPItem> children) {
        this.children = children;
    }


    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "items")
    public List<SPFile> getFiles() {
        return files;
    }

    public void setFiles(List<SPFile> files) {
        this.files = files;
    }

    //	@Override
//	public String toString() {
//
//		return ToStringBuilder.reflectionToString(this);
//	}
}
