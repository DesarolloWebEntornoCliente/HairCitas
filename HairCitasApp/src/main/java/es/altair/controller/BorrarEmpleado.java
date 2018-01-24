package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.dao.EmpleadoDAO;
import es.altair.dao.EmpleadoDAOImpl;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImpl;

/**
 * Servlet implementation class BorrarEmpleado
 */
public class BorrarEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarEmpleado() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("idEmpleado"));
		
		EmpleadoDAO eDAO = new EmpleadoDAOImpl();
		eDAO.borrar(id);
		
		response.sendRedirect("jsp/manipularEmpleado.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
