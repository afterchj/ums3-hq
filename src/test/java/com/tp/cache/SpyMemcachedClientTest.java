//package com.tp.cache;
//
//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertNull;
//
//import java.util.Map;
//
//import org.junit.Test;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//
//import com.cache.XMemcachedClient;
//import com.google.common.collect.Lists;
//import com.tp.spring.SpringContextTestCase;
//import com.tp.utils.Threads;
//
//@ContextConfiguration(locations = { "/applicationContext-test-memcached.xml" })
//public class SpyMemcachedClientTest extends SpringContextTestCase {
//
//	protected Logger logger = LoggerFactory.getLogger(getClass());
//
//	@Autowired
//	private XMemcachedClient client;
//
//	@Test
//	public void normal() {
//
//		String key = "consumer:1";
//		String value = "admin";
//
//		String key2 = "consumer:2";
//		String value2 = "user";
//
//		//get/set
//		client.set(key, 60 * 60 * 1, value);
//		Threads.sleep(1000);
//		String result = client.get(key);
//		assertEquals(value, result);
//
//		//safeSet
//		client.set(key2, 60 * 60 * 1, value2);
//		result = client.get(key2);
//		assertEquals(value2, result);
//
//		//bulk
//		Map<String, Object> bulkResult = client.getBulk(Lists.newArrayList(key, key2));
//		assertEquals(2, bulkResult.size());
//		assertEquals(value, bulkResult.get(key));
//
//		//delete
//		client.delete(key);
//		Threads.sleep(1000);
//		result = client.get(key);
//		assertNull(result);
//
//		client.delete(key);
//		result = client.get(key);
//		assertNull(result);
//	}
//
//	@Test
//	public void incr() {
//		String key = "counter";
//
//		assertEquals(1, client.incr(key, 1, 1));
//		//注意counter的实际类型是String
//		assertEquals("1", client.get(key));
//
//		assertEquals(2, client.incr(key, 1, 1));
//		assertEquals("2", client.get(key));
//
//		assertEquals(0, client.decr(key, 2, 1));
//		assertEquals("0", client.get(key));
//
//	}
//}
