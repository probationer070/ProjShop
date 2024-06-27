package com.ecom6.service.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.order.OrderVO;
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
	public Map<String, Object> getMemberList(MemberVO mvo) {
		Map<String, Object> reSet = new HashMap<>();
		
		int cnt = memberDao.getTotalMember(null);
		List<OrderVO> members = memberDao.getMemberList(mvo);
		reSet.put("memTot", cnt);
		reSet.put("members", members);
		return reSet;
	}

	@Override
	public int memDeleteProc(MemberVO mvo) {
		return memberDao.memDeleteProc(mvo);
	}

}
