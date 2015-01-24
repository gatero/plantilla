<?php
	if(!empty($_GET['nombre'])) $nombre = $_GET['nombre'];
	if(!empty($_GET['email'])) $email = $_GET['email'];
	if(!empty($_GET['mensaje'])) $mensaje=$_GET['mensaje'];
	if($_GET){
		$headers="From: $email\n";
		$cuerpo="LLenaron el formulario ";
		$cuerpo.="esta es la información:\n";
		$cuerpo.="-------------------------------------------\n";
		$cuerpo.="nombre: $nombre\n email: $mail\n";
		$cuerpo.="mensaje:\n $mensaje\n\n";
		$cuerpo.="-------------------------------------------\n";
		// envia el email
		$to_email="mbellasartes@gmail.com";
		mail($to_email, $motivo, $cuerpo, $headers);
	}
?>