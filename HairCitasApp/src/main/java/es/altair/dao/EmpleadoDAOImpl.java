package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Empleado;
import es.altair.bean.Log;
import es.altair.bean.Servicio;
import es.altair.bean.Usuario;
import es.altair.util.Encriptaciones;

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

	public int cuentaEmpleados() {
		long numEmpleados = 0;
		
		Session sesion = Conexion.abrirConexion();
		
		try {

			numEmpleados = (Long) sesion.createQuery("select count(*) from Empleado d").uniqueResult(); 		


			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return  (int) numEmpleados;
	}

	public void borrar(int id) {
		Session sesion = Conexion.abrirConexion();
		try {

			sesion.createQuery("DELETE FROM Empleado WHERE idEmpleado=:id")
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

	public void insertar(Empleado emp) {
		
	Session sesion = Conexion.abrirConexion();
		
		try {

			sesion.save(emp);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public void actualizar(Empleado emp) {
		
		Session sesion = Conexion.abrirConexion();
		
		try {

			sesion.createQuery("update Empleado set nombre=:n, dni=:d, funcion=:f where idEmpleado=:id")
							.setParameter("n", emp.getNombre())
							.setParameter("d", emp.getDni())
							.setParameter("f", emp.getFuncion())
							.setParameter("id", emp.getIdEmpleado())
							.executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public boolean verificarDni(Empleado emp) {
			boolean correcto = true;

			Session sesion = Conexion.abrirConexion();
			try {

				if ((Empleado) sesion.createQuery("From Empleado Where dni=:e")
						.setParameter("e", emp.getDni())
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
