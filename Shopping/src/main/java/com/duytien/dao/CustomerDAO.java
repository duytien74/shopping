package com.duytien.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duytien.model.Customer;
import com.duytien.model.Product;

public interface CustomerDAO extends JpaRepository<Customer,String>{
	@Query("SELECT o FROM Customer o WHERE o.email = ?1")
	Customer findByEmail(String email);
}
