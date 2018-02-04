package es.altair.dao;

import java.util.List;

import es.altair.bean.Log;
import es.altair.bean.Percentual;

public interface UtilDAO {

	Percentual listarPercentuales();

	List<Log> listarLogs();

	void guardarDatosPercentuales(Percentual perc);

	void borrar(int id);
	
	void insertar(Log lg);
}
