<?php
/*
Plugin Name:  Themify Icons Plugin
Plugin URI:   https://themify.me/themify-icons
Version:      2.0.1 
Author:       Themify
Description:  Insert the Themify Icons easily in your post content, WordPress menus, and widget titles.
Text Domain:  themify-icons
Domain Path:  /languages
Compatibility: 5.0.0
*/

if ( !defined( 'ABSPATH' ) ) exit;

class Themify_Icons {

	public function __construct() {
		add_action( 'plugins_loaded', array( $this, 'constants' ), 1 );
		add_action( 'plugins_loaded', array( $this, 'includes' ), 2 );
		add_action( 'plugins_loaded', array( $this, 'i18n' ), 5 );
		add_action( 'plugins_loaded', array( $this, 'setup' ) );
		add_filter( 'plugin_row_meta', array( $this, 'themify_plugin_meta'), 10, 2 );
	}

	public function constants() {
		if ( ! defined( 'THEMIFY_ICONS_DIR' ) )
			define( 'THEMIFY_ICONS_DIR', trailingslashit( plugin_dir_path( __FILE__ ) ) );

		if ( ! defined( 'THEMIFYICONS_URI' ) )
			define( 'THEMIFY_ICONS_URI', trailingslashit( plugin_dir_url( __FILE__ ) ) );

		if ( ! defined( 'THEMIFY_ICONS_VERSION' ) )
			define( 'THEMIFY_ICONS_VERSION', '1.1' );
	}

	public function includes() {
		if ( is_admin() ) {
			include( THEMIFY_ICONS_DIR . 'includes/admin.php' );
			include( THEMIFY_ICONS_DIR . 'includes/tinymce.php' );
			Themify_Icons_TinyMCE::init();
		}
		if ( ! $this->is_themify_theme() ) {
			include( THEMIFY_ICONS_DIR . 'includes/menu-icons.php' );
		}
		include( THEMIFY_ICONS_DIR . 'includes/widget-icons.php' );
		include( THEMIFY_ICONS_DIR . 'includes/functions.php' );
		include( THEMIFY_ICONS_DIR . 'includes/shortcode.php' );
		include( THEMIFY_ICONS_DIR . 'includes/icon-picker.php' );
		Themify_Icons_Icon_Picker::init();
	}

	public function themify_plugin_meta( $links, $file ) {
		if ( plugin_basename( __FILE__ ) == $file ) {
			$row_meta = array(
			  'changelogs'    => '<a href="' . esc_url( 'https://themify.me/changelogs/' ) . basename( dirname( $file ) ) .'.txt" target="_blank" aria-label="' . esc_attr__( 'Plugin Changelogs', 'themify-icons' ) . '">' . esc_html__( 'View Changelogs', 'themify-icons' ) . '</a>'
			);
	 
			return array_merge( $links, $row_meta );
		}
		return (array) $links;
	}

	public function i18n() {
		load_plugin_textdomain( 'themify-icons', false, '/languages' );
	}

	public function setup() {
		if ( is_admin() ) {
			add_action( 'admin_enqueue_scripts', array( $this, 'admin_enqueue' ) );
		} else {
			add_action( 'wp_enqueue_scripts', array( $this, 'enqueue' ) );
		}

		/* fix icons display in Themify Builder frontend editor */
		if ( $this->is_themify_theme() ) {
			add_action( 'themify_builder_frontend_enqueue', array( $this, 'admin_enqueue' ) );
			add_action( 'themify_styles_top_frame', array( $this, 'themify_styles_top_frame' ) );
		}
	}

	public function enqueue() {
		$min = defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ? '' : '.min';
		wp_register_style( 'themify-icons', THEMIFY_ICONS_URI . "assets/themify-icons/themify-icons{$min}.css", null, THEMIFY_ICONS_VERSION );
		wp_register_style( 'themify-icons-frontend', THEMIFY_ICONS_URI . "assets/styles{$min}.css", array( 'themify-icons' ), THEMIFY_ICONS_VERSION );
	}

	function admin_enqueue( $hook_suffix ) {
		$min = defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ? '' : '.min';
		$this->enqueue();
		wp_enqueue_style( 'themify-icons' );
		wp_enqueue_style( 'themify-icons-frontend' );
	}

	/**
	 * Adds stylesheets from the plugin to Themify Builder's editor
	 *
	 * @return array
	 * @since 2.0.1
	 */
	function themify_styles_top_frame( $styles ) {
		$min = defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ? '' : '.min';
		$styles[ THEMIFY_ICONS_URI . "assets/themify-icons/themify-icons{$min}.css" ] = THEMIFY_ICONS_VERSION;
		$styles[ THEMIFY_ICONS_URI . "assets/styles{$min}.css" ] = THEMIFY_ICONS_VERSION;

		return $styles;
	}

	public function is_themify_theme() {
		return file_exists( get_template_directory() . '/themify/themify-utils.php' );
	}
}
$themify_icons = new Themify_Icons;