package com.ecom6.web.notice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.notice.NoticeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping(value={"/notice", "/noticeFIX"})
	public String noticeIndex(HttpServletRequest req, 
							HttpServletResponse res,
							NoticeVO nvo,
							PageVO pgVo,
							Model model) {
		String content = null;
		String page = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		Map<String, Object> reSet = noticeService.getNoticeList(nvo, pgVo);
		if(ssKey!=null) {
			session.setAttribute("ssKey", ssKey);
			if(ssKey.getM_role().equals("admin")) {
				content = "notice/NoticeList.jsp";
				page = "admin/Main";
			} else {
				content = "notice/NoticeList.jsp";
				page = "Main";
			}
		} else {
			content = "notice/NoticeList.jsp";
			page = "Main";
		}
		model.addAttribute("content", content);	
		model.addAttribute("nvo", reSet.get("NoticeList"));	
		model.addAttribute("pgVo", reSet.get("pgVo"));	
		model.addAttribute("noticeTot", reSet.get("noticeTot"));	
		return page;
	}
	
	@GetMapping("/NoticeInForm")
	public String NoticeInform(HttpServletRequest req, 
								PageVO pageVO,
								Model model) {
		String page=null;
		String url = null;
		String msg = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if (ssKey != null && ssKey.getM_role().equals("admin")) {
				model.addAttribute("content",  "/notice/NoticeInForm.jsp");
				session.setAttribute("ssKey", ssKey);
				page = "admin/Main";
		} else {
			msg = "로그인이 필요합니다.";
			url = "/login";
			page = "MsgPage";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
		}
		return page;
	}
	
	@PostMapping("/NoticeProc")
	public String NoticeInformProc(HttpServletRequest req, 
									HttpServletResponse res,
									NoticeVO nvo, PageVO pageVO, 
									Model model) {
		String page = null;
		String msg = null;
		String url = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if (ssKey != null && ssKey.getM_role().equals("admin")) {
				session.setAttribute("ssKey", ssKey);
				int r = noticeService.noticeProc(nvo);
				if (r > 0) {
					msg="공지사항 등록성공!";
				} else {
					msg="공지사항 등록실패!";							
				}
				url = "/noticeFIX";
		} else {
			msg = "잘못된 접근입니다";
			url = "/login";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		page = "MsgPage";
		return page;
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(HttpServletRequest req, 
							   HttpServletResponse res, 
							   PageVO pageVO, 
							   NoticeVO nvo,
							   Model model) {
		String page = null;
		String msg = null;
		String content = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		NoticeVO notice = noticeService.noticeDetail(nvo);
		if (ssKey != null && ssKey.getM_role().equals("admin")) {
			session.setAttribute("ssKey", ssKey);
			content =  "notice/NotiDetail.jsp";
			page = "admin/Main";
		} else {
			session.setAttribute("ssKey", ssKey);
			content =  "notice/NotiDetail.jsp";
			page = "Main";
		}
		model.addAttribute("content", content);
		model.addAttribute("notice", notice);
		return page;
	}
	
	@PostMapping("/NotiUpForm")
	public String NotiUpForm(HttpServletRequest req, 
							HttpServletResponse res, 
							PageVO pageVO, 
							NoticeVO nvo,
							Model model) {
		String page = null;
		String msg = null;
		String url = null;

		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if (ssKey != null && ssKey.getM_role().equals("admin")) {
			session.setAttribute("ssKey", ssKey);
			model.addAttribute("content", "notice/NoticeUpForm.jsp");
			model.addAttribute("notice", nvo);
			page = "Main";
		} else {
			url = "/login";
			msg = "세션이 종료되었습니다. \\n 로그인이 필요합니다.";
			page = "MsgPage";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}
		
		return page;
	}

	@PostMapping("/NotiUpProc")
	public String NotiUpProc(HttpServletRequest req, 
							HttpServletResponse res, 
							PageVO pageVO, 
							NoticeVO nvo,
							Model model) {
		String page = "MsgPage";
		String msg = null;
		String url = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if (ssKey != null && ssKey.getM_role().equals("admin")) {
			int r = noticeService.noticeUpProc(nvo);
			/* log.info("nvo==>"+nvo); */
			if (r > 0) {
				msg="공지사항 수정 성공!";
			} else {
				msg="공지사항 수정 실패!";							
			}
			url = "/noticeFIX";
		} else {
			url = "/login";
			msg = "세션이 종료되었습니다. \\n 로그인이 필요합니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return page;
	}
	
	@PostMapping("/NotiDelProc")
	public String NotiDelProc(HttpServletRequest req, 
							HttpServletResponse res, 
							PageVO pageVO, 
							NoticeVO nvo,
							Model model) {
		String page = "MsgPage";
		String msg = null;
		String url = null;
		HttpSession session = req.getSession();
		MemberVO ssKey = (MemberVO) session.getAttribute("ssKey");
		if (ssKey != null && ssKey.getM_role().equals("admin")) {
			session.setAttribute("ssKey", ssKey);
			int r = noticeService.deleteNotice(nvo);
			if (r > 0) {
				msg="공지사항 삭제 성공!";
			} else {
				msg="공지사항 삭제 실패!";							
			}
			url = "/noticeFIX";
		} else {
			url = "/login";
			msg = "세션이 종료되었습니다. \\n 로그인이 필요합니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return page;
	}
	
	
	 
	
	
	
}
