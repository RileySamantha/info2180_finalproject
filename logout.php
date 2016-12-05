<?php
session_start();
session_destroy();
session_regenerate_id(true);
session_cache_expire();
header('Location: index.php');
exit;
?>