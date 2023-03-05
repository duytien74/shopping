package com.duytien.dao;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.duytien.model.Staff;

public interface StaffDAO extends JpaRepository<Staff,String>{
	@Query("SELECT o FROM Staff o WHERE o.email = ?1")
	Staff findByEmail(String email);
}
