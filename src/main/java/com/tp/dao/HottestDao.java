package com.tp.dao;

import com.tp.entity.Hottest;
import com.tp.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;

@Component
public class HottestDao extends HibernateDao<Hottest, Long> {
    private static final String  DELETE_OFFICAL="delete from Hottest h where h.times is null";

    private static final String  DELETE_OFFICAL_BY_NAME="delete from Hottest h where h.times is null and h.name = ?";

    public void deleteOffical() {
        createQuery(DELETE_OFFICAL).executeUpdate();
    }

    public void deleteOfficalByName(String name) {
        createQuery(DELETE_OFFICAL_BY_NAME,name).executeUpdate();
    }
}
