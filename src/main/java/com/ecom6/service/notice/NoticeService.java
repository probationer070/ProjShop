package com.ecom6.service.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.common.vo.PageVO;

public interface NoticeService {

	Map<String, Object> getNoticeList(NoticeVO nvo, PageVO pgVo);

	int noticeProc(NoticeVO nvo);

	NoticeVO noticeDetail(NoticeVO nvo);

	int noticeUpProc(NoticeVO nvo);


	int deleteNotice(NoticeVO nvo);

	List<NoticeVO> getNotice(NoticeVO nvo); // 스크롤 페이징 용

	int getSearch(HashMap<String, String> param);
}