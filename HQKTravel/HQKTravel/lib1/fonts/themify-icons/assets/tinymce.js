;var TI_Picker = {};

(function($){

	'use strict';

	TI_Picker = {
		target: '',
		showLightbox: function( selected ) {
			var self = TI_Picker;
			self.loadIconsList( function(){
				var top = $( document ).scrollTop() + 80,
					$lightbox = $("#TI_Picker"),
					$lightboxOverlay = $('#TI_Picker_overlay');

				$( 'body' ).on( 'click', '#TI_Picker .themify-icons-lightbox_container a:not(.external-link)', function(e){
					e.preventDefault();
					e.stopPropagation();
					self.setIcon( $( this ).data( 'icon' ) );
				}).on('click', '#TI_Picker_overlay, #TI_Picker .themify-icons-close_lightbox', function(e){
					e.preventDefault();
					e.stopPropagation();
					self.closeLightbox();
				})

				$lightboxOverlay.show();
				$lightbox
					.css( 'top', $( document ).height() )
					.show()
					.animate({
						top: top
					}, 600 );

			});
		},
		loadIconsList : function( callback ) {
			if ( $( '#TI_Picker' ).length ) {
				callback();
			} else {
				$.ajax( {
					url : themifyIconsPlugin.ajaxurl,
					type : 'POST',
					data : {
						action : 'ti_get_icons'
					},
					success : function( resp ) {
						$( 'body' ).append( resp );
						callback();
					}
				} );
			}
		},
		setIcon: function( iconName ) {
			TI_Picker.target.val( iconName ).trigger( 'change' );
			TI_Picker.closeLightbox();
		},
		closeLightbox: function() {
			$( '#TI_Picker' ).animate({
				top: $( document ).height()
			}, 400, function() {
				$( '#TI_Picker_overlay' ).hide();
				$( this ).hide();
			});
		},
	};
})(jQuery);

(function($) {
	'use strict';

	tinymce.PluginManager.add( 'themifyicons', function( editor, url ) {

		$( 'head' ).append( '<link rel="stylesheet" type="text/css" href="' + themifyIconsPlugin.css + '">' );

		function createColorPickAction() {
			var colorPickerCallback = editor.settings.color_picker_callback;

			if ( colorPickerCallback ) {
				return function() {
					var self = this;

					colorPickerCallback.call(
						editor,
						function( value ) {
							self.value( value ).fire( 'change' );
						},
						self.value()
					);
				};
			}
		}

		editor.addButton( 'themifyicons', {
			title: 'Themify Icon',
			image: url + '/images/favicon.png',
			onclick: function(){
				var fields = [];
				jQuery.each( themifyIconsPlugin.fields, function( i, field ){
					if( field.type == 'colorbox' ) {
						field.onaction = createColorPickAction()
					} else if( field.type == 'iconpicker' ) {
						/* create an icon picker */
						field = {
							type : 'container',
							label : field.label,
							layout : 'flex',
							direction : 'row',
							items : [
								{ type : 'textbox', name : field.name },
								{ type : 'button', text : field.text, onclick : function(){
									TI_Picker.target = jQuery( this.$el ).prev(); // set the input text box that recieves the value
									TI_Picker.showLightbox( null );
								} }
							]
						};
					}
					fields.push( field );
				} );

				editor.windowManager.open({
					'title' : themifyIconsPlugin.menuName,
					'body' : fields,
					onSubmit : function( e ){
						var values = this.toJSON(); // get form field values
						values.selectedContent = editor.selection.getContent();
						var template = wp.template( 'themify-icons-plugin' );
						editor.insertContent( template( values ) );
					}
				});
			}
		});
	});
})(jQuery);
