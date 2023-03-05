package com.duytien.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.duytien.model.BillDetail;
import com.duytien.model.BillDetailID;

public interface BillDetailDAO extends JpaRepository<BillDetail, BillDetailID>{
	
	@Query("SELECT o from BillDetail o where o.bill.billID = ?1")
	List<BillDetail> findByBill(long billID);
	
	@Transactional
	@Modifying
	@Query("DELETE FROM BillDetail o where o.bill.billID = ?1 ")
	void deleteByBillID(long billID);
}
