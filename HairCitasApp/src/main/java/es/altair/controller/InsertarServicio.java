package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Empleado;
import es.altair.bean.Servicio;
import es.altair.dao.EmpleadoDAO;
import es.altair.dao.EmpleadoDAOImpl;
import es.altair.dao.ServicioDAO;
import es.altair.dao.ServicioDAOImpl;

/**
 * Servlet implementation class InsertarServicio
 */
public class InsertarServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertarServicio() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String descripcion = request.getParameter("descripcion");
		int tiempo = Integer.parseInt(request.getParameter("tiempo"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		
		Servicio serv = new Servicio(descripcion, tiempo, precio);
		
		ServicioDAO sDAO = new ServicioDAOImpl();
		
		String msg = "";		
		

			sDAO.insertar(serv);

			msg = "Servicio Registrado";
				
			response.sendRedirect("jsp/manipularServicio.jsp?mensaje="+msg);
		
	}

}
