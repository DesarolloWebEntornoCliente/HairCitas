package es.altair.dao;

import java.util.List;

import es.altair.bean.Tiempo;

public interface TiempoDAO {
	
	List<Tiempo> listar ();

	Tiempo obtenerTiempo(int horario);
	
	List<Object[]> listaHorariosDisponibles(int id, String fechaEnt);


}
