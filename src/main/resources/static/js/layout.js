/*
boardSrcript
*/

$(function() {
	$('#signin').on("click", () => {
		$("form[name=sign]").attr('action', "signin")
		$("form[name=sign]").submit();
	});
	
	$(document).ready(function(){
		$('#load').delay('1000').fadeOut();
	});
	
	$('div.eToggle .title').off('click').on('click', function() {
        var toggle = $(this).parent('.eToggle');
        if(toggle.hasClass('disable') == false){
            $(this).parent('.eToggle').toggleClass('selected')
        }
    });
	
})

function openSearch() {
	$('.header__search-containers').toggle('slow');
}