package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import es.altair.bean.Empleado;
import es.altair.bean.Servicio;
import es.altair.bean.Usuario;
import es.altair.util.Encriptaciones;

public class UsuarioDAOImpl implements UsuarioDAO {
	
	 String key = "47AE31A79FEEB2A3"; // LLAVE DE INCRIPTACIÓN
	 String iv = "0123456789ABCDEF"; // VETOR DE INICIALIZACIÓN

	public Usuario comprobarUsuario(String login, String password) {
		
		Usuario usu = null;
		String passEnc = "";
		try {
			passEnc = Encriptaciones.encrypt(key, iv, password);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		SessionFactory sf = new Configuration().configure().buildSessionFactory();
		Session sesion = sf.openSession();
		
		try {
			
			sesion.beginTransaction();

			usu = (Usuario) sesion.createQuery("SELECT u FROM Usuario u WHERE login=:l AND password=:p")
					.setParameter("l", login)
					.setParameter("p", passEnc).uniqueResult();

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			sf.close();
		}

		return usu;
	}

	public int insertar(Usuario usu) {
		
		int filas = 0;
		String passEnc = "";
		try {
			passEnc = Encriptaciones.encrypt(key, iv, usu.getPassword());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Session sesion = Conexion.abrirConexion();
		try {

			filas = sesion.createSQLQuery("INSERT INTO usuarios (login, password, nombre, email, tipo)"
							+ "values (:l, :p, :n, :e, :t)")
					.setParameter("l", usu.getLogin())
					.setParameter("p", passEnc)
					.setParameter("n", usu.getNombre())
					.setParameter("e", usu.getEmail()).setParameter("t", usu.getTipo()).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		return filas;
	}

	public boolean validarEmail(Usuario usu) {
		boolean correcto = true;

		Session sesion = Conexion.abrirConexion();
		try {

			if ((Usuario) sesion.createQuery("From Usuario Where email=:e")
					.setParameter("e", usu.getEmail())
					.uniqueResult() != null)
				correcto = false;

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return correcto;
	}

	public int cuentaUsuarios() {
		
		long numUsuarios = 0;
				
		Session sesion = Conexion.abrirConexion();
		
		try {

			numUsuarios = (Long) sesion.createQuery("select count(*) from Usuario d").uniqueResult(); 		


			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return  (int) numUsuarios;
	}

	public List<Usuario> listar() {
		
		List<Usuario> usuarios = new ArrayList<Usuario>();

		Session sesion = Conexion.abrirConexion();
		
		try {

			usuarios = sesion.createQuery("FROM Usuario e order by nombre").list();

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return usuarios;
	}

	public void borrar(int id) {
		
		Session sesion = Conexion.abrirConexion();
		try {

			sesion.createQuery("DELETE FROM Usuario WHERE idUsuario=:id")
				.setParameter("id", id)
				.executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public Usuario obtenerUsuarioPorId(int id) {
		
		Usuario usu = null;
		
		Session sesion = Conexion.abrirConexion();
		
		usu = (Usuario)sesion.createQuery("select s from Usuario s where idUsuario=:id").setParameter("id", id).uniqueResult();
		
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
		
		return usu;
	}

	public void actualizar(Usuario usu) {
		
		int filas = 0;
		String passEnc = "";
		try {
			passEnc = Encriptaciones.encrypt(key, iv, usu.getPassword().trim());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Session sesion = Conexion.abrirConexion();
		try {

			sesion.createQuery("update Usuario set login=:l, password=:p, nombre=:n, email=:e, tipo=:t where idUsuario=:id")
					.setParameter("l", usu.getLogin())
					.setParameter("p", passEnc)
					.setParameter("n", usu.getNombre())
					.setParameter("e", usu.getEmail())
					.setParameter("id", usu.getIdUsuario())
					.setParameter("t", usu.getTipo()).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}	
		
	}

	public boolean verificarLogin(Usuario usu) {
		boolean correcto = true;
		
		Session sesion = Conexion.abrirConexion();

		try {

			if ((Usuario) sesion.createQuery("From Usuario Where login=:e")
					.setParameter("e", usu.getLogin())
					.uniqueResult() != null)
				correcto = false;

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return correcto;
	}
	
}

