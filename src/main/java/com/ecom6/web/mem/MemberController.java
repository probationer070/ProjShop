package com.ecom6.web.mem;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.mem.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 DB 수정 필요 -> mem_id 외의 식별자 필요, mem_id 수정 불가능
	
	@PostMapping("/loginProc")
	public String loginProc(HttpServletRequest req, 
							HttpServletResponse res, 
							MemberVO mvo, Model model) {
		// 세션 가지고 오기
		HttpSession session = req.getSession();
		String msg = null;
		String url = "/";
		// 회원 정보 가져오기
		MemberVO svo = memberService.getMember(mvo);
		
		if (svo!=null) {
			if (svo.getM_role().equals("admin")) {
				url = "/admin/";
			}
			MemberVO ssKey = svo; 
			msg=svo.getM_name()+"님 반갑습니다.";
			session.setAttribute("ssKey", ssKey);	
			log.info("ssKey======> "+ssKey);
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			url = "/login";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "MsgPage";
	}
	
	@PostMapping(value={"logoutProc", "/admin/logoutProc"})
	public String logoutProc(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("ssKey");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping(value={"logoutProc", "/admin/logoutProc"})
	public String getlogoutProc(HttpServletRequest req) {
		return logoutProc(req);
	}
	
	@GetMapping("/join")
	public String joinMember(HttpServletRequest req, 
							HttpServletResponse res, 
							MemberVO mvo, Model model) {
		model.addAttribute("content", "member/Register.jsp");
		return "Main";
	}
	
	@Transactional
	@PostMapping("/registerProc")
	public String registerProc(
			HttpServletRequest req, 
			HttpServletResponse res,
			MemberVO mvo, Model model) {
		String msg = null;
		String url = "/login";
		
		int r = memberService.memberJoin(mvo);
		if (r>0) {
			msg = "회원가입 성공";
		} else {
			msg = "회원가입 실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "MsgPage";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}


	@PostMapping("/memUpdateForm")
	public String updateForm(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("ssKey");
		model.addAttribute("mvo", mvo);
		model.addAttribute("content", "member/UpdateForm.jsp"); 
		return "Main";
	}
	
	@GetMapping("/info")
	public String infoView(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		

		if(ssKey!=null) {
			model.addAttribute("mvo", ssKey);
			model.addAttribute("content", "member/MemberInfo.jsp"); 
		} else {
			return "redirect:/";
		}
		return "Main";
	}
	
	@Transactional
	@PostMapping("/memUpdateProc")
	public String memUpdateProc(
			HttpServletRequest req, 
			HttpServletResponse res,
			MemberVO mvo, Model model) {
		
		HttpSession session = req.getSession();
		
		String msg = null;
		
		int r = memberService.memberUpdate(mvo);
		if (r>0) {
			msg = "수정 성공";
		} else {
			msg = "수정 실패";
		}
		
		session.removeAttribute("ssKey");
		session.invalidate();
		model.addAttribute("url", "/");
		model.addAttribute("msg", msg);
		return "MsgPage";
	}
	
	@GetMapping("/memberFIX")
	public String memberMgt(HttpServletRequest req, 
							HttpServletResponse res,
							MemberVO mvo, PageVO pgVo, Model model) {
		String msg=null;
		String url=null;
		String page="Main";
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				mvo.setM_role(ssKey.getM_role());
				Map<String, Object> reSet = memberService.getMemberList(mvo, pgVo);
				msg = (String) reSet.get("msg");
				model.addAttribute("members", reSet.get("members"));
				model.addAttribute("memTot", reSet.get("memTot"));
				model.addAttribute("msg", msg);
				
				model.addAttribute("content", "admin/memberList.jsp");
				model.addAttribute("PBlock", PageInfo.PAGE_OF_BLOCK);
				model.addAttribute("pgVo", pgVo);
			} else {
				session.removeAttribute("ssKey");
				session.invalidate();
				msg = "올바른 접근이 아닙니다.";
				url = "/";
				page = "MsgPage";
			}
		} else {
			session.removeAttribute("ssKey");
			session.invalidate();
			msg = "로그인이 필요합니다.";
			url = "/login";
			page = "MsgPage";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return page;
	}
	
	@PostMapping("/memberFIX")
	public String memberMgtPost(HttpServletRequest req, 
			HttpServletResponse res,
			MemberVO mvo, PageVO pgVo, Model model) {
		return memberMgt(req, res, mvo, pgVo,model);
	}
	
	@PostMapping("/customInfo")
	public String customInfo(HttpServletRequest req, 
							HttpServletResponse res,
							MemberVO mvo, // 커스텀 정보
							Model model) {
		String msg=null;
		String url=null;
		String page=null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				model.addAttribute("mvo", mvo);	
				model.addAttribute("content", "member/MemberInfo.jsp");	
				page = "Main";
			} else {
				session.removeAttribute("ssKey");
				session.invalidate();
				msg = "올바른 접근이 아닙니다.";
				url = "/";
				page = "MsgPage";
			}
		} else {
			session.removeAttribute("ssKey");
			session.invalidate();
			msg = "로그인이 필요합니다.";
			url = "/login";
			page = "MsgPage";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return page;
	}
	
	@GetMapping("/customInfo")
	public String GetcustomInfo(HttpServletRequest req, 
			HttpServletResponse res,
			MemberVO mvo, // 커스텀 정보
			Model model) {
		return customInfo(req, res, mvo, model);
	}
	
	
	
	@GetMapping("/admin/info")
	public String infoView(HttpServletRequest req, 
							HttpServletResponse res,
							MemberVO mvo, // 커스텀 정보
							Model model) {
		String msg=null;
		String url=null;
		String page=null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				model.addAttribute("mvo", ssKey);	
				model.addAttribute("content", "/admin/MemberInfo.jsp");	
				page = "admin/Main";
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
			page="redirect:/";
		}
		return page;
	}
	
	@PostMapping("/admin/memUpdateForm")
	public String AdminupdateForm(HttpServletRequest req, Model model) {
		
		String msg=null;
		String url=null;
		String page=null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				model.addAttribute("mvo", ssKey);	
				model.addAttribute("content", "admin/UpdateForm.jsp"); 
				page = "admin/Main";
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
			page="redirect:/";
		}
		return page;
	}
	
	@GetMapping("/admin/memUpdateProc")
	public String AdminGetmemUpdateProc(HttpServletRequest req, 
									 HttpServletResponse res,
									 MemberVO mvo, Model model) {
		return AdminmemUpdateProc(req, res, mvo, model);
	}
	
	@PostMapping("/admin/memUpdateProc")
	public String AdminmemUpdateProc(HttpServletRequest req, 
									 HttpServletResponse res,
									 MemberVO mvo, Model model) {
		String msg = null;
		String page =null;
		String url=null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		
		if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				int r = memberService.memberUpdate(mvo);
				if (r>0) {
					msg = "관리자 정보 수정 성공";
				} else {
					msg = "관리자 정보 수정 실패";
				}
			} else {
				msg = "올바른 접근이 아닙니다.";
				url = "/login";
				page = "MsgPage";
			}
		} else {
			page="redirect:/";
		}
		session.removeAttribute("ssKey");
		session.invalidate();
		model.addAttribute("url", "/");
		model.addAttribute("msg", msg);
		return "MsgPage";

	}
	
	@PostMapping("/memDeleteProc")
	public String memDeleteProc(HttpServletRequest request,
								HttpServletResponse response,
								MemberVO mvo,
								Model model) {
		   HttpSession session = request.getSession();
		   MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		   String msg=null;
		   int r = memberService.memDeleteProc(ssKey);
		   if(r>0) {
			   msg = "회원정보가 삭제 되었습니다. \\n 재 로그인이 필요합니다.";
		   }else {
			   msg = "회원정보가 삭제에 실패했습니다.\\n관리자에게 문의바랍니다.";
		   }
		   session.removeAttribute("ssKey");
		   session.invalidate();
		   model.addAttribute("msg", msg);
		   model.addAttribute("url", "/");
		   return "MsgPage";
	   }
	
	@GetMapping("/memSearch")
	  public String getMemSearch(HttpServletRequest request,
			  					HttpServletResponse response,
			  					MemberVO mvo,//커스텀 정보
			  					Model model) {
		  return "member/SearchPage";
	  }
  @PostMapping("/memSearch")
	  public String postMemSearch(HttpServletRequest request,
			  					HttpServletResponse response,
			  					MemberVO mvo,//커스텀 정보
			  					Model model) {
		  return getMemSearch(request, response, mvo, model);
	  }

  @PostMapping("/searchProc")
  public String searchProc(HttpServletRequest request,
		  				HttpServletResponse response,
		  				MemberVO mvo,
		  				Model model) {
	  int r=0;
	  String id = null;
	  String msg = null;
	  String url = "/";
	  if(mvo!=null) {
		  if(mvo.getMem_id()!=null) {//비밀번호 설정
			 r = memberService.updatePasswd(mvo);
			 if(r>0) {
				 msg = "비밀번호가 변경 되었습니다";
			 }else {  //아이디 찾아서 리턴
				 msg = "비밀번호가 변경오류 입니다 \\n 관리자에게 문의하세요";
			 }
		  }else {
			  id = memberService.searchId(mvo);
			  if(id!=null) msg = "회원아이디: "+id;
			  else msg = "회원정보가 없습니다";
			  url = "memSearch";
		  }
	  }
	  model.addAttribute("msg", msg);
	  model.addAttribute("url", url);
	  return "MsgPage";
  }
}