package com.tp.action.video;

import com.google.common.collect.Lists;
import com.tp.action.CRUDActionSupport;
import com.tp.dao.HibernateUtils;
import com.tp.entity.SPFile;
import com.tp.entity.video.SPItem;
import com.tp.orm.Page;
import com.tp.service.SPFileManager;

import com.tp.service.VideoTypeService;
import com.tp.utils.*;
import org.apache.log4j.Logger;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Results({@Result(name = CRUDActionSupport.RELOAD, location = "video-file.action", params = {
        "page.pageNo", "${page.pageNo}"}, type = "redirect"),
        @Result(name = "editinfo", location = "video-file!input.action", params = {
                "id", "${id}", "page.pageNo", "${page.pageNo}", "actionMessages", "${actionMessages}"}, type = "redirect")})
public class VideoFileAction extends CRUDActionSupport<SPFile> {


    private static final long serialVersionUID = 1L;
    private static final String EDITINFO = "editinfo";

    private SPFile entity;
    private Long id;
    private Page<SPFile> page = new Page<SPFile>();
    private List<Integer> sliders = Lists.newArrayList();
    private SPFileManager spFileManager;

    private File file;
    private Long categoryId;
    private Long sonCategoryId;
    private List<SPItem> parentTypes;
    private List<SPItem> subTypes;
    private List<Long> parentIds = new ArrayList<>();//大分类id
    private List<Long> childrenIds = new ArrayList<>();//小分类id
    private String title;
    private String parentCategory;//选中的父亲分类id
    private String sonCategory;//选中的子分类id
    private List<Long> checkedItems;

    @RequiresPermissions("file:view")
    public String execute() throws Exception {
        return list();
    }

    private static Logger logger = Logger.getLogger(VideoFileAction.class);

    @Override
    @RequiresPermissions("file:view")
    public String list() throws Exception {
//        logger.error("获取文件列表异常");
//        String hql = "from SPItem where dtype= ? order by value";
        parentTypes =spFileManager.getParentTypes();
        if (categoryId != null) {
            SPItem spItem = spFileManager.getById(categoryId);
            subTypes = spItem.getChildren();
        }
        System.out.println("categoryId=" + categoryId + "\t" + "sonCategoryId=" + sonCategoryId);
        page = spFileManager.searchSPFileByCategory(page, categoryId, sonCategoryId);
        sliders = page.getSlider(10);
        return SUCCESS;
    }

    @Override
    @RequiresAuthentication
    @RequiresPermissions("file:edit")
    public String delete() throws Exception {
        spFileManager.deleteSPFile(id);
        addActionMessage("删除成功");
        return RELOAD;
    }

    @Override
    // @RequiresAuthentication
    @RequiresPermissions("file:edit")
    public String input() throws Exception {
        entity = spFileManager.getSPFile(id);
        List<SPItem> items = entity.getItems();
        if (items != null && items.size() > 0) {
            for (int i = 0; i < items.size(); i++) {
                if (items.get(i).getDtype().equals("children")) {
                    childrenIds.add(items.get(i).getId());
                } else {
                    parentIds.add(items.get(i).getId());
                }
            }
        }
        parentTypes = spFileManager.getParentTypes();
        if (parentIds != null && parentIds.size() > 0) {
            //有大分类
            subTypes = spFileManager.getById(parentIds.get(0)).getChildren();
        } else {
            //无大分类
            subTypes = parentTypes.get(0).getChildren();
        }
        return INPUT;
    }

    //修改为最热
    public String hotTag() throws Exception {
        entity = spFileManager.getSPFile(id);
        if (entity.getIsHot() == 1) {
            entity.setIsHot(0);
        } else {
            entity.setIsHot(1);
        }
        spFileManager.saveSPFile(entity);
        return RELOAD;
    }

    //修改为最新
    public String newTag() throws Exception {
        entity = spFileManager.getSPFile(id);
        if (entity.getIsNew() == 1) {
            entity.setIsNew(0);
        } else {
            entity.setIsNew(1);
        }
        spFileManager.saveSPFile(entity);
        return RELOAD;
    }

    //按文件名搜索文件
    public String searchByName() throws Exception {
        page = spFileManager.searchSPFileByName(page, title);
        sliders = page.getSlider(10);
        return SUCCESS;
    }

