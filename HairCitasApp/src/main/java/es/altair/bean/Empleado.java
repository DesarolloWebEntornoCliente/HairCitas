package es.altair.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="empleados")
public class Empleado implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idEmpleado;
	private String nombre;
	private String dni;
	private String funcion;	

	@OneToMany(mappedBy="empleado", cascade=CascadeType.ALL)
	private Set<Cita> citas = new HashSet<Cita>();

	@OneToMany(mappedBy="empleadoTiempo", cascade=CascadeType.ALL)
	private Set<TiempoEmpleado> tiemposEmpleados = new HashSet<TiempoEmpleado>();
	
	
	public Empleado() {
		super();
	}

	public Empleado(String nombre, String dni, String funcion) {
		super();
		this.nombre = nombre;
		this.dni = dni;
		this.funcion = funcion;
	}

	public int getIdEmpleado() {
		return idEmpleado;
	}

	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getFuncion() {
		return funcion;
	}

	public void setFuncion(String funcion) {
		this.funcion = funcion;
	}

	public Set<Cita> getCitas() {
		return citas;
	}

	public void setCitas(Set<Cita> citas) {
		this.citas = citas;
	}

	@Override
	public String toString() {
		return "Empleado [idEmpleado=" + idEmpleado + ", nombre=" + nombre + ", dni=" + dni + ", funcion=" + funcion
				+ "]";
	}
	
	
	
}
