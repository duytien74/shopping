package com.duytien.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name="BILL")
public class Bill implements Serializable{
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="billid")
	long billID ;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date billdate = new Date();
	@Column(name="totalprice")
	double totalPrice;
	@ManyToOne @JoinColumn(name="customerID")
	Customer customer;
	@ManyToOne @JoinColumn(name="staffID")
	Staff staff;
	@ManyToOne @JoinColumn(name="promotionID")
	Promotion promotion;
	@ManyToOne @JoinColumn(name="statusID")
	Status status;

	@OneToMany(mappedBy="bill")
	List<BillDetail> billDetail;
}
