package com.tp.service;

import com.tp.dao.HottestDao;
import com.tp.dao.SearchDao;
import com.tp.entity.Hottest;
import com.tp.entity.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Component
@Transactional
public class SearchService {
    private SearchDao searchDao;

    private HottestDao hottestDao;

    public List<Search> getAll() {
        return searchDao.getAll();
    }

    public List<Search> getOnShelfFiles() {
        return searchDao.getOnShelfFiles();
    }

    public void deleteStatus() {
        searchDao.deleteStatus();
        hottestDao.deleteOffical();
    }

    public void setStatus(Long id) {
        searchDao.setStatus(id);
    }

    public void deleteOfficalByName(String name) {
        hottestDao.deleteOfficalByName(name);
    }

    public void save(Long id) {
        String isDelete = searchDao.isDelete(id);
        if(!"0".equals(isDelete)) {
            Hottest hottest = new Hottest();
            hottest.setName(searchDao.find(id));
            hottest.setUpdateTime(new Date());
            hottestDao.save(hottest);
        }
    }


    @Autowired
    public void setSearchDao(SearchDao searchDao) {
        this.searchDao = searchDao;
    }

    @Autowired
    public void setHottestDao(HottestDao hottestDao) {
        this.hottestDao = hottestDao;
    }

    public void saveOrUpdae(Search search) {
        searchDao.save(search);
    }

    public Search getById(long id) {
        return searchDao.get(id);
    }
}
