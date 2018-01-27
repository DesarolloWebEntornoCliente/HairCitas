package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Empleado;
import es.altair.dao.EmpleadoDAO;
import es.altair.dao.EmpleadoDAOImpl;

/**
 * Servlet implementation class EditarEmpleado
 */
public class EditarEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarEmpleado() {
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
		
		int id = Integer.parseInt(request.getParameter("idEmpleado"));
		String funcion = request.getParameter("funcion");
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		
		Empleado emp = new Empleado(id, nombre, dni, funcion);
		
		EmpleadoDAO eDAO = new EmpleadoDAOImpl();
		
		String msg = "";
		boolean noExiste = eDAO.verificarDni(emp);
		
		if (noExiste) {
			
			eDAO.actualizar(emp);

			msg = "Empleado Actualizado";
			
			response.sendRedirect("jsp/manipularEmpleado.jsp?mensaje="+msg);
		
		} else {
			msg = "El DNI/NIE ya está registrado. Intentelo con otro";
			
			response.sendRedirect("jsp/manipularEmpleado.jsp?mensaje="+msg);
		}

	}

}