    //点击大分类获取子分类信息
    public String getSubTypesByParentId() {
        List<SPItem> newSubTypes = new ArrayList<>();
        if (categoryId != null) {
            SPItem spItem = spFileManager.getById(categoryId);
            newSubTypes = spItem.getChildren();
        }
        String json = spFileManager.jsonString(newSubTypes);
        Struts2Utils.renderJson(json);
        return null;
    }

    //保存文件
    @Override
    @RequiresPermissions("file:edit")
    public String save() throws Exception {
        HibernateUtils.mergeByCheckedIds(entity.getItems(), checkedItems, SPItem.class);
        File willDelete = null;
        List<File> files = null;
        if (file != null) {
            try {
                //Constants.LOCKER_STORAGE为视频文件上传位置
                files = FileUtils.unZip(file, Constants.LOCKER_STORAGE);
            } catch (Exception e) {
                addActionMessage(e.getMessage());
                return EDITINFO;
            }
        }
        if (files == null || files.size() == 0) {
            files = Lists.newArrayList();
        } else if (files.size() == 1) {
            addActionMessage("ZIP资源不足!");
            return EDITINFO;
        } else {
            for (File ziFile : files) {
                //获取视频头像地址
                if (ziFile.getPath().toLowerCase().contains(".jpg") || ziFile.getPath().toLowerCase().contains(".png") || ziFile.getPath().toLowerCase().contains(".jpeg")) {
                    //设置头像
                    entity.setIconPath(ziFile.getPath());
                }
                //获取视频下载地址和时长
                if (ziFile.getPath().toLowerCase().contains(".mp4") || ziFile.getPath().toLowerCase().contains(".avi")) {
                    //设置下载路径
                    entity.setDownloadPath(ziFile.getPath());
                    File f = new File(Constants.LOCKER_STORAGE + "/" + ziFile.getPath());
                    double d = (double) f.length() / 1024 / 1024;
                    d = Double.parseDouble(String.format("%.2f", d));
                    //设置文件大小
                    entity.setSize(d);
                    int duration = (int) (Math.random() + 30);
                    //设置视频时长
                    entity.setDuration(duration);
                }
            }
        }

        entity.setModifyTime(DateUtil.convert(new Date()));
        try {
            spFileManager.saveSPFile(entity);
            if (willDelete != null) {
                org.apache.commons.io.FileUtils.deleteDirectory(willDelete);
            }
        } catch (Exception e) {
            addActionMessage(e.getMessage());
            return EDITINFO;
        }
        addActionMessage("保存成功");
        return RELOAD;
    }

    private File getWillDeleteFile(String apkPath) {
        File willDelete = null;
        String[] ps = StringUtils.split(apkPath, File.separator);
        if (ps.length > 0) {
            String folderName = ps[0];
            willDelete = new File(Constants.LOCKER_STORAGE, folderName);
        }
        return willDelete;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id == null) {
            entity = new SPFile();
        } else {
            entity = spFileManager.getSPFile(id);
        }
    }


    @Override
    public SPFile getModel() {
        return entity;
    }

    @Autowired
    public void setSPFileManager(SPFileManager spFileManager) {
        this.spFileManager = spFileManager;
    }


    public Page<SPFile> getPage() {
        return page;
    }

    public List<Integer> getSliders() {
        return sliders;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getSonCategoryId() {
        return sonCategoryId;
    }

    public void setSonCategoryId(Long sonCategoryId) {
        this.sonCategoryId = sonCategoryId;
    }

    public List<SPItem> getParentTypes() {
        return parentTypes;
    }

    public void setParentTypes(List<SPItem> parentTypes) {
        this.parentTypes = parentTypes;
    }

    public List<SPItem> getSubTypes() {
        return subTypes;
    }

    public void setSubTypes(List<SPItem> subTypes) {
        this.subTypes = subTypes;
    }

    public List<Long> getParentIds() {
        return parentIds;
    }

    public void setParentIds(List<Long> parentIds) {
        this.parentIds = parentIds;
    }

    public List<Long> getChildrenIds() {
        return childrenIds;
    }

    public void setChildrenIds(List<Long> childrenIds) {
        this.childrenIds = childrenIds;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(String parentCategory) {
        this.parentCategory = parentCategory;
    }

    public String getSonCategory() {
        return sonCategory;
    }

    public void setSonCategory(String sonCategory) {
        this.sonCategory = sonCategory;
    }

    public List<Long> getCheckedItems() {
        return checkedItems;
    }

    public void setCheckedItems(List<Long> checkedItems) {
        this.checkedItems = checkedItems;
    }
}
