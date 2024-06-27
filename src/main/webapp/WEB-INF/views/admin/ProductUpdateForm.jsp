<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="./css/product.css"> 
<script type="text/javascript" src="./js/product.js"></script> 
</head>
<body>
    <div id="productmgt">
     <form action="" name="form1" method="post" enctype="multipart/form-data">
     <table class="table table-hover">
       <tr>
         <th colspan="2" style="text-align: center"> <h3>상품수정</h3></th>
       </tr>
         <tr>
           <th class = "pcol3 alignRight">상품명</th>
	       <th class = "col2">
	         <input type="text" name="p_name" class="form-control" 
	         title="상품명" value="${product.p_name}" >
	         <input type="hidden" name="p_no" class="form-control" 
	         title="상품명" value="${product.p_no }" >
	       </th>
          </tr>
         <tr>
           <th class = "pcol3 alignRight">재고수량</th>
	       <th class = "col2">
	         <input type="text" name="stock" class="form-control inNum num" 
	         title="재고수량" value="${product.stock}" >
	       </th>
          </tr>
         <tr>
           <th class = "pcol3 alignRight ">상품단가</th>
	       <th class = "col2">
	         <input type="text" name="price" class="form-control inNum num" 
	         title="상품단가" value="${product.price}" >
	       </th>
          </tr>
         <tr>
           <th class = "pcol3 alignRight">상품설명</th>
	       <th class = "col2">
	         <input type="text" name="detail" class="form-control" 
	         title="상품설명" value="${product.detail}" >
	       </th>
          </tr>
         <tr>
           <th class = "pcol3 alignRight">상품이미지</th>
	       <th class = "col2">
	         <table style="width: 100%">
	           <tr>
	            <td>
	             <a href="/upload/${product.image}">
	             <img alt="이미지" src="/upload/${product.image}"
                    height="100" width="100">
	             </a>
                </td>
                <td>&nbsp;&nbsp;</td>
	            <td>
	            <input type="file" name="image2" class="form-control" 
	              title="이미지">
	            <input type="hidden" name="image" value="${product.image}">
	            </td>
	           </tr>
	         </table>
	       </th>
          </tr>
     </table>
     <div class="btnArea">
       <input type="button"
        name="updatePro" class="btn btn-outline-success psubmit" value="수정완료">
       <input type="button" class="btn btn-outline-secondary"
         onclick="javascript:location.href='/productMgt'" value="상품목록">
     </div>
     </form>
    </div>
</body>
</html>