package com.tp.mapper;

import java.util.Date;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import com.tp.utils.Reflections;

/**
 * 简单封装Apache BeanUtils的ConvertUtils, 实现String<->Java Object的工具类.
 * 
 * 可转换的类型包括各种Primitives和Date。
 */
public class StringMapper {

	public static String DEFAULT_DATE_FORMAT = "yyyy-MM-dd";
	public static String DEFAULT_DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

	/**
	 * String->Object.
	 * 
	 * @param value 待转换的字符串.
	 * @param toType 转换目标类型.
	 */
	public static Object fromString(String value, Class<?> toType) {
		try {
			return ConvertUtils.convert(value, toType);
		} catch (Exception e) {
			throw Reflections.convertReflectionExceptionToUnchecked(e);
		}
	}
	
	public static void main(String[] args) {
		Long num = (Long) fromString("123", Long.class);
		Date date = (Date) fromString("2013-12-21 11:20:25", Date.class);
		System.out.println(num);
		System.out.println(date);
	}

	/**
	 * Object -> String.
	 */
	public static String toString(Object object) {
		try {
			return ConvertUtils.convert(object);
		} catch (Exception e) {
			throw Reflections.convertReflectionExceptionToUnchecked(e);
		}
	}

	/**
	 * 定义Apache BeanUtils日期Converter的格式,可注册多个格式,以','分隔
	 */
	public static void registerDateConverter(String... patterns) {
		DateConverter dc = new DateConverter();
		dc.setUseLocaleFormat(true);
		dc.setPatterns(patterns);
		ConvertUtils.register(dc, Date.class);
	}

	static {
		//初始化日期格式为yyyy-MM-dd 或 yyyy-MM-dd HH:mm:ss
		StringMapper.registerDateConverter(DEFAULT_DATE_FORMAT, DEFAULT_DATETIME_FORMAT);
	}

}
