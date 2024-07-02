package com.ecom6.service.order;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Map;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.common.vo.PageVO;

public interface OrderService {

	Map<String, Object> getOrders(OrderVO ovo);

	OrderVO getOrder(OrderVO ovo);

	Map<String, Object> getOrderList(OrderVO ovo);

	void orderStateUpdate(ArrayList<String> tdArr);

	int updateState(OrderVO ovo);

	int deleteOrder(OrderVO ovo);

	int insertOrders(ArrayList<CartVO> cartList);

	Map<String, Object> getOrders(OrderVO ovo, PageVO pgvo);

	Map<String, Object> getOrderList(OrderVO ovo, PageVO pgVo);



}
