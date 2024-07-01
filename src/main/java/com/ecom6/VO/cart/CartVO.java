package com.ecom6.VO.cart;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CartVO {
	private int rn;
	private int cno;
	private int price;
	private int quantity;
	private int stock;
	private int p_no; // 외래키
	private String p_name;
	private String mem_id; // 외래키
	private String m_name;
	private String m_role;
	private String image;
	private int start;
	private int end;
}
