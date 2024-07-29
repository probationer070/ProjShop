package com.ecom6.service.cart;
import com.ecom6.common.vo.PageInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.dao.cart.CartDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;


	@Override
	public Map<String, Object> getCartItemList(String mem_id) { 

		 Map<String, Object> reSet = new HashMap<String, Object>(); 
		 int cnt = cartDao.getCartItemCnt(mem_id);
		 
		 int total = 0;
		 if (cnt != 0) {
			 total = cartDao.getCartTotalPrcie(mem_id);
		 }
		 
		 // 페이지 계산로직 
		 List<OrderVO> cartList = cartDao.getCartItemList(mem_id);
		 reSet.put("subTotal", total);

		 reSet.put("cartTot", cnt);
		 reSet.put("cartList", cartList);

		 return reSet; 
	 }


	@Override
	public Boolean findCart(CartVO cvo) {

		return cartDao.findCart(cvo);
	}
	
	@Override
	public void addCart(CartVO cvo) {
		log.info("cvo111 ======> "+cvo);
		
		int quantity = cvo.getQuantity();
		if (cvo.getStock()<quantity) {
			cvo.setQuantity(quantity);
		}
		log.info("cvo222 ======> "+cvo);
		int cnt = cartDao.countCart(cvo);
		if (cnt==0) {
			log.info("cvo444 ======> "+cvo);			
			cartDao.insertCart(cvo);
		}
		else {
			log.info("cvo333 ======> "+cvo);	
			cartDao.updateCart(cvo);
		}
	}

	@Override
	public void updateCartItem(CartVO cvo) {
		cartDao.updateCartItem(cvo);
	}

	@Override
	public void deleteCartItem(CartVO cvo) {
		cartDao.deleteCartItem(cvo);
	}
	
	@Override
	public void deleteCart(ArrayList<CartVO> cartList) {
		String memId = cartList.get(0).getMem_id();
		cartDao.deleteCart(memId);
	}


}



	
	
