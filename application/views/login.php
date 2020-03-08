<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap.min.css">
    <script type="text/javascript" src="http://localhost/ci_shop/assets/js/jquery-3.4.1.js"></script>    
    <script src="https://code.jquery.com/jquery-3.4.1.js" 
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <title>Register page</title>
    
  </head>
  <body>
    
    <?php echo validation_errors('<div class="alert alert-danger">','</div>'); ?>
      <div class="container">
      
      <div class="col-md-8 col-md-offset-4 col-vertical-4">
        <div class="card">
        <?php if(isset($_SESSION['success'])) { ?>
        <div class="alert alert-success"><?php echo $_SESSION['success']; ?></div> 
        <?php
        }?>
        <?php if(isset($_SESSION['error'])) { ?>
            <div class="alert alert-danger"><?php echo $_SESSION['error']; ?></div>
        <?php
        }?>
        <h5 class="card-header">Login</h5>
    <form  method="POST">
        <div class="card-body">
        <div id="message"></div>
        <div>
            <label >Username:</label><br>
            <input class="col-md-4" name="username" type="text" id="form_username" autocomplete="off" >
            <small class="text-danger" id="username_error_message"><?php echo form_error('username'); ?><?php echo form_error('username','<p style="color:#F83A18">','</p>'); ?></small>             
        </div>
        <div>
            <label >Password:</label><br>
            <input class="col-md-4" name="password" type="password" id="form_password" autocomplete="off" >
            <small class="error_form text-danger" id="password_error_message"><?php echo form_error('password','<p style="color:#F83A18">','</p>'); ?></small>
        </div><br>
        <div>        
            <label for="captcha"><?php echo $captcha['image']; ?></label><br>
            <input class="col-md-4" name="userCaptcha" type="text" id="form_userCaptcha" autocomplete="off" placeholder="Enter above text" value="<?php if(!empty($userCaptcha)){echo $userCaptcha;} ?>">
            <small class="error_form required-server text-danger" id="captcha_error_message"><?php echo form_error('userCaptcha','<p style="color:#F83A18">','</p>'); ?></small>
        </div>
        <div>
          <input class="btn btn-primary" type="submit"  id="submit" name="login" style="float: right;">
        </div>
        </form>
        </div>

        <div class="card-footer">
          <span > No account!! <a href="register">Sign Up </a></span>       
        </div>    


    <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
    <!-- <script type="text/javascript" src="http://localhost/ci_shop/assets/js/validatelogin.js"></script>  -->
    <script type="text/javascript" src="http://localhost/ci_shop/assets/js/jquery-3.4.1.js"></script>
  </body>
</html>
<script>

$(document).ready(function(){

$(document).on('click', '#submit', function(e){

  console.log("validation js is ready");
  var username = $("#form_username").val();
  var password =$("#form_password").val();
  var captcha = $("#form_userCaptcha").val();

  var error_username = false;
  var error_password = false;
  var error_captcha = false;
  event.preventDefault();
  // if( username !='' && password !='' && captcha !='' && error_username == false && error_password == false && error_captcha == fals){  
  if( username !='' && password !='' && captcha !=''){  
    // if( error_username != true && error_password != true && error_captcha != true){
      //document.write('not empty');
      // document.write(error_username);
      // document.write(error_password);
      // document.write(error_captcha);
    $.ajax({
          url:"<?php echo base_url(); ?>Auth/loginauth",
          method: "POST",
          data: {
          'username': username,
          'password': password,
          'userCaptcha': captcha,
          },
          dataType: "json",
          success: function(data){
            if(data.status == 200){
              window.location = "<?= base_url("/auth/dashboard") ?>";
            }else if (data.status == 300){
              window.location = "<?= base_url("/Shoping_cart/index") ?>";
            }else if(data.status == 409){
              $("#message").text(data.message);
              $("#message").css({"color":"red"});
              return false; 
            }
            else{
              $("#message").text(data.message);
              $("#message").css({"color":"red"});
              return false; 
            }
          }
      });
      
  }
  else if( username =="" && password=="" && captcha == "" ) {
        $("#username_error_message").html("username is Required");
        $("#username_error_message").show();
        $("#form_username").css("border-bottom","2px solid #F90A0A");
        error_username = "true";

        $("#password_error_message").html("Passwords is Required");
        $("#password_error_message").show();
        $("#form_password").css("border-bottom","2px solid #F90A0A");
        error_password = "true";

        $("#captcha_error_message").html("feild is Required");
        $("#captcha_error_message").show();
        $("#form_userCaptcha").css("border-bottom","2px solid #F90A0A");
        error_captcha = "true";
      //document.write(error_username , error_password , error_captcha);
      }

        $(function(event){
        // $("#username_error_message").hide();
        // $("#password_error_message").hide();
        // $("#captcha_error_message").hide();
        var error_username = false;
        var error_password = false;
        var error_captcha = false;
        
        $("#form_username").focusout(function(){
             check_username();
        });

        $("#form_password").focusout(function(){
             check_password();
        });

        $("#form_userCaptcha").focusout(function(){
            check_userCaptcha();
        });
        function check_username(event){
            var pattern = /^[a-zA-Z]*$/;
            var username = $("#form_username").val()
            if(pattern.test(username)&& username !== ''){
                $("#username_error_message").hide();
                $("#form_username").css("border-bottom","2px solid #34F458");
                  error_username = false;
            }else{
                $("#username_error_message").html("Should contain only Characters");
                $("#username_error_message").show();
                $("#form_username").css("border-bottom","2px solid #F90A0A");
                  error_username = true;
            }
        }
        function check_password(event){
            var password_length = $("#form_password").val().length;
            if( password_length < 5){
                $("#password_error_message").html("At least 5 Characters");
                $("#password_error_message").show();
                $("#form_password").css("border-bottom","2px solid #F90A0A");
                 error_password = true;
            }else{
                $("#password_error_message").hide();
                $("#form_password").css("border-bottom","2px solid #34F458");
                error_password = false;  
            }
        }

        function check_userCaptcha(event){
            var userCaptcha = $("#form_userCaptcha").val().length;
            if( userCaptcha > 0){
                $("#captcha_error_message").hide();
                $("#form_userCaptcha").css("border-bottom","2px solid #34F458");
                //  error_captcha = false;
                return true;
            }
        }

        if( error_username == true || error_password == true || error_captcha == true){
            event.preventDefault();
            // return false;
        }
    });
    // document.write(error_username);
    // document.write(error_password);
    // document.write(error_captcha);
  });
});
</script>
<script>
// $(document).on('click', '#submit', function(){
//   // debugger;
//   var username = $("#form_username").val();
//   var password =$("#form_password").val();
//   var captcha = $("#form_userCaptcha").val();

