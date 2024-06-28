package com.ecom6.web.cart;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.cart.CartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	

	@PostMapping("/cartProc")
	public String cartProc(HttpServletRequest req,
						   HttpServletResponse res,
						   CartVO cvo, ProductVO pvo,
						   Model model) {
		String page = "MsgPage";
		String msg = null;
		String url = null;
		MemberVO ssKey = null;
		HttpSession session = req.getSession();
		if(session.getAttribute("ssKey")!=null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			session.setAttribute("ssKey", ssKey);
			if(req.getParameter("flag")!=null) {
				String flag = req.getParameter("flag");
				cvo.setMem_id(ssKey.getMem_id());
				log.info("testpvo ==========> "+pvo);
				url ="cartlist";
				
				switch (flag) {
				case "add": 
					cartService.addCart(cvo);
					msg="장바구니에 추가했습니다";
					break;
//				case "update": 
//					CartList = cartService.updateCart(cvo);
//					msg="장바구니에 수정했습니다";
//					break;
//				case "delete": 
//					cartService.deleteCart(cvo);
//					msg="장바구니에 삭제했습니다";
//					break;
				}
			}
		} else {
			msg = "로그인이 필요합니다.";
			url = "/login";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		model.addAttribute("cvo", cvo);
		return page;
	}
	
	@GetMapping("/cartProc")
	public String cartProcGet(HttpServletRequest req,
						   HttpServletResponse res,
						   CartVO cvo, ProductVO pvo,
						   Model model) {
		return cartProc(req, res, cvo, pvo, model);
	}
	
	@GetMapping("/cartlist")
	public String cartList(HttpServletRequest req,
						   HttpServletResponse res,
						   CartVO cvo, PageVO pgVo,
						   Model model) {
		String content=null;
		MemberVO ssKey = null;
		HttpSession session = req.getSession();
		if (session.getAttribute("ssKey") != null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			session.setAttribute("ssKey", ssKey);
			cvo.setMem_id(ssKey.getMem_id());
			
			log.info("cvo ===> "+cvo);
			Boolean isCartExisted = cartService.findCart(cvo);
			log.info("카트 생성 여부 ===> "+isCartExisted);
			
			Map<String, Object> reSet = cartService.getCartItemList(cvo);				
			
			content = "custom/CartList.jsp";
			model.addAttribute("content", content);
			model.addAttribute("Cartcnt", reSet.get("Cartcnt"));
			model.addAttribute("CartList", reSet.get("CartList"));
		} else {
			return "redirect:/";
		}
	
 		return "Main";
	}
}
