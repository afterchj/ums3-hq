package com.tp.startup;

import com.tp.utils.Constants;
import com.tp.utils.PropertiesLoader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

/**
 * User: ken.cui
 * Date: 13-3-22
 * Time: 下午1:03
 */
public class UmsContext extends ContextLoaderListener {
    private static Logger logger = LoggerFactory.getLogger(UmsContext.class);
    private static PropertiesLoader propertiesLoader = PropertiesLoader.getInstance();
    private static ServletContext servletContext = null;

    public UmsContext() {
        super();
    }

    @Override
    public void contextInitialized(ServletContextEvent event) {
        String profiles = event.getServletContext().getInitParameter("spring.profiles.default");
        System.out.println("profiles=======================》"+profiles);
        String customPath = "classpath:/setup." + profiles + ".properties";
		propertiesLoader.setProperties("classpath:/setup.properties", customPath);
		Constants.TOMCAT_SHOW = propertiesLoader.getProperty("tomcat.show.location") + "/";
		Constants.STATIC_SHOW = propertiesLoader.getProperty("static.show.location");
		Constants.LOCKER_STORAGE = propertiesLoader.getProperty("locker.storage");
		Constants.CLIENT_STORAGE = propertiesLoader.getProperty("client.storeage");
		Constants.POLL_STORAGE = propertiesLoader.getProperty("poll.storeage");
		Constants.CATEGROY_STORAGE = propertiesLoader.getProperty("category.storage");
		Constants.WORK_PIC = propertiesLoader.getProperty("mem.work.pic");
		Constants.HTTPCLIENT_PROXY = propertiesLoader.getBoolean("httpclient.proxy");
		if(Constants.HTTPCLIENT_PROXY){
			Constants.HTTPCLIENT_PROXY_HOST = propertiesLoader.getProperty("httpclient.proxy.host");
			Constants.HTTPCLIENT_PROXY_PORT = propertiesLoader.getInteger("httpclient.proxy.port");
		}
		Constants.ORDER_DEALER_QB_URL = propertiesLoader.getProperty("order.dealer.qb.url");
        super.contextInitialized(event);
        try{
            UmsStartup.prepare();
        }catch (StartupException e){
            logger.error("ums startup failed during app preparation",e);
            return;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        super.contextDestroyed(event);
    }

    public ServletContext getServletContext() {
        return servletContext;
    }
}
