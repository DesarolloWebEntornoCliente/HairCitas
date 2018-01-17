package es.altair.bean;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

@Entity
@Table(name="citas")
public class Cita implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idCita;
	private Date fecha;
	private Time hora;

	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idUsuario")
	private Usuario usuario;

	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idEmpleado")
	private Empleado empleado;
	
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idServicio")
	private Servicio servicio;

	public Cita() {
		// TODO Auto-generated constructor stub
	}

	public Cita(Date fecha, Time hora, Usuario usuario, Empleado empleado, Servicio servicio) {
		super();
		this.fecha = fecha;
		this.hora = hora;
		this.usuario = usuario;
		this.empleado = empleado;
		this.servicio = servicio;
	}

	public int getIdCita() {
		return idCita;
	}

	public void setIdCita(int idCita) {
		this.idCita = idCita;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Time getHora() {
		return hora;
	}

	public void setHora(Time hora) {
		this.hora = hora;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Empleado getEmpleado() {
		return empleado;
	}

	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}

	public Servicio getServicio() {
		return servicio;
	}

	public void setServicio(Servicio servicio) {
		this.servicio = servicio;
	}

	
}
