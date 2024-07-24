//현재 스크롤 위치 저장
let lastScroll = 0;
let page = 1;	// 기본 시작값 (고정)
let nowPageLimit = 0;
let nextPageLimit = 0;
let beforePageLimit = parseInt($('#PgInfo').val());	// 기본 종료값 ()
// let beforePageLimit = 4;	// 기본 종료값 (pageInfo 변경될 때마다 변경 필요함 PageInfo.ROW_OF_PAGE)
let bucket = $('input[name=bucket]').val();

//데이터 가져오는 함수
function getData(limit){
	//다음페이지
	nextPageLimit = (page + 1) * limit;
	var currentScroll = $(this).scrollTop(); 
	
	$.ajax({
		type: "POST",
		enctype: 'multipart/form-data',
		url: "/api/getNotice",
		async : false,
		data: {
			 "end" : nextPageLimit,
			 "start" : beforePageLimit+1
		},
		success: function(data){
			let html = ``;
			data.forEach((notice, idx) => {
				
	        html = 
        		`<tr>
					<input type="hidden" name="noti_no" value="${notice.noti_no}">
   					<td class="tbcol ncol1">
	   					<input type="text" name="subject" value="${notice.subject}"
	    					class="noticeSub noticeDetail" readonly="readonly">
	    			</td>
    				<td class="tbcol ncol2">
						<input type="text" name="writer" value="${notice.writer}"
						     					class="noticeDetail" readonly="readonly">
					</td>
     				<td class="tbcol ncol3">
     					<input type="text" name="regdate" value="${notice.regdate}"
	   						class="number" readonly="readonly">
	   				</td>
     				<td class="tbcol ncol4">
     					<input type="text" name="vdate" value="${notice.vdate}"
	   						class="number" readonly="readonly">
	   				</td>
	   				<td class="tbcol ncol5">
	   					<input type="text" name="readcount" value="${notice.readcount}"
		   					class="" readonly="readonly">
	   				</td>
   				</tr>`;
   				
				$("tbody").append(html);
				// 	$(window).scrollTop(currentScroll-60);
			});
			
		},
		error: function (data, status, err) {
			alert("페이지 불러오기에 실패했습니다.");
		}, complete: function(){
			page += 1;
			beforePageLimit = beforePageLimit + limit;
		}
	});
}

$(document).scroll(function(e){
    var currentScroll = $(this).scrollTop(); 		//현재 높이 저장
    var documentHeight = $(document).height();     //전체 문서의 높이

    var nowHeight = $(this).scrollTop() + $(window).height();     //(현재 화면상단 + 현재 화면 높이)

    if(currentScroll > lastScroll){     //스크롤이 아래로 내려갔을때만 해당 이벤트 진행.

        //nowHeight을 통해 현재 화면의 끝이 어디까지 내려왔는지 파악가능 
        //즉 전체 문서의 높이에 일정량 근접했을때 글 더 불러오기)
        if(documentHeight < (nowHeight + (600))){	// 기존 값 : documentHeight*0.2, 현재 값 : 600
        	//함수콜
		getData(8);	// 증가값
        }
    }

    //현재위치 최신화
    lastScroll = currentScroll;
    // console.log(lastScroll);

});