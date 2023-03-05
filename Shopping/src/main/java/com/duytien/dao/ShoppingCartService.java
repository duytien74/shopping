package com.duytien.dao;

import java.util.Collection;
import java.util.List;

import com.duytien.model.CartItem;

public interface ShoppingCartService {
	Collection<CartItem> getItems();
	void add(CartItem item);
	void remove(String itemID);
	void update(String itemID,int quantity);
	void clear();
	int getCount();
	double getAmount();
}
