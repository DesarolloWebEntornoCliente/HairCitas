package es.altair.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

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

}

