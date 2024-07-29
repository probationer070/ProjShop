package com.ecom6.dao.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.common.vo.PageVO;

@Mapper
public interface NoticeDao {

	int getNoticeCnt();

	List<NoticeVO> getNoticeList(NoticeVO nvo);

	int noticeProc(NoticeVO nvo);

	NoticeVO noticeDetail(NoticeVO nvo);

	int upreadCnt(NoticeVO nvo);

	int noticeUpProc(NoticeVO nvo);

	int deleteNotice(NoticeVO nvo);
	
	int getSearch(String string);
}