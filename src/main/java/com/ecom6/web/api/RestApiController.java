package com.ecom6.web.api;

import java.util.List;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.mem.MemberService;
import com.ecom6.service.notice.NoticeService;
import com.ecom6.service.product.ProductService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class RestApiController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ProductService productService;
	
	@PostMapping("idCheck")
	@ResponseBody
	public int idChekc(MemberVO mvo) {
		int cnt = 0;
			if (mvo.getMem_id()!=null) {
				cnt = memberService.idCheck(mvo.getMem_id());
			}
		return cnt;
	}
	
	@PostMapping("/api/getNotice")
	public List<NoticeVO> getNotice(NoticeVO nvo) {
		List<NoticeVO> noticeList = noticeService.getNotice(nvo);
		return noticeList;
	}
	
	@PostMapping("/api/getProduct")
	public List<ProductVO> getProduct(ProductVO pvo, @RequestParam HashMap<String, String> param) {
		log.info("param 값 출력 ------------> "+param);
		pvo.setText(param.get("text"));
		log.info("pvo 값 출력 ------------> "+pvo);
		List<ProductVO> productList = productService.getProduct(pvo);
		return productList;
	}
}