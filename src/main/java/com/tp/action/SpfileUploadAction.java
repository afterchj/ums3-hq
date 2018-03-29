package com.tp.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tp.dao.HibernateUtils;
import com.tp.entity.FileType;
import com.tp.entity.SPFile;
import com.tp.entity.video.SPItem;
import com.tp.service.SPFileManager;
import com.tp.service.VideoTypeService;
import com.tp.utils.Constants;
import com.tp.utils.DateUtil;
import com.tp.utils.FileUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Namespace("/file")
@Results({
        @Result(name = "editinfo", location = "spfile.action", type = "redirect"),
        @Result(name = "reupload", location = "spfile-upload.jsp", type = "dispatcher")})
public class SpfileUploadAction extends ActionSupport {

    private static final long serialVersionUID = 1L;
    private static final String RELOAD = "reupload";
    private static final String EDITINFO = "editinfo";

    private File upload;
    private String uploadFileName;
    private String name;
    private Integer isRecommend;
    private String lable;
    private List<Long> checkedItems;
    private SPFileManager spFileManager;
    private VideoTypeService videoTypeService;
    private Long id;
    private Long categoryId;
    private Long sonCategoryId;
    private List<SPItem> parentTypes;
    private List<SPItem> subTypes;
    private List<Long> parentIds = new ArrayList<>();//大分类id
    private List<Long> childrenIds = new ArrayList<>();//小分类id

    @Override
    public String execute() throws Exception {
        init();
        return SUCCESS;
    }

    //先初始化分类数据
    private void init() {
        parentTypes = videoTypeService.getParentTypes();
        subTypes = parentTypes.get(0).getChildren();
    }

    @RequiresPermissions("file:edit")
    public String upload() throws IOException {
        init();
        String extension = FileUtils.getExtension(uploadFileName);
        if (!FileType.ZIP.getValue().equalsIgnoreCase(extension)) {
            addActionMessage("请上传一个zip文件");
            return RELOAD;
        }
        SPFile entity = getSPFile();
        try {
            List<File> files = FileUtils.unZip(upload, Constants.LOCKER_STORAGE);
            if (files == null || files.size() == 0) {
                addActionMessage("不能上传一个空的zip文件");
                return RELOAD;
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
                        int duration = (int) (Math.random()*30);
                        //设置视频时长
                        entity.setDuration(duration);
                    }
                }
                if (entity.getIconPath() == null || entity.getIconPath().equals("")) {
                    addActionMessage("zip文件缺少头像图片");
                    return RELOAD;
                }
                if (entity.getDownloadPath() == null || entity.getDownloadPath().equals("")) {
                    addActionMessage("zip文件缺少视频资源");
                    return RELOAD;
                }
            }

//            System.out.println(entity);
            spFileManager.saveSPFile(entity);
        } catch (Exception e) {
            addActionMessage(e.getMessage());
            return RELOAD;
        }
        addActionMessage("上传成功");
        return EDITINFO;
    }

    private SPFile getSPFile() {
        SPFile entity = new SPFile();
        entity.setName(name);
        entity.setIsHot(0);
        entity.setIsNew(0);
        entity.setStatus(1L);
        entity.setIsRecommend(isRecommend);
        entity.setLable(lable);
        entity.setCreateTime(DateUtil.convert(new Date()));
        entity.setModifyTime(DateUtil.convert(new Date()));
        if (CollectionUtils.isNotEmpty(checkedItems)) {
            List<SPItem> spItems = new ArrayList<>();
            spItems.add(parentTypes.get(0));
            //假设先给该是文件定义一个分类
            entity.setItems(spItems);
            HibernateUtils.mergeByCheckedIds(entity.getItems(), checkedItems, SPItem.class);
        }
        return entity;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Integer isRecommend) {
        this.isRecommend = isRecommend;
    }

    public String getLable() {
        return lable;
    }

    public void setLable(String lable) {
        this.lable = lable;
    }

    public List<Long> getCheckedItems() {
        return checkedItems;
    }

    public void setCheckedItems(List<Long> checkedItems) {
        this.checkedItems = checkedItems;
    }

    @Autowired
    public void setSPFileManager(SPFileManager spFileManager) {
        this.spFileManager = spFileManager;
    }

    @Autowired
    public void setVideoTypeService(VideoTypeService videoTypeService) {
        this.videoTypeService = videoTypeService;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
}
