package es.altair.dao;

import java.sql.Date;
import java.util.List;

import es.altair.bean.Cita;
import es.altair.bean.Usuario;

public interface CitaDAO {
	
	List<Cita> listar (Usuario u);

	void borrar(int id);

	void insertar(Cita c, Date data);

	Cita ultimaCitaGuardada();
	
	List<Object[]> listaCitaCompleta(Usuario u);
	
	int cuentaCitas();
	
	List<Object[]> listarCitas();
	
	Cita obtenerCita(int id);
	
}
