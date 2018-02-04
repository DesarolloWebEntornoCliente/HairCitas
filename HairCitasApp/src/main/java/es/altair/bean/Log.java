package es.altair.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="logs")
public class Log implements Serializable{
			
			@Id
			@GeneratedValue(strategy=GenerationType.IDENTITY)
			private int idlog;
			private String logDesc;
			private Date fechaLog ;
			
			public Log() {
				super();
			}

			public Log(String logDesc) {
				super();
				this.logDesc = logDesc;
			}
			
			

			public int getIdlog() {
				return idlog;
			}

			public void setIdlog(int idlog) {
				this.idlog = idlog;
			}

			public String getLogDesc() {
				return logDesc;
			}

			public void setLogDesc(String logDesc) {
				this.logDesc = logDesc;
			}

			public Date getFechaLog() {
				return fechaLog;
			}

			public void setFechaLog(Date fechaLog) {
				this.fechaLog = fechaLog;
			}
	
			
			
}
