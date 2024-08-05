// append to the bottom of your settings.php, found at web/sites/default/settings.php

$databases['python']['default'] = array (
  'database' => 'PythonConnDB',
  'username' => 'LRVSPPython',
  'password' => 'password',
  'prefix' => '',
  'host' => 'localhost',
  'port' => '3306',
  'isolation_level' => 'READ COMMITTED',
  'driver' => 'mysql',
);