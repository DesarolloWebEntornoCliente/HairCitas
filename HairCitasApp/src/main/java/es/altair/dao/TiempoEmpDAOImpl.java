package es.altair.dao;

import org.hibernate.Session;

import es.altair.bean.TiempoEmpleado;

public class TiempoEmpDAOImpl implements TiempoEmpDAO {

	public void insertar(TiempoEmpleado te) {
		
	Session sesion = Conexion.abrirConexion();
		
		try {

			sesion.save(te);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

}
