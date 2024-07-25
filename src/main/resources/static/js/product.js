/**
 * 
 */

 $().ready(function(){
	/* 최종일때 주석 해제*/
	var nlen = $('.num').length;
	for(var i=0; i<nlen; i++) {
		var n = $('.num').eq(i).val();
		var to_n = n.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",");
		$('.num').eq(i).val(to_n);
	}
	
	$('.psubmit').on('click', function() {
		var nm = this.name;

		if(nm=='insert') {
			$('form[name=form1]').attr("action", "productMgtProc?flag=insert");
		} else if(nm=='updatePro') {
			$('form[name=form1]').attr("action", "productMgtProc?flag=update");
		} else if(nm=='stateUpdate') {
			$('.inNum, .num').each(function(){
				var valWithoutComma = $(this).val().replace(/[,]/g, "");
				$(this).val(valWithoutComma);
			});
			$("form[name=form1]").submit();
		} else if(nm=='Orderdelete') {
			$('.inNum, .num').each(function(){
				var valWithoutComma = $(this).val().replace(/[,]/g, "");
				$(this).val(valWithoutComma);
			});
			$('form[name=form1]').attr("action", "orderDelete");
			$("form[name=form1]").submit();
		}
		if(validate()){
			$('.inNum, .num').each(function(){
				var valWithoutComma = $(this).val().replace(/[,]/g, "");
				$(this).val(valWithoutComma);
			});
			$("form[name=form1]").submit();
		}	
	})
	
	$('.inNum').on('keyup change propertychange input paste',function(){
		var nlen = $('.inNum').length;
		for(var i=0; i<nlen; i++) {
			var n = $('.inNum').eq(i).val().replace(/[^0-9,]/g,'');
			var tmpn = n.replace(/[,]/g, '');
			$('.inNum').eq(i).val(numberWithCommas(tmpn));
		}
	});
	
	$('.cartAdd').on('click', () => {
		var q = $('input[name=quantity]').val();
		var s = $('input[name=stock]').val();
		if(!$.isNumeric(q.replace(/[,]/g, ""))){
			alert("숫자만 입력 가능합니다");
			$('input[name=quantity]').focus();
			return false;
		}
		if(parseInt(q.replace(/[,]/g, ""))>parseInt(s.replace(/[,]/g, ""))) {
			alert("재고가 부족 합니다");
			$('input[name=quantity]').focus();
			return false;
		}
		$('.inNum').each(function(){
			var valWithoutComma = $(this).val().replace(/[,]/g, "");
			$(this).val(valWithoutComma);
		});
		$('.num').each(function(){
			var valWithoutComma = $(this).val().replace(/[,]/g, "");
			$(this).val(valWithoutComma);
		});
		$("form[name=form1]").submit();
	})
	
	$('button[name=update]').on('click', function(){
		var pno= $('input[name=p_no]').val();
		location.href = '/productUpdateForm?p_no='+pno;
	});

	$('button[name=delete]').on('click', function(){
		var pno= $('input[name=p_no]').val();
		if(confirm('정말 삭제하시겠습니다?'))
			location.href = '/productDelete?p_no='+pno;
		else return false;
	});

	$('.pDetail').on('click', function() {
		var p_no = $(this).find('input[name=p_no]').val();
		location.href='/productDetail?p_no='+p_no;
	});

	$('.pDetail2').on('click', function() {
		var p_no = $(this).closest('tr').find('input[name=p_no]').val();
		location.href='/productDetail?p_no='+p_no;
	});
	
	$('.orderDetail').on('click', function(){
		var pno = $(this).closest('tr').find('input[name=p_no]').val();
		var ono = $(this).closest('tr').find('input[name=o_no]').val();
		var mid = $(this).closest('tr').find('input[name=mem_id]').val();
		
		$('form[name=form1] input[name=o_no]').val(ono);
		$('form[name=form1] input[name=p_no]').val(pno);
		$('form[name=form1] input[name=mem_id]').val(mid);
		$('form[name=form1]').submit();
		// alert(pno+"::::"+ono+"::::"+mid);
	 })
	
	// 전체 선택을 하면 모두 참, 해제시 모두 해제
	$('#checkAll').on('click', () => {
		if($('#checkAll').prop("checked")==true){
			$('input[name=ck]').prop("checked", true);
		} else if($('#checkAll').prop("checked")==false) {
			$('input[name=ck]').prop("checked", false);
		}
	});
	
	// 전체가 다 체크되면 전체체크가 참이고 그중에 하나만이라도 취소시 전체가 false
	$('input[name=ck]').on('click', () => {
		var l = $('input[name=ck]').length;
		if($('input[name=ck]:checked').length == l) {
			$('#checkAll').prop("checked", true);
		} else {
			$('#checkAll').prop("checked", false);
		}
	})
	// 수동으로 select 변경시 자동 check 됨 -> ??? 안 됨 -> 익명 함수 함부로 쓰지 말것!!!
	$('select[name=state]').on('change',function(){
		var tr =$(this).parent().parent();
		var td = tr.children();
		tr.find(td).find("input[name=ck]").prop("checked",true);
	 })
	 
	 $('.orderChange').on('click', function(){
		var tdArr = new Array(); // 체크박스가 체크되어 있는 애들 받기위한 td배열
		// 체크박스 값 가져오기 모두
		var ckbox = $('input[name=ck]:checked');
		// 한 줄씩 꺼내서 값 저장
		ckbox.each(function(i){	// i번째
			var tr = ckbox.parent().parent().eq(i);
			var th = tr.children();	// 모든 컬럼을 가져오기
			var pno = tr.find(th).find("input[name=p_no]").val();
			var ono = tr.find(th).find("input[name=o_no]").val();
			var memid = tr.find(th).find("input[name=mem_id]").val();
			var state = tr.find(th).find("select[name=state]").val();
			// alert(pno+" "+ono+" "+memid+" "+state);
			// 가져온 값을 배열에 저장
			tdArr.push("o_no:"+ono);
			tdArr.push("p_no:"+pno);
			tdArr.push("mem_id:"+memid);
			tdArr.push("state:"+state);
		}) // each 종료
		// 비동기통신(ajax)
		$.ajax({
			async:false,
			type:'post',
			data:{tdArr},
			url:'/orderFIXProc',
			dataType:'json',
			success: setInterval(), /* 콜백 함수 : 성공시 처리되어야 할 일 지정 */
		});
		// 콜백함수 정의
		function setInterval(){
			// 1. check박스 지우기
			alert("처리 완료");
			var tr =$("select[name='state']").parent().parent();
			var td = tr.children();
			tr.find(td).find("input[name=ck]").prop("checked",false);
		}

	 }) // orderChange 끝
	 
	 /* 결제 취소 */
	 $('.PayCancel').on('click', function(){
		var tid = $(this).closest('tr').find('input[name=transactionid]').val();
		$('form[name=cancel]').attr('action', 'cancelProc2');
		$('form[name=cancel] input[name=transactionid]').val(tid);
		$('form[name=cancel]').submit();
	 })
	 
 })
 
function validate() {
	var flen = $("form[name=form1] .chk").length;
	for (var i=0; i < flen; i++) {
		if( $('form[name=form1] .chk').eq(i).val() == "" || 
			$('form[name=form1] .chk').eq(i).val() == null ||
			$('form[name=form1] .chk').eq(i).val().trim() == "") {
				alert($('form[name=form1] .chk').eq(i).attr('title')+' 은/는 필수입력입니다.');
				$('form[name=form1] .chk').eq(i).focus();
				return false;
		}
	}
	return true;
}

function numberWithCommas(num) {
	var parts = num.toString().split(".");
	return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	+ (parts[1] ? "," + parts[1] : "");
}

function orderDetail(obj) {
	// var pno = $(obj).closest("tr").find("input[name=p_no]").val();
	var ono = $(obj).closest("tr").find("input[name=o_no]").val();
	var mem_id = $(obj).closest("tr").find("input[name=mem_id]").val();
	console.log(ono);
	console.log(mem_id);
	// $('form[name=form1] input[name=p_no]').val(pno);
	$('form[name=form1] input[name=o_no]').val(ono);
	$('form[name=form1] input[name=mem_id]').val(mem_id);
	$('form[name=form1]').submit();
}
