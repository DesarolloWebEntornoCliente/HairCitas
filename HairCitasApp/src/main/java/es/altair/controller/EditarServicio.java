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
 * Servlet implementation class EditarServicio
 */
public class EditarServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarServicio() {
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
		
		int id = Integer.parseInt(request.getParameter("idServicio"));
		String descripcion = request.getParameter("descripcion");
		int tiempo = Integer.parseInt(request.getParameter("tiempo"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		
		Servicio serv = new Servicio(id, descripcion, tiempo, precio);
		
		ServicioDAO sDAO = new ServicioDAOImpl();
		
		int filas = 0;
		String msg = "";		
		

			sDAO.actualizar(serv);

			msg = "Servicio Actualizado";
				
			response.sendRedirect("jsp/manipularServicio.jsp?mensaje="+msg);
	}


}
