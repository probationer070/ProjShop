/**
 * 
 */

$().ready(function(){
	$('.notisubmit1').on('click', function(){
		if(chkValidate('form1')) {
			$("form[name=form1]").attr('action', 'admin/NoticeProc');
			$("form[name=form1]").submit();
		}
	})

	$('.notisubmit2').on('click', function(){
		if(chkValidate('form1')) {
			$("form[name=form1]").attr('action', 'NotiUpProc');
			$("form[name=form1]").submit();
		}
	})
	
	$('.notisubmit').on('click', function() {
		var nm = this.name;
		var n_id = $('input[name=noti_no]').val();

		if(nm=='update') {
			$('form[name=form1]').attr("action", "NotiUpForm");
		} else if(nm=='delete') {
			if(confirm('정말 삭제하시겠습니다?')) {
				$('form[name=form1]').attr("action", "NotiDelProc");
			} else return false;
		}
		$("form[name=form1]").submit();
	})
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
	return true;
}