package com.tp.action;

import com.google.common.collect.Lists;
import com.tp.dto.FileDTO;
import com.tp.entity.Category;
import com.tp.entity.Search;
import com.tp.mapper.JsonMapper;
import com.tp.service.SearchService;
import com.tp.utils.Struts2Utils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-5-19
 * Time: 下午4:10
 * To change this template use File | Settings | File Templates.
 */
@Namespace("/category")
@Results({@Result(name = CRUDActionSupport.RELOAD, location = "search.action", type = "redirect", params = {"id", "${id}"})})
public class SearchAction extends CRUDActionSupport<Search> {

    private static final long serialVersionUID = 1L;

    private Search entity;
    private Long id;
    private Long categoryID;
    private List<Search> searchResult = Lists.newArrayList();
    private List<Category> categories = Lists.newArrayList();
    private List<Long> checkedFileIds;
    private SearchService searchService;

    @Override
    public String list() throws Exception {
        return "manage";
    }

    @Override
    public String input() throws Exception {

        return INPUT;
    }

    @Override
    public String save() throws Exception {
        entity.setStatus(0);
        entity.setCreateTime(new Date());
        entity.setDelete(false);
        searchService.saveOrUpdae(entity);
        return null;
    }

    @Override
    public String delete() throws Exception {
        if (id != null) {
            entity = searchService.getById(id);
            entity.setUpdateTime(new Date());
            entity.setDelete(true);
            if(entity.getStatus()==1){
                searchService.deleteOfficalByName(entity.getName());
            }
            searchService.saveOrUpdae(entity);
        }
        return null;
    }


    public String getRemainFiles() throws Exception {
        List<Search> allFiles = searchService.getAll();
        List<Search> onShelfFiles = searchService.getOnShelfFiles();
        List<Search> remainFiles = getRemainFiles(allFiles, onShelfFiles);
        String json = jsonString(remainFiles);
        Struts2Utils.renderJson(json);
        return null;
    }


    public String getOnShelfFiles() throws Exception {

        List<Search> onShelfFiles = searchService.getOnShelfFiles();
        String json = jsonString(onShelfFiles);
        Struts2Utils.renderJson(json);
        return null;
    }

    public List<Search> getRemainFiles(List<Search> allFiles, List<Search> onShelfFiles) {
        List<Search> remainFiles = Lists.newArrayListWithCapacity(allFiles.size());
        for (Search fi : allFiles) {
            if (!onShelfFiles.contains(fi)) {
                remainFiles.add(fi);
            }
        }
        return remainFiles;
    }

    public String saveFile() throws Exception{
        searchService.deleteStatus();
        for(Long fid:checkedFileIds){
            searchService.setStatus(fid);
            searchService.save(fid);
        }
        addActionMessage("保存成功");
        return "search-manage";
    }

    public String getAllDict() {
        List<Search> allFiles = searchService.getAll();
        String json = jsonString(allFiles);
        Struts2Utils.renderJson(json);
        return null;
    }

    public String jsonString(List<Search> remainFiles) {
        List<FileDTO> fileDtos = Lists.newArrayList();
        for (Search f : remainFiles) {
            FileDTO dto = new FileDTO();
            dto.setId(f.getId());
            dto.setName(f.getName());
            fileDtos.add(dto);
        }
        JsonMapper mapper = JsonMapper.buildNormalMapper();
        return mapper.toJson(fileDtos);
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id == null) {
            entity = new Search();
        } else {
            entity = searchService.getById(id);
        }
    }

    @Override
    public Search getModel() {
        if (entity == null) {
            entity = new Search();
        }
        return entity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Long> getCheckedFileIds() {
        return checkedFileIds;
    }

    public void setCheckedFileIds(List<Long> checkedFileIds) {
        this.checkedFileIds = checkedFileIds;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategoryID(Long categoryID) {
        this.categoryID = categoryID;
    }

    public Long getCategoryID() {
        return categoryID;
    }

    @Autowired
    public void setSearchService(SearchService searchService) {
        this.searchService = searchService;
    }
}
