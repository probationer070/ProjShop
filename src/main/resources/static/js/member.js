/**
 * 회원관리용
 */

$().ready(function(){
	var idSubmitChk = 1; 
	var pwcheck=false;
	
	$('#login_btn').on('click', function(){
		if(chkValidate('LoginForm')) {
			$("form[name=LoginForm]").attr('action', 'loginProc');
			$("form[name=LoginForm]").submit();
		}
	})
	
	$('#logout_btn').on('click', function(){
		if(chkValidate('LoginForm')) {
			$("form[name=LoginForm]").attr('action', 'logoutProc');
			$("form[name=LoginForm]").submit();
		}
	})
	
	$('.mdetail').on('click', function(){
		var mid = $(this).closest('tr').find('input[name=mem_id]').val();
		var mnm = $(this).closest('tr').find('input[name=m_name]').val();
		var zipcode = $(this).closest('tr').find('input[name=zipcode]').val();
		var addr1 = $(this).closest('tr').find('input[name=address]').val();
		var addr2 = $(this).closest('tr').find('input[name=address2]').val();
		var job = $(this).closest('tr').find('input[name=m_job]').val();
		var phone = $(this).closest('tr').find('input[name=m_phone]').val();
		var mEmail = $(this).closest('tr').find('input[name=m_email]').val();
		var regDate = $(this).closest('tr').find('input[name=m_regdate]').val();
		
		
		$('form[name=form1] input[name=mem_id]').val(mid);
		$('form[name=form1] input[name=m_name]').val(mnm);
		$('form[name=form1] input[name=zipcode]').val(zipcode);
		$('form[name=form1] input[name=address]').val(addr1);
		$('form[name=form1] input[name=address2]').val(addr2);
		$('form[name=form1] input[name=m_job]').val(job);
		$('form[name=form1] input[name=m_phone]').val(phone);
		$('form[name=form1] input[name=m_email]').val(mEmail);
		$('form[name=form1] input[name=m_regdate]').val(regDate);
		$("form[name=form1]").attr('action', 'customInfo?m_id='+mid);
		$('form[name=form1]').submit();
	 })
	
	$('#submit1').on('click', function(){
		if(chkValidate('form1')) {
			if(idSubmitChk==1){
				alert('아이디 중복\n다시 확인해 주세요');
				$('#idchk').focus();
				return false;
			}
			if(!pwcheck) {	// pwcheck가 다르면 false이므로 참이어야 안으로 들어감
				alert("패스워드가 다릅니다.");
				return false;
			}
			$("form[name=form1]").submit();
		}
	})
	
	$('#submit3').on('click', function(){
		if(!chkValidate('form1')){
			return false;
		} else {
			if(!pwcheck) {	
				alert("패스워드가 다릅니다.");
				return false;
			}			
			$("form[name=form1]").submit();
		}
		
	})
	
	$('#idchk').on('propertychange change paste input', function(){
		$.ajax({
			async:true,
			type:'post',
			url:'idCheck',
			data:{'mem_id':$('#idchk').val()},
			dataType:'json',
			success:function(data){
				if (data>0) {
					$('font[id=warning]').text('');
					$('font[id=warning]').attr('color', 'red');
					$('font[id=warning]').text('이미 존재하는 아이디 입니다');
					$('#idchk').focus();
					idSubmitChk = 1;	// 전송블기
				} else {
					$('font[id=warning]').text('');
					$('font[id=warning]').attr('color', 'blue');
					$('font[id=warning]').text('사용가능한 아이디 입니다');
					$('#idchk').focus();
					idSubmitChk = 0;	// 전송가능
				}
			}
		})
	})
	
	$('#check1, #check2').keyup(function(){
		$('font[id=check]').text('');	// 글씨 쓰는 곳 지우기
		if($('#check1').val()!=$('#check2').val()) {
			$('font[id=check]').text('');
			$('font[id=check]').attr('color', 'red');
			$('font[id=check]').text('패스워드가 다릅니다');
			pwcheck=false;
		} else {
			$('font[id=check]').text('');
			$('font[id=check]').attr('color', 'green');
			$('font[id=check]').text('동일한 패스워드');
			pwcheck=true;
		}
	});
	
	$('.submit1').on('click', function(){
		var flen = $("form[name=tabForm1] .chk1").length;
		for(var i=0; i<flen; i++){
			if($('.chk1').eq(i).val()=="" ||
			  $('.chk1').eq(i).val()==null ||
			  $('.chk1').eq(i).val().trim()==""){
				alert($('.chk1').eq(i).attr('title')+'을/를 입력하시오');
				$('.chk1').eq(i).focus();
			}
		} 
		$("form[name=tabForm1]").submit();
	});

    $('.pwCheck2').on('click',function(){
		var flen = $("form[name=tabForm2] .chk2").length;
	 	for(var i=0; i<flen; i++){
			if($('.chk2').eq(i).val()=="" ||
		       $('.chk2').eq(i).val()==null ||
		       $('.chk2').eq(i).val().trim()==""){
			  alert($('.chk2').eq(i).attr('title')+'를 입력하시오.');
			  $('.chk2').eq(i).focus();
			  return false;
			 }
		    }
		    if(!pwcheck){
				alert("비밀번호가 다릅니다.");
			}else{
			  $("form[name=tabForm2]").submit();
			}

		});
	
	$('#mobile1, #mobile2, #mobile3').on('propertychange change paste input', function(){
		let n1 = $('#mobile1').val();
		let n2 = $('#mobile2').val();
		let n3 = $('#mobile3').val();

		$('input[name=m_phone]').val(n1+n2+n3);
	});
})

function chkValidate(formNm) {
	var flen = $("form[name="+formNm+"] .chk").length;
	for (var i=0; i < flen; i++) {
		if( $("form[name="+formNm+"] .chk").eq(i).val() == "" 
		|| $("form[name="+formNm+"] .chk").eq(i).val() == null 
		|| $("form[name="+formNm+"] .chk").eq(i).val().trim() == "") {
			alert($("form[name="+formNm+"] .chk").eq(i).attr('title')+' 은/는 필수입력입니다.');
			$("form[name="+formNm+"] .chk").eq(i).focus();
			return false;
		}
	}
	
	if(formNm =='form1'){
		var str = $('input[name="m_email"]').val();
		var atPos = str.indexOf('@');
		var atLastPos = str.lastIndexOf('@');
		var dotPos = str.indexOf('.');
		var spacePos = str.indexOf(' ');
		var commaPos = str.indexOf(',');
		var eMailSize = str.length;
		if(!(atPos > 1 && atPos==atLastPos && 
			dotPos > 3 && spacePos==-1 && commaPos == -1 &&
			atPos+1<dotPos && dotPos+1 < eMailSize)) {
				//alert('Email 주소 형식이 잘못되었습니다.');
				$('font[class=emailNm]').text('');
				$('font[class=emailNm]').attr('color', 'red');
				$('font[class=emailNm]').text('Email 주소 형식이 잘못되었습니다.');
				document.form1.m_email.focus();
				return false;
		}
	}
	return true;



        
}
