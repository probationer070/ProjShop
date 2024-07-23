package com.ecom6.web.order;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.mem.MemberVO;

import com.ecom6.VO.order.OrderVO;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.PaymentSys.PgApiService;
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
	private PgApiService apiService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	OrderWrapper orderWrapper;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("/orderProc")
	public String orderProc(HttpServletRequest req,
						   HttpServletResponse res,
						   OrderVO ovo,PageVO pgVo,
						   Model model) {
		HttpSession session = req.getSession();
		String msg = null;
		String url = null;
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			Map<String, Object> reSet = cartService.getCartItemList(ssKey.getMem_id());
			ArrayList<CartVO> CartList = (ArrayList<CartVO>) reSet.get("cartList");
		
			HashMap<String, Object> reMap = 
					orderWrapper.orderProc(ovo, CartList);
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
	
	@PostMapping("orderFIXProc")
	@ResponseBody
	public void orderFIXProc(HttpServletRequest req,
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
	
	@PostMapping("/OrDetailMgt")
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
				model.addAttribute("content", "admin/OrderDetail.jsp");		
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
				url = "/orderFIX";		
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
				url = "/orderFIX";		
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
	
	@GetMapping("/orderList")
	public String orderList(HttpServletRequest request,
			                HttpServletResponse response,
			                OrderVO ovo,
			                Model model,
			                PageVO pgVo) {

		String msg;
		String url;
		String page="Main";
		HttpSession session = request.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			//데이터 받아서 저장
			ovo.setMem_id(ssKey.getMem_id());
			ovo.setM_role(ssKey.getM_role());
			Map<String, Object> reSet = orderService.getOrders(ovo,pgVo);
			model.addAttribute("orders", reSet.get("orders"));
			model.addAttribute("orderTot", reSet.get("orderTot"));
			model.addAttribute("content", "custom/OrderList.jsp");
			model.addAttribute("PBlock", PageInfo.PAGE_OF_BLOCK);
			model.addAttribute("pgVo", pgVo);
		}else {
		  msg="로그인이 필요합니다.";
	      url = "/login";
	      page="MsgPage";
	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);
		}
		session.setAttribute("ssKey", ssKey);
		return page;
	}

	@GetMapping(value={"/orderFIX"})
	public String orderFIX(HttpServletRequest req, 
							HttpServletResponse res,
							OrderVO ovo,
							PageVO pgVo,
							Model model) {
		String page = null;
		String msg = null;
		String url = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
//			session.setAttribute("ssKey", ssKey);
			if(ssKey.getM_role().equals("admin")) {
				ovo.setM_role(ssKey.getM_role());
				Map<String, Object> reSet = orderService.getOrderList(ovo,pgVo);
				model.addAttribute("orders", reSet.get("orders"));
				model.addAttribute("orderTot", reSet.get("orderTot"));
				model.addAttribute("content", "admin/OrderList.jsp");
				model.addAttribute("PBlock", PageInfo.PAGE_OF_BLOCK);
				model.addAttribute("pgVo", pgVo);
				page = "admin/Main";
			} else {
				 session.removeAttribute("ssKey");
				 session.invalidate();
				 msg="접근이 올바르지 않습니다.";
				 url = "/login";
				 page="MsgPage";
				 model.addAttribute("msg", msg);
				 model.addAttribute("url", url);
				}
			  }else {
			    session.removeAttribute("ssKey");
				session.invalidate();
				msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
			    url = "/login";
			    page="MsgPage";
			    model.addAttribute("msg", msg);
			    model.addAttribute("url", url);
			  }
		return page;
	}
