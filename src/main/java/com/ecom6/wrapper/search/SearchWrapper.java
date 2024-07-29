package com.ecom6.wrapper.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.service.notice.NoticeService;
import com.ecom6.service.product.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("searchWrapper")
public class SearchWrapper {

	@Autowired
	private ProductService productService;

	@Autowired
	private NoticeService noticeService;

	public HashMap<String, Object> SearchProc(HashMap<String, String> param, PageVO pgVo) {
		HashMap<String, Object> reSet = new HashMap<String, Object>();
		HashMap<String, Object> search_item = null;

		int p_search = productService.getSearch(param);
		int n_search = noticeService.getSearch(param);
		if (param.get("bucket")!=null) {
			if (Integer.parseInt(param.get("bucket")) == 1) {
				ProductVO pvo = new ProductVO();
				pvo.setText(param.get("text"));
				search_item = (HashMap<String, Object>) productService.getProductsList(pvo, pgVo);

				reSet.put("search_list", (List<Object>) search_item.get("productList"));

			} else if (Integer.parseInt(param.get("bucket")) == 2) {
				NoticeVO nvo = new NoticeVO();
				nvo.setText(param.get("text"));
				search_item = (HashMap<String, Object>) noticeService.getNoticeList(nvo, pgVo);
				reSet.put("search_list", (List<Object>) search_item.get("NoticeList"));
			} 
		} else {
			ProductVO pvo = new ProductVO();
			pvo.setText(param.get("text"));
			search_item = (HashMap<String, Object>) productService.getProductsList(pvo, pgVo);

			reSet.put("search_list", (List<Object>) search_item.get("productList"));
		}

		reSet.put("p_search", p_search);
		reSet.put("n_search", n_search);

		return reSet;
	}



}