//   console.log(username);
//   console.log(password);
//   console.log(captcha);
//   // event.preventDefault();
//   // var error_username = true;
//   // var error_password = true;
//   // var error_captcha = true;

//   var error_username = false;
//   var error_password = false;
//   var error_captcha = false;

//   // console.log(error_username);
//   // console.log(error_password);
//   // console.log(error_captcha);

//     // if( username !="" && password !="" && captcha != "" && error_username == false && error_password == false && error_captcha == false) {
//     if( username !="" && password !="" && captcha != "" ) {
//     // if( error_username == false && error_password == false && error_captcha == false){
//       //alert('correct');
//     debugger;
//   	$.ajax({
//       url:"Auth/loginauth",
//       type: 'POST',
//       data: {
//       	'username': username,
//       	'password': password,
//       	'userCaptcha': captcha,
//       },
//       dataType: "json",
//       success: function(response){
//       	alert('save successfully');
//       }
//     });	
    
//   }else{
//     alert('please fill all input');
//   }

  
// // else{

// //     // if(  username.length == 0 && password.length == 0 && captcha.length ==0) {
// //       // if( username =="" && password=="" && captcha == "") {
    
// //     $("#username_error_message").html("username is Required");
// //     $("#username_error_message").show();
// //     $("#form_username").css("border-bottom","2px solid #F90A0A");
// //     error_username = true;

// //     $("#password_error_message").html("Passwords is Required");
// //     $("#password_error_message").show();
// //     $("#form_password").css("border-bottom","2px solid #F90A0A");
// //     error_password = true;

// //     $("#captcha_error_message").html("feild is Required");
// //     $("#captcha_error_message").show();
// //     $("#form_userCaptcha").css("border-bottom","2px solid #F90A0A");
      
// //     error_captcha = true;
// //     event.preventDefault();

// //     // return false;
// //   // }
// //   if( error_username === true || error_password === true || error_captcha === true){
// //       event.preventDefault();
// //       // return false;
// //   }
  
// // }
 

// //   $(function(){
// //     $("#username_error_message").hide();
// //     $("#password_error_message").hide();
// //     $("#captcha_error_message").hide();
    
// //     $("#form_username").focusout(function(){
// //         check_username();
// //     });

// //     $("#form_password").focusout(function(){
// //         check_password();
// //     });

// //     $("#form_userCaptcha").focusout(function(){
// //         check_userCaptcha();
// //     });


// //     function check_username(event){
// //         var pattern = /^[a-zA-Z]*$/;
// //         var username = $("#form_username").val()
// //         if(pattern.test(username)&& username !== ''){
// //             $("#username_error_message").hide();
// //             $("#form_username").css("border-bottom","2px solid #34F458");
// //              error_username = false;
// //         }else{
// //             $("#username_error_message").html("Should contain only Characters");
// //             $("#username_error_message").show();
// //             $("#form_username").css("border-bottom","2px solid #F90A0A");
// //              error_username = true;
// //         }
// //     }

// //     function check_password(event){
// //         var password_length = $("#form_password").val().length;
// //         if( password_length < 5){
// //             $("#password_error_message").html("At least 5 Characters");
// //             $("#password_error_message").show();
// //             $("#form_password").css("border-bottom","2px solid #F90A0A");
// //              error_password = true;
// //         }else{
// //             $("#password_error_message").hide();
// //             $("#form_password").css("border-bottom","2px solid #34F458");
// //              error_password = false;

// //         }
// //     }

// //     function check_userCaptcha(event){
// //         var userCaptcha = $("#form_userCaptcha").val().length;
// //         if( userCaptcha > 0){
// //             $("#captcha_error_message").hide();
// //             $("#form_userCaptcha").css("border-bottom","2px solid #34F458");
// //              error_captcha = false;
// //         }
// //     }

// //     });
//    });
</script>

