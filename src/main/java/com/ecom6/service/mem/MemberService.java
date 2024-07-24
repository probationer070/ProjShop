package com.ecom6.service.mem;

import java.util.Map;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.common.vo.PageVO;

public interface MemberService {

	MemberVO getMember(MemberVO mvo);

	int idCheck(String mem_id);

	int memberJoin(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	Map<String, Object> getMemberList(MemberVO mvo, PageVO pgVo);

	int memDeleteProc(MemberVO mvo);

	int updatePasswd(MemberVO mvo);

	String searchId(MemberVO mvo);
}
