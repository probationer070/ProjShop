package com.ecom6.dao.product;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageVO;

@Mapper
public interface ProductDao {

	int getProductCnt(ProductVO pvo);

	List<ProductVO> getProductList(ProductVO pvo);

	int insertProduct(ProductVO pvo);

	ProductVO productDetail(int p_no);

	void updateProdStock(ArrayList<CartVO> cartList);

	int updateProduct(ProductVO pvo);

	int deleteProduct(ProductVO pvo);

	int updateStock(OrderVO ovo);
	
	int getSearch(String string);
}