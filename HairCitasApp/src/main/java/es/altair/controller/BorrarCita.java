package es.altair.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Cita;
import es.altair.bean.Log;
import es.altair.dao.CitaDAO;
import es.altair.dao.CitaDAOImpl;
import es.altair.dao.UtilDAO;
import es.altair.dao.UtilDAOImpl;

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
		
		Cita cit = null;
		
		numControlStr = request.getParameter("numControlPainel");
				
		int id = Integer.parseInt(request.getParameter("idCita"));
		
		CitaDAO cDAO = new CitaDAOImpl();
		
		cit = cDAO.obtenerCita(id); 
		
		cDAO.borrar(id);
		
/*		Calendar c1 = GregorianCalendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		Date data = null;
		
		String fecha = sdf.format(c1.getTime());
		
		try {
			data = sdf.parse(fecha);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		*/
		
		UtilDAO utDAO = new UtilDAOImpl();
		Log lg = new Log("Cita " + cit.getServicio().getDescripcion() + " de "  + cit.getUsuario().getNombre() + " ha sido Cancelada");
		
		utDAO.insertar(lg);
		
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
