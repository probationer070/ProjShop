package com.ecom6.service.cart;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.common.vo.PageVO;

public interface CartService {

	Boolean findCart(CartVO cvo);

	void addCart(CartVO cvo);

	void updateCart(CartVO cvo);

	void deleteCart(CartVO cvo);

	Map<String, Object> getCartItemList(CartVO cvo, PageVO pgVo);




}
