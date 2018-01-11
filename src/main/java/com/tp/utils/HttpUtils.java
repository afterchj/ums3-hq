package com.tp.utils;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

public class HttpUtils {
	
    public static HttpClient httpclient = HttpClientBuilder.create().build();
    /**
     * 发送 post请求访问本地应用并根据传递参数不同返回不同结果
     */
//    public String post(String url,String respEncoding) {
//        return post(url,"UTF-8",respEncoding,new ArrayList<NameValuePair>());
//    }
    
    public static HttpResponse post(String url,String respEncoding){
    	 return post(url,"UTF-8",respEncoding,new ArrayList<NameValuePair>());
    }

    /**
     * 发送 post请求访问本地应用并根据传递参数不同返回不同结果
     */
    public static HttpResponse post(String url,String reqEncoding,String respEncoding,List<NameValuePair> param) {
    	HttpResponse response = null;
    	// 创建httppost
        HttpPost httppost = new HttpPost(url);
        // 创建参数队列
        List<NameValuePair> formparams = param;
        UrlEncodedFormEntity uefEntity;
        try {
            uefEntity = new UrlEncodedFormEntity(formparams, reqEncoding);
            httppost.setEntity(uefEntity);
            response = httpclient.execute(httppost);
//            HttpEntity entity = response.getEntity();
//            if (entity != null) {
//                resStr = EntityUtils.toString(entity,respEncoding);
//            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭连接,释放资源
           // httpclient.getConnectionManager().shutdown();
        }
        return response;
    }
    
    /**
     * 发送 post请求访问本地应用并根据传递参数不同返回不同结果
     */
    public static HttpResponse connect(HttpEntityEnclosingRequestBase http, String reqEncoding,String respEncoding,List<NameValuePair> param) {
    	HttpResponse response = null;
        // 创建参数队列
        List<NameValuePair> formparams = param;
        UrlEncodedFormEntity uefEntity;
        try {
            uefEntity = new UrlEncodedFormEntity(formparams, reqEncoding);
            http.setEntity(uefEntity);
            response = httpclient.execute(http);
//            HttpEntity entity = response.getEntity();
//            if (entity != null) {
//                resStr = EntityUtils.toString(entity,respEncoding);
//            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭连接,释放资源
           // httpclient.getConnectionManager().shutdown();
        }
        return response;
    }
    
    /**
     * 发送 post请求访问本地应用并根据传递参数不同返回不同结果
     */
    public static HttpResponse connect(HttpHost host, HttpEntityEnclosingRequestBase http, String reqEncoding,String respEncoding,List<NameValuePair> param) {
    	HttpResponse response = null;
        // 创建参数队列
        List<NameValuePair> formparams = param;
        UrlEncodedFormEntity uefEntity;
        try {
            uefEntity = new UrlEncodedFormEntity(formparams, reqEncoding);
            http.setEntity(uefEntity);
            response = httpclient.execute(host, http);
//            HttpEntity entity = response.getEntity();
//            if (entity != null) {
//                resStr = EntityUtils.toString(entity,respEncoding);
//            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭连接,释放资源
           // httpclient.getConnectionManager().shutdown();
        }
        return response;
    }
    

    /**
     * 发送 get请求
     */
    public String get(String url) {
        //httpclient = new DefaultHttpClient();
        String resStr = "";
        try {
            // 创建httpget.
            HttpGet httpget = new HttpGet(url);
            // 执行get请求.
            HttpResponse response = httpclient.execute(httpget);
            // 获取响应实体
            HttpEntity entity = response.getEntity();
            // 打印响应状态
            System.out.println(response.getStatusLine());
            if (entity != null) {
                // 打印响应内容长度
//                System.out.println("Response content length: "
//                        + entity.getContentLength());
                // 打印响应内容
//                System.out.println("Response content: "
//                        + EntityUtils.toString(entity));
                resStr=EntityUtils.toString(entity);
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭连接,释放资源
            //httpclient.getConnectionManager().shutdown();
        }
        return resStr;
    }
    
    
    public static String getHost(String url) {
    	if (!(org.apache.commons.lang3.StringUtils.startsWithIgnoreCase(url, "http://") || org.apache.commons.lang3.StringUtils
    			.startsWithIgnoreCase(url, "https://"))) {
    		url = "http://" + url;
    	}
    	String returnVal = org.apache.commons.lang3.StringUtils.EMPTY;
    	try {
    		URI uri = new URI(url);
    		returnVal = uri.getHost();
    	} catch (Exception e) {
    	}
    	if ((org.apache.commons.lang3.StringUtils.endsWithIgnoreCase(returnVal, ".html") || org.apache.commons.lang3.StringUtils
    			.endsWithIgnoreCase(returnVal, ".htm"))) {
    		returnVal = org.apache.commons.lang3.StringUtils.EMPTY;
    	}
    	return returnVal;
    }
    
    public static Integer getPort(String url) {
    	if (!(org.apache.commons.lang3.StringUtils.startsWithIgnoreCase(url, "http://") || org.apache.commons.lang3.StringUtils
    			.startsWithIgnoreCase(url, "https://"))) {
    		url = "http://" + url;
    	}
    	Integer returnVal = 80;
    	try {
    		URI uri = new URI(url);
    		returnVal = uri.getPort();
    	} catch (Exception e) {
    	}
    	if(returnVal <= 0){
    		returnVal = 80;
    	}
    	return returnVal;
    }
    
    public static String getProtocal(String url) {
    	if(org.apache.commons.lang3.StringUtils.startsWithIgnoreCase(url, "https://")){
    		return "https";
    	}else {
    		return "http";
    	}
    }

	public static String getPath(String postUrl) {
		if (!(org.apache.commons.lang3.StringUtils.startsWithIgnoreCase(postUrl, "http://") || org.apache.commons.lang3.StringUtils
    			.startsWithIgnoreCase(postUrl, "https://"))) {
			postUrl = "http://" + postUrl;
    	}
		URI uri;
		String returnVal = "/";
		try {
			uri = new URI(postUrl);
			String query = uri.getQuery();
			if(StringUtils.isNotBlank(query)){
				returnVal = uri.getPath() + "?" + query;
			}else {
				returnVal = uri.getPath();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnVal;
	}
    
}