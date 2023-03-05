package com.duytien.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.duytien.model.CartItem;
import com.duytien.model.Product;

@SessionScope
@Service
public class ShoppingCartDAO implements ShoppingCartService{
	Map<String,CartItem> map = new HashMap<>();

	@Override
	public Collection<CartItem> getItems() {	
		return map.values();
	}

	@Override
	public void add(CartItem item) {
		CartItem oldItem = map.get(item.getProductID());
		if( oldItem != null) {
			oldItem.setQuantity(oldItem.getQuantity() + item.getQuantity());
			map.put(oldItem.getProductID(), oldItem);
		}else {
			map.put(item.getProductID(), item);
		}
		
	}

	@Override
	public void remove(String itemID) {
		map.remove(itemID);
		
	}

	@Override
	public void update(String itemID, int quantity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void clear() {
		map.clear();
		
	}

	@Override
	public int getCount() {
		return map.size();
	}

	@Override
	public double getAmount() {
		// TODO Auto-generated method stub
		return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
	}
	
	
}
