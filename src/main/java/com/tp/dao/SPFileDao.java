package com.tp.dao;

import com.tp.entity.SPFile;
import com.tp.orm.Page;
import com.tp.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;

/**
 * Created by yuanjie.fang on 2018/1/3.
 */
@Component
public class SPFileDao extends HibernateDao<SPFile, Long> {
    //查询所有
    private static final String QUERY_SPFILE = "select f from SPFile f order by f.id desc,f.modifyTime desc";
    //按大分类或小分类查询
    private static final String QUERY_SPFILE_BY_CATEGORY1 = "select f from SPFile f join f.items i where i.id = ? order by f.id desc,f.modifyTime desc";
    //按大小分类查询
    private static final String QUERY_SPFILE_BY_CATEGORY2 = "select f from SPFile f join f.items i join f.items i2 where i.id = ? and i2.id = ? order by f.modifyTime desc";
    //按名称搜索
    private static final String QUERY_SPFILE_BY_NAME = "select f from SPFile f where f.name = ? order by f.modifyTime desc";

    private static final String QUERY_SPFILE_BY_STATUS = "";

    private static final String QUERY_USER_SPFILE = "select f from SPFile f where f.status = 1 and f.isCheck = 1 order by f.modifyTime desc,f.id desc";

    private static final String QUERY_USER_SPFILE_BY_CATEGORY1 = "select f from SPFile f join f.items i where i.id = ? and f.status = 1 and f.isCheck = 1 order by f.modifyTime desc,f.id desc";

    private static final String QUERY_USER_SPFILE_BY_CATEGORY2 = "select f from SPFile f join f.items i join f.items i2 where i.id = ? and i2.id = ? and f.status = 1 and f.isCheck = 1 order by f.modifyTime desc,f.id desc";

    private static final String QUERY_OFFICIAL_SPFILE = "select f from SPFile f where f.status = 1 and f.isCheck IS NULL order by f.modifyTime desc,f.id desc";

    private static final String QUERY_OFFICIAL_SPFILE_BY_CATEGORY1 = "select f from SPFile f join f.items i where i.id = ? and f.status = 1 and f.isCheck IS NULL order by f.modifyTime desc,f.id desc";

    private static final String QUERY_OFFICIAL_SPFILE_BY_CATEGORY2 = "select f from SPFile f join f.items i join f.items i2 where i.id = ? and i2.id = ? and f.status = 1 and f.isCheck IS NULL order by f.modifyTime desc,f.id desc";

    public Page<SPFile> searchSPFileByCategory(final Page<SPFile> page, Long categoryId, Long sonCategoryId) {
        if (categoryId == null && sonCategoryId == null) {
            return findPage(page, QUERY_SPFILE);
        } else if (categoryId != null && sonCategoryId == null) {
            return findPage(page, QUERY_SPFILE_BY_CATEGORY1, categoryId);
        } else if (categoryId == null && sonCategoryId != null) {
            return findPage(page, QUERY_SPFILE_BY_CATEGORY1, sonCategoryId);
        } else {
            return findPage(page, QUERY_SPFILE_BY_CATEGORY2, categoryId, sonCategoryId);
        }
    }

    public Page<SPFile> searchSPFileByCategory(final Page<SPFile> page, Long categoryId, Long sonCategoryId, String source) {
        if(source ==null || "".equals(source) || "0".equals(source)) {
            if (categoryId == null && sonCategoryId == null) {
                return findPage(page, QUERY_SPFILE);
            } else if (categoryId != null && sonCategoryId == null) {
                return findPage(page, QUERY_SPFILE_BY_CATEGORY1, categoryId);
            } else if (categoryId == null && sonCategoryId != null) {
                return findPage(page, QUERY_SPFILE_BY_CATEGORY1, sonCategoryId);
            } else {
                return findPage(page, QUERY_SPFILE_BY_CATEGORY2, categoryId, sonCategoryId);
            }
        }else if("1".equals(source)){
            if (categoryId == null && sonCategoryId == null) {
                return findPage(page, QUERY_USER_SPFILE);
            } else if (categoryId != null && sonCategoryId == null) {
                return findPage(page, QUERY_USER_SPFILE_BY_CATEGORY1, categoryId);
            } else if (categoryId == null && sonCategoryId != null) {
                return findPage(page, QUERY_USER_SPFILE_BY_CATEGORY1, sonCategoryId);
            } else {
                return findPage(page, QUERY_USER_SPFILE_BY_CATEGORY2, categoryId, sonCategoryId);
            }
        }else {
            if (categoryId == null && sonCategoryId == null) {
                return findPage(page, QUERY_OFFICIAL_SPFILE);
            } else if (categoryId != null && sonCategoryId == null) {
                return findPage(page, QUERY_OFFICIAL_SPFILE_BY_CATEGORY1, categoryId);
            } else if (categoryId == null && sonCategoryId != null) {
                return findPage(page, QUERY_OFFICIAL_SPFILE_BY_CATEGORY1, sonCategoryId);
            } else {
                return findPage(page, QUERY_OFFICIAL_SPFILE_BY_CATEGORY2, categoryId, sonCategoryId);
            }
        }
    }

    public Page<SPFile> searchUserSPFileByCategory(final Page<SPFile> page, Long status, Long categoryId, Long sonCategoryId) {
        page.setPageSize(15);
        StringBuffer hql = new StringBuffer("select f from SPFile f join f.items i");

        if (categoryId == null && sonCategoryId == null && status == null) {
            return findPage(page, QUERY_SPFILE);
        }
        if (categoryId == null && sonCategoryId == null && status != null) {
            String hql_s = "select f from SPFile f  where f.status = ? order by f.id desc,f.modifyTime desc";
            return findPage(page, hql_s, status);
        }
        if (status != null) {
            if (categoryId != null && sonCategoryId == null) {
                hql.append(" where f.status = ? and i.id = ? order by f.id desc,f.modifyTime desc");
                return findPage(page, hql.toString(), status, categoryId);
            } else if (categoryId == null && sonCategoryId != null) {
                hql.append(" where f.status = ? and i.id = ?  order by f.id desc,f.modifyTime desc");
                return findPage(page, hql.toString(), status, sonCategoryId);
            } else {
                hql.append(" join f.items i2 where f.status = ? and i.id = ? and i2.id = ? order by f.id desc,f.modifyTime desc");
                return findPage(page, hql.toString(), status, categoryId, sonCategoryId);
            }
        }
        return null;
    }

    public Page<SPFile> searchSPFileByName(final Page<SPFile> page, String name) {
        return findPage(page, QUERY_SPFILE_BY_NAME, name);
    }
}
