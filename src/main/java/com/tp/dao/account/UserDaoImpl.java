package com.tp.dao.account;

import org.springframework.stereotype.Repository;

import com.tp.dao.UserDao;
import com.tp.dao.impl.BaseHibernateDaoImpl;
import com.tp.entity.account.User;

@Repository("userDao")
public class UserDaoImpl extends BaseHibernateDaoImpl<User, Long> implements UserDao{

}
