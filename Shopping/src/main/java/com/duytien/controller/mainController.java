package com.duytien.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duytien.dao.CategoryDAO;
import com.duytien.dao.CustomerDAO;
import com.duytien.dao.ManufacturerDAO;
import com.duytien.dao.ProductDAO;
import com.duytien.dao.ShoppingCartDAO;
import com.duytien.dao.StaffDAO;
import com.duytien.model.Category;
import com.duytien.model.Customer;
import com.duytien.model.Manufacturer;
import com.duytien.model.Product;
import com.duytien.model.Staff;
import com.duytien.utility.CookieService;
import com.duytien.utility.ParamService;
import com.duytien.utility.SessionService;

@Controller
@RequestMapping("/shopping")
public class mainController {
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
	HttpServletRequest request;
	@Autowired
	ParamService paramService;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ManufacturerDAO manufacturerDAO;
	
	
	@RequestMapping("/main")
	public String main(Model model,
			@ModelAttribute("genders") Map<Boolean,String> gender,
			@ModelAttribute("roles") Map<Boolean,String> role,
			@ModelAttribute("categorys") List<Category> category,
			@ModelAttribute("manufacturers") List<Manufacturer> manufacturer
			) {
		
		
		session.setAttribute("countItem",cartDAO.getCount());
		session.setAttribute("cartItem",cartDAO.getItems());
		session.setAttribute("totalItem",cartDAO.getAmount());
		session.setAttribute("staff", session.getAttribute("staff"));
		session.setAttribute("customer", session.getAttribute("customer"));
		
		if(cartDAO.getCount() == 0) {
			session.setAttribute("promotionCode", null);
		}
		
		//Menu main
		model.addAttribute("categoryMenu",categoryDAO.findAll());
		model.addAttribute("manufacturerMenu",manufacturerDAO.findAll());
		
		// Form dang ky
		model.addAttribute("cs", new Customer());
		model.addAttribute("gender", gender);

		// Form login
		model.addAttribute("username", cookie.getValue("username"));
		model.addAttribute("password", cookie.getValue("password"));
		
		
		//Form profile
		Staff staff = session.getAttribute("staff");
		Customer customer = session.getAttribute("customer");
		if(staff == null && customer == null) {
			model.addAttribute("pfStaff",new Staff());
			model.addAttribute("pfCustomer",new Customer());
		}else {
			if(staff != null) {
				model.addAttribute("pfStaff",staff);
				model.addAttribute("pfCustomer",new Customer());
			}else {
				model.addAttribute("pfStaff",new Staff());
				model.addAttribute("pfCustomer",customer);
			}
		}
		
		String mncs = paramService.getString("mncs", "");
		if(mncs.equals("")) {
			model.addAttribute("mnCustomer",new Customer());
		}
		
		String mnst = paramService.getString("mnst", "");
		if(mnst.equals("")) {
			model.addAttribute("mnStaff",new Staff());
		}
		
		String mnit = paramService.getString("mnit", "");
		if(mnit.equals("")) {
			model.addAttribute("mnProduct",new Product());
		}
		model.addAttribute("role", role);
		model.addAttribute("category",category);
		model.addAttribute("manufacturer",manufacturer);
		return "main";
	}
	
	
	@RequestMapping("/maintop10")
	public String top10(Model model,RedirectAttributes param) {
		Pageable pageable = PageRequest.of(0,10);
		model.addAttribute("item",productDAO.findByTop10(pageable).getContent());
		if(param.getAttribute("message") != null) {
			model.addAttribute("notice",param.getAttribute("message"));
		}	
		model.addAttribute("views","top10-list.jsp");
		return "forward:/shopping/main";
	}
	
	
	
	@ModelAttribute("genders")
	public Map<Boolean,String> getGenders(){
		Map<Boolean,String> map = new HashMap<>();
		map.put(true, "Male");
		map.put(false, "Female");
		return map;
	}
	
	@ModelAttribute("roles")
	public Map<Boolean,String> getRoles(){
		Map<Boolean,String> map = new HashMap<>();
		map.put(true, "Quản trị viên");
		map.put(false, "Nhân viên");
		return map;
	}
	
	@ModelAttribute("categorys")
	public List<Category> getCategorys(){
		return categoryDAO.findAll();
	}
	
	@ModelAttribute("manufacturers")
	public List<Manufacturer> getManufacturers(){
		return manufacturerDAO.findAll();
	}
	
	
	@GetMapping("/detail")
	public String detail(@RequestParam("productid") String productID,
			Model model) {
		Product product = productDAO.findById(productID).get();
		Pageable pageable = PageRequest.of(0, 10);
		List<Product> list = productDAO.findByCategory(product.getCategory().getCategoryID(),pageable).getContent();
		model.addAttribute("sameProduct",list);
		model.addAttribute("product",product);				
		model.addAttribute("views","detail-item.jsp");
		return "forward:/shopping/main";
	}
	
	
	
	
	

}
