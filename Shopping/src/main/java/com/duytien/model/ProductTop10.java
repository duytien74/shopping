package com.duytien.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductTop10 {
	@Id
	Serializable group;
	long count;
	double total;
}
