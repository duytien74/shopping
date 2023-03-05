package com.duytien.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duytien.dao.CategoryDAO;
import com.duytien.dao.ManufacturerDAO;
import com.duytien.dao.ProductDAO;
import com.duytien.model.Product;

@Controller
@RequestMapping("/shopping")
public class CategoryController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ManufacturerDAO manufacturerDAO;
	
	@RequestMapping("/category/{id}")
	@GetMapping
	public String category(Model model,@PathVariable("id") int id,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0),9);
		Page<Product> page = productDAO.findByCategory(id,pageable);
		
		model.addAttribute("itemCategory",page.getContent());
		model.addAttribute("page",page);
		model.addAttribute("urlPaging","category/"+id);
		model.addAttribute("categoryTitle", "Phân loại / " + categoryDAO.findById(id).get().getCategoryName());
		model.addAttribute("views","all-list.jsp");
		
		return "forward:/shopping/main";
	}
	
	@RequestMapping("/manufacturer/{id}")
	public String manufacturer(Model model,@PathVariable("id") int id,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0),9);
		Page<Product> page = productDAO.findByManufacturer(id,pageable);
		model.addAttribute("itemCategory",page.getContent());
		model.addAttribute("page",page);
		model.addAttribute("urlPaging","manufacturer/"+id);
		model.addAttribute("categoryTitle", "Hãng sản xuất / "+manufacturerDAO.findById(id).get().getManufacturerName());
		model.addAttribute("views","all-list.jsp");
		return "forward:/shopping/main";
	}
	
	@RequestMapping("/all")
	public String all(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0),9);
		Page<Product> page = productDAO.findAll(pageable);
		model.addAttribute("itemCategory",page.getContent());
		model.addAttribute("page",page);
		model.addAttribute("urlPaging","all");
		model.addAttribute("categoryTitle","Tất cả");
		model.addAttribute("views","all-list.jsp");
		return "forward:/shopping/main";
	}

}
