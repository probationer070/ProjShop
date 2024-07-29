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
	
	var SubTot = $('span[id=total_product_base_price_id]').text();
	$('span[id=total_product_base_price_id]').text(numberWithCommas(parseInt(SubTot))+'원');
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
