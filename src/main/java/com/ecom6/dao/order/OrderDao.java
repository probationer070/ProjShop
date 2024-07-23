package com.ecom6.dao.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.VO.order.OrderVO;

@Mapper
public interface OrderDao {

	int insertOrders(List<OrderVO> list);

	List<OrderVO> getOrders(OrderVO ovo);

	List<OrderVO> getOrderList(OrderVO ovo);

	void orderStateUpdate(List<OrderVO> list);

	int updateState(OrderVO ovo);

	int deleteOrder(OrderVO ovo);
	
	List<OrderVO> getOrdersList(NoticeVO nvo);

	int getTotalOrders(OrderVO ovo);

	int getMemOrdersTotal(OrderVO ovo);

}
