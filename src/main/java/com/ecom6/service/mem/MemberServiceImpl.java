package com.ecom6.service.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVO;
import com.ecom6.dao.mem.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public MemberVO getMember(MemberVO mvo) {
		return memberDao.getMember(mvo);
	}

	@Override
	public int idCheck(String mem_id) {
		return memberDao.idCheck(mem_id);
	}

	@Override
	public int memberJoin(MemberVO mvo) {
		return memberDao.memberJoin(mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return memberDao.memberUpdate(mvo);
	}

	@Override
	public Map<String, Object> getMemberList(MemberVO mvo, PageVO pgVo) {
		Map<String, Object> reSet = new HashMap<>();
		int cnt = memberDao.getTotalMember(null);
		
		// 페이지 계산로직
		if(pgVo.getCurBl()<=0) pgVo.setCurBl(1);
		if(pgVo.getCurPg()<=0) pgVo.setCurPg(1);
		int start = (pgVo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgVo.getCurPg()*PageInfo.ROW_OF_PAGE)>cnt?
				   cnt : pgVo.getCurPg()*PageInfo.ROW_OF_PAGE;
		mvo.setStart(start);
		mvo.setEnd(end);
		//페이지 수 계산
		int pgCnt = (cnt%PageInfo.ROW_OF_PAGE==0)?
				     cnt/PageInfo.ROW_OF_PAGE:
					 cnt/PageInfo.ROW_OF_PAGE+1;
		pgVo.setPgCnt(pgCnt);
		
		//페이지 블록 계산
		int blockCnt = (pgCnt%PageInfo.PAGE_OF_BLOCK==0)?
				       pgCnt/PageInfo.PAGE_OF_BLOCK:
				       pgCnt/PageInfo.PAGE_OF_BLOCK+1;
		
		pgVo.setBlCnt(blockCnt);
		//startPg
		int startPg = (pgVo.getCurBl()-1)*PageInfo.PAGE_OF_BLOCK+1;
		//endPg
		int endPg = pgVo.getCurBl()*PageInfo.PAGE_OF_BLOCK>pgCnt?
				    pgCnt:pgVo.getCurBl()*PageInfo.PAGE_OF_BLOCK;
		pgVo.setStartPg(startPg);
		pgVo.setEndPg(endPg);
		
		List<OrderVO> members = memberDao.getMemberList(mvo);
		
		reSet.put("pgVo", pgVo);
		reSet.put("memTot", cnt);
		reSet.put("members", members);
		return reSet;
	}

	@Override
	public int memDeleteProc(MemberVO mvo) {
		return memberDao.memDeleteProc(mvo);
	}

	@Override
	public int updatePasswd(MemberVO mvo) {
		return memberDao.updatePasswd(mvo);
	}

	@Override
	public String searchId(MemberVO mvo) {
		return memberDao.searchId(mvo);
	}
}
