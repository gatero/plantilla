<?php 
  class SendEmailForm{
    var $nombre,
        $asunto,
        $edad,
        $email,
        $mensaje,
        $data,
        $error;

    function setNombre($nombre){
      $this->$nombre= $nombre;
    }
    function getNombre(){
      return $this->$nombre;
    }

    function setAsunto($asunto){
      $this->$asunto= $asunto;
    }
    function getAsunto(){
      return $this->$asunto;
    }

    function setEmail($email){
      $this->$email= $email;
    }
    function getEmail(){
      return $this->$email;
    }

    function setMensaje($mensaje){
      $this->$mensaje= $mensaje;
    }
    function getMensaje(){
      return $this->$mensaje;
    }

    function formValidator(){
      # Nombre
      if(!empty($_POST)){
        if(!empty($_POST['nombre']) && $_POST['nombre'] != null){
          $this->setNombre($_POST['nombre']);
          echo $this->getNombre().' ok';
          $this->data['nombre']= $this->getNombre();
          echo $this->data['nombre'].' ok';
        }else{
          $this->error['nombre']= '<span class="contactError">Es necesario agregar un nombre</span>';
        }

        # Asunto
        if(!empty($_POST['asunto']) && $_POST['asunto'] != null){
          $this->setAsunto($_POST['asunto']);
          $this->data['asunto']= $this->getAsunto();
        }else{
          $this->error['asunto']= '<span class="contactError">Es necesario agregar un asunto</span>';
        }

        # Email
        if(!empty($_POST['email']) && $_POST['email'] != null && filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
          $this->setEmail($_POST['email']);
          $this->data['email']= $this->getEmail();
        }else{
          $this->error['email']= '<span class="contactError">Es necesario agregar un email</span>';
        }

        # mensaje
        if(!empty($_POST['mensaje']) && $_POST['mensaje'] != null){
          $this->setMensaje($_POST['mensaje']);
          $this->data['mensaje']= $this->getMensaje();
        }else{
          $this->error['mensaje']= '<span class="contactError">Es necesario agregar un mensaje</span>';
        }

        if(empty($this->error)) return $this->data;
        else return $this->error;

      }else{
        $this->error['general']= '<span class="contactError">Es necesario llenar el formulario</span>';
        return $this->error;
      }
    }
  }
  #

  class SendEmailController extends SendEmailForm{
    var $mensaje,
        $sendTo= 'niel.gatero@gmail.com';
    function outConstructor(){
    	$this->formValidator();
    }
    function formView(){
      ?>
      <form action="<?php echo bloginfo('url'); ?>/sendemail/" role='ContactForm' method='POST'>
        <div class='form-group'>
          <label for='nombre'>nombre</label>
          <input type='text' name='nombre' class='form-control input-xs' id='nombre'>
          <?php #echo $this->mensaje['error']['nombre']; ?>
        </div>
        <div class='form-group'>
          <label for='asunto'>asunto</label>
          <input type='text' name='asunto' class='form-control input-xs' id='asunto'>
          <?php #echo $this->mensaje['error']['asunto']; ?>
        </div>
        <div class='form-group'>
          <label for='email'>email</label>
          <input type='text' name='email' class='form-control input-xs' id='email'>
          <?php #echo $this->mensaje['error']['email']; ?>
        </div>
        <div class='form-group'>
          <label for='mensaje'>mensaje</label>
          <textarea name='mensaje' class='form-control' id='mensaje'></textarea>
          <?php #echo $this->mensaje['error']['mensaje']; ?>
        </div>
        <div class='form-group'>
          <button type='submit' class="btn btn-green pull-right">ENVIAR</button>
        </div>
        <?php #echo $this->mensaje['error']['general']; ?>
      </form>
      <?php
    }
  }
  $mail= new SendEmailController();
?>