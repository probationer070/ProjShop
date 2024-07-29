package com.ecom6.service.cart;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.common.vo.PageVO;

public interface CartService {

	Boolean findCart(CartVO cvo);

	void addCart(CartVO cvo);

	void deleteCart(ArrayList<CartVO> cartList);

	void updateCartItem(CartVO cvo);

	void deleteCartItem(CartVO cvo);



	Map<String, Object> getCartItemList(String mem_id);

}
