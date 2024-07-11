package com.ecom6.service.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVO;
import com.ecom6.dao.notice.NoticeDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public Map<String, Object> getNoticeList(NoticeVO nvo, PageVO pgVo) {
		Map<String, Object> reSet = new HashMap<String, Object>();
		// 전체 공지사항 개수
		int noticeTot = noticeDao.getNoticeCnt();
		// page 계산
		if (pgVo.getCurBl()<=0) pgVo.setCurBl(1);
		if (pgVo.getCurPg()<=0) pgVo.setCurPg(1);
		
		int start = (pgVo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgVo.getCurPg() * PageInfo.ROW_OF_PAGE) > noticeTot ?
				noticeTot : pgVo.getCurPg()*PageInfo.ROW_OF_PAGE;
		nvo.setStart(start);
		nvo.setEnd(end);
		// 페이지 수 계산
		int pgCnt = ((noticeTot % PageInfo.ROW_OF_PAGE) == 0) ?
					(noticeTot / PageInfo.ROW_OF_PAGE) :
					(noticeTot / PageInfo.ROW_OF_PAGE)+1;
		pgVo.setPgCnt(pgCnt);
		
		// 페이지 블록 계산
		int blCnt = (pgCnt % PageInfo.PAGE_OF_BLOCK == 0) ?
					(pgCnt / PageInfo.PAGE_OF_BLOCK) :
					(pgCnt / PageInfo.PAGE_OF_BLOCK)+1;
		pgVo.setBlCnt(blCnt);
		// startPg
		int startPg = (pgVo.getCurBl()-1)*PageInfo.PAGE_OF_BLOCK+1;
		// endPg
		int endPg = pgVo.getCurBl()*PageInfo.PAGE_OF_BLOCK > pgCnt ?
					pgCnt : pgVo.getCurBl()*PageInfo.PAGE_OF_BLOCK;
		pgVo.setStartPg(startPg);
		pgVo.setEndPg(endPg);
		log.info("pgCnt =====> "+pgCnt);
		log.info("blCnt =====> "+blCnt);
		log.info("endPg =====> "+endPg);
		log.info("startPg =====> "+startPg);
		
		List<NoticeVO> NoticeList = noticeDao.getNoticeList(nvo);
		
		reSet.put("pgVo", pgVo);
		reSet.put("noticeTot", noticeTot); 
		reSet.put("NoticeList", NoticeList);
		
		return reSet;
	}

	@Override
	public int noticeProc(NoticeVO nvo) {
		return noticeDao.noticeProc(nvo);
	}
	
	@Transactional
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		int r = noticeDao.upreadCnt(nvo);
		if (r>0) {
			return noticeDao.noticeDetail(nvo);			
		} else {
			return null;
		}
	}

	@Override
	public int noticeUpProc(NoticeVO nvo) {
		return noticeDao.noticeUpProc(nvo);
	}

	@Override
	public int deleteNotice(NoticeVO nvo) {
		return noticeDao.deleteNotice(nvo);
	}


//	@Override
//	public int noticeDelProc(NoticeVO nvo) {
//		return noticeDao.noticeDelProc(nvo);
//	}

}
