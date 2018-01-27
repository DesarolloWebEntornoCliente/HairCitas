package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Servicio;
import es.altair.bean.Usuario;
import es.altair.dao.ServicioDAO;
import es.altair.dao.ServicioDAOImpl;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImpl;

/**
 * Servlet implementation class EditarUsuario
 */
public class EditarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuario() {
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
		
		int estado = 0;
		int id = Integer.parseInt(request.getParameter("idUsuario"));

		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		try {
			estado = Integer.parseInt(request.getParameter("estado"));

		} catch (Exception e) {
			estado = Integer.parseInt(request.getParameter("estadoUsu"));

		}
		
		Usuario usu = new Usuario(id, login, password, nombre, email, estado);
		
		UsuarioDAO uDAO = new UsuarioDAOImpl();
		
		String msg = "";		
		
			uDAO.actualizar(usu);

			msg = "Usuario Actualizado";
				
			response.sendRedirect("jsp/manipularUsuario.jsp?mensaje="+msg);
	}

}
