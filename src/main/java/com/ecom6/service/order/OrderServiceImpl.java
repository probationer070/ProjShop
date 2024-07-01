package com.ecom6.service.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.dao.order.OrderDao;
import com.ecom6.wrapper.order.OrderWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	
	@Transactional
	@Override
	public Map<String, Object> getOrders(OrderVO ovo) {
		Map<String, Object> reSet = new HashMap<>();
		// total
		int cnt = orderDao.getTotalOrders(ovo);
		// list
		List<OrderVO> orders = orderDao.getOrders(ovo);
		
		reSet.put("orderTot", cnt);
		reSet.put("orders", orders);
		return reSet;
	}

	@Override
	public OrderVO getOrder(OrderVO ovo) {
		List<OrderVO> list = orderDao.getOrders(ovo);
		if (list.size()>0)
			return list.get(0);
		return orderDao.getOrders(ovo).get(0);
	}

	@Override
	public Map<String, Object> getOrderList(OrderVO ovo) {
		Map<String, Object> reSet = new HashMap<>();
		
		int cnt = orderDao.getTotalOrders(null);
		List<OrderVO> orders = orderDao.getOrderList(ovo);
		log.info("OrderTot =====> "+cnt);
		reSet.put("orderTot", cnt);
		reSet.put("orders", orders);
		return reSet;
	}
	
	@Transactional
	@Override
	public void orderStateUpdate(ArrayList<String> tdArr) {
		List<OrderVO> list = new ArrayList<>();
		for (int i=0; i < tdArr.size(); i+=4) {
			OrderVO ovo = new OrderVO();
			int n=0, no=0;
			String mid = null;
			// 한 개씩 꺼내서 담기
			
			n = tdArr.get(i).indexOf(":"); // 첫번째 o_no
			no = Integer.parseInt(tdArr.get(i).substring(n+1));
			ovo.setO_no(no);
			
			n = tdArr.get(i+1).indexOf(":"); // 첫번째 p_no
			no = Integer.parseInt(tdArr.get(i+1).substring(n+1));
			ovo.setP_no(no);
			
			n = tdArr.get(i+2).indexOf(":"); // 첫번째 p_no
			mid = tdArr.get(i+2).substring(n+1);
			ovo.setMem_id(mid);
			
			n = tdArr.get(i+3).indexOf(":"); // 첫번째 p_no
			no = Integer.parseInt(tdArr.get(i+3).substring(n+1));
			ovo.setState(no);
			
			// 리스트에 추가
			list.add(ovo);
		}
		orderDao.orderStateUpdate(list);
		// log.info("list ===> "+list);
	}

	@Override
	public int updateState(OrderVO ovo) {
		return orderDao.updateState(ovo);
	}

	@Override
	public int deleteOrder(OrderVO ovo) {
		return orderDao.deleteOrder(ovo);
	}

	@Override
	public int insertOrders(ArrayList<CartVO> cartList) {
		List<OrderVO> list = new ArrayList<OrderVO>(cartList.size());
		for(CartVO cartItem : cartList) {
			OrderVO order = OrderWrapper.convertCartToOrder(cartItem);
			log.info("order ====> "+order);
			list.add(order);			
		}
		log.info("orderList ====> "+list);
		
	    return orderDao.insertOrders(list);
	}

}
