package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Cita;
import es.altair.bean.Empleado;
import es.altair.bean.Usuario;

public class CitaDAOImpl implements CitaDAO {

	public List<Cita> listar(Usuario u) {
		List<Cita> citas = new ArrayList<Cita>();

		Session sesion = Conexion.abrirConexion();
		
		try {

			citas = sesion.createQuery("FROM Cita c WHERE usuario=:usu order by fecha, hora").setParameter("usu", u).list();

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return citas;
	}

	public void borrar(int id) {
		
		Session sesion = Conexion.abrirConexion();
		try {

			sesion.createQuery("DELETE FROM Cita WHERE idCita=:id")
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

	public void insertar(Cita c) {
		
		Session sesion = Conexion.abrirConexion();
		
		try {

			sesion.save(c);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public Cita ultimaCitaGuardada() {
		
		Cita cit = null;
		
		Session sesion = Conexion.abrirConexion();
		
		int id = (Integer) sesion.createSQLQuery("SELECT MAX(idCita) from citas").uniqueResult();
		
		cit = (Cita)sesion.createQuery("select s from Cita s where idCita=:id").setParameter("id", id).uniqueResult();
		
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
		
		return cit;
	}

}
