package es.altair.dao;

import java.util.List;

import es.altair.bean.Cita;
import es.altair.bean.Usuario;

public interface CitaDAO {
	
	List<Cita> listar (Usuario u);

	void borrar(int id);

	void insertar(Cita c);

	Cita ultimaCitaGuardada();
	
	List<Object[]> listaCitaCompleta(Usuario u);
	
	int cuentaCitas();
	
	List<Object[]> listarCitas();
	
}
