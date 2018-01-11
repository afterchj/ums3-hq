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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by hongjian.chen on 2018/1/3.
 */
@Results({@Result(name = CRUDActionSupport.RELOAD, location = "video-info.action", params = {"pid", "${pid}", "id", "${id}"}, type = "redirect")})
public class VideoInfoAction extends CRUDActionSupport<SPItem> {
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
        entity = videoTypeService.getById(pid);
        items = entity.getChildren();
        Collections.sort(items, new Comparator<SPItem>() {
            public int compare(SPItem o1, SPItem o2) {

                if (Integer.parseInt(o1.getValue()) > Integer.parseInt(o2.getValue())) {
                    return -1;
                }
                if (Integer.parseInt(o1.getValue()) == Integer.parseInt(o2.getValue())) {
                    return 0;
                }
                return 1;
            }
        });
        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public String save() throws Exception {
//        System.out.println("videoInfo.save id=" + id + "  " + pid);
//        ActionContext ac = ActionContext.getContext();
//        ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
//        String path = sc.getRealPath("/category/");
        SPItem type = new SPItem();
        if (pid != null) {
            type.setId(pid);
        } else {
            type.setId(id);
        }
        entity.setDtype("children");
        entity.setParent(type);
        if (iicon != null) {
            String iconPath = FileUtils.getIcon(iicon, Constants.CATEGROY_STORAGE, iiconFileName);
//            System.out.println("iconPath=" + iconPath);
            entity.setIcon(iconPath);
        }
        videoTypeService.saveOrUpdate(entity);
        return RELOAD;
    }

    public String change() throws Exception {
        entity = videoTypeService.getById(id);
        if (entity.getStatus() == 0L) {
            entity.setValue("-1");
            entity.setStatus(1L);
        } else if (entity.getStatus() == 1L) {
            entity.setValue("1000");
            entity.setStatus(0L);
        }
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

    public List<SPItem> getItems() {
        return items;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
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
