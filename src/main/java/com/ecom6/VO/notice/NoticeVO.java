package com.ecom6.VO.notice;

import java.time.LocalDate;

import com.ecom6.VO.mem.MemberVO;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class NoticeVO {
	private int rn;
	private int noti_no;
	private int readcount;
	private String subject;
	private String content;
	private String writer;
	private String vdate;
	private String regdate;
	private String state;
	private int start;
	private int end;
}