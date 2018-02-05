package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.hibernate.Query;
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

	public List<Object[]> listaHorariosDisponibles(int id, String fechaEnt) {
		
		List<Tiempo> tmp1 = new ArrayList<Tiempo>();
		
		List<Object[]> tmp2 = new ArrayList<Object[]>();
		
		
		String fechaConvert = fechaEnt.replace('.', '/');

		String fecha[] = fechaConvert.split("/");
		String fechaAux = String.format("%s-%s-%s", fecha[2], fecha[1], fecha[0]); 
		

		Session sesion = Conexion.abrirConexion();
		
		try {
			
			
			tmp2 = sesion.createSQLQuery("select * from tiempos where idTiempo not in (select te.idTiempo from tiempos t left join tiempoempleados te on (t.idTiempo=te.idTiempo) join citas c on  (te.idCita=c.idCita)\r\n" + 
					"where c.idEmpleado=:id  and fecha=:fechaAux) group by tiempo order by tiempo")
					.setParameter("id", id)
					.setParameter("fechaAux", fechaAux)
					.list();
			

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		


		return tmp2;
	}

}
