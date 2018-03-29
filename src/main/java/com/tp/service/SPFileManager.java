package com.tp.service;

import com.google.common.collect.Lists;
import com.tp.dao.SPFileDao;
import com.tp.dto.FileDTO;
import com.tp.entity.SPFile;
import com.tp.entity.video.SPItem;
import com.tp.mapper.JsonMapper;
import com.tp.orm.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
@Transactional
public class SPFileManager {

    private SPFileDao spFileDao;

    //根据id查询视频文件
    public SPFile getSPFile(Long id) {
        return spFileDao.get(id);
    }

    //获取视频文件列表
    public List<SPFile> getAllSPFile() {
        return spFileDao.getAll();
    }


    //删除视频文件
    public void deleteSPFile(Long id) {
        spFileDao.delete(id);
    }

    //根据分类查询文件
    public Page<SPFile> searchSPFileByCategory(final Page<SPFile> page, Long categoryId, Long sonCategoryId) {
        return spFileDao.searchSPFileByCategory(page, categoryId, sonCategoryId);
    }

    public Page<SPFile> searchUserSPFileByCategory(final Page<SPFile> page, Long status, Long categoryId, Long sonCategoryId) {
        return spFileDao.searchUserSPFileByCategory(page, status, categoryId, sonCategoryId);
    }

    //保存视频文件
    public void saveSPFile(SPFile entity) {
        spFileDao.save(entity);
    }

    //按名称查询文件
    public Page<SPFile> searchSPFileByName(final Page<SPFile> page, String name) {
        return spFileDao.searchSPFileByName(page, name);
    }

    @Autowired
    public void setSPFileDao(SPFileDao spFileDao) {
        this.spFileDao = spFileDao;
    }

    public String jsonString(List<SPItem> spItems) {
        List<FileDTO> fileDtos = Lists.newArrayList();

        for (SPItem s : spItems) {
            FileDTO dto = new FileDTO();
            dto.setId(s.getId());
            dto.setName(s.getName());
            fileDtos.add(dto);
        }
        JsonMapper mapper = JsonMapper.buildNormalMapper();
        return mapper.toJson(fileDtos);

    }

}
