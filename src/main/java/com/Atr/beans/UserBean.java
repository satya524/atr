package com.Atr.beans;

import org.springframework.stereotype.Component;

@Component
public class UserBean {

	
	private String Loginname;
	private String usertype;
	private String Loginid;
	private String emailid;
	private String ServiceType;
	private String ServiceId;
	public String getLoginname() {
		return Loginname;
	}
	public void setLoginname(String loginname) {
		Loginname = loginname;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getLoginid() {
		return Loginid;
	}
	public void setLoginid(String loginid) {
		Loginid = loginid;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getServiceType() {
		return ServiceType;
	}
	public void setServiceType(String serviceType) {
		ServiceType = serviceType;
	}
	public String getServiceId() {
		return ServiceId;
	}
	public void setServiceId(String serviceId) {
		ServiceId = serviceId;
	}
	
}
