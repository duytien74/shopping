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
@Table(name="MANUFACTURER")
public class Manufacturer implements Serializable{
	@Id
	int manufacturerID;
	@Column(name="manufacturername")
	String manufacturerName;
	
	@OneToMany(mappedBy="manufacturer")
	List<Product> product;
}
