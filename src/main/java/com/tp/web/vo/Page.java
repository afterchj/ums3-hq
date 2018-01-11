package com.tp.web.vo;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.apache.commons.lang3.builder.ToStringBuilder;

import com.google.common.collect.Lists;

public class Page {
	private Integer pageNo;
	private Integer pageSize = 50;
	private Long totalRecords;
	private Integer totalPages;
	private Integer totalSliders = 10;
	
	private String orderKey;
	private String orderValue;
	
	public void init(Long totalRecords){
		totalPages =  (int) (totalRecords % pageSize == 0 ? totalRecords / pageSize : totalRecords / pageSize + 1);
		if (pageNo == null || pageNo <= 0) {
			pageNo = 1;
		}
		if (pageNo > totalPages) {
			pageNo = totalPages;
		}
		this.totalRecords = totalRecords;
	}

	public void init(Long totalRecords, Integer pageSize) {
		this.pageSize = pageSize;
		init(totalRecords);
	}

	public void setPageNo(String pageNo) {

		if (StringUtils.isBlank(pageNo)) {
			this.pageNo = 1;
		} else {
			try {
				this.pageNo = Integer.valueOf(pageNo);
			} catch (NumberFormatException e) {
				this.pageNo = 1;
			}
		}

	}

	public Integer getStartRow() {
		if(pageNo == null || pageSize == null){
			return null;
		}
		return (pageNo - 1) * pageSize;
	}

	/**
	 * 是否还有下一页.
	 */
	public boolean hasNextPage() {
		return (getPageNum() + 1 <= Long.valueOf(totalPages));
	}

	/**
	 * 是否最后一页.
	 */
	public boolean isLastPage() {
		return !hasNextPage();
	}

	/**
	 * 取得下页的页号, 序号从1开始. 当前页为尾页时仍返回尾页序号.
	 */
	public Integer getNextPage() {
		if (hasNextPage()) {
			return getPageNum() + 1;
		} else {
			return getPageNum();
		}
	}

	public Integer getPageNum() {
		return getPageNum();
	}

	public Integer getNext() {
		return getPageNum() + 1;
	}

	/**
	 * 是否还有上一页.
	 */
	public boolean hasPrePage() {
		return (getPageNum() > 1);
	}

	/**
	 * 是否第一页.
	 */
	public boolean isFirstPage() {
		return !hasPrePage();
	}

	/**
	 * 取得上页的页号, 序号从1开始. 当前页为首页时返回首页序号.
	 */
	public Integer getPrePage() {
		if (hasPrePage()) {
			return getPageNum() - 1;
		} else {
			return getPageNum();
		}
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Long getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(Long totalRecords) {
		this.totalRecords = totalRecords;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public Integer getTotalSliders() {
		return totalSliders;
	}

	public void setTotalSliders(Integer totalSliders) {
		this.totalSliders = totalSliders;
	}
	
	/**
	 * 是否已设置排序字段,无默认值.
	 */
	public boolean isOrderBySetted() {
		return (StringUtils.isNotBlank(orderKey) && StringUtils.isNotBlank(orderValue));
	}

	public String getOrderKey() {
		return orderKey;
	}

	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}

	public String getOrderValue() {
		return orderValue;
	}

	/**
	 * 设置排序方式向.
	 * 
	 * @param orderValue 可选值为desc或asc,多个排序字段时用','分隔.
	 */
	public void setOrderValue(final String orderValue) {
		String lowcaseOrderDir = StringUtils.lowerCase(orderValue);

		//检查order字符串的合法值
		String[] orderDirs = StringUtils.split(lowcaseOrderDir, ',');
		for (String orderDirStr : orderDirs) {
			if (!StringUtils.equals(Sort.DESC, orderDirStr) && !StringUtils.equals(Sort.ASC, orderDirStr)) {
				throw new IllegalArgumentException("排序方向" + orderDirStr + "不是合法值");
			}
		}

		this.orderValue = lowcaseOrderDir;
	}

	/**
	 * 获得排序参数.
	 */
	public List<Sort> getSort() {
		String[] orderBys = StringUtils.split(orderKey, ',');
		String[] orderDirs = StringUtils.split(orderValue, ',');
		Validate.isTrue(orderBys.length == orderDirs.length, "分页多重排序参数中,排序字段与排序方向的个数不相等");

		List<Sort> orders = Lists.newArrayList();
		for (int i = 0; i < orderBys.length; i++) {
			orders.add(new Sort(orderBys[i], orderDirs[i]));
		}

		return orders;
	}
	
	public static class Sort {
		public static final String ASC = "asc";
		public static final String DESC = "desc";

		private final String key;
		private final String value;

		public Sort(String key, String value) {
			this.key = key;
			this.value = value;
		}

		public String getKey() {
			return key;
		}

		public String getValue() {
			return value;
		}
	}

	
	@Override
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
