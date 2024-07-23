package com.ecom6.VO.mem;

import java.time.LocalDate;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.WebApplicationContext;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Scope(value = WebApplicationContext.SCOPE_SESSION,
proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MemberVO {
	private int rn;
	private String mem_id;
	private String m_passwd;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String zipcode;
	private String address;
	private String address2;
	private String m_job;
	private String m_role;
	private LocalDate m_regdate;
	private int start;
	private int end;
}
