<%@page import="java.util.ArrayList"%>
<%@page import="es.altair.dao.ServicioDAOImpl"%>
<%@page import="es.altair.dao.ServicioDAO"%>
<%@page import="es.altair.dao.CitaDAOImpl"%>
<%@page import="es.altair.dao.CitaDAO"%>
<%@page import="es.altair.dao.EmpleadoDAOImpl"%>
<%@page import="es.altair.dao.EmpleadoDAO"%>
<%@page import="es.altair.dao.UsuarioDAOImpl"%>
<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="es.altair.dao.UtilDAOImpl"%>
<%@page import="es.altair.dao.UtilDAO"%>
<%@page import="es.altair.bean.Percentual"%>
<%@page import="es.altair.bean.Log"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="../images/hair.ico" type="image/ico" />

    <title>Hair Citas | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    <script  type="text/javascript" src="../js/codigo.js"></script>
    
    
        
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    
  </head>

  <body class="nav-md">
    <div class="container body">
    
    	<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				
				UsuarioDAO uDAO = new UsuarioDAOImpl();
				int numUsuarios = uDAO.cuentaUsuarios();
				
				EmpleadoDAO eDAO = new EmpleadoDAOImpl();
				int numEmpleados = eDAO.cuentaEmpleados();
				
				CitaDAO cDAO = new CitaDAOImpl();
				int numCitas = cDAO.cuentaCitas();
				
				ServicioDAO sDAO = new ServicioDAOImpl();
				int numServicios = sDAO.cuentaServicios();
				
			    Date ahora = new Date();
			    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
			    String mes = formateador.format(ahora).toString();
				int mesActual = Integer.parseInt(mes.substring(3, 5));
				
				UtilDAO utDAO = new UtilDAOImpl();
				Percentual pMes = new Percentual(mesActual, numUsuarios, numEmpleados, numServicios, numCitas);
				
				List<Log> listaLogs = utDAO.listarLogs();
				
				int numLogs = listaLogs.size();
				
				utDAO.guardarDatosPercentuales(pMes);
				
				Percentual percs = utDAO.listarPercentuales();
				
				double pU=0, pE=0, pS=0,pC=0;
				
				pU = ((numUsuarios - percs.getNumUsu()) * 100) / numUsuarios;
				pE = ((numEmpleados - percs.getNumEmp()) * 100) / numEmpleados;
				pS = ((numServicios - percs.getNumSer()) * 100) / numServicios;
				pC = ((numCitas - percs.getNumCit()) * 100) / numCitas;


		%>
    
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
       

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
              <br>
              <a href="principalAdmin.jsp" class="site_title"><img src="../images/hairMin.jpg" alt="..." class="img-responsive "> <span>Hair Citas</span></a>
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
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="principalAdmin.jsp">Dashboard</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Usuarios <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="insertarUsuario.jsp">Insertar</a></li>
                      <li><a href="manipularUsuario.jsp?numUsuarios=<%=numUsuarios%>">Manipular Datos</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Empleados <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="insertarEmpleado.jsp">Insertar</a></li>
                      <li><a href="manipularEmpleado.jsp?numEmpleados=<%=numEmpleados%>">Manipular Datos</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Citas <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="manipularCita.jsp?numCitas=<%=numCitas%>">Manipular Datos</a></li>
                    </ul>
                  </li>
				  <li><a><i class="fa fa-clone"></i> Gestionar Servicios <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="insertarServicio.jsp">Insertar</a></li>
                      <li><a href="manipularServicio.jsp">Manipular Datos</a></li>
                    </ul>
                  </li>
                </ul>
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
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="../images/cara1.png" alt=""><%=((Usuario) session.getAttribute("usuLogeado")).getNombre()%>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Perfil</a></li>
                    <li><a href="../CerrarSesion"><i class="fa fa-sign-out pull-right"></i> Salir</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green"><%=numLogs %></span>
                  </a>    
                  
 				  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
 				  	<%
				
						for (Log logs : listaLogs) {
							String fecha[] = logs.getFechaLog().toString().split("-");
							String fechaAux = String.format("%s/%s/%s", fecha[1], fecha[2].substring(0,2), fecha[0]); 
					%>
                    <li>
                      <a href="../BorrarLog?idLog=<%=logs.getIdlog() %>">
                        <span class="image"><img src="../images/delete.png" alt="" /></span></a>
                        <span>
                          <span><%=fechaAux %></span>
                        </span>
                        <span class="message">
                           <%=logs.getLogDesc() %>
                        </span>
                      
                    </li>
   
                  <% } %>
                    
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main" id="LoadPage">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total de Usuarios</span>
              <div class="count"><%=numUsuarios %></div>
              <%
              	if(numUsuarios < percs.getNumUsu()){    %>
                    <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i><%=pU %> % </i> Del Mes Anterior</span>
			  <%}else{ %>
              	<span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i><%=pU %> % </i> Del Mes Anterior</span>
              	<%} %>
            </div>

            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Empleados Activos</span>
              <div class="count"><%=numEmpleados %></div>
      		  <%
              	if(numEmpleados < percs.getNumEmp()){    %>
                    <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i><%=pE %> % </i> Del Mes Anterior</span>
			  <%}else{ %>
              	<span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i><%=pE %> % </i> Del Mes Anterior</span>
              	<%} %>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total de Servicios</span>
              <div class="count"><%=numServicios %></div>
      		  <%
              	if(numServicios < percs.getNumSer()){    %>
                    <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i><%=pS %> % </i> Del Mes Anterior</span>
			  <%}else{ %>
              	<span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i><%=pS %> % </i> Del Mes Anterior</span>
              	<%} %>            </div>
          <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total de Citas</span>
              <div class="count"><%=numCitas %></div>
      		  <%
              	if(numCitas < percs.getNumCit()){    %>
                    <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i><%=pC %> % </i> Del Mes Anterior</span>
			  <%}else{ %>
              	<span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i><%=pC %> % </i> Del Mes Anterior</span>
              	<%} %>            </div>
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>Flujo de Actividad en la Página <small>Ultimo Semestre</small></h3>
                  </div>

                <div class="col-md-9 col-sm-9 col-xs-12">
                  <div id="chart_plot_01" class="demo-placeholder"></div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                  <div class="x_title">
                    <h2>Plataformas de Acceso</h2>
                    <div class="clearfix"></div>
                  </div>

                  <div class="col-md-12 col-sm-12 col-xs-6">
                    <div>
                      <p>Facebook </p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <p>Twitter </p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12 col-sm-12 col-xs-6">
                    <div>
                      <p>Navegadores</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <p>Tabletas y Mobiles</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <br />
          <div class="row">
          </div>

            <div class="col-md-8 col-sm-8 col-xs-12">
              <div class="row">

                <div class="col-md-12 col-sm-12 col-xs-12">
  

              </div>
              <div class="row">

              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
 
      	<%
			}
		%>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <!-- Chart.js -->
    <!-- gauge.js -->
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <!-- Skycons -->
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
	<script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    
    
  </body>
</html>
