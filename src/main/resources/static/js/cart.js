/**
 * 
 */
$().ready(function(){
	getTotal();
	
	$('#order').on('click', function(){
		let cartTot = $('input[name=cartTot]').val();
		if (cartTot > 0) {
			document.getElementById("orderDetail").submit();
		}
	})
	
})

function cartUpdate(f, obj) {
	var url;
	var quantity = $(obj).closest('div').parent().find('input[name=quantity]').val();
	var price = $(obj).closest('div').parent().find('input[name=price]').val();
	var pno = $(obj).closest('div').parent().find('input[name=p_no]').val();
	var stock = $(obj).closest('div').parent().find('input[name=stock]').val();
	console.log(quantity);
	console.log(price);
	console.log(pno);
	console.log(stock);
	var q = quantity.replace(/[,]/g, '');
	var p = price.replace(/[,]/g, '');
	var s = stock.replace(/[,]/g, '');
	if(f == 'D'){
		url = 'cartProc?flag=delete';
		$(obj).closest('div').parent().parent().parent().remove();
	} else if(f == 'U') {
		if(parseInt(q)>parseInt(s)) {
			alert('재고가 부족합니다');
			return false;
		}
		var a = parseInt(q)*parseInt(p);
		$(obj).closest('div').parent().parent().find('strong[class=total]').text(numberWithCommas(a));
		$(obj).closest('div').parent().parent().find('strong[class=total_price_d]').text(numberWithCommas(a));
		$(obj).closest('div').parent().parent().find('input[name=total]').val(numberWithCommas(parseInt(a)));
		
		url = 'cartProc?flag=update';
		getTotal();
		
	}
	$.ajax({
		async:true,
		type:'post',
		data:{"quantity":quantity,
			  "p_no":pno
			  },
		url:url,
		dataType:"json",
		success:msgAler()
	});
	
	function msgAler() {
		alert("처리완료했습니다.");
		window.location.reload();
	}
}



function fnCalCount(type, ths) {
    var $input = $(ths).parents("span").find("input[name='quantity']");
    var tCount = Number($input.val());
    var $priceInput = $(ths).parents("tr").find("input[name='amount']");
    var pricePerUnit = parseFloat($(ths).parents("tr").data("price")); // 각 행에 가격이 저장되어 있다고 가정

    if (type == 'p') {
        $input.val(Number(tCount) + 1);
    } else {
        if (tCount > 1) {
            $input.val(Number(tCount) - 1);
        }
    }
    
    // 총 가격 업데이트
	var updatedCount = Number($input.val());
    var totalPrice = (updatedCount * pricePerUnit).toFixed(2);
    $priceInput.val(totalPrice);
}

function getTotal() {
	var arr = new Array();
	var total = 0;
	
	$('input[name=total]').each(function(index, item) {
		var item_price = $(item).val();
		item_price = parseInt(item_price.replace(/[,]/g, ""));
		arr.push(item_price);
	});
	
	arr.forEach((element)=> {
		total += element;
	});
	$('strong[class=total_price_d]').text(numberWithCommas(total+3000));
	$('input[name=amount]').val(total+3000);
	/*alert(total);*/
	$('strong[class=total_price]').text(numberWithCommas(total));
}

/****************************************************************/
/* m_Completepayment 설명 */
/****************************************************************/
/* 인증완료시 재귀 함수 */
/* 해당 함수명은 절대 변경하면 안됩니다. */
/* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다. */
/* Web 방식의 경우 리턴 값이 form 으로 넘어옴 */
/****************************************************************/
function m_Completepayment(FormOrJson, closeEvent) {
	var frm = document.kcp_order_info;
	/********************************************************************/
	/* FormOrJson은 가맹점 임의 활용 금지 */
	/* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다. */
	/********************************************************************/
	GetField(frm, FormOrJson);
	console.log(frm);
	// alert("m_Completepayment : " + frm.res_cd.value);
	if (frm.res_cd.value == "0000") {
		/*
		[가맹점 리턴값 처리 영역] 
		인증이 완료되면 frm에 인증값이 들어갑니다. 해당 데이터를 가지고
		승인요청을 진행 해주시면 됩니다.
		
		 */
		//폼 id = kcp_order_info
		var form = document.getElementById("kcp_order_info");
		closeEvent();
		
		// 
		frm.action = "/payProc2";
		frm.submit();
	} else {
		/*
		(인증실패) 인증 실패 처리 진행
		 */
		closeEvent();
	}
}
/* 이 함수를 실행하여 표준웹 실행 */
function jsf__pay() {
	try {
		var form = document.kcp_order_info;
		KCP_Pay_Execute(form);
	} catch (e) {
		/* IE 에서 결제 정상종료시 throw로 스크립트 종료 */
	}
}

