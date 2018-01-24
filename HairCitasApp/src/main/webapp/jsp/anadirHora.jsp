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
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="../images/hair.ico" type="image/ico" />

    <title>Hair Citas </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">	

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
    <link href="css/codigo.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
    
 	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				

				
				 int servicio = Integer.parseInt(request.getParameter("servicio"));
				 String fecha = request.getParameter("datepicker");
				 int empleado = Integer.parseInt(request.getParameter("empleado"));
				
				 ServicioDAO sDAO = new ServicioDAOImpl();
				 List<Servicio> servicios = sDAO.listar();
				 
				 EmpleadoDAO eDAO = new EmpleadoDAOImpl();
				 List<Empleado> empleados = eDAO.listar();
				 
				 TiempoDAO tDAO = new TiempoDAOImpl();
				 List<Object[]> tiempos = tDAO.listaHorariosDisponibles(empleado, fecha);
				 

				 
		%>
    
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
       

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
              <br>
              </div>
              <div class="profile_info">
                <span>Bienvenido,</span>
                <h2><%=((Usuario) session.getAttribute("usuLogeado")).getNombre()%></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                      <a href="principalUsu.jsp"><img src="images/hairMin.jpg" alt="..." class="img-responsive " id="logoUsu"> <span></span></a>

               
              </div>
              <div class="menu_section">
              
                 
                  
              </div>  <!-- FIN DEL MENU LATERAL -->

            </div>  <!-- /sidebar menu -->
            

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="../CerrarSesion">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
           
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
         <div class="right_col" role="main">

		<div class="row col-md-8 col-md-offset-2">
		
		
			<div class="form-area">
					<form action="AnadirCita?servicio=<%=servicio %>&empleado=<%=empleado %>&fecha=<%=fecha %>" method="post" role="form" name="formulario1" id="formulario1" >
						<h3>Anadir Cita</h3>
						<div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Servicio  </label>
					  	</div>
							<input class="form-control" id="servicio" name="servicio" type="text" value="<%=servicio%>" disabled>
						</div>

						<div class="input-group">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Empleado  </label>
						  </div>
								<input class="form-control" id="empleado" name="empleado" type="text" value="<%=empleado%>" disabled>
						</div>
						<div class="input-group">
						   <label>Fecha</label> 
						  		<input class="form-control" id="fecha" name="fecha" type="text" value="<%=fecha%>" disabled>
						</div>   
						
						<br>
						<br> 
						    
						<div class="input-group" id="listaHoras" name="listaHoras">

								<%			
				
									for (Object[] objects : tiempos) {
								%>
								<div class="form-check">
									<label class="custom-control custom-radio">
									<input id="radio1" name="radio1" type="radio" class="custom-control-input" value="<%=objects[0]%>">
									<span class="custom-control-indicator"></span>
									<span class="custom-control-description"><%=objects[1]%></span>
									</label>
								</div>	
								<%
									}
								%>	
													
						</div>
						<script type="text/javascript">
													
						$(document).ready(function(){
							$("#boton").click(function () {	 
								var servicio = document.getElementById("servicio");
								$("#formulario1").submit();
								});								
							 });
						</script>
					</br>
					<table>
					<tr>
					<td>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary" id="boton">
						</div>
					</td>
					<td>
						<div class="form-group">
						<button type="button" class="btn btn-primary" onclick="location.href='jsp/anadirCita.jsp'">Volver</button>
						</div>
					</td>
					</tr>
					</table>
					</form>
				</div>
		
		
		</div>
		</div>
      	<%
			}
		%>
    </div>

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Flot plugins -->
    <script src="vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	
  </body>
</html>