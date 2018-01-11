package com.tp.service.impl;

import com.tp.dao.VideoTypeDao;
import com.tp.entity.video.SPItem;
import com.tp.service.VideoTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hongjian.chen on 2018/1/3.
 */

@Service
public class VideoTypeServiceImpl implements VideoTypeService {

    String hql = "from SPItem where dtype= ? order by value";

    @Autowired
    private VideoTypeDao videoTypeDao;

    @Override
    public List<SPItem> getAllTypes() {
        String sql = "from SPItem order by value";
        return videoTypeDao.getAll(sql);
    }


    @Override
    public List<SPItem> getParentTypes() {
        return videoTypeDao.getParentTypes(hql);
    }

    @Override
    public List<SPItem> getSubTypes() {
        return videoTypeDao.getSubTypes(hql);
    }


    @Override
    public void saveOrUpdate(SPItem item) {
        videoTypeDao.saveOrUpdate(item);
    }


    @Override
    public SPItem getById(Long id) {
        return videoTypeDao.getById(id);
    }

    @Override
    public void deleteById(Long id) {
        videoTypeDao.deleteById(getById(id));
    }
}
