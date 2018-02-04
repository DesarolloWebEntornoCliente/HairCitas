package es.altair.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.altair.bean.Cita;
import es.altair.bean.Empleado;
import es.altair.bean.Servicio;
import es.altair.bean.Tiempo;
import es.altair.bean.TiempoEmpleado;
import es.altair.bean.Usuario;
import es.altair.dao.CitaDAO;
import es.altair.dao.CitaDAOImpl;
import es.altair.dao.EmpleadoDAO;
import es.altair.dao.EmpleadoDAOImpl;
import es.altair.dao.ServicioDAO;
import es.altair.dao.ServicioDAOImpl;
import es.altair.dao.TiempoDAO;
import es.altair.dao.TiempoDAOImpl;
import es.altair.dao.TiempoEmpDAO;
import es.altair.dao.TiempoEmpDAOImpl;

/**
 * Servlet implementation class AnadirCita
 */
public class AnadirHora extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnadirHora() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try{	
			
			
			int servicio = Integer.parseInt(request.getParameter("servicio"));
			int empleado = Integer.parseInt(request.getParameter("empleado"));
			String fecha = request.getParameter("datepicker");		
	
			SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
	
			ServicioDAO sDAO = new ServicioDAOImpl();
			Servicio serv = new Servicio();
			
			EmpleadoDAO eDAO = new EmpleadoDAOImpl();
			Empleado emp = new Empleado();
			
			CitaDAO cDAO = new CitaDAOImpl();
			Cita c = new Cita();
			
			Date data = null;
	
			try {
				data = formato.parse(fecha);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.getSession().setAttribute("servicio11", servicio);
			request.getSession().setAttribute("empleado11", empleado);
			
			//response.sendRedirect("jsp/anadirHora.jsp");
			
            //adiciono los datos en el request
			request.setAttribute("servicio", servicio);
			request.setAttribute("servicio", empleado);
			request.setAttribute("fehaHttp", fecha);

			//passo as caracteristicas obtidas do produto para  a pagina altera-produto.jsp
			//	RequestDispatcher rs = request.getRequestDispatcher("jsp/anadirHora.jsp").forward(request, response);
			//	rs.forward(request,response );  
			
				request.getRequestDispatcher("jsp/anadirHora.jsp").forward(request, response);

			
		}catch(Exception e){
			e.printStackTrace();
		}


	}

}
