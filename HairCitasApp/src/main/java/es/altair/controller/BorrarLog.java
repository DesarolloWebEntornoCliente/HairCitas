package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.dao.CitaDAO;
import es.altair.dao.CitaDAOImpl;
import es.altair.dao.UtilDAO;
import es.altair.dao.UtilDAOImpl;

/**
 * Servlet implementation class BorrarLog
 */
public class BorrarLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarLog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 int id = Integer.parseInt(request.getParameter("idLog"));
				
		UtilDAO utDAO = new UtilDAOImpl();
		
		utDAO.borrar(id);
		
			response.sendRedirect("jsp/principalAdmin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
