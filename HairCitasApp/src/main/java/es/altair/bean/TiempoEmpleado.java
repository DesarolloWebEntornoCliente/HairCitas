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
@Table(name="tiempoempleados")
public class TiempoEmpleado implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTiempoEmpleado;
	
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idTiempo")
	private Tiempo tiempo2;

	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idCita")
	private Cita citaTiempo;

	public TiempoEmpleado() {
		super();
	}		

	public TiempoEmpleado(Tiempo tiempo2, Cita citaTiempo) {
		super();
		this.tiempo2 = tiempo2;
		this.citaTiempo = citaTiempo;
	}

	public TiempoEmpleado(Tiempo tiempo2) {
		super();
		this.tiempo2 = tiempo2;
	}
	
	public TiempoEmpleado(Cita citaTiempo) {
		super();
		this.citaTiempo = citaTiempo;
	}
	
	public int getIdTiempoEmpleado() {
		return idTiempoEmpleado;
	}

	public void setIdTiempoEmpleado(int idTiempoEmpleado) {
		this.idTiempoEmpleado = idTiempoEmpleado;
	}

	public Tiempo getTiempo() {
		return tiempo2;
	}

	public void setTiempo(Tiempo tiempo) {
		this.tiempo2 = tiempo;
	}


	public Tiempo getTiempo2() {
		return tiempo2;
	}

	public void setTiempo2(Tiempo tiempo2) {
		this.tiempo2 = tiempo2;
	}

	public Cita getCitaTiempo() {
		return citaTiempo;
	}


	public void setCitaTiempo(Cita citaTiempo) {
		this.citaTiempo = citaTiempo;
	}


	
	

}
