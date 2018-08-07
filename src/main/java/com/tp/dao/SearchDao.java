package com.tp.dao;

import com.tp.entity.Search;
import com.tp.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SearchDao extends HibernateDao<Search, Long> {
    private static final String QUERY_ALL_BY_SORT = "select s from Search s where s.delete = 0 order by s.createTime desc";

    private static final String QUERY_ON_SHELF_BY_SORT = "select s from Search s where s.status = 1 and s.delete = 0 order by s.createTime desc";

    private static final String  DELETE_STATUS="update Search s set s.status=0";

    private static final String  SET_STATUS="update Search s set s.status=1 where s.delete = 0 and s.id = ?";

    private static final String  IS_DELETE="select count(*) from Search s where s.delete = 0 and s.id = ?";

    private static final String  QUERY_NAME="select s.name from Search s where s.delete = 0 and s.id = ?";

    @Override
    public List<Search> getAll() {
        return createQuery(QUERY_ALL_BY_SORT).list();
    }

    public List<Search> getOnShelfFiles() {
        return createQuery(QUERY_ON_SHELF_BY_SORT).list();
    }

    public void deleteStatus() {
        createQuery(DELETE_STATUS).executeUpdate();
    }

    public void setStatus(Long id) {
        createQuery(SET_STATUS,id).executeUpdate();
    }

    public String find(Long id) {
        return String.valueOf(createQuery(QUERY_NAME,id).uniqueResult());
    }

    public String isDelete(Long id) {
        return String.valueOf(createQuery(IS_DELETE,id).uniqueResult());
    }
}
