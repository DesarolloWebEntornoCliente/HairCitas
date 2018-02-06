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
     <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="../vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- Ion.RangeSlider -->
    <link href="../vendors/normalize-css/normalize.css" rel="stylesheet">
    <link href="../vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="../vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <!-- Bootstrap Colorpicker -->
    <link href="../vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

    <link href="../vendors/cropper/dist/cropper.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">	

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <link href="../css/codigo.css" rel="stylesheet">
    
    <script type="text/javascript">
        function habilitaBtn () {
            var se = document.getElementById("servicio").value;
            var em = document.getElementById("empleado").value;
           // var dp = document.getElementById("myDatepicker2").value;
            if(se != "Seleccione el Servicio..." && em != "Seleccione el Empleado")
            {
                document.getElementById('btnEnviar').disabled=false;              
            }
        }
    </script>
    
    <style type="text/css">
    	.selecciona{
    		margin: 20px;
    	}
    </style>
    
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
		
		<form action="../AnadirHora" method="post" role="form"  data-parsley-validate name="formulario" class="form-horizontal form-label-left">  
			<h3>Anadir Cita</h3>
				<table>
						<tr>
						<td>
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Servicio  </label>
						  </div>
						</td>
						<td>
							<select id="servicio" name="servicio" onchange="habilitaBtn()">
							    <option selected>Seleccione el Servicio...</option>
								<%				
									for (Servicio s : servicios) {
								%>
						    	<option value="<%=s.getIdServicio()%>"><%=s.getDescripcion()%></option>
								<%
									}
								%>						  
							</select>
						</td>
						</tr>
						<br>
						<br>
						<tr class="selecciona">
							<td>
							<div class="input-group">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">Empleado  </label>
							  </div>
							</td>
							<td>
							  <select id="empleado" name="empleado"  onchange="habilitaBtn()" >
								    <option selected>Seleccione el Empleado</option>
									<%				
										for (Empleado e : empleados) {
									%>
							    	<option value="<%=e.getIdEmpleado()%>"><%=e.getNombre()%></option>
									<%
										}
									%>			
							  </select>
							</td>
						</tr>	
						<tr class="selecciona">
							<td>
				  			<div >
								    <label class="" for="inputGroupSelect01">Fecha  </label>
							</div>
							</td>
							<td>	    
			                    <div class="form-group">
			                        <div class='input-group date'  >
			                            <input type='text' class="form-control" id='myDatepicker2'  name="myDatepicker2" value="myDatepicker2" />
			                            <span class="input-group-addon">
			                               <span class="glyphicon glyphicon-calendar"></span>
			                            </span>
			                        </div>
			                    </div>
			                </td>
					
						    <script>
					        $(function(){
					        	  $('#myDatepicker2').data("DateTimePicker").minDate(e.date);
					        });
						    </script>
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
						<div class="form-group" style="margin-top: 230px;">
							<input type="submit" class="form-control btn btn-primary" id="btnEnviar" disabled value="Seleccionar Horario">
						</div>
					</td>
					<td>
					<br>
					<br>
						<div class="form-group" style="margin-top: 230px;">
						<button type="button" id="btnVolver" class="btn btn-primary" style="margin-left: 10px;" onclick="location.href='principalUsu.jsp'">Volver</button>
						
						</div>
					</td>
					</tr>
				</table>
			</form>
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
	
	   <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-datetimepicker -->    
    <script src="../vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="../vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="../vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- jquery.inputmask -->
    <script src="../vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <!-- jQuery Knob -->
    <script src="../vendors/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- Cropper -->
    <script src="../vendors/cropper/dist/cropper.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    <!-- Initialize datetimepicker -->
<script>
    $('#myDatepicker').datetimepicker();
    
    $('#myDatepicker2').datetimepicker({
        format: 'DD.MM.YYYY',
            locale: 'es'
    });
    
    $('#myDatepicker3').datetimepicker({
        format: 'hh:mm A'
    });
    
    $('#myDatepicker4').datetimepicker({
        ignoreReadonly: true,
        allowInputToggle: true
    });

    $('#datetimepicker6').datetimepicker();
    
    $('#datetimepicker7').datetimepicker({
        useCurrent: false
    });
    
    $("#datetimepicker6").on("dp.change", function(e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    
    $("#datetimepicker7").on("dp.change", function(e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
</script>
	
	
  </body>
</html>



