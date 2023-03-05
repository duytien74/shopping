package com.duytien.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
@Table(name="PROMOTION")
public class Promotion implements Serializable{
	@Id
	@Column(name="promotionid")
	String promotionID;
	@Column(name="promotionname")
	String promotionName;
	@Temporal(TemporalType.DATE)
	Date promotiondateofend;
	double discount;
	
	@OneToMany(mappedBy="promotion")
	List<Bill> bill;
}
