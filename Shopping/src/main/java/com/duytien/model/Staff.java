package com.duytien.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name="STAFF")
public class Staff implements Serializable{
	@Id
	@Column(name="staffid")
	String staffID;
	String	pass;
	@Column(name="staffname")
	String staffName;
	boolean gender = false;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date dateofbirth;
	String phone;
	String email;
	String addresss;
	
	@Column(name="isadmin")
	boolean isadmin= false;
	String images;
	
	@OneToMany(mappedBy="staff")
	List<Bill> bill;
}
