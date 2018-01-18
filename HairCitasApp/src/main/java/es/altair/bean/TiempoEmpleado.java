package es.altair.bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="citas")
public class TiempoEmpleado implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTiempoEmpleado;
	
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idTiempo")
	private Tiempo tiempo;

	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idCita")
	private Cita citaTiempo;

	public TiempoEmpleado() {
		super();
	}		

	public TiempoEmpleado(Tiempo tiempo, Cita citaTiempo) {
		super();
		this.tiempo = tiempo;
		this.citaTiempo = citaTiempo;
	}


	public int getIdTiempoEmpleado() {
		return idTiempoEmpleado;
	}

	public void setIdTiempoEmpleado(int idTiempoEmpleado) {
		this.idTiempoEmpleado = idTiempoEmpleado;
	}

	public Tiempo getTiempo() {
		return tiempo;
	}

	public void setTiempo(Tiempo tiempo) {
		this.tiempo = tiempo;
	}



	public Cita getCitaTiempo() {
		return citaTiempo;
	}



	public void setCitaTiempo(Cita citaTiempo) {
		this.citaTiempo = citaTiempo;
	}


	
	

}
