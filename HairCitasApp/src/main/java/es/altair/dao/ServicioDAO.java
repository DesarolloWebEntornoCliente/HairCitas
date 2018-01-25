package es.altair.dao;

import java.util.List;

import es.altair.bean.Servicio;

public interface ServicioDAO {
	List<Servicio> listar ();

	Servicio obtenerServicio(int servicio);

	void borrar(int id);

	void insertar(Servicio serv);

}
