<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/product.css"> 
<script type="text/javascript" src="/js/product.js"></script> 
</head>
<body>
    <div id="productmgt">
     <form action="" name="form1" method="post" enctype="multipart/form-data">
     <table class="table table-hover">
       <tr>
         <th colspan="3" style="text-align: center"> <h3>상품등록</h3></th>
       </tr>
         <tr>
           <th class = "col1">상품명</th>
	       <th class = "col2">
	         <input type="text" name="p_name" class="form-control chk" 
	         title="상품명" placeholder="상품명을 입력하시오">
	       </th>
	       <th class = "col3"><font></font></th>
          </tr>
         <tr>
           <th class = "col1">재고수량</th>
	       <th class = "col2">
	         <input type="text" name="stock" class="form-control chk inNum" 
	         title="재고수량" placeholder="재고수량을 입력하시오">
	       </th>
	       <th class = "col3"><font></font></th>
          </tr>
         <tr>
           <th class = "col1 ">상품단가</th>
	       <th class = "col2">
	         <input type="text" name="price" class="form-control chk inNum" 
	         title="상품단가" placeholder="상품단가를 입력하시오">
	       </th>
	       <th class = "col3"><font></font></th>
          </tr>
         <tr>
           <th class = "col1">상품설명</th>
	       <th class = "col2">
	         <input type="text" name="detail" class="form-control chk" 
	         title="상품설명" placeholder="상품설명을 입력하시오">
	       </th>
	       <th class = "col3"><font></font></th>
          </tr>
         <tr>
           <th class = "col1">상품이미지</th>
	       <th class = "col2">
	         <input type="file" name="image2" class="form-control chk" 
	         title="이미지" placeholder="이미지를 첨부하시오">
	       </th>
	       <th class = "col3"><font></font></th>
          </tr>
     </table>
     <div class="btnArea">
       <button type="button"
        name="insert" class="btn btn-outline-primary psubmit">등록및전송</button>
       <button type="button"
         class="btn btn-outline-secondary" 
          onclick="javascript:location.href='/productMgt'">상품목록</button>
<!--        <button type="button" -->
<!--         name="update" class="btn btn-outline-primary psubmit">상품수정</button> -->
     </div>
     </form>
    </div>
</body>
</html>