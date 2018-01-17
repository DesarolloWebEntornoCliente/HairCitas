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
<title>Citas del Usuario</title>
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
				CitaDAO cDAO = new CitaDAOImpl();
				List<Cita> citas = cDAO.listar((Usuario) session.getAttribute("usuLogeado"));
		%>

		<a href="../CerrarSesion">Cerrar Sesión</a>

		<div class="row col-md-8 col-md-offset-2">
			<table class="table table-striped">
				<thead>
					<a href="anadirCita.jsp" class="btn btn-primary btn-xs pull-right"><b>+</b>
						Añadir Cita</a>
					<tr>
						<th>Fecha</th>
						<th>Hora</th>
						<th>Servicio</th>
						<th>Empleado</th>
						<th></th>
					</tr>
				</thead>
				<%
				
					for (Cita l : citas) {
						long anyo = l.getFecha().getYear() + 1900;
						long mes = l.getFecha().getMonth() + 1;
						String hora = String.format("%02d:%02d",l.getHora().getHours(), l.getHora().getMinutes() );
						String fecha = String.format("%02d/%02d/%04d",l.getFecha().getDate(), mes, anyo );
				%>
				<tr>
					<td><%=fecha%></td>
					<td><%=hora%></td>
					<td><%=l.getServicio().getDescripcion()%></td>
					<td><%=l.getEmpleado().getNombre()%></td>
					
						<button type="button" class="btn btn-default"
							onclick="location.href='jsp/editarCita.jsp'">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							Actualizar
						</button> <!-- Button trigger modal -->
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#borrarCita<%=l.getIdCita()%>">
							<i class="fa fa-times" aria-hidden="true"></i> Borrar
						</button> <!-- Modal -->
						<div class="modal fade" id="borrarCita<%=l.getIdCita()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Borrar
											Cita</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										¿Desea borrar la Cita de 
										<%=l.getServicio().getDescripcion() + " de "+ fecha%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarCita?idCita=<%=l.getIdCita()%>'">Sí</button>
									</div>
								</div>
							</div>
						</div>

					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>


		<%
			}
		%>



	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>