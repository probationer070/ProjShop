package com.ecom6.service.cart;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.common.vo.PageVO;

public interface CartService {

	Map<String, Object> getCartItemList(CartVO cvo);

	Boolean findCart(CartVO cvo);

	void addCart(CartVO cvo);




}
