<?php
/*
 * Subrion Open Source CMS 4.1.0
 * Config file generated on 13 April 2023 04:01:01
 */

define('INTELLI_CONNECT', 'mysqli');
define('INTELLI_DBHOST', 'mariadb');
define('INTELLI_DBUSER', 'root');
define('INTELLI_DBPASS', 'admin12345');
define('INTELLI_DBNAME', 'subrion');
define('INTELLI_DBPORT', '3306');
define('INTELLI_DBPREFIX', 'sbr410_');

define('IA_SALT', '#4C766F4B34');

// debug mode: 0 - disabled, 1 - enabled
define('INTELLI_DEBUG', 1);

session_save_path('/var/www/html/tmp');