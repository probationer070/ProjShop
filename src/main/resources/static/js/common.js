$().ready(function(){
	
	// admin 아이템 상세 페이지에서 뒤로가기 누르면 메인으로 이동
	/*history.pushState(null, document.title, window.location.href);
	history.replaceState(null, document.title, '/');
	window.addEventListener('popstate', (e) => {
		location.replace('/');
	});*/
	
	$('.submit2').on('click', function(){
		var choice = this.name;
		alert(choice)
		// 팝업을 띄우고 비밀번호 확인
		var _left = Math.ceil((window.screen.width - 600) / 2);
		var _top = Math.ceil((window.screen.height - 200) / 2);
		openWin = window.open("/pwCheck", "pwCheck",
			"width=600, height=200, toolbar=no, menubar=no, left="+_left
			+", top="+_top+", resizeable=no, scrollbars=no, location=no, status=no");
		if(choice == 'memUpdate') {
			$('form[name=form1]').attr('action', "memUpdateForm");
		} else if (choice == 'memDelete') {
			if(confirm("정말로 삭제하시겠습니까?")){
				$('form[name=form1]').attr('action', "memDelete");			
				$('form[name=form1]').submit();
			} else {			
				return false;
			}
		}
	})
	
	$('.pwck').on('click', function(){
		var pw1 = $('#pwck').val();
		if (pw1==null || pw1.trim().length==0){
			alert("password Required");
			$('#pwck').focus();
			return false;
		}

		var pw2 = $("input[name='m_passwd']", opener.document).val();
		if(pw1==pw2) {
			$("form[name='form1']", opener.document).submit();
			window.close();
		} else {
			alert("password Error");
			window.close();
		}
	})
	
	$('#cancel').on('click', function(){
		location.href="/";
	})
})