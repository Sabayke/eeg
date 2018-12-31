<?php
session_start();
$bdd = new PDO('mysql:host=127.0.0.1;dbname=eggdata', 'root', '');

if(isset($_POST['Valider'])) 
{
   $login = htmlspecialchars($_POST['login']);
   $mot_de_passe = htmlspecialchars($_POST['mot_de_passe']);
   if(!empty($login) AND !empty($mot_de_passe)) 
   {
      $requser = $bdd->prepare("SELECT * FROM  auth WHERE login = ? AND mot_de_passe = ?");
	  $requser->execute(array($login, $mot_de_passe));	
      $userexist = $requser->rowCount();
      if($userexist == 1) 
	  {
         $userinfo = $requser->fetch();
         $_SESSION['login'] = $userinfo['login'];
         $_SESSION['mot_de_passe'] = $userinfo['mot_de_passe'];
		// echo "salut";
         header("Location: Principale.php?login=$login");
           } else {
					$erreur = "Vous avez fait une erreur , Veuillez verifier vous informations";
				  }
   } 		 else {
					$erreur = "Tous les champs doivent être complétés !";
				  }
}     
?>	
<!DOCTYPE html>
<html>
<head>
<title>Bienvenue à notre plate-forme</title>
	<!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" >
   
    
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
   

	
	<link href="csslogin/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="csslogin/font-awesome.css" rel="stylesheet"> 

	
	
	<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,
	
</head>
<body>

	<div class="main">
		<h1>Bienvenue à notre plate-forme</h1>
		<div class="main-w3lsrow">
			
			<div class="login-form login-form-left"> 
				<div class="agile-row">
					<div class="head">
						<h2>Se connecter</h2>
						<span class="fa fa-lock"></span>
					</div>					
					<div class="clear"></div>
					<div class="login-agileits-top"> 
						
						<form action="" method="POST"> 
							<input type="text" class="form-control" name="login" Placeholder="Nom de l'utilisateur"/>
							<input type="password" class="form-control" name="mot_de_passe" Placeholder="Mot de passe" />
							<input type="submit" name="Valider" value="Valider">
						<?php
									      echo "<p style='color:red'></p>";
									                
													         if(isset($erreur)) {
									            echo '<font color="red">'.$erreur."</font>";
									         } 
									?>	
						</form> 	
					</div> 
					<div class="login-agileits-bottom"> 
						<h6><a href="#">Avez vous oublié votre mot de passe ?</a></h6>
					</div> 

				</div>  
			</div>  
		</div>
		<!-- //login form -->
		
		<div class="login-agileits-bottom1"> 
		</div>
		
		<!-- social icons -->
		<div class="social_icons agileinfo">
			<ul class="top-links">
				<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
				
				<li><a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a></li>
				
			</ul>
		</div>
		<!-- //social icons -->
		
		<!-- copyright -->
		<div class="copyright">
		 <p style="color: black;">© 2019 All rights reserved | Design by , <strong>Brahim et MSN étudiants à l'Ecole Supérieure polytechnique (ESP) de Dakar </strong></p>
		</div>
		<!-- //copyright --> 
	</div>	
	<!-- //main -->
	
</body>
</html>