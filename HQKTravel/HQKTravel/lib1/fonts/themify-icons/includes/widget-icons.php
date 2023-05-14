<?php

function themify_icons_in_widget_form( $widget, $return, $instance ) {
	$icon = isset( $instance['ti_icon'] ) ? $instance['ti_icon'] : '';
	?>
	<p>
		<label for="<?php echo $widget->get_field_id( 'ti_icon' ); ?>"><?php _e( 'Icon', 'themify-icons' ) ?>: </label>
		<input type="text" name="<?php echo $widget->get_field_name( 'ti_icon' ); ?>" id="<?php echo $widget->get_field_id( 'ti_icon' ); ?>" class="smallfat" value="<?php echo esc_attr( $icon ); ?>" />
	</p><?php
}
add_action( 'in_widget_form', 'themify_icons_in_widget_form', 10, 3 );

function themify_icons_widget_update_callback( $instance, $new_instance, $old_instance ) {
	$instance['ti_icon'] = $new_instance['ti_icon'];
	return $instance;
}
add_filter( 'widget_update_callback', 'themify_icons_widget_update_callback', 10, 3 );

function themify_icons_dynamic_sidebar_params( $params ) {
	global $wp_registered_widgets;

	// get widget option
	$options = get_option( $wp_registered_widgets[$params[0]['widget_id']]['callback'][0]->option_name );
	$widget_id = themify_icons_get_widget_id( $params[0]['widget_id'] );

	if ( isset( $options[$widget_id]['ti_icon'] ) && '' != $options[$widget_id]['ti_icon'] ) {
		if ( class_exists( 'Themify_Icon_Font' ) ) {
			$icon = themify_get_icon( $options[$widget_id]['ti_icon'] );
		} else {
			wp_enqueue_style( 'themify-icons' );
			$icon = '<i class="themify-menu-icon ' . themify_icons_get_icon( $options[$widget_id]['ti_icon'] ) . '"></i>';
		}

		$params[0]['before_title'] .= $icon . ' ';
	}

	return $params;
}
if( ! is_admin() )
	add_filter( 'dynamic_sidebar_params', 'themify_icons_dynamic_sidebar_params', 1000 );

function themify_icons_get_widget_id( $widget ) {
	preg_match( '/-([0-9]+)$/', $widget, $matches );
	return $matches[1];
}