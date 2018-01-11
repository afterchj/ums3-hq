package com.tp.test;

import com.tp.entity.video.SPFile;
import com.tp.entity.video.SPItem;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by hongjian.chen on 2017/12/29.
 */
public class MyTest {
    protected static SessionFactory sessionFactory;

    static {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-hibernate.xml");
        sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
    }

    public static Session getCurrentSession() {
        return sessionFactory.openSession();
    }

    @Test
    public void testCriteria() {
        String[] names = new String[]{"影视", "女明星", "动漫"};
        Criteria criteria = getCurrentSession().createCriteria(SPItem.class);
        List<SPItem> items = criteria.add(Restrictions.in("name", names))
                .add(Restrictions.disjunction()
                        .add(Restrictions.isNotNull("icon"))
                        .add(Restrictions.isNotNull("name"))
                        .add(Restrictions.gt("id", 0l)))
                .list();
//        List<SPItem> items = criteria.add(Restrictions.and(Restrictions.eq("dtype", "parent"), Restrictions.isNotNull("name"))).list();
        for (SPItem item : items) {
            System.out.println(item.getId() + "   " + item.getName());
        }

    }

    @Test
    public void testQery1() {
        String sql = "select * from sp_category sp join sp_category sc on sp.id=sc.parent_id";
        List<SPItem> spItems = getCurrentSession().createSQLQuery(sql).addEntity(SPItem.class).list();
        System.out.println(spItems.size());
        for (SPItem type : spItems) {
            System.out.println(type.getChildren().size() + "     " + type.getName());
        }
    }

    @Test
    public void testQery() {
        String hql = "From SPItem sp join sp.files where sp.id=? or sp.id=?";
        String hql1 = "From SPItem sp join sp.files where sp.id=?";
//        Query query1 = getCurrentSession().createQuery(hql1).setParameter(0,9l);
        Query query = getCurrentSession().createQuery(hql).setParameter(0, 8l).setParameter(1, 10l);
        List<Object[]> list = (List<Object[]>) query.list();
        for (Object[] o : list) {
            SPItem type = (SPItem) o[0];
            SPFile typ = (SPFile) o[1];
            System.out.println(type.getId() + "     " + type.getName() + "      " + typ.getId() + "     " + typ.getName());
//            System.out.println("o[1]:" + typ.getId() + "     " + typ.getName());
        }
    }

    @Test
    public void testVideo() {
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        List<SPItem> list = new ArrayList<>();

        SPItem type = new SPItem();
        type.setId(8l);
//        type.setDtype("parent");
//        type.setName("动漫");
//        type.setIcon("act.img");
//        type.setDescription("测试大分类");
//        type.setValue("1");
//        type.setDelete(false);

        SPItem video1 = new SPItem();
        video1.setName("吴磊");
        video1.setDtype("children");
        video1.setIcon("hg.img");
        video1.setDescription("测试子分类-男明星");
        video1.setValue("3");
        video1.setDelete(false);
        video1.setParent(type);
//        list.add(video1);
        SPItem video2 = new SPItem();
        video2.setName("李易峰");
        video2.setDtype("children");
        video2.setIcon("hjh.img");
        video2.setDescription("测试子分类-男明星");
        video2.setValue("004");
        video2.setDelete(false);
        video2.setParent(type);
//        list.add(video2);

//        type.setChildren(list);
//        session.save(type);
        session.save(video1);
        session.save(video2);
        tx.commit();
    }

    @Test
    public void testFile() {
        SPItem type = (SPItem) getCurrentSession().get(SPItem.class, 2l);
        List<SPFile> files = type.getFiles();
        System.out.println(files.size());
        for (SPFile file : files) {
            System.out.println(file.getId() + "   " + file.getName());
        }
    }

    @Test
    public void test() {
//        String sql = "select * description from sp_category  where dtype= 'children' order by value";
        String hql = "from SPItem where id=?";
        Query query = getCurrentSession().createQuery(hql).setParameter(0, 3l);
        SPItem item = (SPItem) query.uniqueResult();
        List<SPItem> types = item.getChildren();
        Collections.sort(types, new Comparator<SPItem>() {
            public int compare(SPItem o1, SPItem o2) {
                if (Integer.parseInt(o1.getValue()) > Integer.parseInt(o2.getValue())) {
                    return 1;
                }
                if (Integer.parseInt(o1.getValue()) == Integer.parseInt(o2.getValue())) {
                    return 0;
                }
                return -1;
            }
        });
        System.out.println("----------------------------------------------");
        for (SPItem type : types) {
            System.out.println(type.getId() + "     " + type.getValue() + "     " + type.getName());
        }
    }

    @Test
    public void testSave2() {
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
//        tx.begin();
//        SPInfo info=new SPInfo();
        SPItem type = new SPItem();
        type.setName("美食");
        type.setDtype("parent");
        type.setIcon("yx.img");
        type.setDescription("测试大分类-美食");
        type.setValue("3");
        type.setDelete(false);
        type.setStatus(0l);
        session.save(type);
        tx.commit();
    }

    @Test
    public void testSave3() {
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();

        SPFile file = new SPFile();
        List<SPItem> list = new ArrayList<>();
        SPItem item1 = new SPItem();
        item1.setId(8l);

        SPItem item2 = new SPItem();
        item2.setId(9l);

        file.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        file.setIsHot(0);
        file.setIsNew(0);
        file.setIsRecommend(0);
        file.setName("李逍遥");
        file.setIconPath("hjh.mp4");
        list.add(item1);
        list.add(item2);

        file.setItems(list);
        session.save(file);
        tx.commit();
//        session.close();
    }


}
