package com.ecom6.service.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageVO;

public interface ProductService {

	Map<String, Object> getProductsList(ProductVO pvo, PageVO pgVo);

	int insertProduct(ProductVO pvo, MultipartFile file);

	ProductVO productDetail(ProductVO pvo);

	void updateProdStock(ArrayList<CartVO> cartList);

	int updateProduct(ProductVO pvo, MultipartFile file);

	int deleteProduct(ProductVO pvo) throws Exception;

	int updateStock(OrderVO ovo);

	int getSearch(HashMap<String, String> param);

	List<ProductVO> getProduct(ProductVO pvo);

}