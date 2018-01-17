<%@page import="java.util.List"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="es.altair.bean.Cita"%>
<%@page import="es.altair.dao.CitaDAOImpl"%>
<%@page import="es.altair.dao.CitaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Anadir Cita</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
</head>

<body>
	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				
		%>

		<div class="row">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Bienvenido
						<%=((Usuario) session.getAttribute("usuLogeado")).getNombre()%>
				</a></li>
				<li class="breadcrumb-item"><a href="principalUsu.jsp">Pincipal
						Usuario</a></li>
				<li class="breadcrumb-item">Añadir Cita</li>
				<li class="breadcrumb-item active"><a href="../CerrarSesion">Cerrar
						Sesión</a></li>
			</ol>
		</div>

		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="../AnadirCita" method="post" role="form"
						enctype="multipart/form-data">
						<h3>Anadir Cita</h3>
						<div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Servicio  </label>
						  </div>
						  <select class="custom-select" id="servicio">
						    <option selected>Choose...</option>
						    <option value="1">One</option>
						    <option value="2">Two</option>
						    <option value="3">Three</option>
						  </select>
						</div>

						<div class="input-group">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Empleado  </label>
						  </div>
						  <select class="custom-select" id="servicio">
						    <option selected>Choose...</option>
						    <option value="1">One</option>
						    <option value="2">Two</option>
						    <option value="3">Three</option>
						  </select>
						</div>
					</br>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary">
						</div>
					</form>
				</div>
			</div>
		</div>


		<%
			}
		%>



	</div>


	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>