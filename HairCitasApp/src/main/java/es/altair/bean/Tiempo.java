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
@Table(name="tiempos")
public class Tiempo implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTiempo;
	private String tiempo;	
	
	@OneToMany(mappedBy="tiempo2", cascade=CascadeType.ALL)
	private Set<TiempoEmpleado> tiemposEmpleados = new HashSet<TiempoEmpleado>();

	public Tiempo() {
		super();
	}

	public Tiempo(String tiempo) {
		super();
		this.tiempo = tiempo;
	}

	public int getIdTiempo() {
		return idTiempo;
	}

	public void setIdTiempo(int idTiempo) {
		this.idTiempo = idTiempo;
	}

	public String getTiempo() {
		return tiempo;
	}

	public void setTiempo(String tiempo) {
		this.tiempo = tiempo;
	}

	public Set<TiempoEmpleado> getTiemposEmpleados() {
		return tiemposEmpleados;
	}

	public void setTiemposEmpleados(Set<TiempoEmpleado> tiemposEmpleados) {
		this.tiemposEmpleados = tiemposEmpleados;
	}
	
	
}
