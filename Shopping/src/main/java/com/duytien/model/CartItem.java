package com.duytien.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
	String productID;
	String productName;
	int quantity;
	double price;
	String images;
	
}
