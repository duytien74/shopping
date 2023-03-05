package com.duytien.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duytien.model.Bill;

public interface BillDAO extends JpaRepository<Bill, Long>{
	@Query("SELECT o from Bill o where o.customer.customerID = ?1")
	Page<Bill> findByCustomer(String customerID,Pageable pageable);
}
