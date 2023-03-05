package com.duytien.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name="PRODUCT")
public class Product implements Serializable{
	@Id
	@Column(name="productid")
	String productID;
	@Column(name="productname")
	String productName;
	@ManyToOne @JoinColumn(name="categoryID")
	Category category;
	@ManyToOne @JoinColumn(name="manufacturerID")
	Manufacturer manufacturer;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="dateofstart")
	Date dateStart;
	double price;
	String images;
	
	@OneToMany(mappedBy="product")
	List<BillDetail> billDetail;
}
