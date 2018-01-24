package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.dao.CitaDAO;
import es.altair.dao.CitaDAOImpl;

/**
 * Servlet implementation class BorrarCita
 */
public class BorrarCita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarCita() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String numControlStr = "";
		
		numControlStr = request.getParameter("numControlPainel");
		
		
		
		int id = Integer.parseInt(request.getParameter("idCita"));
		
		CitaDAO cDAO = new CitaDAOImpl();
		
		cDAO.borrar(id);
		
		if(numControlStr.equals("1"))
			response.sendRedirect("jsp/principalUsu.jsp");
		else
			response.sendRedirect("jsp/manipularCita.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
