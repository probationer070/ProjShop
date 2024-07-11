<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/css/common.css"> 
<link rel="stylesheet" href="/css/tabMenu.css">
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>  
</head>
<body onload="document.getElementById('t1').click();">
  <h1 style="text-align: center">
    <a href="/">Home</a>
  </h1>
  <div class="tabmenu">
    <ul>
      <li id="tab1" class="btnCon">
        <a class="btn first" href="#tab1" id="t1">아이디 찾기</a>
          <div class="tabCon">
            <div id="large_login_box">
              <form action="searchProc" method="post" name="tabForm1">
              <table>
                <tr>
                  <td>
                    <input type="text" name="m_name" class="chk1" title="이름" placeholder="이름을 입력하시오">
                    <br>
                    <input type="text" name="m_phone" class="chk1" title="전화번호" placeholder="전화번호를 입력하시오">
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="submit1">
                      <div id="large_login_btn">아이디 찾기</div>
                    </div>
                  </td>
                </tr>
              </table>
              </form>
            </div>
          </div>
      </li>
      <li id="tab2" class="btnCon">
        <a class="btn first" href="#tab2">비밀번호 찾기</a>
          <div class="tabCon">
            <div id="large_login_box">
              <form action="searchProc" method="post" name="tabForm2">
                <table>
                  <tr>
                   <td>
                    <input type="text" name="mem_id" class="chk2" title="아이디" placeholder="아이디를 입력하시오">
                    <br>
                    <input type="password" name="m_passwd" class="chk2" title="비밀번호" 
                    		placeholder="비밀번호를 입력하시오" id="check1">
                    <br>
                    <input type="password" name="m_passwd2" class="chk2" title="비밀번호 확인" 
                    		placeholder="비밀번호 확인을 입력하시오" id="check2">
                    <br>
                    <font id="check" size="2" color="green"></font>
                   </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="submit2">
                        <div id="large_login_btn">새비밀번호 설정</div>
                      </div>
                    </td>
                  </tr>
                </table>
              </form>
            </div>
          </div>
      </li>
    </ul>
  </div>
</body>
</html>