//	@GetMapping("/orderDetail")
//	public String getorderDetail(HttpServletRequest req, 
//							HttpServletResponse res, 
//							Model model) {
//		HttpSession session = req.getSession();
//		String page = null;
//		String url = null;
//		String msg = null;
//		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
//		if(ssKey!=null) {
//			session.setAttribute("ssKey", ssKey);
//			Map<String, Object> reSet = cartService.getCartItemList(ssKey.getMem_id());
//			// 주문하고 재고는 하나 줄고
//			model.addAttribute("subTotal", req.getAttribute("subTotal"));
//			model.addAttribute("content", "custom/OrderDetail.jsp");
//			model.addAttribute("cart", reSet.get("cartList"));
//			model.addAttribute("SubTot", reSet.get("subTotal"));	
//			model.addAttribute("url", url);
//			page = "Main";
//		} else {
//			session.removeAttribute("ssKey");
//			session.invalidate();
//			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
//		    url = "/login";
//		    page="MsgPage";
//		    model.addAttribute("msg", msg);
//		    model.addAttribute("url", url);
//		}
//		return page;
//	}

	@RequestMapping("/orderDetail")
	public ModelAndView orderProc(HttpServletRequest req, 
								@RequestParam HashMap<String, String> param) throws NoSuchAlgorithmException {
		ModelAndView mav =  new ModelAndView();
		mav.setViewName("custom/OrderDetail");
		log.info("param CHECK : ===> "+param);
		HttpSession session = req.getSession();
		String page = null;
		String url = null;
		String msg = null;
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			session.setAttribute("ssKey", ssKey);

			String Apiurl = "https://api.testpayup.co.kr/ap/api/payment/himedia/order";
			Map<String, String> apiMap = new HashMap<String, String>();
			Map<String, Object> apiResult = new HashMap<String, Object>();


			String orderNumber = UUID.randomUUID().toString().substring(0,8).replace("-", "").toUpperCase();
			apiMap.put("orderNumber", orderNumber);

			// String amount = "100000";
			String amount = param.get("amount");
			String merchantId = "himedia";
			String apiCertKey = "ac805b30517f4fd08e3e80490e559f8e";

//			apiMap.put("amount", amount);
//			apiMap.put("itemName", "Test");
//			apiMap.put("userName", "Testor");
			Iterator<String> keys = param.keySet().iterator();
			while (keys.hasNext()) {
				String key = keys.next();
				apiMap.put(key, param.get(key));
			}
			apiMap.put("userAgent", "WP");
			apiMap.put("returnUrl", "orderProc");

			LocalDateTime time = LocalDateTime.now();
			String Formattime = time.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
			apiMap.put("timestamp", Formattime);

			String signNotEncode = merchantId+"|"+orderNumber+"|"+amount+"|"+apiCertKey+"|"+Formattime;
			String sign = apiService.getSHA256Hash(signNotEncode);
			apiMap.put("signature", sign);

			apiResult = apiService.JsonApi(Apiurl, apiMap);

			System.out.println("API 통신 주문 값: "+apiResult);
			mav.addObject("data", apiResult);
			
			Map<String, Object> reSet = cartService.getCartItemList(ssKey.getMem_id());
			
			mav.addObject("cart",reSet.get("cartList"));
			mav.addObject("cartTot",reSet.get("cartTot"));
			mav.addObject("SubTot",reSet.get("subTotal"));
			mav.addObject("url", url);
		} else {
			session.removeAttribute("ssKey");
			session.invalidate();
			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
		    url = "/login";
		    mav.setViewName("MsgPage");
		    mav.addObject("msg", msg);
		    mav.addObject("url", url);
		}
		return mav;
	}

	@PostMapping("/payProc2")
	public ModelAndView payProc2(@RequestParam HashMap<String, String> param, 
								HttpServletRequest req, OrderVO ovo) throws NoSuchAlgorithmException {
		ModelAndView mav =  new ModelAndView();

//		System.out.println("trace input 내용 : "+param.toString());
//		System.out.println(param.get("cardNo"));
//		System.out.println(param.get("expireYear"));

		String url = "https://api.testpayup.co.kr/ap/api/payment/"+param.get("ordr_idxx")+"/pay";
		Map<String, String> apiMap = new HashMap<String, String>();
		Map<String, Object> apiResult = new HashMap<String, Object>();

		apiMap.put("res_cd", param.get("res_cd"));	// Res-code
		apiMap.put("res_msg", param.get("res_msg"));	// Res-msg 
		apiMap.put("enc_data", param.get("enc_data"));	// 
		apiMap.put("enc_info", param.get("enc_info"));	// 
		apiMap.put("tran_cd", param.get("tran_cd"));	// 
		apiMap.put("buyr_mail", param.get("buyr_mail")); //

		apiResult = apiService.JsonApi(url, apiMap);

		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");

		System.out.println("API 통신 값: "+apiResult);
		if ("0000".equals(apiResult.get("responseCode"))) {
			Map<String, Object> reSet = cartService.getCartItemList(ssKey.getMem_id());
			ArrayList<CartVO> CartList = (ArrayList<CartVO>) reSet.get("cartList");
			HashMap<String, Object> reMap = 
					orderWrapper.orderProc(ovo, CartList);
			session.setAttribute("ssKey", ssKey);
		}
		mav.setViewName("Main");
		mav.addObject("content", "layouts/PayResult.jsp");
		mav.addObject("data", apiResult);

		return mav;
	}
}