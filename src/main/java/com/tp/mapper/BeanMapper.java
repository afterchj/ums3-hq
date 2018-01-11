package com.tp.mapper;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.dozer.DozerBeanMapper;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.tp.utils.Convert;
import com.tp.utils.Reflections;

/**
 * 简单封装Dozer, 实现深度转换Bean<->Bean的Mapper.实现:
 *  
 * 1. 持有Mapper的单例. 
 * 2. 返回值类型转换.
 * 3. 批量转换Collection中的所有对象.
 * 4. 区分创建新的B对象与将对象A值复制到已存在的B对象两种函数.
 * 
 */
public class BeanMapper {

	/**
	 * 持有Dozer单例, 避免重复创建DozerMapper消耗资源.
	 */
	private static DozerBeanMapper dozer = new DozerBeanMapper();

	/**
	 * 基于Dozer转换对象的类型.
	 */
	public static <T> T map(Object source, Class<T> destinationClass) {
		if(source == null){
			return null;
		}
		return dozer.map(source, destinationClass);
	}

	/**
	 * 基于Dozer转换Collection中对象的类型.
	 */
	public static <T> List<T> mapList(Collection sourceList, Class<T> destinationClass) {
		if(sourceList == null){
			return null;
		}
		List<T> destinationList = Lists.newArrayListWithCapacity(sourceList.size());
		for (Object sourceObject : sourceList) {
			T destinationObject = dozer.map(sourceObject, destinationClass);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}
	
	/**
	 * 基于Dozer转换Collection中对象的类型.
	 */
	public static <T> Set<T> mapSet(Collection sourceList, Class<T> destinationClass) {
		if(sourceList == null){
			return null;
		}
		Set<T> destinationList = Sets.newHashSetWithExpectedSize(sourceList.size());
		for (Object sourceObject : sourceList) {
			T destinationObject = dozer.map(sourceObject, destinationClass);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}
	
	/**
	 * 自定义 转换Collection中对象的类型.
	 */
	public static <T> List<T> mapList(Collection sourceList, Convert<T> convert) {
		List<T> destinationList = Lists.newArrayList();
		if(CollectionUtils.isNotEmpty(sourceList)){
			for (Object sourceObject : sourceList) {
				T destinationObject = map(sourceObject, convert.getClazz());
				convert.convert(sourceObject, destinationObject);
				destinationList.add(destinationObject);
			}
		}
		return destinationList;
	}
	
	public static <T> T mapJson (JSONObject json, Class<T> destinationClass) throws InstantiationException, IllegalAccessException{
		if(MapUtils.isEmpty(json)){
			return null;
		}
		T target = destinationClass.newInstance();
		for(String key : json.keySet()){
			if(Reflections.getAccessibleField(target, key) != null){
				Reflections.setFieldValue(target, key, json.get(key));
			}
		}
		return target;
	}
	
	public static <T> T mapJson (String json, Class<T> destinationClass) throws InstantiationException, IllegalAccessException{
		JSONObject jsonObject = JSONObject.parseObject(json);
		return mapJson(jsonObject, destinationClass);
	}
	
	public static <T> Set<T> mapSet(Collection sourceList, Convert<T> convert) {
		Set<T> destinationList = Sets.newHashSet();
		for (Object sourceObject : sourceList) {
			T destinationObject = map(sourceObject, convert.getClazz());
			convert.convert(sourceObject, destinationObject);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}
	


	/**
	 * 基于Dozer将对象A的值拷贝到对象B中.
	 */
	public static void copy(Object source, Object destinationObject) {
		dozer.map(source, destinationObject);
	}
}