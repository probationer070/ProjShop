package com.ecom6.dao.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.common.vo.PageVO;

@Mapper
public interface CartDao {

	int getCartItemCnt();

	List<OrderVO> getCartItemList(CartVO cvo);

	Boolean findCart(CartVO cvo);

	int insertCart(CartVO cvo);

	int updateCart(CartVO cvo);

	int countCart(CartVO cvo);

}
