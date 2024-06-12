<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ATR Login </title>
    <!-- Add Bootstrap CSS link -->
   <link href="./css/bootstrap.min.css" rel="stylesheet">
    <!-- Add custom CSS for styling -->
    <style>
        body {
            background-image: url('./images/logobackdrophydairport.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            color: blue; /* Set text color to white for better readability */
			font-family: calibri;   
        }

        .container {
            max-width: 400px;
            margin:20px;
            margin-left:600px;
           padding:30px;
            
        }


        .form-container {
            background-color: rgba(255, 255, 255, 0.8); /* Add a semi-transparent white background for the form */
            padding: 20px 30px;
            margin-top: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.3);
           
        }

        .form-group {
            margin: 0 0 20px;
        }
        
        input[type="submit"]{
        width:10px;
        }
        .width-200 {
        	width: 200px;
        }
        .width-200 img{
        width: 200px;
        }
        /* header starts*/
.navbar {
	background-color: #191970de;
    color:white;
  }
  .navbar-brand, .navbar-nav .nav-link {
      color: white;
  }
  .navbar {
   display: flex;
   align-items: center;
  }
  .site-name{
  	width: calc(100% - 200px);
  	left: -100px;
	position: relative;
	text-align: center;
	color: #FFF;
	font-weight: 600;
	margin: 0;
  }
  .width-200 {
        	width: 200px;
        }
        .width-200 img{
        width: 200px;
        }
/* header ends*/
/* footer starts */
.footer-container {
	background: #0e56a3;
	padding:20px 0;
	color: #FFF;
	position: fixed;
	bottom: 0;
	width: 100%;
}
.f-container {
	margin: 0 5%;
	max-width: 1600px;
}
.f-container p {
	margin: 0;
	padding: 0;
}
.socialIcon > a img {
 width: 30px;
 margin-left: 5px;
}
/* footer ends */
    </style>
</head>
<body>
<div class="header-container">
    <!-- Navigation Bar -->
    <div class="navbar navbar-expand-sm navbar-dark p-0">
    
        <div class="img-container width-200">
            <img src="./images/waisllogo.png" alt="Your Logo">
        </div>
                <h1 class="center site-name">ATR PROJECT</h1>
            
 </div>
</div>
    <!-- Login Form -->
    <div class="container">
        
        <div class="form-container">
            <h2 class="text-center">Login</h2>
            <form action="./login" method="post" >
                <div class="form-group">
                    <label for="username">LoginId</label>
                    <input type="text" class="form-control" id="username" name="LoginId" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
        </div>
    </div>
   
<div class="footer-container bg-footer">
	<div class="f-container">
	<div class="row">
		<div class="col-6"> 
		<p>© <script>document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))</script> WAISL LTD. All rights reserved.</p>
		</div>
		<div class="socialIcon col-6 d-flex justify-content-end align-items-center">
		<div class="mr-4">Follow us on</div>
		<a href="https://www.facebook.com/WeAreWAISL" class="facebook" target="_blank" title="Facebook"><img src="./images/fb.png"></a>
		<a href="https://twitter.com/WeAreWAISL" class="twitter" target="_blank" title="Twitter"><img src="./images/twitter_Im.png"></a>
		<a href="https://instagram.com/wearewaisl" class="instagram" target="_blank" title="Instagram"><img src="./images/instagram_Im.png"></a>
		<a href="https://www.linkedin.com/company/waisl-limited-formerly-known-as-wipro-airport-it-services-ltd/mycompany/" class="linkedin" target="_blank" title="Linkedin"><img src="./images/linkedin.png"></a>
		</div>
	</div>
</div>
</div>
    <!-- Add jQuery and Bootstrap JS scripts -->
    <script src="./css/jquery-3.5.1.min.js"></script>
    <script src="./css/bootstrap.min.js"></script>
</body>
</html>
