package es.altair.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Empleado;
import es.altair.bean.Log;
import es.altair.bean.Percentual;

public class UtilDAOImpl implements UtilDAO {

	public Percentual listarPercentuales() {
		
	Percentual perc = null;
		
	int mesAbuscar = 0;
		Session sesion = Conexion.abrirConexion();
				
	    Date ahora = new Date();
	    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
	    String mes = formateador.format(ahora).toString();
	    
		mesAbuscar = Integer.parseInt(mes.substring(3, 5))-1;		

		
	try {
		perc = (Percentual)sesion.createQuery("select s from Percentual s where mes=:mes").setParameter("mes", mesAbuscar).uniqueResult();
		
		sesion.getTransaction().commit();
	} catch (Exception e) {
		// TODO: handle exception
	} finally {
		
		Conexion.desconectar(sesion);
	}

		return perc;
	}

	
	public List<Log> listarLogs() {
		
		List<Log> logs = new ArrayList<Log>();
		

		Session sesion = Conexion.abrirConexion();
		
		try {

			logs = sesion.createQuery("FROM Log l order by fechaLog").list();

			sesion.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return logs;
	}

	public void guardarDatosPercentuales(Percentual perc) {
		
		Percentual buscarPerc = null;
		
		Session sesion = Conexion.abrirConexion();
		
		try {
			
			buscarPerc = (Percentual)sesion.createQuery("select s from Percentual s where mes=:mes").setParameter("mes", perc.getMes()).uniqueResult();
			
			if(buscarPerc != null) {
				
				sesion.createQuery("update Percentual set mes=:mes, numUsu=:u, numEmp=:e, numSer=:s, numCit=:c where idPercentual=:id")
				.setParameter("mes", perc.getMes())
				.setParameter("u", perc.getNumUsu())
				.setParameter("e", perc.getNumEmp())
				.setParameter("s", perc.getNumSer())
				.setParameter("c", perc.getNumCit())
				.setParameter("id", buscarPerc.getIdPercentual())
				.executeUpdate();
	
				
				sesion.getTransaction().commit();

			} else
				sesion.save(perc);


		} catch (Exception e) {

		} finally {
			sesion.close();
		}
		
	}


	public void borrar(int id) {
		
		Session sesion = Conexion.abrirConexion();
		try {

			sesion.createQuery("DELETE FROM Log WHERE idLog=:id")
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
	
	
	public void insertar(Log lg) {
		
	Session sesion = Conexion.abrirConexion();
		
		try {

			sesion.save(lg);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}
	
	

}
