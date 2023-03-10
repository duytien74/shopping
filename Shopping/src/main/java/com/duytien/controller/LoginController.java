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
					param.addAttribute("message","????ng nh???p th??nh c??ng!");
				}else {
					param.addAttribute("message","Sai m???t kh???u!");
				}
				
			}else {
				param.addAttribute("message","T??n ????ng nh???p kh??ng t???n t???i!");
			}
		}else {
			param.addAttribute("message","????ng nh???p th???t b???i!");
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
		param.addAttribute("message","????ng xu???t th??nh c??ng!");
		return "redirect:/shopping/maintop10";
	}
	
	@RequestMapping("/check")
	public String check(RedirectAttributes param,Model model) {
		Staff staff = session.getAttribute("staff");
		Customer customer = session.getAttribute("customer");
		if(staff == null && customer == null) {
			param.addAttribute("message","Vui l??ng ????ng nh???p!");
		}else {
			cartDAO.clear();
			param.addAttribute("message","?????t h??ng th??nh c??ng!");
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
		
		//Ki???m tra tr???ng form
		System.out.println(passnew);
		System.out.println(passcon);
		if(passnew.equals("") || passcon.equals("") || passnow.equals("")) {
			model.addAttribute("openchangepass","show");
			model.addAttribute("notice","Vui l??ng nh???p th??ng tin ?????y ?????!");
			return "forward:/shopping/maintop10";
		}
		
		
		//Ki???m tra m???t kh???u x??c nh???n
		if(!passnew.equals(passcon)) {
			model.addAttribute("openchangepass","show");
			model.addAttribute("notice","M???t kh???u x??c nh???n kh??ng ch??nh x??c!");
			return "forward:/shopping/maintop10";
		}
		
		//?????i m???t kh???u theo t???ng vai tr??
		if(staff != null) {
			if(!passnow.equals(staff.getPass())) {
				model.addAttribute("openchangepass","show");
				model.addAttribute("notice","M???t kh???u hi???n t???i kh??ng ????ng!");
				return "forward:/shopping/maintop10";
			}
			staff.setPass(passnew);
			staffDAO.save(staff);
			session.setAttribute("staff", staff);
		}else {
			if(!passnow.equals(customer.getPass())) {
				model.addAttribute("openchangepass","show");
				model.addAttribute("notice","M???t kh???u hi???n t???i kh??ng ????ng!");
				return "forward:/shopping/maintop10";
			}
			customer.setPass(passnew);
			customerDAO.save(customer);
			session.setAttribute("customer", customer);
		}
		param.addAttribute("message","?????i m???t kh???u th??nh c??ng!");
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
			model.addAttribute("notice","Vui l??ng nh???p email!");
			return "forward:/shopping/maintop10";
		}
		if(staff == null && customer == null) {
			model.addAttribute("openforgot","show");
			model.addAttribute("notice","Email kh??ng t???n t???i!");
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
			mailer.send(email,"X??c th???c ????ng k?? t??i kho???n","M???t kh???u m???i c???a b???n l??: "+resetPassword);
		}catch(MessagingException e) {
			model.addAttribute("notice","G???i mail th???t b???i!");
			model.addAttribute("openforgot","show");
			return "forward:/shopping/maintop10";
		}
		
		param.addAttribute("message","L???y l???i m???t kh???u th??nh c??ng! Vui l??ng ki???m tra mail c???a b???n!");
		return "redirect:/shopping/maintop10";
	}
}
