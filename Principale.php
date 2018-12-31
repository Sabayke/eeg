<?php
session_start();
$bdd = new PDO('mysql:host=127.0.0.1;dbname=eggdata', 'root', '');
?>

<!DOCTYPE html>
<html>	
<head>
<title>Bienvenue à notre plate-forme Pour les traitements des signaux eeg</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta name="keywords" content="Remedial Appointment Form Bootstrap Responsive Templates, Iphone Compatible Templates, Smartphone Compatible Templates, Ipad Compatible Templates, Flat Responsive Templates"/>
<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link rel="shortcut icon" href="assets/images/gt_favicon.png">
	
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="assets/css/main.css">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
<!--//webfonts-->

</head>
<body class="home">

 
<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="Principale.php"><img src="assets/images/logo.jpg" alt=""></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li class="active"><a href="Principale.php">Acceuil</a></li>
					
					<li><a class="active" href="analyses.html">Analyses</a></li>
					<li><a> <?php echo $_GET['login'];?></a></li>
					
				</ul>
			</div>
		</div>
	</div>  

	<h1 style="top: 60px;">Bienvenue à notre plate-forme de traitements des signaux EEG</h1>

<!--	
	<div class="container">
			<div class="w3-agileits-team-title"> 			
			<div id="horizontalTab">
					<ul class=" resp-tabs-list">
					<li>
						<img src="analyses/Capture0.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture1.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture2.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture3.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture4.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture5.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture6.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture7.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture8.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="analyses/Capture9.jpg" alt=" " class="img-responsive" />
					</li>
					</ul>
			</div>
		</div>
