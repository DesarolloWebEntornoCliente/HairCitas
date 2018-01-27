package es.altair.controller;

import es.altair.bean.Usuario;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RegistrarUsuario
 */
//@javax.servlet.annotation.WebServlet(name = "RegistrarUsuario", urlPatterns = {"/RegistrarUsuario"})
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarUsuario() {
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
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		
		Usuario usu = new Usuario(login, password, nombre, email, 0);
		
		UsuarioDAO uDAO = new UsuarioDAOImpl();
		
		int filas = 0;
		String msg = "";
		boolean yaExiste = uDAO.verificarLogin(usu);
		
		if (uDAO.validarEmail(usu) && yaExiste) {
			filas = uDAO.insertar(usu);
			if (filas == 1) {
				msg = "Usuario Registrado";
				
				response.sendRedirect("jsp/manipularUsuario.jsp?mensaje="+msg);
			}
			else {
				msg = "Error al Registrar al Usuario";
				
				response.sendRedirect("jsp/insertarUsuario.jsp?mensaje="+msg);
			}
		} else {
			msg = "Email o Login ya registrado. Intentelo con otro";
			
			response.sendRedirect("jsp/insertarUsuario.jsp?mensaje="+msg);
		}
		
		
	}

}
