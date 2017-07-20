$(function() {
	$('.blink').focus(function() {
        if(this.title==this.value) {
            this.value = '';
        }
    }).blur(function(){
        if(this.value=='') {
            this.value = this.title;
        }
    });
    
	$('#slider ul.slider-items').jcarousel({
		'scroll': 1,
		'auto': 3,
		'wrap': 'both',
        initCallback: mycarousel_initCallback,
        itemVisibleInCallback: {
			onAfterAnimation: function(c, o, i, s) {
				jQuery('.slider-controls li').removeClass('active');
				jQuery('.slider-controls li:eq('+ (i-1) +')').addClass('active');
			}
		}
	});
	
	$('.sidebar .selectbox').click(function(){
		$(this).addClass('select-hovered');
		$(this).find('.list').show();
	}).mouseleave(function(){
		$(this).removeClass('select-hovered');
		$(this).find('.list').hide();
	});
	
	$('.sidebar .selectbox .list a').click(function(){
		var select = $(this).parents('.selectbox').find('select');
		var value = $(this).text();
		var idx = $(this).parent().index();
		
		$('.sidebar .selectbox .list li.active').removeClass('active');
		$(this).parent().addClass('active');
		
		$('option', select).each(function(){
			$(this).attr('selected', false);
		});
	
		$('option', select).eq(idx).attr('selected', true);
		$(this).parents('.selectbox').find('.currentItem span').text(value);
		
		return false;
	});
	
	if ($.browser.msie && $.browser.version == 6) {
		DD_belatedPNG.fix('#search .container, #search .search-button, h1#logo a, #navigation, #slider, .more, .jcarousel-prev, .jcarousel-next, #main, #main .inner, .widget .widget-entry, .widget h2, .widget li, .widget li a, .widget li a span, .widget a.items, #content h2, #content h2 .title-bottom, .product a, #slider .slider-outer');
		$('#left-sidebar .widget li').css('height', '37px');
	}
	
});

function mycarousel_initCallback(carousel) {

	$('.slider-controls').append('<ul></ul><div class="cl">&nbsp;</div>');
	
	$('#slider ul.slider-items li').each(function(){
		$('.slider-controls ul').append('<li><a href="#">&nbsp;</a></li>');
	});
	
	$('.slider-controls ul li:last').addClass('last');
	
	$('#slider .slider-controls').css('margin-left', function(){
		return (-($(this).find('ul').width() / 2) + 4) + 'px';
	});

    $('.slider-controls a').bind('click', function() {
        carousel.scroll(($.jcarousel.intval($(this).parent().index()) + 1));
        return false;
    });
    
    var _arrows = $('#slider .jcarousel-prev, #slider .jcarousel-next');
	_arrows.hide();
	
    $('#slider .shell').hover(function(){
    	_arrows.each(function(){
    		$(this).show().addClass('carousel-active');
    	});
    }, function(){
    	_arrows.each(function(){
    		$(this).hide().removeClass('carousel-active');
    	});
    });

};