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

			citas = sesion.createQuery("FROM Cita c WHERE usuario=:usu order by fecha").setParameter("usu", u).list();

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

	public List<Object[]> listaCitaCompleta(Usuario u) {
		
	List<Object[]> citaFull = new ArrayList<Object[]>();
		
		Session sesion = Conexion.abrirConexion();
			
		int id = u.getIdUsuario();
		
		citaFull = sesion.createSQLQuery("select c.fecha, t.tiempo, s.descripcion, e.nombre, c.idCita  from citas c join tiempoempleados te on (c.idCita=te.idCita)" + 
				"join tiempos t on (t.idTiempo=te.idTiempo) join servicios s on (c.idServicio=s.idServicio) join empleados e on (c.idEmpleado=e.idEmpleado)" + 
				" where c.idUsuario=:id").setParameter("id", id).list();
		
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
	
		return citaFull;
	}

	public int cuentaCitas() {
	long numCitas = 0;
		
		Session sesion = Conexion.abrirConexion();
		
		try {

			numCitas = (Long) sesion.createQuery("select count(*) from Cita d").uniqueResult(); 		


			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return  (int) numCitas;
	}

}
