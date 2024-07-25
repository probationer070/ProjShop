<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ProductList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/product.js"></script> 
<title>쇼핑몰</title>
</head>
<body>
   <div id="productmgt">
     <h2 style="text-align: center;">상품목록</h2>
     <div align="right" class="mb-2">
       <button class="btn btn-dark">상품수: ${pcnt}</button>
     </div>
     <table class="table table-hover text-center table-bordered border-dark">
       <thead>
         <tr>
            <th class="pcol pcol1">상품번호</th>
		    <th class="pcol pcol2">상품명</th>
		    <th class="pcol pcol3">상품가격</th>
		    <th class="pcol pcol4">등록일</th>
		    <th class="pcol pcol5">재고</th>
         </tr>
       </thead>
       <tbody>
        <c:choose>
          <c:when test="${fn:length(productList)==0}">
            <tr>
              <th colspan="5">등록된 상품이 없습니다.</th>
            </tr>
          </c:when>
          <c:when test="${fn:length(productList)>0}">
            <c:forEach var="product" items="${productList}">
             <tr>
                <th class="pcol pcol1">
                 <input type="text" name="p_no" value="${product.p_no}" 
                     class="" style="text-align: center;">
                 </th>
			    <th class="pcol pcol2">
			     <input type="text" name="p_name" value=" ${product.p_name}" 
                     class="pDetail2" readonly="readonly">
                </th>
			    <th class="pcol pcol3">
			     <input type="text" name="price" value="${product.price}" 
                     class="num" style="text-align: center;">
			   </th>
			    <th class="pcol pcol4">
			     <input type="text" name="pr_date" value=" ${product.pr_date}" 
                     class="" style="text-align: center;">
			   </th>
			    <th class="pcol pcol5">
			     <input type="text" name="stock" value=" ${product.stock}" 
                     class="num" style="text-align: center;">
			    </th>
             </tr>
            </c:forEach>
          </c:when>
        </c:choose>
       </tbody>
     </table>
    
      <!-- 페이지  -->
     <div id="Pg" align="center">
     <c:if test="${pgVo.startPg>PBlock}">
	     <font color="4c5317">
	         <a href="/productFIX?curPg=${pgVo.startPg-PBlock}&curBl=${pgVo.curBl-1}&text=${text}">[이전]</a>
	     </font>
     </c:if>
     <c:forEach var="pgno" begin="${pgVo.startPg}" end="${pgVo.endPg}" step="1">
         <c:set scope="page" var="list" 
                  value="./productFIX?curPg=${pgno}&curBl=${pgVo.curBl}&text=${text}"/> 
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
               <a href="./productFIX?curPg=${pgVo.startPg+PBlock}&curBl=${pgVo.curBl+1}&text=${text}">[다음]</a>
             </font>
       </c:if> 
     </div>
     <div style="margin-bottom: 15px;"></div>
     <!-- 페이지 끝 -->
     
     <div class="btnArea" align="right">
     	<button type="button" class="btnJoin" onclick="location.href='/productInForm'">
        상품등록
    	</button>
     </div>
   </div>
</body>
</html>