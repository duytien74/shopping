package com.duytien.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duytien.dao.CustomerDAO;
import com.duytien.dao.ProductDAO;
import com.duytien.dao.ShoppingCartDAO;
import com.duytien.dao.StaffDAO;
import com.duytien.model.BASE64DecodedMultipartFile;
import com.duytien.model.Customer;
import com.duytien.utility.CookieService;
import com.duytien.utility.MailerServiceImpl;
import com.duytien.utility.ParamService;
import com.duytien.utility.SessionService;

@Controller
public class RegisterController {
	@Autowired
	StaffDAO staffDAO;
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	ProductDAO productDAO;
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
	MailerServiceImpl mailer;
	
	@PostMapping("/shopping/register")
	public String create(
			@ModelAttribute("cs") Customer cs,
			@RequestParam("image") MultipartFile image,
			Model model
			) {		
		if(!customerDAO.existsById(cs.getCustomerID()) 
				&& !staffDAO.existsById(cs.getCustomerID())) {
			cs.setImages(image.getOriginalFilename());
			Random r = new Random();
		    String randomNumber = String.format("%05d", r.nextInt(100000));
			

		    try {
				mailer.send(cs.getEmail(),"X??c th???c ????ng k?? t??i kho???n","M?? x??c th???c l??: "+randomNumber);
			}catch(MessagingException e) {
				model.addAttribute("regisfail","G???i mail th???t b???i!");
				model.addAttribute("openregister","show");
				return "forward:/shopping/maintop10";
			}
			session.setAttribute("confirmCode",randomNumber);
			try {
				session.setAttribute("imageCustomer",new BASE64DecodedMultipartFile(image.getOriginalFilename(), image.getBytes()));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("registerCustomer", cs);
			model.addAttribute("openconfirm","show");
		}else {			
			model.addAttribute("regisfail","T??n ????ng nh???p ???? t???n t???i");
			model.addAttribute("openregister","show");
		}
		
		return "forward:/shopping/maintop10";

	}
	
	
	@PostMapping("/shopping/confirm")
	public String confirm(Model model,RedirectAttributes param) {
		String userCode = paramService.getString("userCode", null);
		Customer cs = session.getAttribute("registerCustomer");
		MultipartFile image = session.getAttribute("imageCustomer");
		String confirmCode = session.getAttribute("confirmCode");
		System.out.println(image.getSize());
		if(userCode != null) {
			if(confirmCode.equals(userCode)) {	
				customerDAO.save(cs);
				paramService.save(image,"employee");
				session.setAttribute("confirmCode",null);
				session.setAttribute("imageCustomer",null);
				session.setAttribute("registerCustomer",null);
				param.addAttribute("message","????ng k?? th??nh c??ng!");
				return "redirect:/shopping/maintop10";
			}else {
				model.addAttribute("notice","M?? x??c th???c kh??ng ch??nh x??c!");
				model.addAttribute("openconfirm","show");
			}
			
		}else {
			model.addAttribute("notice","Vui l??ng nh???p m?? x??c th???c!");
			model.addAttribute("openconfirm","show");
		}
		
		return "forward:/shopping/maintop10";

	}
	
	@PostMapping("/shopping/disconfirm")
	public String disconfirm(Model model) {
		session.setAttribute("confirmCode",null);
		session.setAttribute("imageCustomer",null);
		session.setAttribute("registerCustomer",null);
		return "redirect:/shopping/maintop10";
	}
	
	@RequestMapping("/test")
	public void test() {
		customerDAO.deleteById("TienDZ");
	}
	
	@ModelAttribute("genders")
	public Map<Boolean,String> getGenders(){
		Map<Boolean,String> map = new HashMap<>();
		map.put(true, "Male");
		map.put(false, "Female");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/mailer/demo")
	public String demo(Model model) {
		try {
			mailer.send("tiennld2002@gmail.com","Xac thuc nhe","Ma xac thuc la 1234");
			return "OK";
		}catch(MessagingException e) {
			return e.getMessage();
		}
	}
}
