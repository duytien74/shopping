package com.duytien.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.duytien.model.Category;

public interface CategoryDAO extends JpaRepository<Category,Integer>{

}
