package com.ecom6.service.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.VO.cart.CartVO;
import com.ecom6.VO.order.OrderInfo;
import com.ecom6.VO.order.OrderVO;
import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVO;
import com.ecom6.dao.order.OrderDao;
import com.ecom6.wrapper.order.OrderWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	

	@Transactional
	@Override
	public OrderVO getOrder(OrderVO ovo) {
		List<OrderVO> list = orderDao.getOrders(ovo);
		if(list.size()>0) 
			return list.get(0);
		else return null;
	}
	
	@Transactional
	@Override
	public void orderStateUpdate(ArrayList<String> tdArr) {
		List<OrderVO> list = new ArrayList<>();
		for (int i=0; i < tdArr.size(); i+=4) {
			OrderVO ovo = new OrderVO();
			int n=0, no=0;
			String mid = null;
			// 한 개씩 꺼내서 담기
			
			n = tdArr.get(i).indexOf(":"); // 첫번째 o_no
			no = Integer.parseInt(tdArr.get(i).substring(n+1));
			ovo.setO_no(no);
			
			n = tdArr.get(i+1).indexOf(":"); // 첫번째 p_no
			no = Integer.parseInt(tdArr.get(i+1).substring(n+1));
			ovo.setP_no(no);
			
			n = tdArr.get(i+2).indexOf(":"); // 첫번째 p_no
			mid = tdArr.get(i+2).substring(n+1);
			ovo.setMem_id(mid);
			
			n = tdArr.get(i+3).indexOf(":"); // 첫번째 p_no
			no = Integer.parseInt(tdArr.get(i+3).substring(n+1));
			ovo.setState(no);
			
			// 리스트에 추가
			list.add(ovo);
		}
		orderDao.orderStateUpdate(list);
	
	}

	@Override
	public int updateState(OrderVO ovo) {
		return orderDao.updateState(ovo);
	}

	@Override
	public int deleteOrder(OrderVO ovo) {
		return orderDao.deleteOrder(ovo);
	}
	
	@Override
	public int insertOrders(ArrayList<CartVO> cartList) {
		List<OrderVO> list = new ArrayList<OrderVO>(cartList.size());
		for(CartVO cartItem : cartList) {
			OrderVO order = OrderWrapper.convertCartToOrder(cartItem);
			log.info("order ====> "+order);
			list.add(order);			
		}
		log.info("orderList ====> "+list);

	    return orderDao.insertOrders(list);
	}

    @Transactional
	@Override
	public Map<String, Object> getOrders(OrderVO ovo, PageVO pgVo) {
    	Map<String, Object> reSet = new HashMap<>();
    	//total
    	log.info("ovo ======> "+ovo);
    	int cnt = orderDao.getTotalOrders(ovo);
    	//페이지 계산
    	if(pgVo.getCurBl()<=0) pgVo.setCurBl(1);
		if(pgVo.getCurPg()<=0) pgVo.setCurPg(1);
		int start = (pgVo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgVo.getCurPg()*PageInfo.ROW_OF_PAGE)>cnt?
				   cnt : pgVo.getCurPg()*PageInfo.ROW_OF_PAGE;
		ovo.setStart(start);
		ovo.setEnd(end);
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
		
    	// 리스트 구하는 거
    	List<OrderVO> orders = orderDao.getOrders(ovo);
    	reSet.put("orderTot", cnt);
		//페이지 저장
    	reSet.put("pgVo", pgVo);
    	reSet.put("orders", orders);
		return reSet;
	}

	@Override
	public Map<String, Object> getOrderList(OrderVO ovo, PageVO pgVo) {
		Map<String, Object> reSet = new HashMap<String, Object>();
		int cnt = orderDao.getTotalOrders(ovo);
		
		//페이지 계산
    	if(pgVo.getCurBl()<=0) pgVo.setCurBl(1);
		if(pgVo.getCurPg()<=0) pgVo.setCurPg(1);
		int start = (pgVo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgVo.getCurPg()*PageInfo.ROW_OF_PAGE)>cnt?
				   cnt : pgVo.getCurPg()*PageInfo.ROW_OF_PAGE;
		ovo.setStart(start);
		ovo.setEnd(end);
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
		
		List<OrderVO> orders = orderDao.getOrderList(ovo);
		reSet.put("orderTot", cnt);
		reSet.put("orders", orders);
		reSet.put("pgVo", pgVo);
		return reSet;
	}

	@Override
	public int getTotalAmount(OrderVO ovo) {
		return orderDao.getTotalAmount(ovo);
	}

	@Override
	public OrderVO getTrandOrder(OrderVO ovo) {
		return orderDao.getTrandOrder(ovo);
	}

	@Override
	public void createOrder(OrderInfo oio) {
		orderDao.createOrder(oio);
	}

	@Override
	public Map<String, Object> getMemOrders(OrderInfo oio, PageVO pgVo) {
		Map<String, Object> reSet = new HashMap<>();
    	//total
    	int cnt = orderDao.getTotalMemOrders(oio);
    	//페이지 계산
    	if(pgVo.getCurBl()<=0) pgVo.setCurBl(1);
		if(pgVo.getCurPg()<=0) pgVo.setCurPg(1);
		int start = (pgVo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgVo.getCurPg()*PageInfo.ROW_OF_PAGE)>cnt?
				   cnt : pgVo.getCurPg()*PageInfo.ROW_OF_PAGE;
		oio.setStart(start);
		oio.setEnd(end);
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
		
    	// 리스트 구하는 거
    	List<OrderVO> orders = orderDao.getMemOrders(oio);
    	reSet.put("orderTot", cnt);
		//페이지 저장
    	reSet.put("pgVo", pgVo);
    	reSet.put("orders", orders);
		return reSet;
	}

	@Override
	public void deleteOrderMemView(OrderInfo oio) {
		orderDao.deleteOrderMemView(oio);
	}

	
}