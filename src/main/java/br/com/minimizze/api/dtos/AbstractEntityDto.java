package br.com.minimizze.api.dtos;

import java.util.Date;

public abstract class AbstractEntityDto {

	public abstract Long getId();
	
	private Date created_at;

	private Date updated_at;

	public void setLastUpdate() {
		this.updated_at = new Date();
	}

	public Date getCreated_at() {
		return created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

}
