package com.boardsystem.po;

import java.io.Serializable;
import java.util.Date;

public class Good implements Serializable{
	private String id;
	private String ip;
	private Date ipTime;
	public Good(String id, String ip, Date ipTime) {
		super();
		this.id = id;
		this.ip = ip;
		this.ipTime = ipTime;
	}
	
	@Override
	public String toString() {
		return "good [id=" + id + ", ip=" + ip + ", ipTime=" + ipTime + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getIpTime() {
		return ipTime;
	}
	public void setIpTime(Date ipTime) {
		this.ipTime = ipTime;
	}

}
