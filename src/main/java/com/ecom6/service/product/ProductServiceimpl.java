package com.ecom6.service.product;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ecom6.VO.order.OrderVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageVO;
import com.ecom6.dao.product.ProductDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceimpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;

	@Override
	public Map<String, Object> getProductsList(PageVO pgVo) {
		Map<String, Object> reSet = new HashMap<String, Object>();
		int cnt = productDao.getProductCnt();
		
		// 페이지 계산로직
		
		
		List<ProductVO> productList = productDao.getProductList(pgVo);
		
		reSet.put("pcnt", cnt); 
		reSet.put("productList", productList);
		
		return reSet;
	}

	@Override
	public int insertProduct(ProductVO pvo, MultipartFile file) {
		String originalFileNm = file.getOriginalFilename();
		File destinationFile;
		if (originalFileNm==null || originalFileNm.length()==0) {
			pvo.setImage("ready.gif");
		} else {
			pvo.setImage(originalFileNm);
			destinationFile = new File(pvo.getPath()+originalFileNm);
			// 실제 파일 전송
			try {
				file.transferTo(destinationFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return productDao.insertProduct(pvo);
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		return productDao.productDetail(pvo.getP_no());
	}

	@Override
	public void updateStocks(Hashtable<Integer, OrderVO> hCartList) {
		List<OrderVO> list = new ArrayList<OrderVO>(hCartList.keySet().size());
		for (int key : hCartList.keySet()) {
			list.add(hCartList.get(key));
		}
		productDao.updateStocks(list);
	}

	@Override
	public int updateProduct(ProductVO pvo, MultipartFile file) {
		String originalFileNm = file.getOriginalFilename();
		File destinationFile;
		if (pvo.getImage().equals("ready.gif") || pvo.getImage()==null) {
			if (originalFileNm==null || originalFileNm.length()==0)
				pvo.setImage("ready.gif");
		} else {			
			if (originalFileNm!=null && originalFileNm.length()>0) {
				pvo.setImage(originalFileNm);
				destinationFile = new File(pvo.getPath()+originalFileNm);
				// 실제 파일 전송
				try {
					file.transferTo(destinationFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		return productDao.updateProduct(pvo);
	}
	
	@Override
	public int deleteProduct(ProductVO pvo) throws Exception {
		int r = 0;
		try {
			r =  productDao.deleteProduct(pvo);
			if (r == 0) {
				throw new Exception("삭제할 제품이 없습니다.");
			}
		} catch (SQLException e) {
			throw new Exception("데이터베이스 오류: "+ e.getMessage(), e);
		}
		return r;
	}

//	@Override
//	public int updateStock(int p_no, int stock) {
//		ProductVO pvo = new ProductVO();
//		pvo.setP_no(p_no);
//		pvo.setStock(stock);
//		return productDao.updateStock(pvo);
//	}

	@Override
	public int updateStock(OrderVO ovo) {
		return productDao.updateStock(ovo);
	}
}