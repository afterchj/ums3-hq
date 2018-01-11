package com.tp.service;


import com.tp.entity.video.SPItem;

import java.util.List;

/**
 * Created by hongjian.chen on 2018/1/3.
 */

public interface VideoTypeService {

    List<SPItem> getAllTypes();

    List<SPItem> getParentTypes();

    List<SPItem> getSubTypes();

    void saveOrUpdate(SPItem item);

    SPItem getById(Long id);

    void deleteById(Long id);
}
