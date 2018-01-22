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
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<link rel="stylesheet" href="../css/gijgo.min.css">
<script src="../js/gijgo.min.js"></script>

<script src="../js/codigo.js"></script>

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
</head>

<body>
	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				
				 int servP = Integer.parseInt(request.getParameter("servicio"));
				 String fechaP = request.getParameter("datepicker");
				 int empP = Integer.parseInt(request.getParameter("empleado"));
				
				 ServicioDAO sDAO = new ServicioDAOImpl();
				 List<Servicio> servicios = sDAO.listar();
				 
				 EmpleadoDAO eDAO = new EmpleadoDAOImpl();
				 List<Empleado> empleados = eDAO.listar();
				 
				 TiempoDAO tDAO = new TiempoDAOImpl();
				 List<Object[]> tiempos = tDAO.listaHorariosDisponibles(empP, fechaP);
				 

				 
		%>

		<div class="row">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Bienvenido
						<%=((Usuario) session.getAttribute("usuLogeado")).getNombre()%>
				</a></li>
				<li class="breadcrumb-item"><a href="principalUsu.jsp">Pincipal
						Usuario</a></li>
				<li class="breadcrumb-item">Añadir Cita</li>
				<li class="breadcrumb-item">Añadir Horario</li>
				<li class="breadcrumb-item active"><a href="../CerrarSesion">Cerrar
						Sesión</a></li>
			</ol>
		</div>


		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="AnadirCita?servi=<%=servP%>> method="get" role="form" name="formulario1" >
						<h3>Anadir Cita</h3>
						<div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Servicio  </label>
					  	</div>
							<input class="form-control" id="servi" name="servi" type="text" value="<%=servP%>" disabled>
						</div>
						</br>
						<br>



						<div class="input-group">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Empleado  </label>
						  </div>
								<input class="form-control" id="empl" name="empl" type="text" value="<%=empP%>" disabled>
						</div>
						<div class="input-group">
						   <label>Fecha</label> 
						  		<input class="form-control" id="fech" name="fech" type="text" value="<%=fechaP%>" disabled>
						</div>   
						
						<br>
						<br> 
						    
						<div class="input-group" id="listaHoras" name="listaHoras">

								<%			
				
									for (Object[] objects : tiempos) {
								%>
									<label class="custom-control custom-radio">
									<input id="radio1" name="radio1" type="radio" class="custom-control-input" value="<%=objects[0]%>">
									<span class="custom-control-indicator"></span>
									<span class="custom-control-description"><%=objects[1]%></span>
									</label>
								<%
									}
								%>	
													
						</div>
						<script type="text/javascript">
													
						$(document).ready(function(){
							$("#boton").click(function () {	 
								$("#formulario1").submit();
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