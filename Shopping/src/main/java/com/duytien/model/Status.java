package com.duytien.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="STATUSBILL")
public class Status implements Serializable{
	@Id
	@Column(name="statusid")
	int statusID;
	@Column(name="statusname")
	String statusName;
	
	@OneToMany(mappedBy="status")
	List<Bill> bill;
}
