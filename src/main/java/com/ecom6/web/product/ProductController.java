package com.ecom6.web.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.product.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

// 상품과 관련된 컨트롤러
@Slf4j
@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	@Value("${resources.location}")
	String resouresLocation;
	
	
	// 어드민 전용
	@GetMapping("/productFIX")
	 public String productFIX(HttpServletRequest request,
			 	              HttpServletResponse response,
			 	              Model model, ProductVO pvo,
			 	              PageVO pgVo) {
		 String page=null;
		 MemberVO ssKey = null;
		 String content = null;
		 HttpSession session = request.getSession();
		 if(session.getAttribute("ssKey")!=null) {
			 ssKey = (MemberVO) session.getAttribute("ssKey");
			 session.setAttribute("ssKey", ssKey);
			 if(ssKey.getM_role().equals("admin")) {
				 content="admin/ProductList.jsp";
				 page = "admin/Main";
			 }else {
				 page="redirect:/";//최초화면으로 이동
			 }
		 }else {
			 page="redirect:/";
		 }
		 Map<String, Object> reSet =productService.getProductsList(pvo, pgVo);
		 model.addAttribute("content", content);
		 model.addAttribute("pcnt", reSet.get("pcnt"));
		 model.addAttribute("productList", reSet.get("productList"));
		 model.addAttribute("PBlock", PageInfo.PAGE_OF_BLOCK);
		 model.addAttribute("pgVo", pgVo);
		 return page;
	   }
	
	// 고객전용
	@GetMapping("/productList")
	public String productList(HttpServletRequest req, 
			HttpServletResponse res, ProductVO pvo,
			Model model, PageVO pgVo) {
		String content=null;
		MemberVO ssKey = null;
		HttpSession session = req.getSession();
		if (session.getAttribute("ssKey") != null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			// session이 있을 때 받아서 저장
			session.setAttribute("ssKey", ssKey);
		}
		Map<String, Object> reSet =productService.getProductsList(pvo, pgVo);
		content = "custom/productList.jsp";
		model.addAttribute("content", content);
		model.addAttribute("pcnt", reSet.get("pcnt"));
		model.addAttribute("productList", reSet.get("productList"));
		model.addAttribute("PBlock", PageInfo.PAGE_OF_BLOCK);
		model.addAttribute("pgVo", pgVo);
		return "Main";
	}
	
	@GetMapping("/productInForm")
	   public String productInForm(HttpServletRequest request,
	            HttpServletResponse response,
	            Model model, ProductVO pvo,
	            PageVO pgVo) {
		  
		    	 String page=null;
			 MemberVO ssKey = null;
			 String content =null;
			 HttpSession session = request.getSession();
			 if(session.getAttribute("ssKey")!=null) {
				 ssKey = (MemberVO) session.getAttribute("ssKey");
				 session.setAttribute("ssKey", ssKey);
				 if(ssKey.getM_role().equals("admin")) {
					content= "admin/ProductInForm.jsp";
					 page="admin/Main";
				 }else {
					 page="redirect:/";
				 }
			 }else {
				 page="redirect:/";
			 }
			 Map<String, Object> reSet =productService.getProductsList(pvo, pgVo);
			 model.addAttribute("content", content);
			 model.addAttribute("pcnt", reSet.get("pcnt"));
			 model.addAttribute("productList", reSet.get("productList"));
			 model.addAttribute("pgVo", pgVo);
		 return page;
	   }
	
	@PostMapping("productMgtProc")
	public String productInProc(HttpServletRequest req, 
								HttpServletResponse res,
								Model model, PageVO pgVo, ProductVO pvo,
								@RequestParam("image2") MultipartFile file) {
		
		String msg = null;
		String url = null;
		MemberVO ssKey = null;
		HttpSession session = req.getSession();
		if (session.getAttribute("ssKey") != null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			// session이 있다면 저장
			session.setAttribute("ssKey", ssKey);
			if (ssKey.getM_role().equals("admin")) {
				if(req.getParameter("flag")!=null) {
					String flag = req.getParameter("flag");
					// 업로드를 위한 패스 저장
					pvo.setPath(resouresLocation);
					if(flag.equals("insert")) {
						// insert 호출
						int r = productService.insertProduct(pvo, file);
						if (r > 0) {
							msg="상품등록성공!";
						} else {
							msg="상품등록실패!";							
						}
					} else if(flag.equals("update")) {
						// update 호출
						//log.info("update ===> ");
						int r = productService.updateProduct(pvo, file);
						if (r > 0) {
							msg="상품수정성공!";
						} else {
							msg="상품수정실패!";							
						}
					}
					url = "productDetail?p_no="+pvo.getP_no();
				}
			} else {
				url = "redirect:/";	// 최초 화면으로 이동
				msg = "잘못된 접근입니다!";
			}
		} else {
			url = "redirect:/";
			msg = "잘못된 접근입니다!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "MsgPage";
	}
	
	
	@GetMapping("/productDetail")
	public String productDetail(HttpServletRequest req, 
								HttpServletResponse res,
								Model model, ProductVO pvo) {
		String page=null;
		MemberVO ssKey = null;
		String content = null;
		HttpSession session = req.getSession();
		ProductVO product = productService.productDetail(pvo);
		if (session.getAttribute("ssKey") != null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			// session이 있을 때 받아서 저장
			session.setAttribute("ssKey", ssKey);
			if (ssKey.getM_role().equals("admin")) {
				content = "admin/productDetail.jsp";
				model.addAttribute("content", content);
				page = "admin/Main";
			} else {
				model.addAttribute("content", "custom/productDetail.jsp");
				page ="Main";
			}
		} else {
//			page = "MsgPage";
//			model.addAttribute("url", "login");
//			model.addAttribute("msg", "로그인");
			model.addAttribute("content", "custom/productDetail.jsp");
			page ="Main";
		}
		model.addAttribute("product", product);

		return page;
	}
	
	
	@GetMapping("productUpdateForm")
	public String productUpdateForm(HttpServletRequest req, 
									HttpServletResponse res,
									Model model, ProductVO pvo) {
		String page=null;
		MemberVO ssKey = null;
		String content = null;
		String msg = null;
		String url = null;
		HttpSession session = req.getSession();
		ProductVO product = productService.productDetail(pvo);
		if (session.getAttribute("ssKey") != null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			// session이 있을 때 받아서 저장
			session.setAttribute("ssKey", ssKey);
			if (ssKey.getM_role().equals("admin")) {
				content = "admin/ProductUpdateForm.jsp";
				model.addAttribute("content", content);
				page = "admin/Main";
			} else {
				msg = "잘못된 접근입니다.";
				url = "/";
				page = "MsgPage";
				model.addAttribute("url", url);
				model.addAttribute("msg", msg);
			}
		} else {
			msg = "세션이 종료되었습니다.";
			url = "/login";
			page = "MsgPage";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
		}
		model.addAttribute("product", product);

		return page;
	}
	
	@GetMapping("/productDelete")
	public String productDelete(HttpServletRequest req, 
								HttpServletResponse res,
								Model model, ProductVO pvo) {
		String page=null;
		MemberVO ssKey = null;
		HttpSession session = req.getSession();
		if (session.getAttribute("ssKey") != null) {
			ssKey = (MemberVO) session.getAttribute("ssKey");
			// session이 있을 때 받아서 저장
			session.setAttribute("ssKey", ssKey);
			if (ssKey.getM_role().equals("admin")) {
				// 삭제 후
				String msg = null;
				int r=0;
				try {
					r = productService.deleteProduct(pvo);
					if (r > 0) 
						msg="상품 삭제 성공";
					else
						msg="등록된 상품이 없습니다";							
				} catch (Exception e) {
					msg="해당 상품을 구매한 고객이 있습니다.";	
				} finally {					
					String url = "/productList";
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
				}
				page = "MsgPage";
			} else {
				page = "redirect:/";	// 최초 화면으로 이동
			}
		} else {
			page = "redirect:/";
		}
		return page;
	}
	
}