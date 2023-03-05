package com.duytien.controller;

import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duytien.dao.BillDAO;
import com.duytien.dao.BillDetailDAO;
import com.duytien.dao.ProductDAO;
import com.duytien.dao.PromotionDAO;
import com.duytien.dao.ShoppingCartDAO;
import com.duytien.dao.StatusDAO;
import com.duytien.model.Bill;
import com.duytien.model.BillDetail;
import com.duytien.model.BillDetailID;
import com.duytien.model.CartItem;
import com.duytien.model.Customer;
import com.duytien.model.Product;
import com.duytien.model.Promotion;
import com.duytien.model.Staff;
import com.duytien.model.Status;
import com.duytien.utility.ParamService;
import com.duytien.utility.SessionService;

@Controller
@RequestMapping("/shopping")
public class BillController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ShoppingCartDAO cartDAO;
	@Autowired
	BillDAO billDAO;
	@Autowired
	BillDetailDAO billDetailDAO;
	@Autowired
	PromotionDAO promotionDAO;
	@Autowired
	StatusDAO statusDAO;
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;
	
	@RequestMapping("/package-product")
	public String packageproduct(Model model,RedirectAttributes param) {
		model.addAttribute("notice",param.getAttribute("message"));
		model.addAttribute("views","package-product.jsp");
		return "forward:/shopping/main";
	}
	
	@RequestMapping("/package/remove/{productID}")
	public String removeItem(@PathVariable("productID") String id,RedirectAttributes param) {
		cartDAO.remove(id);
		session.setAttribute("countItem",cartDAO.getCount());
		session.setAttribute("cartItem",cartDAO.getItems());
		session.setAttribute("totalItem",cartDAO.getAmount());
		param.addAttribute("message", "Sản phẩm đã xóa khỏi giỏ hàng!");
		
		
		return "redirect:/shopping/package-product";
	}
	
	@PostMapping("/bill-order")
	public String createBill(RedirectAttributes param,Model model) {
		Staff staff = session.getAttribute("staff");
		Customer customer = session.getAttribute("customer");
		if(staff == null && customer == null) {
			param.addAttribute("message","Vui lòng đăng nhập!");
			return "redirect:/shopping/package-product";
		}
		if(cartDAO.getItems().isEmpty()) {
			param.addAttribute("message","Vui lòng chọn sản phẩm!");
			return "redirect:/shopping/package-product";
		}

		Promotion promotion = session.getAttribute("promotionCode");
		Status status = statusDAO.findById(0).get();
		Bill presentBill = new Bill();
		double total = session.getAttribute("totalItem");
		if(promotion !=null) {			
			presentBill.setTotalPrice(total - (total * promotion.getDiscount()));
		}else {
			presentBill.setTotalPrice(total);
		}
		presentBill.setCustomer(customer);
		presentBill.setStaff(staff);
		presentBill.setPromotion(promotion);
		presentBill.setStatus(status);
		
		Bill newBill = billDAO.save(presentBill);
		session.setAttribute("bill",newBill);
		System.out.println(newBill.getBillID() + " nha");
		return "forward:/shopping/bill-order-detail";
	}
	
	
	@RequestMapping("/bill-order-detail")
	public String billdetail(Model model,RedirectAttributes param) {
		Bill bill =	session.getAttribute("bill");
		if(bill == null) {
			param.addAttribute("message","Vui lòng chọn sản phẩm và đặt hàng!");
			return "redirect:/shopping/package-product";
		}
		Iterator<CartItem> listCartItem = cartDAO.getItems().iterator();
		
		while(listCartItem.hasNext()) {
			CartItem item = listCartItem.next();
			Product pr = productDAO.findById(item.getProductID()).get();
			BillDetailID bdID = new BillDetailID(bill.getBillID(),pr.getProductID());
			BillDetail bd = new BillDetail();
			bd.setId(bdID);
			bd.setBill(bill);
			bd.setProduct(pr);
			bd.setPrice(pr.getPrice());
			bd.setQuantity(item.getQuantity());
			bd.setTotalprice(item.getPrice() * item.getQuantity());
			billDetailDAO.save(bd);
		}
		
		cartDAO.clear();
		session.setAttribute("bill",null);
		param.addAttribute("message","Đặt hàng thành công!");
		return "redirect:/shopping/package-product";
		
	}
	
	@PostMapping("/bill-promotion")
	public String billPromotion(RedirectAttributes param) {
		String promotionID = paramService.getString("promotionCode", "");
		if(promotionID.equals("")) {
			param.addAttribute("message","Vui lòng nhập mã khuyến mãi!");
			return "redirect:/shopping/package-product";
		}
		Promotion promotion = promotionDAO.findById(promotionID).orElse(null);
		if(promotion == null) {
			param.addAttribute("message","Mã khuyến mãi không tồn tại!");
			return "redirect:/shopping/package-product";
		}
		
		if(cartDAO.getCount() == 0) {
			session.setAttribute("promotionCode", null);
		}
		
		Promotion sessionPromotion = session.getAttribute("promotionCode");
		
		if(sessionPromotion	 != null) {
			System.out.println(sessionPromotion.getPromotionID() + " nha");
			param.addAttribute("message","Đã có mã giảm giá!");
			return "redirect:/shopping/package-product";
		}
		
		Date date = new Date();
		if(promotion.getPromotiondateofend().compareTo(date) < 0) {
			param.addAttribute("message","Mã khuyến mãi này đã hết hạn sử dụng!");
			return "redirect:/shopping/package-product";
		}
		
		session.setAttribute("promotionCode", promotion);
		
		return "redirect:/shopping/package-product";
	}
	
	//Bill handle

	
	//Staff
	@RequestMapping("/history-bill-staff")
	public String historyBillStaff(Model model, @RequestParam("p") Optional<Integer> p, RedirectAttributes param) {
		Staff staff = session.getAttribute("staff");
		if (staff == null) {
			param.addAttribute("message", "Không có quyền truy cập!");
			return "redirect:/shopping/maintop10";
		}
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Bill> page = billDAO.findAll(pageable);
		model.addAttribute("page", page);
		model.addAttribute("billTitle", "Quản lý đơn hàng");
		model.addAttribute("notice",param.getAttribute("message"));
		model.addAttribute("urlbill","history-bill-staff");
		model.addAttribute("views", "history-customer.jsp");
		return "forward:/shopping/main";
	}
	//Delete bill
	@RequestMapping("/history-bill-delete")
	public String historyBillDelete(Model model, @RequestParam("p") Optional<Integer> p, RedirectAttributes param) {
		Staff staff = session.getAttribute("staff");
		if (staff == null) {
			param.addAttribute("message", "Không có quyền truy cập!");
			return "redirect:/shopping/maintop10";
		}
		String billID = paramService.getString("billID", "");
		billDetailDAO.deleteByBillID(Long.parseLong(billID));
		billDAO.deleteById(Long.parseLong(billID));
		param.addAttribute("message", "Xóa đơn hàng thành công!");
		return "redirect:/shopping/history-bill-staff?p="+p.orElse(0);
	}
	
	//Update bill
		@RequestMapping("/history-bill-update")
		public String historyBillUpdate(Model model, @RequestParam("p") Optional<Integer> p, RedirectAttributes param) {
			Staff staff = session.getAttribute("staff");
			if (staff == null) {
				param.addAttribute("message", "Không có quyền truy cập!");
				return "redirect:/shopping/maintop10";
			}
			String billID = paramService.getString("billID", "");
			Bill bill = billDAO.findById(Long.parseLong(billID)).get();
			bill.setStatus(statusDAO.findById(1).get());
			bill.setStaff(staff);
			billDAO.save(bill);
			param.addAttribute("message", "Duyệt đơn thành công!");
			return "redirect:/shopping/history-bill-staff?p="+p.orElse(0);
		}
	
	//Customer
	@RequestMapping("/history-bill-customer")
	public String historyBillCustomer(Model model,
			@RequestParam("p") Optional<Integer> p,
			RedirectAttributes param
			) {
		Customer cs = session.getAttribute("customer");
		if(cs == null) {
			param.addAttribute("message", "Vui lòng đăng nhập với tư cách khách hàng");
			return "redirect:/shopping/maintop10";
		}
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Bill> page = billDAO.findByCustomer(cs.getCustomerID(),pageable);
		model.addAttribute("page",page);
		model.addAttribute("billTitle","Lịch sử đặt hàng");
		model.addAttribute("urlbill","history-bill-customer");
		model.addAttribute("views","history-customer.jsp");
		return "forward:/shopping/main";
	}
	
	//Bill detail
	@RequestMapping("/history-bill-detail")
	public String historyBillDetail(Model model,
			RedirectAttributes param,
			@RequestParam("p") Optional<Integer> p) {
		String billID = paramService.getString("billID", "");
		String url = paramService.getString("url", "");
		if(billID.equals("")) {
			param.addAttribute("message", "Vui lòng đăng nhập");
			return "redirect:/shopping/maintop10";
		}
		Bill bill = billDAO.findById(Long.valueOf(billID)).get();
		List<BillDetail> listBillDetail = billDetailDAO.findByBill(bill.getBillID());
		model.addAttribute("p",p.orElse(0));
		model.addAttribute("bill",bill);
		model.addAttribute("listBillDetail",listBillDetail);
		model.addAttribute("openbilldetail","show");
		model.addAttribute("views","history-customer.jsp");
		return "forward:/shopping/"+url+"?p="+p.orElse(0);
	}
}
