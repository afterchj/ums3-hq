package com.tp.action.video;

import com.tp.action.CRUDActionSupport;
import com.tp.entity.video.SPItem;
import com.tp.service.VideoTypeService;
import com.tp.utils.Constants;
import com.tp.utils.FileUtils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.List;

/**
 * Created by hongjian.chen on 2018/1/3.
 */
@Results({@Result(name = CRUDActionSupport.RELOAD, location = "video-type.action", type = "redirect")})
public class VideoTypeAction extends CRUDActionSupport<SPItem> {
    private static final long serialVersionUID = 1L;

    @Autowired
    private VideoTypeService videoTypeService;

    private SPItem entity;
    private Long id;
    private Long pid;
    private List<SPItem> items;

    private File iicon;
    private String iiconFileName;

    @Override
    public String list() throws Exception {
        items = videoTypeService.getParentTypes();
        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public String save() throws Exception {
//        System.out.println("id=" + id + ",type.id=" + entity.getId() + ",pid=" + pid);
//        ActionContext ac = ActionContext.getContext();
//        ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
//        String path = sc.getRealPath("/category/");
        if (iicon != null) {
            String iconPath = FileUtils.getIcon(iicon, Constants.CATEGROY_STORAGE, iiconFileName);
//            System.out.println("iconPath=" + iconPath);
            entity.setIcon(iconPath);
        }
        entity.setDtype("parent");
        videoTypeService.saveOrUpdate(entity);
        return RELOAD;
    }

    @Override
    public String delete() throws Exception {
        videoTypeService.deleteById(id);
        return RELOAD;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id == null) {
            entity = new SPItem();
        } else {
            entity = videoTypeService.getById(id);
        }
    }

    @Override
    public SPItem getModel() {
        if (entity == null) {
            entity = new SPItem();
        }
        return entity;
    }

    public SPItem getEntity() {
        return entity;
    }

    public void setEntity(SPItem entity) {
        this.entity = entity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public List<SPItem> getItems() {
        return items;
    }

    public void setItems(List<SPItem> items) {
        this.items = items;
    }

    public File getIicon() {
        return iicon;
    }

    public void setIicon(File iicon) {
        this.iicon = iicon;
    }

    public String getIiconFileName() {
        return iiconFileName;
    }

    public void setIiconFileName(String iiconFileName) {
        this.iiconFileName = iiconFileName;
    }
}
