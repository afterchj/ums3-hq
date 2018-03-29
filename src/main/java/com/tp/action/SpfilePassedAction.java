package com.tp.action;


import com.google.common.collect.Lists;
import com.tp.entity.SPFile;
import com.tp.entity.video.SPItem;
import com.tp.orm.Page;
import com.tp.service.SPFileManager;
import com.tp.service.VideoTypeService;
import com.tp.utils.DateUtil;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * Created by hongjian.chen on 2018/3/22.
 */

@Namespace("/file")
@Results({@Result(name = CRUDActionSupport.RELOAD, location = "spfile-passed.action", params = {"id", "${id}", "status", "${status}",
        "page.pageNo", "${page.pageNo}"}, type = "redirect")})
public class SpfilePassedAction extends CRUDActionSupport<SPFile> {

    @Autowired
    private VideoTypeService videoTypeService;
    @Autowired
    private SPFileManager spFileManager;
    private Page<SPFile> page = new Page<>();
    private List<Integer> sliders = Lists.newArrayList();
    private SPFile entity;
    private List<SPItem> items;
    private Long id;
    private Long parent;
    private Long children;
    private long status;
    private String parentName;
    private String childrenName;
    private String selectedIds;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParent() {
        return parent;
    }

    public void setParent(Long parent) {
        this.parent = parent;
    }

    public Long getChildren() {
        return children;
    }

    public void setChildren(Long children) {
        this.children = children;
    }

    public long getStatus() {
        return status;
    }

    public void setStatus(long status) {
        this.status = status;
    }

    public Page<SPFile> getPage() {
        return page;
    }

    public void setPage(Page<SPFile> page) {
        this.page = page;
    }

    public List<Integer> getSliders() {
        return sliders;
    }

    public void setSliders(List<Integer> sliders) {
        this.sliders = sliders;
    }

    public List<SPItem> getItems() {
        return items;
    }

    public void setItems(List<SPItem> items) {
        this.items = items;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getChildrenName() {
        return childrenName;
    }

    public void setChildrenName(String childrenName) {
        this.childrenName = childrenName;
    }

    public String getSelectedIds() {
        return selectedIds;
    }

    public void setSelectedIds(String selectedIds) {
        this.selectedIds = selectedIds;
    }


    //    public String execute() throws Exception {
//        return list();
//    }

    public String list() throws Exception {
        items = videoTypeService.getAllTypes();
        for (SPItem item : items) {
            if (item.getId() == parent) {
                parentName = item.getName();
            }
            if (item.getId() == children) {
                childrenName = item.getName();
            }
        }
        System.out.println("parent=" + parent + "\tchildren=" + children + "\tstatus=" + status);
        page = spFileManager.searchUserSPFileByCategory(page, status, parent, children);
        sliders = page.getSlider(10);
        return SUCCESS;
    }


    @Override
    public String input() throws Exception {

        return null;
    }

    public String save() throws Exception {
        return null;
    }

    public String delete() throws Exception {
        doDelete(id);
        return RELOAD;
    }

    public String changeAll() {
        String[] ids = selectedIds.split(",");
        System.out.println("ids.length=" + ids.length);
        for (int i = 0; i < ids.length; i++) {
            doChange(Long.parseLong(ids[i]));
        }
        return RELOAD;
    }

    public void doChange(Long id) {
        entity = spFileManager.getSPFile(id);
        entity.setModifyTime(DateUtil.convert(new Date()));
        if (entity.getStatus() == 1L) {
            entity.setStatus(0L);
        } else {
            entity.setStatus(1L);
        }
        spFileManager.saveSPFile(entity);
    }

    public String deleteAll() {
        String[] ids = selectedIds.split(",");
        System.out.println("ids.length=" + ids.length);
        for (int i = 0; i < ids.length; i++) {
            doDelete(Long.parseLong(ids[i]));
        }
        return RELOAD;
    }

    public void doDelete(Long id) {
        spFileManager.deleteSPFile(id);
    }

    public String change() {
        doChange(id);
        return RELOAD;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = spFileManager.getSPFile(id);
        } else {
            entity = new SPFile();
        }
    }

    @Override
    public SPFile getModel() {
        return entity;
    }


//    public List<SPFile> getModel() {
//        return spFile;
//    }
}
