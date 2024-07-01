package com.ecom6.web.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.cart.CartService;
import com.ecom6.service.order.OrderService;
import com.ecom6.wrapper.order.OrderWrapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
public class OrderController {
	// 규칙 1. 서비스에서 트랜잭션을 걸어야 한다.
	// 규칙 2. 서로 다른 업무에서 해당 업무 이외의 업무를 호출하지 않는다.
	// 규칙 3. 타 업무가 필요할 때는 Wrapper 클래스를 만들어서 사용한다
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	OrderWrapper orderWrapper;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("/orderProc")
	public String orderProc(HttpServletRequest req,
						   HttpServletResponse res,
						   OrderVO ovo, PageVO pgVo,
						   Model model) {
		HttpSession session = req.getSession();
		String msg = null;
		String url = null;
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			Map<String, Object> reSet = cartService.getCartItemList(ssKey.getMem_id());
			ArrayList<CartVO> CartList = (ArrayList<CartVO>) reSet.get("CartList");
			log.info("cartList=======> "+CartList);
			HashMap<String, Object> reMap = 
					orderWrapper.orderProc(ovo,CartList);
			msg = (String) reMap.get("msg");
			url = (String) reMap.get("url");
			// 주문하고 재고는 하나 줄고
		} else {
			msg = "로그인이 필요합니다.";
			url = "/login";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		session.setAttribute("ssKey", ssKey);
		return "MsgPage";
	}
	
	@PostMapping("/custOrderDetail")
	public String custOrderDetail(HttpServletRequest req,
								  HttpServletResponse res,
								  OrderVO ovo,
								  Model model) {
		String msg;
		String url;
		String page = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			OrderVO order = orderService.getOrder(ovo);
			model.addAttribute("order", order);
			model.addAttribute("content", "custom/OrderDetail.jsp");
			page = "Main";
		} else {
			msg = "세션이 종료되었습니다. \\n 로그인이 필요합니다.";
			url = "/login";
			page = "MsgPage";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
		}
		session.setAttribute("ssKey", ssKey);
		return page;
	}
	
	@GetMapping("/custOrderDetail")
	public String getOrderDetail(Model model) {
		String page = null;
		String msg = "잘못된 접근 입니다.";
		String url = "/login";
		page = "MsgPage";
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return page;
	}
	
	// ADMIN
	@GetMapping("/orderMgt")
	public String getMethodName(HttpServletRequest req,
							    HttpServletResponse res,
							    OrderVO ovo,
							    Model model) {
		String page = null;
		String msg;
		String url;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				ovo.setM_role(ssKey.getM_role());
				Map<String, Object> reSet = orderService.getOrderList(ovo);
				model.addAttribute("orders", reSet.get("orders"));
				model.addAttribute("orderTot", reSet.get("orderTot"));
				model.addAttribute("content", "admin/OrderList.jsp");
				page = "Main";				
			} else {
				session.removeAttribute("ssKey");
				session.invalidate();
				
				msg = "올바른 접근이 아닙니다.";
				url = "/login";
				page = "MsgPage";
				model.addAttribute("url", url);
				model.addAttribute("msg", msg);
			}
		} else {
			session.removeAttribute("ssKey");
			session.invalidate();
			
			msg = "세션이 종료되었습니다.";
			url = "/login";
			page = "MsgPage";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
		}
		return page;
	}
	
	@PostMapping("orderMgtProc")
	@ResponseBody
	public void orderMgtProc(HttpServletRequest req,
							 HttpServletResponse res,
							 OrderVO ovo,
							 Model model,
							 @RequestParam(value="tdArr[]") ArrayList<String> tdArr) {
		HttpSession session = req.getSession();
		MemberVO admin = (MemberVO) session.getAttribute("ssKey");
		if (admin!=null && admin.getM_role().equals("admin")) {
			try {
				log.info("tdArr Data check ==> "+tdArr);	
				orderService.orderStateUpdate(tdArr);
			} catch (Exception e) {
				log.info(e.getMessage()+":"+e.getLocalizedMessage());
			}
		}
	}
	
	@PostMapping("/orDetailMgt")
	public String orderDetail(HttpServletRequest req,
							  HttpServletResponse res,
							  OrderVO ovo,
							  Model model) {
		
		String page = "admin/Main";
		String msg;
		String url;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				ovo.setM_role(ssKey.getM_role());
				log.info("+===>"+ovo);
				OrderVO order = orderService.getOrder(ovo);
				model.addAttribute("order", order);
				model.addAttribute("content", "./OrderDetail.jsp");		
			} else {
				session.removeAttribute("ssKey");
				session.invalidate();
				
				msg = "올바른 접근이 아닙니다.";
				url = "/login";
				page = "MsgPage";
				model.addAttribute("url", url);
				model.addAttribute("msg", msg);
			}
		} else {
			session.removeAttribute("ssKey");
			session.invalidate();
			
			msg = "세션이 종료되었습니다.";
			url = "/login";
			page = "MsgPage";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
		}
		
		return page;
	}
	
	@PostMapping("oStateUpdate")
	public String oStateUpdate(HttpServletRequest req,
							  HttpServletResponse res,
							  OrderVO ovo,
							  Model model) {
		String page = "MsgPage";
		String msg = null;
		String url = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				log.info("+===>"+ovo);
				int r = orderService.updateState(ovo);
				if (r>0)
					msg = "주문상태 수정완료";		
				else 
					msg = "주문상태 수정실패";
				url = "/orderMgt";		
			} else {
				session.removeAttribute("ssKey");
				session.invalidate();
				msg = "올바른 접근이 아닙니다.";
				url = "/login";
			}
		} else {
			session.removeAttribute("ssKey");
			session.invalidate();
			msg = "세션이 종료되었습니다.";
			url = "/login";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return page;
	}
	
	@GetMapping("orderDelete")
	public String GetorderDelete(HttpServletRequest req,
							  HttpServletResponse res,
							  OrderVO ovo,
							  Model model) {
		return orderDelete(req, res, ovo, model);
	}
	
	@PostMapping("orderDelete")
	public String orderDelete(HttpServletRequest req,
							  HttpServletResponse res,
							  OrderVO ovo,
							  Model model) {
		String page = "MsgPage";
		String msg = null;
		String url = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				// log.info("+===>"+ovo.getState());
				Map<String, Object> reSet = orderWrapper.orderDelete(ovo);
				msg = (String) reSet.get("msg");
				url = "/orderMgt";		
			} else {
				session.removeAttribute("ssKey");
				session.invalidate();
				msg = "올바른 접근이 아닙니다.";
				url = "/login";
			}
		} else {
			session.removeAttribute("ssKey");
			session.invalidate();
			msg = "세션이 종료되었습니다.";
			url = "/login";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return page;
	}
	
}
