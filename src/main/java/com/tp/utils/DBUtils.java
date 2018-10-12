//package com.tp.utils;
//
//import com.tp.service.impl.VideoTypeServiceImpl;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
///**
// * Created by hongjian.chen on 2018/6/1.
// */
//public class DBUtils {
//    public static SessionFactory sessionFactory;
//    public static ApplicationContext ctx = null;
//
//    static {
//        ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//        sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
//    }
//
//    public static Session getCurrentSession() {
//        return sessionFactory.openSession();
//    }
//
//    public static void main(String[] args) {
//        VideoTypeServiceImpl videoTypeService = (VideoTypeServiceImpl) ctx.getBean("videoTypeService");
//        System.out.println(sessionFactory);
//        System.out.println(videoTypeService.getParentTypes().get(0).getDtype());
//    }
//}
