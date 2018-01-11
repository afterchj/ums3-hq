package com.tp.web.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class AppAdForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String dtype;
	private Integer offset;
	private ThemeFileForm file;
	private Date createDate;
	private Integer status;

	@NotBlank(message = "dtype 不能够为空.")
	public String getDtype() {
		return dtype;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}

	@NotNull(message = "offset不能够为空.")
	@Min(value = 1, message = "offset必须为整数")
	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	@NotNull(message = "必须指定内容广告文件.")
	public ThemeFileForm getFile() {
		return file;
	}

	public void setFile(ThemeFileForm file) {
		this.file = file;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
