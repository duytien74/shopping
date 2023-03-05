package com.duytien.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duytien.dao.CustomerDAO;
import com.duytien.dao.ProductDAO;
import com.duytien.dao.ShoppingCartDAO;
import com.duytien.dao.StaffDAO;
import com.duytien.model.Customer;
import com.duytien.model.Staff;
import com.duytien.utility.CookieService;
import com.duytien.utility.MailerServiceImpl;
import com.duytien.utility.ParamService;
import com.duytien.utility.SessionService;

@Controller
@RequestMapping("/shopping")
public class LoginController {
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
	@Autowired
	MailerServiceImpl mailer;
	
	@PostMapping("/login")
	public String login(RedirectAttributes param
			) {

		String username = paramService.getString("username", null);
		String password = paramService.getString("password", null);
		String remember = paramService.getString("remember", null);
		Staff staff= staffDAO.findById(username).orElse(null);
		Customer customer= customerDAO.findById(username).orElse(null);

		System.out.println(username);
		if(username != null && password != null) {
			if(staff != null || customer != null) {
				String checkpass = staff != null ? staff.getPass() : customer.getPass();
				if(checkpass.equals(password)) {
					int hours =0;
					if(remember == null) {
						cookie.remove("username");
						cookie.remove("password");
					}else {
						hours =10*24;
						cookie.add("username", username, hours);
						cookie.add("password", password, hours);

					}
					session.setAttribute("staff", staff);
					session.setAttribute("customer", customer);
					param.addAttribute("message","Đăng nhập thành công!");
				}else {
					param.addAttribute("message","Sai mật khẩu!");
				}
				
			}else {
				param.addAttribute("message","Tên đăng nhập không tồn tại!");
			}
		}else {
			param.addAttribute("message","Đăng nhập thất bại!");
		}
		
		if(staff != null){
			return "redirect:/shopping/history-bill-staff";
		}
		return "redirect:/shopping/maintop10";
	}
	
	@RequestMapping("/logout")
	public String logout(RedirectAttributes param) {
		session.removeAttribute("staff");
		session.removeAttribute("customer");
		cartDAO.clear();
		param.addAttribute("message","Đăng xuất thành công!");
		return "redirect:/shopping/maintop10";
	}
	
	@RequestMapping("/check")
	public String check(RedirectAttributes param,Model model) {
		Staff staff = session.getAttribute("staff");
		Customer customer = session.getAttribute("customer");
		if(staff == null && customer == null) {
			param.addAttribute("message","Vui lòng đăng nhập!");
		}else {
			cartDAO.clear();
			param.addAttribute("message","Đặt hàng thành công!");
		}
		return "redirect:/shopping/maintop10";
	}
	
	
	@PostMapping("/change-password")
	public String change(Model model,RedirectAttributes param) {
		Staff staff = session.getAttribute("staff");
		Customer customer = session.getAttribute("customer");
		String passnow = paramService.getString("passnow", null);
		String passnew = paramService.getString("passnew", null);
		String passcon = paramService.getString("passcon", null);
		
		//Kiểm tra trống form
		System.out.println(passnew);
		System.out.println(passcon);
		if(passnew.equals("") || passcon.equals("") || passnow.equals("")) {
			model.addAttribute("openchangepass","show");
			model.addAttribute("notice","Vui lòng nhập thông tin đầy đủ!");
			return "forward:/shopping/maintop10";
		}
		
		
		//Kiểm tra mật khẩu xác nhận
		if(!passnew.equals(passcon)) {
			model.addAttribute("openchangepass","show");
			model.addAttribute("notice","Mật khẩu xác nhận không chính xác!");
			return "forward:/shopping/maintop10";
		}
		
		//Đổi mật khẩu theo từng vai trò
		if(staff != null) {
			if(!passnow.equals(staff.getPass())) {
				model.addAttribute("openchangepass","show");
				model.addAttribute("notice","Mật khẩu hiện tại không đúng!");
				return "forward:/shopping/maintop10";
			}
			staff.setPass(passnew);
			staffDAO.save(staff);
			session.setAttribute("staff", staff);
		}else {
			if(!passnow.equals(customer.getPass())) {
				model.addAttribute("openchangepass","show");
				model.addAttribute("notice","Mật khẩu hiện tại không đúng!");
				return "forward:/shopping/maintop10";
			}
			customer.setPass(passnew);
			customerDAO.save(customer);
			session.setAttribute("customer", customer);
		}
		param.addAttribute("message","Đổi mật khẩu thành công!");
		return "redirect:/shopping/maintop10";
	}
	
	@PostMapping("/forgot-password")
	public String forgot(Model model,RedirectAttributes param) {
		String email = paramService.getString("email", null);
		Staff staff = staffDAO.findByEmail(email);
		Customer customer = customerDAO.findByEmail(email);
		String resetPassword = "hightechshop123";
		if(email.equals("")) {
			model.addAttribute("openforgot","show");
			model.addAttribute("notice","Vui lòng nhập email!");
			return "forward:/shopping/maintop10";
		}
		if(staff == null && customer == null) {
			model.addAttribute("openforgot","show");
			model.addAttribute("notice","Email không tồn tại!");
			return "forward:/shopping/maintop10";
		}
		
		if(staff != null) {
			staff.setPass(resetPassword);
			staffDAO.save(staff);
		}else {
			customer.setPass(resetPassword);
			customerDAO.save(customer);
		}
		
		try {
			mailer.send(email,"Xác thực đăng ký tài khoản","Mật khẩu mới của bạn là: "+resetPassword);
		}catch(MessagingException e) {
			model.addAttribute("notice","Gửi mail thất bại!");
			model.addAttribute("openforgot","show");
			return "forward:/shopping/maintop10";
		}
		
		param.addAttribute("message","Lấy lại mật khẩu thành công! Vui lòng kiểm tra mail của bạn!");
		return "redirect:/shopping/maintop10";
	}
}
