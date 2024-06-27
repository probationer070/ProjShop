package com.ecom6.dao.mem;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.VO.mem.MemberVO;
import com.ecom6.VO.order.OrderVO;

@Mapper
public interface MemberDao {

	MemberVO getMember(MemberVO mvo);

	int idCheck(String mem_id);

	int memberJoin(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	int getTotalMember(Object object);

	List<OrderVO> getMemberList(MemberVO mvo);

	int memDeleteProc(MemberVO mvo);

}
