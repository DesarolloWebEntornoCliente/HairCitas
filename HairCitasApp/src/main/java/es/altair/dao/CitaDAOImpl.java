package es.altair.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
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
	
	public Cita obtenerCita(int id) {
		
		Cita cit = null;
		
		Session sesion = Conexion.abrirConexion();
		
		cit = (Cita)sesion.createQuery("select s from Cita s where idCita=:id").setParameter("id", id).uniqueResult();
		
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
		
		return cit;
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
			//sesion.close();
			// sf.close();
			Conexion.desconectar(sesion);
		}
		
	}

	public void insertar(Cita c, Date data) {
		
		Session sesion = Conexion.abrirConexion();
		
		Query query = sesion.createSQLQuery("insert into citas (fecha, idUsuario, idEmpleado, idServicio) values (:f, :u, :e, :s)");
		query.setParameter("f", data);
		query.setParameter("u", c.getUsuario());
		query.setParameter("e", c.getEmpleado());
		query.setParameter("s", c.getServicio());
		query.executeUpdate();
		

		sesion.getTransaction().commit();
		
		try {

		
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public Cita ultimaCitaGuardada() {
		
		Cita cit = null;
		
		int id = 0;
		
		Session sesion = Conexion.abrirConexion();
		
		try {
			id = (Integer) sesion.createSQLQuery("SELECT MAX(idCita) from citas").uniqueResult();

		} catch (Exception e) {
			id=0;
		}
		
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
				" where c.idUsuario=:id order by c.fecha, t.tiempo").setParameter("id", id).list();
		
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

	public List<Object[]> listarCitas() {
		
	List<Object[]> citaFull = new ArrayList<Object[]>();
		
		Session sesion = Conexion.abrirConexion();
		
		citaFull = sesion.createSQLQuery("select c.idCita, c.fecha, t.tiempo, s.descripcion, e.nombre, u.idUsuario from citas c join servicios s on (c.idServicio=s.idServicio) join empleados e on (c.idEmpleado=e.idEmpleado)\r\n" + 
				"join tiempoempleados te on (c.idCita=te.idCita) join tiempos t on (t.idTiempo=te.idTiempo) join usuarios u on (c.idUsuario=u.idUsuario) order by c.fecha, t.tiempo, e.nombre;").list();
		
		/*			
		citaFull = sesion.createSQLQuery("select c.idCita, c.fecha, t.tiempo, u.nombre, s.descripcion, e.nombre from citas c join usuarios u on (c.idUsuario=u.idUsuario) "
				+ "join servicios s on (c.idServicio=s.idServicio) join empleados e on (c.idEmpleado=e.idEmpleado) join tiempoempleados te on (c.idCita=te.idCita) "
				+ "join tiempos t on (t.idTiempo=te.idTiempo) order by c.fecha, t.tiempo").list();
		*/
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
	
		return citaFull;
	}

}
