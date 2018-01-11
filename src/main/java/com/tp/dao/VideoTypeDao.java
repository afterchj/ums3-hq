package com.tp.dao;

import com.tp.entity.video.SPItem;

import java.util.List;


/**
 * Created by hongjian.chen on 2018/1/3.
 */
public interface VideoTypeDao {

    List<SPItem> getAll(String sql);

    List<SPItem> getParentTypes(String sql);

    List<SPItem> getSubTypes(String sql);

    void saveOrUpdate(SPItem item);


    SPItem getById(Long id);


    void deleteById(SPItem item);
}
