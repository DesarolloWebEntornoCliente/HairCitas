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
@Table(name="servicios")
public class Servicio implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idServicio;
	private String descripcion;
	private int tiempo;
	private double precio;	

	@OneToMany(mappedBy="servicio", cascade=CascadeType.ALL)
	private Set<Cita> citas = new HashSet<Cita>();

	public Servicio() {
		super();
	}

	public Servicio(String descripcion, int tiempo, double precio) {
		super();
		this.descripcion = descripcion;
		this.tiempo = tiempo;
		this.precio = precio;
	}

	public int getIdServicio() {
		return idServicio;
	}

	public void setIdServicio(int idServicio) {
		this.idServicio = idServicio;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getTiempo() {
		return tiempo;
	}

	public void setTiempo(int tiempo) {
		this.tiempo = tiempo;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Set<Cita> getCitas() {
		return citas;
	}

	public void setCitas(Set<Cita> citas) {
		this.citas = citas;
	}

	@Override
	public String toString() {
		return "Servicio [idServicio=" + idServicio + ", descripcion=" + descripcion + ", tiempo=" + tiempo
				+ ", precio=" + precio + "]";
	}

	
}
