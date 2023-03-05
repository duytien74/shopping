package com.duytien.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class BillDetailID implements Serializable{
	@Column(name = "billid")
    private long billId;
    @Column(name = "productid")
    private String productID;
}
