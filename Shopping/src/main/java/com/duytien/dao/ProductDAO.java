package com.duytien.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.duytien.model.Product;
import com.duytien.model.ProductTop10;



public interface ProductDAO extends JpaRepository<Product, String>  {
	@Query("SELECT o FROM Product o WHERE o.category.categoryID = ?1")
	List<Product> findByCategory(int category);
	
	@Query("SELECT o FROM Product o WHERE o.category.categoryID = ?1")
	Page<Product> findByCategory(int category,Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.manufacturer.manufacturerID = ?1")
	Page<Product> findByManufacturer(int manufacturer,Pageable pageable);
	
	@Query("SELECT new ProductTop10(p.product,sum(p.quantity),sum(p.quantity * p.product.price))"+
			" FROM BillDetail p" +
			" GROUP BY p.product"+
			" ORDER BY sum(p.quantity) desc")
	Page<ProductTop10> findByTop10(Pageable pageable);
	
	@Query("SELECT sum(o.totalPrice) from Bill o")
	double findTotal();
}
