package es.altair.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="percentuales")
public class Percentual implements Serializable{
		
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int idPercentual;
		private int mes ;
		private int numUsu;
		private int numEmp;
		private int numSer;
		private int numCit;
		
		
		public Percentual() {
			super();
		}


		public Percentual(int mes, int numUsu, int numEmp, int numSer, int numCit) {
			super();
			this.mes = mes;
			this.numUsu = numUsu;
			this.numEmp = numEmp;
			this.numSer = numSer;
			this.numCit = numCit;
		}
		
		


		public Percentual(int idPercentual, int mes, int numUsu, int numEmp, int numSer, int numCit) {
			super();
			this.idPercentual = idPercentual;
			this.mes = mes;
			this.numUsu = numUsu;
			this.numEmp = numEmp;
			this.numSer = numSer;
			this.numCit = numCit;
		}


		public int getIdPercentual() {
			return idPercentual;
		}


		public void setIdPercentual(int idPercentual) {
			this.idPercentual = idPercentual;
		}


		public int getMes() {
			return mes;
		}


		public void setMes(int mes) {
			this.mes = mes;
		}


		public int getNumUsu() {
			return numUsu;
		}


		public void setNumUsu(int numUsu) {
			this.numUsu = numUsu;
		}


		public int getNumEmp() {
			return numEmp;
		}


		public void setNumEmp(int numEmp) {
			this.numEmp = numEmp;
		}


		public int getNumSer() {
			return numSer;
		}


		public void setNumSer(int numSer) {
			this.numSer = numSer;
		}


		public int getNumCit() {
			return numCit;
		}


		public void setNumCit(int numCit) {
			this.numCit = numCit;
		}


	
		
}
