<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Hair Citas | </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">
    <link href="css/codigo.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
				<form role="form" method="POST" action="ValidarUsuario">
              <h1>Login</h1>
 				<%
					String error = request.getParameter("mensaje");
					if (error != null) {
				%>
				<div class="alert alert-warning alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">x</button>
					<strong>Info!</strong>
					<%=error%>
				</div>
				<%
					}
				%>
              <div>
                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Login" required="" />
              </div>
              <div>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="ValidarUsuario">Login</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Eres nuevo aquí?
                  <a href="#signup" class="to_register"> Registrate </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div class="derechos">
                <img src="images/hairMin.jpg" alt="..." class="img-responsive " id="imgLogin">
                  <p>©2018 All Rights Reserved. Railton E. Cardoso! </p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
				<form action="../RegistrarUsuario" method="post">
              <h1>Registrar</h1>
              <div>
                <input type="text" class="form-control" id="login" name="login" placeholder="Login" required />
              </div>
               <div>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
              </div>
               <div>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required />
              </div>
              <div>
                <input type="email" class="form-control"  id="email" name="email" placeholder="Email" required />
              </div>
              <div>
                <a class="btn btn-default submit" href="jsp/registrar.jsp">Enviar</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Ya es miembro ?
                  <a href="#signin" class="to_register"> Login </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div class="derechos">
                <img src="images/hairMin.jpg" alt="..." class="img-responsive " id="imgLogin">
                  <p>©2018 All Rights Reserved. Railton E. Cardoso! </p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
