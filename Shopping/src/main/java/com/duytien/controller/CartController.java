package com.duytien.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duytien.dao.ProductDAO;
import com.duytien.dao.ShoppingCartDAO;
import com.duytien.model.CartItem;
import com.duytien.model.Product;
import com.duytien.utility.SessionService;

@Controller
@RequestMapping("/shopping/cart")
public class CartController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ShoppingCartDAO cartDAO;
	@Autowired
	SessionService session;
	
	@PostMapping("/add/{productID}")
	public String addItem(@PathVariable("productID") String id,
			@RequestParam("quantity") int quantity,
			RedirectAttributes params) {
		Product pr = productDAO.findById(id).get();
		
		if(pr != null) {
			CartItem cartItem = new CartItem();
			BeanUtils.copyProperties(pr, cartItem);
			cartItem.setQuantity(quantity);
			cartDAO.add(cartItem);
			session.setAttribute("countItem",cartDAO.getCount());
			session.setAttribute("cartItem",cartDAO.getItems());
			params.addAttribute("sussces", "Sản phẩm đã được thêm vào giỏ hàng!");
		}
		return "redirect:/shopping/detail?productid="+id;
		
	}
	
	@RequestMapping("/remove/{productID}")
	public String removeItem(@PathVariable("productID") String id,RedirectAttributes param) {
		cartDAO.remove(id);
		session.setAttribute("countItem",cartDAO.getCount());
		session.setAttribute("cartItem",cartDAO.getItems());
		param.addAttribute("sussces", "Sản phẩm đã xóa khỏi giỏ hàng!");
		return "redirect:/shopping/detail?productid="+id;
	}
}
