//package com.tp.web.vo;
//
//import java.io.Serializable;
//import java.util.List;
//
//import com.tp.entity.trade.OrderConfig;
//import com.tp.mapper.BeanMapper;
//import com.tp.utils.Convert;
//
//public class OrderConfigForm implements Serializable {
//
//	private static final long serialVersionUID = 1L;
//
//	private String id;
//	private String name;
//	private Integer userRestriction;
//	private Integer goodsRestriction;
//	private GoodsForm goods;
//	private String shelf;
//	private Integer balance;
//	private Integer cost;
//	private String beanName;
//	private Integer status;
//	private Integer batchInterval;
//	private Integer batchSize;
//	private String goodsId;
//
//	public Integer getUserRestriction() {
//		return userRestriction;
//	}
//
//	public void setUserRestriction(Integer userRestriction) {
//		this.userRestriction = userRestriction;
//	}
//
//	public Integer getGoodsRestriction() {
//		return goodsRestriction;
//	}
//
//	public void setGoodsRestriction(Integer goodsRestriction) {
//		this.goodsRestriction = goodsRestriction;
//	}
//
//	public String getShelf() {
//		return shelf;
//	}
//
//	public void setShelf(String shelf) {
//		this.shelf = shelf;
//	}
//
//	public Integer getBalance() {
//		return balance;
//	}
//
//	public void setBalance(Integer balance) {
//		this.balance = balance;
//	}
//
//	public Integer getCost() {
//		return cost;
//	}
//
//	public void setCost(Integer cost) {
//		this.cost = cost;
//	}
//
//	public String getBeanName() {
//		return beanName;
//	}
//
//	public void setBeanName(String beanName) {
//		this.beanName = beanName;
//	}
//
//	public Integer getStatus() {
//		return status;
//	}
//
//	public void setStatus(Integer status) {
//		this.status = status;
//	}
//
//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}
//
//	public Integer getBatchInterval() {
//		return batchInterval;
//	}
//
//	public void setBatchInterval(Integer batchInterval) {
//		this.batchInterval = batchInterval;
//	}
//
//	public Integer getBatchSize() {
//		return batchSize;
//	}
//
//	public void setBatchSize(Integer batchSize) {
//		this.batchSize = batchSize;
//	}
//
//	public static List<OrderConfigForm> convertFrom(
//			List<OrderConfig> orderConfiges) {
//		return BeanMapper.mapList(orderConfiges,
//				new Convert<OrderConfigForm>() {
//
//					@Override
//					public void convert(Object source,
//							OrderConfigForm destinationObject) {
//						OrderConfig orderConfig = (OrderConfig) source;
//						if (orderConfig.getGoods() != null) {
//							destinationObject.setGoods(GoodsForm.convertFrom(orderConfig.getGoods()));
//							destinationObject.setGoodsId(orderConfig.getGoods().getId());
//						}
//					}
//				});
//	}
//
//	public static OrderConfigForm convertFrom(OrderConfig orderConfig) {
//		if (orderConfig == null) {
//			return null;
//		}
//		OrderConfigForm form = BeanMapper.map(orderConfig,
//				OrderConfigForm.class);
//		if (orderConfig.getGoods() != null) {
//			form.setGoods(GoodsForm.convertFrom(orderConfig.getGoods()));
//			form.setGoodsId(orderConfig.getGoods().getId());
//		}
//		return form;
//	}
//
//	public GoodsForm getGoods() {
//		return goods;
//	}
//
//	public void setGoods(GoodsForm goods) {
//		if (goods != null) {
//			this.goods = goods;
//		}
//	}
//
//	public String getName() {
//		return name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//	public String getGoodsId() {
//		return goodsId;
//	}
//
//	public void setGoodsId(String goodsId) {
//		this.goodsId = goodsId;
//	}
//
//}
