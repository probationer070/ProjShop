package com.ecom6.web.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecom6.VO.mem.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	@GetMapping("/")
	public String index(HttpServletRequest req, 
						HttpServletResponse res,
						Model model) {
		MemberVO ssKey = null;
		String page = null;
		HttpSession session = req.getSession();
		if(session.getAttribute("ssKey")!=null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			if (ssKey.getM_role().equals("admin")) {
				page = "redirect:/admin/";				
			} else {
				page = "layouts/index";
			}
		} else {
			page = "layouts/index";
		}
//		String content = "custom/productList.jsp";
//		model.addAttribute("content", content);
		return page;
	}
	
	@GetMapping(value={"/admin/", "/admin"})
	public String admin(HttpServletRequest req, 
			HttpServletResponse res) {
		MemberVO ssKey = null;
		String page = null;
		HttpSession session = req.getSession();
		if(session.getAttribute("ssKey")!=null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			if (ssKey.getM_role().equals("admin")) {
				page = "admin/index";				
			} else {
				page = "redirect:/";
			}
		} else {
			page = "redirect:/";
		}
		return page;
	}
	
	@GetMapping("/pwCheck")
	public String pwCheck(HttpServletRequest req, 
						HttpServletResponse res) {
		return "popup/pwCheck_popup";
	}
	
	
}
