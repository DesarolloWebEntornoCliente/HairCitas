<%@page import="es.altair.dao.CitaDAOImpl"%>
<%@page import="es.altair.dao.CitaDAO"%>
<%@page import="es.altair.dao.EmpleadoDAOImpl"%>
<%@page import="es.altair.dao.EmpleadoDAO"%>
<%@page import="es.altair.dao.UsuarioDAOImpl"%>
<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <link href="../css/codigo.css" rel="stylesheet">
    
    
    <script type="text/javascript" src="../js/validaciones.js"></script>
    
  </head>

<script>
function validarEmail(campo) {
	if (!esCorrectoEmail(campo.value)) {
		mostrarError(campo.id, "Error: Email Incorrecto");
	} else {
		borrarError(campo.id);
	}
}
</script>


  <body class="nav-md">
    <div class="container body">
    
    	<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesi�n");
			} else {
				
				UsuarioDAO uDAO = new UsuarioDAOImpl();
				int numUsuarios = uDAO.cuentaUsuarios();
				
				EmpleadoDAO eDAO = new EmpleadoDAOImpl();
				int numEmpleados = eDAO.cuentaEmpleados();
				
				CitaDAO cDAO = new CitaDAOImpl();
				int numCitas = cDAO.cuentaCitas();
				

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
                      <li><a href="manipularUsuario.jsp">Manipular Datos</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Empleados <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="insertarEmpleado.jsp">Insertar</a></li>
                      <li><a href="manipularEmpleado.jsp">Manipular Datos</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Citas <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="manipularCita.jsp">Manipular Datos</a></li>
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
                    <li><a href="../CerrarSesion"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">0</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>Verificar Alertas</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">


		<div class="row">
			<div class="col-md-8">
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
			<section class='form'>
				
				<form action="../InsertarUsuario" class="form-horizontal" method="post"  onsubmit="return validarFormulario()">>
					<div class="form-group">
						<label class="col-md-2 control-label" for="login">Login</label>
						<div class="col-md-6">
							<input type="text" id="login" name="login" placeholder="Login"
								class="form-control input-md" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="password">Password</label>
						<div class="col-md-6">
							<input type="password" id="password" name="password" placeholder="Password"
								class="form-control input-md" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="nombre">Nombre</label>
						<div class="col-md-6">
							<input type="text" id="nombre" name="nombre" placeholder="Nombre"
								class="form-control input-md" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="email">Email</label>
						<div class="col-md-6">
							<input type="email" id="email" name="email" placeholder="Email" class="form-control input-md" required="required" onblur="validarEmail(this)">
						</div>
					</div>
					
					 <div class="form-group">
					 <label class="col-md-2 control-label" for="estado">Tipo</label>
                        <div class="col-md-6">
                          <div id="gender" class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input type="radio" name="estado" value="0" required> &nbsp; Usuario &nbsp;
                            </label>
                            <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input type="radio" name="estado" value="1"> Admin
                            </label>
                          </div>
                        </div>
                      </div>
					
					<br>
					<br>
					<div class="form-group">
						<div class="col-md-6">
							<input type="submit" value="Enviar" class="btn btn-primary">
						</div>
					</div>
				</form>
				</section>
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
	    <script src="../js/multifield.js"></script>
    <script src="../js/validator.js"></script>
	<script>
		// initialize the validator function
		validator.message['date'] = 'not a real date';

		// validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
		$('form')
			.on('blur', 'input[required], input.optional, select.required', validator.checkField)
			.on('change', 'select.required', validator.checkField)
			.on('keypress', 'input[required][pattern]', validator.keypress);

		$('.multi.required')
			.on('keyup blur', 'input', function(){
				validator.checkField.apply( $(this).siblings().last()[0] );
			});

		// bind the validation to the form submit event
		//$('#send').click('submit');//.prop('disabled', true);

		$('form').submit(function(e){
			e.preventDefault();
			var submit = true;

			// Validate the form using generic validaing
			if( !validator.checkAll( $(this) ) ){
				submit = false;
			}

			if( submit )
				this.submit();

			return false;
		});

		/* FOR DEMO ONLY */
		$('#vfields').change(function(){
			$('form').toggleClass('mode2');
		}).prop('checked',false);

		$('#alerts').change(function(){
			validator.defaults.alerts = (this.checked) ? false : true;
			if( this.checked )
				$('form .alert').remove();
		}).prop('checked',false);
	</script>
  </body>
</html>
