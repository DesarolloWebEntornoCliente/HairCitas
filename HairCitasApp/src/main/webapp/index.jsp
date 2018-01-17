<html>
<head>
<title>Web App</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="fonts/font-awesome.min.css">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
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
				<hr>
				<form role="form" method="POST" action="ValidarUsuario">
					<div class="form-group">
						<label for="usuario">Usuario</label> <input type="text"
							class="form-control" id="usuario" name="usuario"
							placeholder="Usuario" autofocus required="required">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" id="password" name="password"
							placeholder="Password" required="required">
					</div>
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-sign-in"></i> Enviar
					</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='jsp/registrar.jsp'">
						<i class="fa fa-user-plus"></i> Registrar
					</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
