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
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/gh/atatanasov/gijgo@1.7.3/dist/combined/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/gh/atatanasov/gijgo@1.7.3/dist/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
 
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">	

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <link href="../css/codigo.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
    
 	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				 ServicioDAO sDAO = new ServicioDAOImpl();
				 List<Servicio> servicios = sDAO.listar();
				 
				 EmpleadoDAO eDAO = new EmpleadoDAOImpl();
				 List<Empleado> empleados = eDAO.listar();
				 
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
                      <a href="principalUsu.jsp"><img src="../images/hairMin.jpg" alt="..." class="img-responsive " id="logoUsu"> <span></span></a>

               
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

		<div class="row col-md-10 col-md-offset-3">
		
						<div class="form-area">
		
		
		<form action="../AnadirHora" method="post" role="form" name="formulario" >   
						<h3>Anadir Cita</h3>
						<table class="table table-striped">
						<div class="input-group mb-3">
						<tr>
						<td>
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Servicio  </label>
						  </div>
						</td>
						<td>
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
						</td>
						<td>
						<div class="input-group">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Empleado  </label>
						  </div>
						</td>
						<td>
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
						</td>
						<td>
							<div class="input-group">
							   <label>Fecha <input id="datepicker" name="datepicker"  /></label>
							</div>    
					
						   <div>
						    <script>
						        $('#datepicker').datepicker({
						            showOtherMonths: true
						        });
						    </script>
						    </div>
						 </td>							
						 </tr>
						</div>
						<script type="text/javascript">
													
							$(document).ready(function(){
								$("#boton").click(function () {	 
									$("#formulario").submit();
									});								
								 });
						</script>
					</tr>
					
					<tr>
					<td>
					<br>
					<br>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary" id="boton" value="Seleccionar Horario">
						</div>
					</td>
					<td>
					<br>
					<br>
						<div class="form-group">
						<button type="button" class="btn btn-primary" onclick="location.href='principalUsu.jsp'">Volver</button>
						
						</div>
					</td>
					</tr>
				</table>
				</form>
		</div>
		</div>
		</div>
		<!-- Fin page content -->
		
		
      	<%
			}
		%>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>