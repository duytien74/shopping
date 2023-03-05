package com.duytien.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duytien.dao.CustomerDAO;
import com.duytien.dao.ProductDAO;
import com.duytien.dao.ShoppingCartDAO;
import com.duytien.dao.StaffDAO;
import com.duytien.model.Customer;
import com.duytien.model.Staff;
import com.duytien.utility.CookieService;
import com.duytien.utility.ParamService;
import com.duytien.utility.SessionService;

@Controller
@RequestMapping("/shopping")
public class ProfileController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	StaffDAO staffDAO;
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	ShoppingCartDAO cartDAO;
	@Autowired
	SessionService session;
	@Autowired
	CookieService cookie;
	@Autowired
	ParamService paramService;
	
	@PostMapping("/update-staff")
	public String updatestaff(@ModelAttribute("pfStaff") Staff pfStaff,
			@RequestParam("image") MultipartFile image,
			RedirectAttributes param) {
		Staff preStaff = staffDAO.findById(pfStaff.getStaffID()).get();
		
		
		pfStaff.setPass(preStaff.getPass());
		pfStaff.setIsadmin(preStaff.isIsadmin());
		if(image.isEmpty()) {
			pfStaff.setImages(preStaff.getImages());
		}else {
			pfStaff.setImages(image.getOriginalFilename());
		}
		BeanUtils.copyProperties(pfStaff, preStaff);
		
		paramService.save(image,"employee");
		staffDAO.save(preStaff);
		session.setAttribute("staff", preStaff);
		param.addAttribute("message","Chỉnh sửa thông tin thành công!");
		return "redirect:/shopping/maintop10";
	}
	
	@PostMapping("/update-customer")
	public String updatecustomer(@ModelAttribute("pfCustomer") Customer pfCustomer,
			@RequestParam("image") MultipartFile image,
			RedirectAttributes param) {
		Customer preCustomer = customerDAO.findById(pfCustomer.getCustomerID()).get();
		
		pfCustomer.setPass(preCustomer.getPass());
		if(image.isEmpty()) {
			pfCustomer.setImages(preCustomer.getImages());
			System.out.println(preCustomer.getImages());
		}else {
			pfCustomer.setImages(image.getOriginalFilename());
		}
		BeanUtils.copyProperties(pfCustomer, preCustomer);
		paramService.save(image,"employee");
		customerDAO.save(preCustomer);
		session.setAttribute("customer", preCustomer);
		param.addAttribute("message","Chỉnh sửa thông tin thành công!");
		return "redirect:/shopping/maintop10";
	}

}
