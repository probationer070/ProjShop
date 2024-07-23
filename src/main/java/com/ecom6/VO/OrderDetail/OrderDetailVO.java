package com.ecom6.VO.OrderDetail;

import com.ecom6.VO.order.OrderVO;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class OrderDetailVO {
	private int rn;
	private int od_no;
	private int price;
	private int quantity;
	private int totalprice;
	private String p_name;
	private String address;
	private String address2;
	private String od_regdate;
	private String credit;
}
