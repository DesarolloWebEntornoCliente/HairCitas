package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Empleado;
import es.altair.bean.Tiempo;

public class TiempoDAOImpl implements TiempoDAO {

	public List<Tiempo> listar() {
		
		List<Tiempo> tiempos = new ArrayList<Tiempo>();

		Session sesion = Conexion.abrirConexion();
		
		try {

			tiempos = sesion.createQuery("FROM Tiempo t ").list();

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return tiempos;
	}

	public Tiempo obtenerTiempo(int id) {
		
		Tiempo tmp = null;
		
		Session sesion = Conexion.abrirConexion();
		
		tmp = (Tiempo)sesion.createQuery("select s from Tiempo s where idTiempo=:id").setParameter("id", id).uniqueResult();
		
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
		
		return tmp;
	}

}
