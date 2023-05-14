<?php

if( ! function_exists( 'themify_icons_get_icon' ) ) :
/**
 * Retrieve an icon name and returns the proper CSS classname to display that icon
 *
 * @return string
 */
function themify_icons_get_icon( $name ) {
	/**
	 * compatibility with old versions of the plugin,
	 * display proper FA icons, these are not included in the plugin
	 */
	$prefix = substr( $name, 0, 4 );
	if ( strpos( $name, 'fa-' ) === 0 ) { // FA v4
		return "fa {$name}";
	} else if ( in_array( $prefix, array( 'fas ', 'far ', 'fab ' ) ) ) { // FA v5
		return $name;
	}

	return $name;
}
endif;