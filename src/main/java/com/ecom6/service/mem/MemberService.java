package com.ecom6.service.mem;

import java.util.Map;

import com.ecom6.VO.mem.MemberVO;

public interface MemberService {

	MemberVO getMember(MemberVO mvo);

	int idCheck(String mem_id);

	int memberJoin(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	Map<String, Object> getMemberList(MemberVO mvo);

	int memDeleteProc(MemberVO mvo);

}
