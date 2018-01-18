package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Empleado;
import es.altair.bean.Servicio;

public class EmpleadoDAOImpl implements EmpleadoDAO {

	public List<Empleado> listar() {
		List<Empleado> empleados = new ArrayList<Empleado>();

		Session sesion = Conexion.abrirConexion();
		
		try {

			empleados = sesion.createQuery("FROM Empleado e order by nombre").list();

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return empleados;
	}

	public Empleado obtenerEmpleado(int id) {
		Empleado emp = null;
		
		Session sesion = Conexion.abrirConexion();
		
		emp = (Empleado)sesion.createQuery("select s from Empleado s where idEmpleado=:id").setParameter("id", id).uniqueResult();
		
			sesion.getTransaction().commit();
					
		Conexion.desconectar(sesion);
		
		return emp;
	}

}
