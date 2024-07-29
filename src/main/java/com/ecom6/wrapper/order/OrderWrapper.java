package com.ecom6.wrapper.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.order.OrderInfo;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.service.cart.CartService;
import com.ecom6.service.order.OrderService;
import com.ecom6.service.product.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("orderWrapper")
public class OrderWrapper {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CartService cartService;

	
	@Transactional
	public Map<String, Object> orderDelete(OrderVO ovo) {
		// 삭제 가능여부 확인(1,2) 나머지 삭제 불가능. 반품로직으로 이동
		HashMap<String, Object> reMap = new HashMap<>();
		String msg=null;

		switch (ovo.getState()) {
		case 1:
		case 2: {
			// 삭제가 가능하면 상품 재고 추가
			int r = productService.updateStock(ovo);
			if (r>0) {
				int dr = orderService.deleteOrder(ovo);
				if (dr>0) 
					msg = "해당 주문 삭제 후 \\n 환불시스템으로 이동합니다";
				else
					msg = "주문 삭제 실패 \\n 해당 주문이 없습니다.";
			}
			else {
				msg = "처리 중 오류가 발생했습니다.";
			}
			
			break;
			}
		default:
			// 삭제 불가
			msg = "해당 주문은 삭제가 불가능하므로 \\n 반품을 통해 처리해야 합니다.";
		}
		
		reMap.put("msg", msg);
			
		return reMap;
	}
	
	public HashMap<String, Object> orderProc(OrderVO ovo, ArrayList<CartVO> cartList, OrderInfo oio) {
		String url=null;
		String msg=null;
		int r = orderService.insertOrders(cartList);
		OrderVO o_no = orderService.getTrandOrder(ovo);
		oio.setO_no(o_no.getO_no());
		oio.setMem_id(o_no.getMem_id());
		oio.setO_regdate(o_no.getO_regdate());

		if(r>0) {
			orderService.createOrder(oio);
			productService.updateProdStock(cartList);
			msg="주문완료했습니다.";
			url = "orderList";
			cartService.deleteCart(cartList);
		}else {
			msg="주문을 실패했습니다.\\n 관리자에게 문의바랍니다.";
			url="cartList";
		}
		HashMap<String, Object> reMap = new HashMap<String, Object>();
        reMap.put("msg", msg);		
        reMap.put("url", url);		
        reMap.put("cartList", cartList);		
		return reMap;
	}
	
	public static OrderVO convertCartToOrder(CartVO cart) {
        OrderVO order = new OrderVO();

        order.setStock(cart.getStock()); 
        order.setP_name(cart.getP_name());
        order.setP_no(cart.getP_no());
        order.setQuantity(cart.getQuantity());
        order.setPrice(cart.getPrice());
        order.setMem_id(cart.getMem_id());

        return order;
    }

	public void DeleteOnoOrders(HashMap<String, String> param) {
		OrderInfo oio = new OrderInfo();
		oio.setO_no(Integer.parseInt(param.get("o_no")));
		oio.setMem_id(param.get("mem_id"));
		orderService.deleteOrderMemView(oio);
	}
	
}
