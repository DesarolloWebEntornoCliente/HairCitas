package es.altair.dao;

import java.util.List;

import es.altair.bean.Empleado;

public interface EmpleadoDAO {
	List<Empleado> listar ();

	Empleado obtenerEmpleado(int empleado);
	
	int cuentaEmpleados();

	void borrar(int id);

}