</div>	
		
					<div class=" resp-tabs-container">
					<div class="tab1">
						<div class="team-img-w3-agile">
						<img src="images/tm11.jpg" alt=" " class="img-responsive" />
						<h4>Ousmane NDIOUR</h4>
							<span>Neurologue</span>
							<p>Etudiant à l'Ecole Supérieure Polytechnique.</p>
						</div>
						<div class=" team-Info-agileits">
						<div class=" register-form">
					<form action="#" method="post">
						<div class="fields-grid">
							
								<input type="text" name="Votre nom" placeholder="Nom du patient" required=""> 
								<input type="email" name="Email" placeholder="email" required="">
							<input type="text" name="text" placeholder="Numéro de Téléphone" required=""> 
							
							<div class="styled-input">
								<h2>Sexe :</h2>
								  <input type="radio" name="gender" value="Homme"> homme
								  <input type="radio" name="gender" value="femme"> femme
							</div>
							
							<div class="styled-input">
								<select id="category2" required="">
									<option value="">Choisir l'hôpital</option>
									<option value="">Hôpital 1</option>
									<option value="">Hôpital 2</option>
									<option value="">Hôpital 3</option>
									<option value="">Hôpital 4</option>
									<option value="">Hôpital 5</option>
								</select>
								<span></span>
							</div>
							<div class="styled-input">
							<input class="date" id="datepicker" name="Text" type="text" value="MM/DD/YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}"  required="">
							</div>	
								<div class="content-wthree2">
									<div class="grid-w3layouts1">
										<div class="w3-agile1">
											<label class="rating">Etes vous sûr de prendre ce RDV ?<span>*</span></label>
											<ul>
												<li>
													<input type="radio" id="a-option" name="selector1">
													<label for="a-option">Oui </label>
													<div class="check"></div>
												</li>
												<li>
													<input type="radio" id="b-option" name="selector1">
													<label for="b-option">Non</label>
													<div class="check"><div class="inside"></div></div>
												</li>
											</ul>
												<div class="clear"></div>
										</div>
									</div>
									<div class="clear"></div>
								</div>
								<div class="styled-input">
							
									<textarea name="text" placeholder="Si oui, veuillez nous dire les raisons pour lesquelles vous voulez faire une consultation..."></textarea>
								</div>
								<input type="submit" name="submit" value="Valider vos informations">
							
						</div>
						
					</form>
						
				</div>	
												
						</div>
						<div class="clear"> </div>
					</div>
					
					<div class="tab2">
					<div class=" team-img-w3-agile">
					<img src="images/tm22.jpg" alt=" " class="img-responsive" />
					<h4>Amadou Diaham</h4>
							<span>Dentiste</span>
							<p>Etudiant à l'Ecole Supérieure Polytechnique..</p>
						</div>
						<div class=" team-Info-agileits">
						<div class=" register-form">
					<form action="#" method="post">
					<div class="fields-grid">
							
								<input type="text" name="Nom" placeholder="Nom du patient" required=""> 
								<input type="email" name="Email" placeholder="email" required="">
							<input type="text" name="Telephone" placeholder="Numéro du téléphone" required=""> 
							
							<div class="styled-input">
								<h2>Sexe :</h2>
								  <input type="radio" name="gender" value="male"> Masculin
								  <input type="radio" name="gender" value="female"> Feminin
							</div>
							
							<div class="styled-input">
								<select id="category2" required="">
									<option value="">Choisir l'hôpital</option>
									<option value="">Hôpital 1</option>
									<option value="">Hôpital 2</option>
									<option value="">Hôpital 3</option>
									<option value="">Hôpital 4</option>
									<option value="">Hôpital 5</option>
								</select>
								<span></span>
							</div>
							<div class="styled-input">
							<input class="date" id="datepicker" name="Text" type="text" value="MM/DD/YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}"  required="">
							</div>	
								<div class="content-wthree2">
									<div class="grid-w3layouts1">
										<div class="w3-agile1">
											<label class="rating">Vous prennez des médicaments?<span>*</span></label>
											<ul>
												<li>
													<input type="radio" id="a-option" name="selector1">
													<label for="a-option">Oui </label>
													<div class="check"></div>
												</li>
												<li>
													<input type="radio" id="b-option" name="selector1">
													<label for="b-option">Non</label>
													<div class="check"><div class="inside"></div></div>
												</li>
											</ul>
												<div class="clear"></div>
										</div>
									</div>
									<div class="clear"></div>
								</div>
								<div class="styled-input">
									<textarea name="message" placeholder="Si oui .. lesquel?"></textarea>
								</div>
								<input type="submit" name="submit" value="Valider vos informations">
							
						</div>
						
					</form>
						
				</div>							
						</div>
						<div class="clear"> </div>
					</div>
					<div class="tab3">
						<div class=" team-img-w3-agile">
						<img src="images/tm33.jpg" alt=" " class="img-responsive" />
							<h4>Brahim Elmoctar</h4>
							<span>Radiologiste</span>
							<p>Etudiant à l'Ecole Supérieure Polytechnique..</p>
						</div>
						<div class=" team-Info-agileits">
						<div class=" register-form">
					<form action="#" method="post">
						<div class="fields-grid">
							
								<input type="text" name="Nom" placeholder="Nom du patient" required=""> 
								<input type="email" name="Email" placeholder="email" required="">
							<input type="text" name="Telephone" placeholder="Numéro du téléphone" required=""> 
							
							<div class="styled-input">
								<h2>Sexe :</h2>
								  <input type="radio" name="gender" value="male"> Masculin
								  <input type="radio" name="gender" value="female"> Feminin
							</div>
							
							<div class="styled-input">
								<select id="category2" required="">
									<option value="">Choisir l'hôpital</option>
									<option value="">Hôpital 1</option>
									<option value="">Hôpital 2</option>
									<option value="">Hôpital 3</option>
									<option value="">Hôpital 4</option>
									<option value="">Hôpital 5</option>
								</select>
								<span></span>
							</div>
							<div class="styled-input">
							<input class="date" id="datepicker" name="Text" type="text" value="MM/DD/YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}"  required="">
							</div>	
									<div class="content-wthree2">
									<div class="grid-w3layouts1">
										<div class="w3-agile1">
											<label class="rating">Vous prennez des médicaments?<span>*</span></label>
											<ul>
												<li>
													<input type="radio" id="a-option" name="selector1">
													<label for="a-option">Oui </label>
													<div class="check"></div>
												</li>
												<li>
													<input type="radio" id="b-option" name="selector1">
													<label for="b-option">Non</label>
													<div class="check"><div class="inside"></div></div>
												</li>
											</ul>
												<div class="clear"></div>
										</div>
									</div>
									<div class="clear"></div>
								</div>
								<div class="styled-input">
									<textarea name="message" placeholder="Si oui .. lesquel?"></textarea>
								</div>
								<input type="submit" name="submit" value="Book Appointment">
							
						</div>						
					</form>
						
				</div>
													
						</div>
						<div class="clear"> </div>
					</div>
					<div class="tab4">
					<div class=" team-img-w3-agile">
					<img src="images/tm44." alt=" " class="img-responsive" />
						<h4>Ouria Mara</h4>
							<span>Dermatologiste</span>
							<p>Etudiante à l'Ecole Supérieure Polytechnique.</p>
						</div>
						<div class=" team-Info-agileits">
						<div class=" register-form">
					<form action="#" method="post">
						<div class="fields-grid">
							
								<input type="text" name="Nom" placeholder="Nom du patient" required=""> 
								<input type="email" name="Email" placeholder="email" required="">
							<input type="text" name="Telephone" placeholder="Numéro du téléphone" required=""> 
							
							<div class="styled-input">
								<h2>Sexe :</h2>
								  <input type="radio" name="gender" value="male"> Masculin
								  <input type="radio" name="gender" value="female"> Feminin
							</div>
							
							<div class="styled-input">
								<select id="category2" required="">
									<option value="">Choisir l'hôpital</option>
									<option value="">Hôpital 1</option>
									<option value="">Hôpital 2</option>
									<option value="">Hôpital 3</option>
									<option value="">Hôpital 4</option>
									<option value="">Hôpital 5</option>
								</select>
								<span></span>
							</div>
							<div class="styled-input">
							<input class="date" id="datepicker" name="Text" type="text" value="MM/DD/YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}"  required="">
							</div>	
									<div class="content-wthree2">
									<div class="grid-w3layouts1">
										<div class="w3-agile1">
											<label class="rating">Vous prennez des médicaments?<span>*</span></label>
											<ul>
												<li>
													<input type="radio" id="a-option" name="selector1">
													<label for="a-option">Oui </label>
													<div class="check"></div>
												</li>
												<li>
													<input type="radio" id="b-option" name="selector1">
													<label for="b-option">Non</label>
													<div class="check"><div class="inside"></div></div>
												</li>
											</ul>
												<div class="clear"></div>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							
									
									<textarea name="message" placeholder="Si oui lesquel"></textarea>
									
								
								<input type="submit" name="submit" value="Book Appointment">
							
						</div>
						
					</form>
						
				</div>
													
						</div>
						<div class="clear"> </div>
					</div>
					</div>
					<div class="clear"> </div>
					
			</div>
	</div>
 </div>
-->
		<footer>
		<div class="copyright">		
			<p>© 2018 tous les droits sont reservé | Designed by , <strong>Brahim et Msn étudiants à l'Ecole Supérieure polytechnique (ESP) de Dakar </strong></p>
		</div>
		</footer>
 	
	<!--tabs-->	
<script src="js/jquery.min.js"></script>
<script src="js/easy-responsive-tabs.js"></script>
<script>
$(document).ready(function () {
$('#horizontalTab').easyResponsiveTabs({
type: 'default', //Types: default, vertical, accordion           
width: 'auto', //auto or any width like 600px
fit: true,   // 100% fit in a container
closed: 'accordion', // Start closed if in accordion view
activate: function(event) { // Callback function if tab is switched
var $tab = $(this);
var $info = $('#tabInfo');
var $name = $('span', $info);
$name.text($tab.text());
$info.show();
}
});
$('#verticalTab').easyResponsiveTabs({
type: 'vertical',
width: 'auto',
fit: true
});
});
</script>
<!--//tabs-->
<!-- Calendar -->
<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
		$( "#datepicker,#datepicker1" ).datepicker();
		});
	</script>
<!-- //Calendar -->
</body>
</html>