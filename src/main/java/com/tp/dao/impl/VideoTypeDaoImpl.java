package com.tp.dao.impl;

import com.tp.dao.VideoTypeDao;
import com.tp.entity.video.SPItem;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hongjian.chen on 2018/1/3.
 */
@Repository
public class VideoTypeDaoImpl implements VideoTypeDao {

    @Autowired
    SessionFactory sessionFactory;

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }


    @Override
    public List<SPItem> getAll(String sql) {
        return getCurrentSession().createQuery(sql).list();
    }

    @Override
    public List<SPItem> getParentTypes(String sql) {
        return getCurrentSession().createQuery(sql).setString(0,"parent").list();
    }

    @Override
    public List<SPItem> getSubTypes(String sql) {

        return getCurrentSession().createQuery(sql).setString(0,"children").list();
    }

    @Override
    public void saveOrUpdate(SPItem item) {
        Session session = getCurrentSession();
//        session.clear();
        session.saveOrUpdate(item);
    }

    @Override
    public SPItem getById(Long id) {
        return (SPItem) getCurrentSession().get(SPItem.class, id);
    }

    @Override
    public void deleteById(SPItem item) {
        getCurrentSession().delete(item);
    }

}
