<?php 

session_start();

include("templates/html.tpl");

if (isset($_SESSION['id']))
	include("templates/head-logined.tpl");
else 
	include("templates/head.tpl");
include("templates/content.tpl");
include("templates/footer.tpl");
include("templates/scripts.tpl");

?>
