package com.tp.entity;

import javax.persistence.*;

@MappedSuperclass
public class LongIDEntity {

	protected Long id;
	private boolean delete = false;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="is_delete", nullable=false, length=1)
	public boolean isDelete() {
		return delete;
	}

	public void setDelete(boolean delete) {
		this.delete = delete;
	}
}
