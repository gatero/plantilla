<?php
	$name=  basename($_SERVER['PHP_SELF']);
	$name=  str_replace('.php','',$name);
	// clase activa en el menu superior
	$btn_01['active']= $name=='index'? 'class="btn-active"': '';
	include './include/layout/img-data.php';
?>