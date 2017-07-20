(function($) {
	$.fn.PavOffCavasmenu = function(opts) {
		// default configuration
		var config = $.extend({}, {
			opt1: null,
			text_warning_select:'Please select One to remove?',
			text_confirm_remove:'Are you sure to remove footer row?',
			JSON:null
		}, opts);
		// main function
		function DoSomething(e) {
			
		}

	 
		// initialize every element
		this.each(function() {  
			var $btn = $('#mainnav .btn-navbar');
			var	$nav = null;
			 

		//	if (!$btn.length) return;
	 	 	var $nav = $('<nav class="pavo-mainnav" ></nav>').appendTo( $('<section id="off-canvas-nav"></sections>').appendTo( $("body")) );
	 	 	 $('#off-canvas-nav .pavo-mainnav').append( '<div id="off-canvas-button"><span class="icon-remove-sign"></span></div>' );
	 	 	var $menucontent = $($btn.data('target')).find('.megamenu').clone();
	  

	 	 	$menucontent.appendTo($nav);

 			$('html').addClass ('off-canvas');
			$("#off-canvas-button").click( function(){
				$btn.click();	
			} ); 
			$btn.toggle( function(){
				$("body").addClass('off-canvas-active').removeClass("off-canvas-inactive");
			}, function(){
				$("body").removeClass('off-canvas-active').addClass("off-canvas-inactive");
			} );

		});
		return this;
	};
	
})(jQuery);


$(window).ready( function(){
	$('#mainnav input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	/*  Fix First Click Menu */
	$(document.body).on('click', '#mainnav [data-toggle="dropdown"], #off-canvas-nav [data-toggle="dropdown"]' ,function(){ 
		if(!$(this).parent().hasClass('open') && this.href && this.href != '#'){
			window.location.href = this.href;
		}

	});

	$("#mainnav").PavOffCavasmenu();

	$(".quantity-adder .add-action").click( function(){
		if( $(this).hasClass('add-up') ) {  
			$("[name=quantity]",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) + 1 );
		}else {
			if( parseInt($("[name=quantity]",'.quantity-adder').val())  > 1 ) {
				$("input",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) - 1 );
			}
		}
	} );

	$("#image-additional a").click( function(e){
         $("#image").parent('a').attr('href', $(this).data('zoom-image') );
         e.preventDefault();
    } );
} );