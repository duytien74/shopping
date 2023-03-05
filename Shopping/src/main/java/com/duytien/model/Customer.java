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

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name="CUSTOMER")
public class Customer implements Serializable{
	@Id
	@Column(name="customerid")
	String customerID;
	String	pass;
	@Column(name="customername")
	String customerName;
	boolean gender = false;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date dateofbirth;
	String phone;
	String email;
	String addresss;
	String images;
	
	@OneToMany(mappedBy="customer")
	List<Bill> bill;
}
