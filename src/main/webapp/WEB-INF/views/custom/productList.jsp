<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/product.css"> 
<link type="text/css" rel="stylesheet" href="/css/productList.css"> 
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/product.js"></script> 
<title>쇼핑몰</title>
</head>
<body>
  <div style="width:100%">
       <div class="xans-element- xans-product xans-product-listnormal ec-base-product">
         <ul class="prdList grid4" data-ez-role="layout ez-discount-tag">
		  <c:forEach var="product" items="${productList}">
           <li id="anchorBoxId_102" class="xans-record-">
             <div class="prdList__item pDetail">
               <input type="hidden" name="p_no" value="${product.p_no}">
               <div class="thumbnail">
                   <img src="/upload/${product.image}" alt="Sandwich" style="width:100%; height: 18rem;">
               </div>
               <div class="description">
                 <div class="name">
                     <span class="title displaynone">
                       <span style="font-size:13px;color:#8f1f1f;font-weight:bold;">상품명</span>
                       " :"
                     </span>
                     <span style="font-size:13px;color:#d95200;font-weight:bold;">${product.p_name}</span>
                 </div>
                 <ul class="xans-element- xans-product xans-product-listitem spec">
                   <li class=" xans-record-">
                     <strong class="title displaynone">
                       <span style="font-size:13px;color:#8f1f1f;">상품요약정보</span>
                       " :"
                     </strong>
                     <span style="font-size:13px;color:#ff3636;">${product.detail}</span>
                   </li>
                   <li class=" xans-record-">
					<strong class="title displaynone">
					  <span style="font-size:12px;color:#555555;">판매가</span>
					  " :"
					</strong>
					${product.price}원
					<input type="hidden" name="price" value="${product.price}원" class="form-control-plaintext alignRight num">
			       </li>
                 </ul>
                 <ul class="icon"></ul>
               </div>
             </div>
           </li>
           </c:forEach>
         </ul>
       </div>
     </div>
     <!-- 페이지  -->
     <div id="Pg" align="center">
     <c:if test="${pgVo.startPg>PBlock}">
	     <font color="4c5317">
	         <a href="/productList?curPg=${pgVo.startPg-PBlock}&curBl=${pgVo.curBl-1}">[이전]</a>
	     </font>
     </c:if>
     <c:forEach var="pgno" begin="${pgVo.startPg}" end="${pgVo.endPg}" step="1">
         <c:set scope="page" var="list" 
                  value="/productList?curPg=${pgno}&curBl=${pgVo.curBl}&text=${text}"/> 
         <a href="${list}" style=" text-decoration:none;">
          <c:choose>
              <c:when test="${pgVo.curPg==pgno}">
                <font color="4c5317" style="font-weight: bold;">[${pgno}]</font>
              </c:when>
              <c:otherwise>
               <font color="4c5317">[${pgno}]</font>
              </c:otherwise>
           </c:choose>
         </a>                  
    	</c:forEach>
      <c:if test="${pgVo.endPg<pgVo.pgCnt}">
             <font color="4c5317">
               <a href="./productList?curPg=${pgVo.startPg+PBlock}&curBl=${pgVo.curBl+1}">[다음]</a>
             </font>
       </c:if> 
     </div>
     <div style="margin-bottom: 15px;"></div>
     <!-- 페이지 끝 -->
</body>
</html>
