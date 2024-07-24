package com.ecom6.service.product;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.notice.NoticeVO;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.VO.product.ProductVO;
import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVO;
import com.ecom6.dao.product.ProductDao;
import com.ecom6.utils.WebpUtils;
import com.ecom6.wrapper.order.OrderWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceimpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;

	@Override
	public Map<String, Object> getProductsList(ProductVO pvo, PageVO pgVo) {
		Map<String, Object> reSet = new HashMap<String, Object>();
		int cnt = productDao.getProductCnt(pvo);
		
		// 페이지 계산로직
		if(pgVo.getCurBl()<=0) pgVo.setCurBl(1);
		if(pgVo.getCurPg()<=0) pgVo.setCurPg(1);
		int start = (pgVo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgVo.getCurPg()*PageInfo.ROW_OF_PAGE)>cnt?
				   cnt : pgVo.getCurPg()*PageInfo.ROW_OF_PAGE;
		pvo.setStart(start);
		pvo.setEnd(end);
		//페이지 수 계산
		int pgCnt = (cnt%PageInfo.ROW_OF_PAGE==0)?
				     cnt/PageInfo.ROW_OF_PAGE:
					 cnt/PageInfo.ROW_OF_PAGE+1;
		pgVo.setPgCnt(pgCnt);
		
		//페이지 블록 계산
		int blockCnt = (pgCnt%PageInfo.PAGE_OF_BLOCK==0)?
				       pgCnt/PageInfo.PAGE_OF_BLOCK:
				       pgCnt/PageInfo.PAGE_OF_BLOCK+1;
		
		pgVo.setBlCnt(blockCnt);
		//startPg
		int startPg = (pgVo.getCurBl()-1)*PageInfo.PAGE_OF_BLOCK+1;
		//endPg
		int endPg = pgVo.getCurBl()*PageInfo.PAGE_OF_BLOCK>pgCnt?
				    pgCnt:pgVo.getCurBl()*PageInfo.PAGE_OF_BLOCK;
		pgVo.setStartPg(startPg);
		pgVo.setEndPg(endPg);
		log.info("pvo logging =====> "+pvo);
		log.info("pcnt logging =====> "+cnt);
		
		List<ProductVO> productList = productDao.getProductList(pvo);
		
		reSet.put("pgVo", pgVo);
		reSet.put("pcnt", cnt); 
		reSet.put("productList", productList);
		
		return reSet;
	}

	@Override
	public int insertProduct(ProductVO pvo, MultipartFile file) {
//		String originalFileNm = file.getOriginalFilename();
//		File destinationFile;
//		if (originalFileNm==null || originalFileNm.length()==0) {
//			pvo.setImage("ready.gif");
//		} else {
//			pvo.setImage(originalFileNm);
//			destinationFile = new File(pvo.getPath()+originalFileNm);
//			// 실제 파일 전송
//			try {
//				file.transferTo(destinationFile);
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return productDao.insertProduct(pvo);
		
		String originalFileNm = file.getOriginalFilename();
        String webpFileName = originalFileNm.substring(0, originalFileNm.lastIndexOf(".")) + ".webp";
        File destinationFile;

        if (originalFileNm == null || originalFileNm.length() == 0) {
            pvo.setImage("ready.gif");
        } else {
            pvo.setImage(webpFileName);
            destinationFile = new File(pvo.getPath() + originalFileNm);

            try {
                // 원본 파일을 위치에 저장
                file.transferTo(destinationFile);

                // WebP 파일을 저장할 위치 설정
                File webpOutputFile = new File(pvo.getPath() + webpFileName);

                // 이미지 파일을 WebP 형식으로 변환 및 저장
                WebpUtils.imageFileToWebpImageFile(destinationFile, webpOutputFile);

                // 임시 파일 삭제
                Files.deleteIfExists(destinationFile.toPath());
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
	
	@Override
	public void updateProdStock(ArrayList<CartVO> cartList) {
		List<OrderVO> list = new ArrayList<OrderVO>(cartList.size());
		for(CartVO cartItem : cartList) {
			OrderVO order = OrderWrapper.convertCartToOrder(cartItem);
			list.add(order);			
		}
		productDao.updateProdStock(cartList);
	}
   
	@Override
	public int getSearch(HashMap<String, String> param) {
		return productDao.getSearch(param.get("text"));
	}

	@Override
	public List<ProductVO> getProduct(ProductVO pvo) {
		List<ProductVO> productList = productDao.getProductList(pvo);
		return productList;
	}

	}
	