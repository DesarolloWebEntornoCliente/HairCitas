package es.altair.bean;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Time;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="citas")
public class Cita implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idCita;
	private Date fecha;

	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idUsuario")
	private Usuario usuario;

	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idEmpleado")
	private Empleado empleado;
	
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="idServicio")
	private Servicio servicio;

	@OneToMany(mappedBy="citaTiempo", cascade=CascadeType.ALL)
	private Set<TiempoEmpleado> tiemposEmpleados = new HashSet<TiempoEmpleado>();
	
	
	public Cita() {
		// TODO Auto-generated constructor stub
	}

	public Cita(Date fecha, Usuario usuario, Empleado empleado, Servicio servicio) {
		super();
		this.fecha = fecha;
		this.usuario = usuario;
		this.empleado = empleado;
		this.servicio = servicio;
	}
	
	public Cita(int idCita, Date fecha) {
		super();
		this.idCita = idCita;
		this.fecha = fecha;
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
