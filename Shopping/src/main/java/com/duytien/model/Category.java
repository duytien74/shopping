package com.duytien.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="CATEGORY")
public class Category implements Serializable{
	@Id
	int categoryID;
	@Column(name="categoryname")
	String categoryName;
	@OneToMany(mappedBy="category")
	List<Product> product;
}	
