package com.ecom6.web.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.wrapper.search.SearchWrapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MainController {
	@Autowired
	SearchWrapper searchWrapper;
	
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
	
	@GetMapping("/search")
	public String SearchResult(HttpServletRequest req, 
						HttpServletResponse res, Model model, PageVO pgVo,
						@RequestParam HashMap<String, String> param) {
		String content = "SearchResult.jsp";

		Map<String, Object> reMap = searchWrapper.SearchProc(param, pgVo);
		log.info("param ===> "+param);
		log.info("TESTING text2 =============>  "+reMap.get("search_list"));
		model.addAttribute("p_search", reMap.get("p_search"));
		model.addAttribute("n_search", reMap.get("n_search"));
		model.addAttribute("search_list", reMap.get("search_list"));
		model.addAttribute("content", content);
		return "Main";
	}

}