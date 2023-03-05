package com.duytien.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name="BILLDETAIL")
public class BillDetail implements Serializable{
	@EmbeddedId
    private BillDetailID id;
	
	@ManyToOne @JoinColumn(name="billID", referencedColumnName = "billID", insertable=false, updatable=false)
	Bill bill;

	@ManyToOne @JoinColumn(name="productID",referencedColumnName = "productID", insertable=false, updatable=false)
	Product product;
	int quantity;
	double price;
	double totalprice;
}
