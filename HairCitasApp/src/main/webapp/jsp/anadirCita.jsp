<%@page import="es.altair.bean.Tiempo"%>
<%@page import="es.altair.dao.TiempoDAOImpl"%>
<%@page import="es.altair.dao.TiempoDAO"%>
<%@page import="es.altair.bean.Empleado"%>
<%@page import="es.altair.dao.EmpleadoDAOImpl"%>
<%@page import="es.altair.dao.EmpleadoDAO"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="es.altair.bean.Cita"%>
<%@page import="es.altair.bean.Servicio"%>
<%@page import="es.altair.dao.ServicioDAOImpl"%>
<%@page import="es.altair.dao.ServicioDAO"%>
<%@page import="es.altair.dao.CitaDAOImpl"%>
<%@page import="es.altair.dao.CitaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

   <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/gh/atatanasov/gijgo@1.7.3/dist/combined/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/gh/atatanasov/gijgo@1.7.3/dist/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Anadir Cita</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<link rel="stylesheet" href="../css/gijgo.min.css">
<script src="../js/gijgo.min.js"></script>

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
</head>

<body>
	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				 ServicioDAO sDAO = new ServicioDAOImpl();
				 List<Servicio> servicios = sDAO.listar();
				 
				 EmpleadoDAO eDAO = new EmpleadoDAOImpl();
				 List<Empleado> empleados = eDAO.listar();
				 
				 TiempoDAO tDAO = new TiempoDAOImpl();
				 List<Tiempo> tiempos = tDAO.listar();
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
					<form action="../AnadirCita" method="post" role="form" name="formulario" >
						<h3>Anadir Cita</h3>
						<div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Servicio  </label>
						  </div>
							<select class="custom-select" id="servicio" name="servicio">
							    <option selected>Seleccione el Servicio...</option>
								<%				
									for (Servicio s : servicios) {
								%>
						    	<option value="<%=s.getIdServicio()%>"><%=s.getDescripcion()%></option>
								<%
									}
								%>						  
							</select>
						</div>

						<div class="input-group">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Empleado  </label>
						  </div>
						  <select class="custom-select" id="empleado" name="empleado">
							    <option selected>Seleccione el Empleado...</option>
								<%				
									for (Empleado e : empleados) {
								%>
						    	<option value="<%=e.getIdEmpleado()%>"><%=e.getNombre()%></option>
								<%
									}
								%>			
						  </select>
						</div>
						<div class="input-group">
						   <label>Fecha <input id="datepicker" name="datepicker"/></label> 
						    <script>
						        $('#datepicker').datepicker({
						            showOtherMonths: true
						        });
						    </script>
						</div>    
						    
						<div class="input-group">

								<%				
									for (Tiempo t : tiempos) {
								%>
									<label class="custom-control custom-radio">
									<input id="radio1" name="radio1" type="radio" class="custom-control-input" value="<%=t.getIdTiempo()%>">
									<span class="custom-control-indicator"></span>
									<span class="custom-control-description"><%=t.getTiempo()%></span>
									</label>
								<%
									}
								%>	
													
						</div>
						<script type="text/javascript">
							$(document).ready(function()
								{
								$("#boton").click(function () {	 
									//alert($('input:radio[name=radio1]:checked').val());
									$("#formulario").submit();
									});
								 });
						</script>
					</br>
					</br>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary" id="boton">
						</div>
					</form>
				</div>
			</div>
		</div>


		<%
			}
		%>



	</div>


	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>