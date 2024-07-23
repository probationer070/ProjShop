package com.ecom6.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.order.OrderInfo;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.common.vo.PageVO;

public interface OrderService {

	int insertOrders(ArrayList<CartVO> cartList);

	OrderVO getOrder(OrderVO ovo);

	void orderStateUpdate(ArrayList<String> tdArr);

	int updateState(OrderVO ovo);

	int deleteOrder(OrderVO ovo);
	
	Map<String, Object> getOrders(OrderVO ovo, PageVO pgVo);

	Map<String, Object> getOrderList(OrderVO ovo, PageVO pgVo);

	int getTotalAmount(OrderVO ovo);

	OrderVO getTrandOrder(OrderVO ovo);

	void createOrder(OrderInfo oio);

	Map<String, Object> getMemOrders(OrderInfo oio, PageVO pgVo);

	void deleteOrderMemView(OrderInfo oio);

}
