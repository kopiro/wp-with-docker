<?php

$table_prefix  = 'wp_';

if (strpos($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false) {
	$_SERVER['HTTPS'] = 'on';
	define('HTTP_PROTOCOL', 'https');
	define('FORCE_SSL_ADMIN', true);
} else {
	define('HTTP_PROTOCOL', 'http');
}

define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
define('AUTH_KEY', getenv('AUTH_KEY'));
define('SECURE_AUTH_KEY', getenv('SECURE_AUTH_KEY'));
define('LOGGED_IN_KEY', getenv('LOGGED_IN_KEY'));
define('NONCE_KEY', getenv('NONCE_KEY'));
define('AUTH_SALT', getenv('AUTH_SALT'));
define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT'));
define('LOGGED_IN_SALT', getenv('LOGGED_IN_SALT'));
define('NONCE_SALT', getenv('NONCE_SALT'));
define('VIRTUAL_HOST', getenv('VIRTUAL_HOST'));
define('WP_DEBUG', getenv('WP_DEBUG'));
define('WP_DEBUG_DISPLAY', getenv('WP_DEBUG_DISPLAY'));

define('WP_SITEURL', HTTP_PROTOCOL . '://' . VIRTUAL_HOST . '/wordpress');
define('WP_HOME', HTTP_PROTOCOL . '://' . VIRTUAL_HOST);

define('WP_USE_THEMES', true);
define('WP_CONTENT_DIR', __DIR__ . '/wp-content');
define('WP_CONTENT_URL', '/wp-content');
define('WP_AUTO_UPDATE_CORE', false);
define('WC_TEMPLATE_DEBUG_MODE', false);
define('DISABLE_WP_CRON', true);
define('AUTOMATIC_UPDATER_DISABLED', true);
define('DISALLOW_FILE_MODS', true);
define('WPLANG', 'it_IT');

require_once(ABSPATH . 'wp-settings.php');