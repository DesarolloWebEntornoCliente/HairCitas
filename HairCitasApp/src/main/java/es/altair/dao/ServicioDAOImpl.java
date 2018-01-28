package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Cita;
import es.altair.bean.Servicio;

public class ServicioDAOImpl implements ServicioDAO {

	public List<Servicio> listar() {
		List<Servicio> servicios = new ArrayList<Servicio>();

		Session sesion = Conexion.abrirConexion();
		
		try {

			servicios = sesion.createQuery("FROM Servicio c order by descripcion").list();

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return servicios;
	}

	public Servicio obtenerServicio(int id) {
		Servicio serv = null;
		
		Session sesion = Conexion.abrirConexion();
		
		serv = (Servicio)sesion.createQuery("select s from Servicio s where idServicio=:id").setParameter("id", id).uniqueResult();
		
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
		
		return serv;
	}

	public void borrar(int id) {
		
		Session sesion = Conexion.abrirConexion();
		try {

			sesion.createQuery("DELETE FROM Servicio WHERE idServicio=:id")
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

	public void insertar(Servicio serv) {
		
	Session sesion = Conexion.abrirConexion();
		
		try {

			sesion.save(serv);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public void actualizar(Servicio serv) {
		
		Session sesion = Conexion.abrirConexion();
		
		try {

			sesion.createQuery("update Servicio set descripcion=:d, tiempo=:t, precio=:p where idServicio=:id")
							.setParameter("d", serv.getDescripcion())
							.setParameter("t", serv.getTiempo())
							.setParameter("p", serv.getPrecio())
							.setParameter("id", serv.getIdServicio())
							.executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		
	}

	public int cuentaServicios() {
		
	long numServicios = 0;
		
		Session sesion = Conexion.abrirConexion();
		
		try {

			numServicios = (Long) sesion.createQuery("select count(*) from Servicio d").uniqueResult(); 		

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return  (int) numServicios;
	}

}
