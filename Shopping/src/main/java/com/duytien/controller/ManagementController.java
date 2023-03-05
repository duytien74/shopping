package com.duytien.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duytien.dao.BillDAO;
import com.duytien.dao.BillDetailDAO;
import com.duytien.dao.CustomerDAO;
import com.duytien.dao.ProductDAO;
import com.duytien.dao.PromotionDAO;
import com.duytien.dao.ShoppingCartDAO;
import com.duytien.dao.StaffDAO;
import com.duytien.dao.StatusDAO;
import com.duytien.model.Customer;
import com.duytien.model.Product;
import com.duytien.model.Staff;
import com.duytien.utility.ParamService;
import com.duytien.utility.SessionService;

@Controller
@RequestMapping("/shopping")
public class ManagementController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ShoppingCartDAO cartDAO;
	@Autowired
	BillDAO billDAO;
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	StaffDAO staffDAO;
	@Autowired
	StatusDAO statusDAO;
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;
	
	//Customer
	
	//Index
	@RequestMapping("/manage-customer")
	public String customer(Model model,
			@RequestParam("p") Optional<Integer> p,
			RedirectAttributes param) {
		Staff staff = session.getAttribute("staff");
		if(staff == null) {
			model.addAttribute("notice","Không có quyền truy cập!");
			return "forward:/shopping/maintop10";
		}
		String mncs = paramService.getString("mncs", "");
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Customer> page = customerDAO.findAll(pageable);
		model.addAttribute("page",page);

		model.addAttribute("views","manage-customer.jsp");
		return "forward:/shopping/main?mncs="+mncs;
	}
	
	//Open modal
	@RequestMapping("/manage-customer-modal")
	public String customermodal(Model model,
			@RequestParam("p") Optional<Integer> p,
			RedirectAttributes param) {
		String csID = paramService.getString("customerID", "");
		Customer cs = null;
		if(csID.equals("")) {
			cs = new Customer();
		}else {
			cs = customerDAO.findById(csID).get();
		}
		model.addAttribute("mnCustomer",cs);
		model.addAttribute("openManageCS", "show");
		model.addAttribute("p", p.orElse(0));
		return "forward:/shopping/manage-customer?p=" + p.orElse(0)+"&mncs=yes";
	}
	
	//Add,update
	@PostMapping("/manage-update-customer")
	public String updatecustomer(@ModelAttribute("mnCustomer") Customer mnCustomer,
			@RequestParam("image") MultipartFile image,
			@RequestParam("p") Optional<Integer> p,
			RedirectAttributes param,Model model) {
		Customer preCS = customerDAO.findById(mnCustomer.getCustomerID()).orElse(null);
		
		if(preCS != null) {
			if(image.isEmpty()) {
				mnCustomer.setImages(preCS.getImages());
			}else {
				mnCustomer.setImages(image.getOriginalFilename());
			}
			BeanUtils.copyProperties(mnCustomer, preCS);
			
			paramService.save(image,"employee");
			customerDAO.save(preCS);
			model.addAttribute("notice","Chỉnh sửa thông tin thành công!");
		}else {
			mnCustomer.setImages(image.getOriginalFilename());
			paramService.save(image,"employee");
			customerDAO.save(mnCustomer);
			model.addAttribute("notice","Thêm khách hàng thành công!");
		}
		
		return "forward:/shopping/manage-customer?p=" + p.orElse(0);
	}
	
	//Delete customer
		@RequestMapping("/manage-customer-delete")
		public String customerdelete(Model model,
				@RequestParam("p") Optional<Integer> p,
				RedirectAttributes param) {
			String csID = paramService.getString("customerID", "");
			Customer cs = customerDAO.findById(csID).get();
			customerDAO.deleteById(csID);
			model.addAttribute("notice","Xóa khách hàng thành công!");
			return "forward:/shopping/manage-customer?p=" + p.orElse(0);
		}
	
	//Staff
	
	@RequestMapping("/manage-staff")
	public String staff(Model model,
			@RequestParam("p") Optional<Integer> p) {
		Staff staff = session.getAttribute("staff");
		if(staff == null || staff.isIsadmin() == false) {
			model.addAttribute("notice","Không có quyền truy cập!");
			return "forward:/shopping/maintop10";
		}
		String mnst = paramService.getString("mnst", "");
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Staff> page = staffDAO.findAll(pageable);
		model.addAttribute("page",page);
		model.addAttribute("views","manage-staff.jsp");
		return "forward:/shopping/main?mnst="+mnst;
	}
	
	
	//Add,update
		@PostMapping("/manage-update-staff")
		public String updatestaff(@ModelAttribute("mnStaff") Staff mnStaff,
				@RequestParam("image") MultipartFile image,
				@RequestParam("p") Optional<Integer> p,
				RedirectAttributes param,Model model) {
			Staff preST = staffDAO.findById(mnStaff.getStaffID()).orElse(null);
			
			if(preST != null) {
				if(image.isEmpty()) {
					mnStaff.setImages(preST.getImages());
				}else {
					mnStaff.setImages(image.getOriginalFilename());
				}
				BeanUtils.copyProperties(mnStaff, preST);
				
				paramService.save(image,"employee");
				staffDAO.save(preST);
				model.addAttribute("notice","Chỉnh sửa thông tin thành công!");
			}else {
				mnStaff.setImages(image.getOriginalFilename());
				paramService.save(image,"employee");
				staffDAO.save(mnStaff);
				model.addAttribute("notice","Thêm nhân viên mới thành công!");
			}
			
			return "forward:/shopping/manage-staff?p=" + p.orElse(0);
		}
	
		// Delete staff
		@RequestMapping("/manage-staff-delete")
		public String staffdelete(Model model, @RequestParam("p") Optional<Integer> p, RedirectAttributes param) {
			String stID = paramService.getString("staffID", "");
			Staff st = staffDAO.findById(stID).get();
			staffDAO.deleteById(stID);
			model.addAttribute("notice", "Xóa nhân viên thành công!");
			return "forward:/shopping/manage-staff?p=" + p.orElse(0);
		}
	
	//Open modal staff
		@RequestMapping("/manage-staff-modal")
		public String staffmodal(Model model,
				@RequestParam("p") Optional<Integer> p,
				RedirectAttributes param) {
			String stID = paramService.getString("staffID", "");
			Staff st = null;
			if(stID.equals("")) {
				st = new Staff();
			}else {
				st = staffDAO.findById(stID).get();
			}
			model.addAttribute("mnStaff",st);
			model.addAttribute("openManageST", "show");
			model.addAttribute("p", p.orElse(0));
			return "forward:/shopping/manage-staff?p=" + p.orElse(0)+"&mnst=yes";
		}
	
	//Item	
	@RequestMapping("/manage-item")
	public String item(Model model,
			@RequestParam("p") Optional<Integer> p) {
		Staff staff = session.getAttribute("staff");
		if(staff == null) {
			model.addAttribute("notice","Không có quyền truy cập!");
			return "forward:/shopping/maintop10";
		}
		String mnit = paramService.getString("mnit", "");
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = productDAO.findAll(pageable);
		model.addAttribute("page",page);
		model.addAttribute("views","manage-item.jsp");
		return "forward:/shopping/main?mnit="+mnit;
	}
	
	//Open modal item
	@RequestMapping("/manage-item-modal")
	public String itemmodal(Model model, @RequestParam("p") Optional<Integer> p, RedirectAttributes param) {
		Staff staff = session.getAttribute("staff");
		if(staff == null) {
			model.addAttribute("notice","Không có quyền truy cập!");
			return "forward:/shopping/maintop10";
		}
		String prID = paramService.getString("productID", "");
		Product pr = null;
		if (prID.equals("")) {
			pr = new Product();
		} else {
			pr = productDAO.findById(prID).get();
		}
		model.addAttribute("mnProduct", pr);
		model.addAttribute("openManageIT", "show");
		model.addAttribute("p", p.orElse(0));
		return "forward:/shopping/manage-item?p=" + p.orElse(0) + "&mnit=yes";
	}
	
	
	//Add,update item
	@PostMapping("/manage-update-item")
	public String updateitem(@ModelAttribute("mnProduct") Product mnProduct, @RequestParam("image") MultipartFile image,
			@RequestParam("p") Optional<Integer> p, RedirectAttributes param, Model model) {
		Staff staff = session.getAttribute("staff");
		if(staff == null) {
			model.addAttribute("notice","Không có quyền truy cập!");
			return "forward:/shopping/maintop10";
		}
		Product prePR = productDAO.findById(mnProduct.getProductID()).orElse(null);

		if (prePR != null) {
			if (image.isEmpty()) {
				mnProduct.setImages(prePR.getImages());
			} else {
				mnProduct.setImages(image.getOriginalFilename());
			}
			mnProduct.setCategory(prePR.getCategory());
			mnProduct.setManufacturer(prePR.getManufacturer());
			BeanUtils.copyProperties(mnProduct, prePR);

			paramService.save(image, "product");
			productDAO.save(prePR);
			model.addAttribute("notice", "Chỉnh sửa thông tin thành công!");
		} else {
			mnProduct.setImages(image.getOriginalFilename());
			paramService.save(image, "product");
			productDAO.save(mnProduct);
			model.addAttribute("notice", "Thêm sản phẩm mới thành công!");
		}

		return "forward:/shopping/manage-item?p=" + p.orElse(0);
	}

	// Delete item
	@RequestMapping("/manage-item-delete")
	public String itemdelete(Model model, @RequestParam("p") Optional<Integer> p, RedirectAttributes param) {
		Staff staff = session.getAttribute("staff");
		if(staff == null) {
			model.addAttribute("notice","Không có quyền truy cập!");
			return "forward:/shopping/maintop10";
		}
		String prID = paramService.getString("productID", "");
		Product pr = productDAO.findById(prID).get();
		productDAO.deleteById(prID);
		model.addAttribute("notice", "Xóa sản phẩm thành công!");
		return "forward:/shopping/manage-item?p=" + p.orElse(0);
	}
	
	//Money
	@RequestMapping("/manage-money")
	public String money(Model model,RedirectAttributes param,@RequestParam("p") Optional<Integer> p) {
		Staff staff = session.getAttribute("staff");
		if(staff == null || staff.isIsadmin() == false) {
			model.addAttribute("notice","Không có quyền truy cập!");
			return "forward:/shopping/maintop10";
		}
		Pageable pageable = PageRequest.of(p.orElse(0),5);
		model.addAttribute("page",productDAO.findByTop10(pageable));
		model.addAttribute("total",productDAO.findTotal());
		if(param.getAttribute("message") != null) {
			model.addAttribute("notice",param.getAttribute("message"));
		}	
		model.addAttribute("views","manage-money.jsp");
		return "forward:/shopping/main";
	}
}
