<?php
declare(strict_types=1);

if (!defined('BASE_URL')) {
    define('BASE_URL', '');
}
if (!defined('BASE_PATH')) {
    define('BASE_PATH', '/');
}
if (!defined('UPLOADS_DIR')) {
    define('UPLOADS_DIR', __DIR__ . '/uploads');
}
if (!defined('SESSION_NAME')) {
    define('SESSION_NAME', 'album_cromos');
}

require_once __DIR__ . '/config.php';
