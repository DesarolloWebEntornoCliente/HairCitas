package es.altair.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
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
public class AnadirCita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnadirCita() {
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

		int servicio = Integer.parseInt(request.getParameter("servicio"));
		int empleado = Integer.parseInt(request.getParameter("empleado"));
		int horario = Integer.parseInt(request.getParameter("radio1"));
	
		String fecha = request.getParameter("datepicker");		

		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

		ServicioDAO sDAO = new ServicioDAOImpl();
		Servicio serv = sDAO.obtenerServicio(servicio);
		
		EmpleadoDAO eDAO = new EmpleadoDAOImpl();
		Empleado emp = eDAO.obtenerEmpleado(empleado);
		
		TiempoDAO tDAO = new TiempoDAOImpl();
		Tiempo tiempo = tDAO.obtenerTiempo(horario);
		
		Date data = null;

		try {
			data = formato.parse(fecha);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession sesion = request.getSession();
		
		TiempoEmpDAO teDAO = new TiempoEmpDAOImpl();


		CitaDAO cDAO = new CitaDAOImpl();

		Cita c = new Cita(data, ((Usuario) sesion.getAttribute("usuLogeado")), emp, serv);
		
		cDAO.insertar(c);
		
		TiempoEmpleado te = new TiempoEmpleado(tiempo, c); // verificar se ya tiene ID
		
		teDAO.insertar(te);

		response.sendRedirect("jsp/principalUsu.jsp");

	}

}
