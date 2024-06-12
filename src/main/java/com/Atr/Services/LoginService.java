package com.Atr.Services;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.Atr.Dao.LoginDao;
import com.Atr.beans.AtrBean;
import com.Atr.beans.UserBean;

@Component
@Service
public class LoginService {
@Autowired
LoginDao ldao;
	public Map<String, Object> verifyLogin(String loginId, String password) {
		// TODO Auto-generated method stub
		return ldao.Verifylogin(loginId,password);
	}
	public boolean insertdata(AtrBean Atr) {
		// TODO Auto-generated method stub
		return ldao.insertdata(Atr);
	}
	public List<Map<String, Object>> getOpenstatus() {
		// TODO Auto-generated method stub
		return ldao.getOpenStatusDetails();
	}
	public List<Map<String, Object>> getOpenstatusById(int id) {
		// TODO Auto-generated method stub
		return ldao.getOpenstatusById(id);
	}
	public boolean updateByid(AtrBean atr) {
		// TODO Auto-generated method stub
		return ldao.updateByid(atr);
	}
	public List<String> getIssuedBydetails() {
		// TODO Auto-generated method stub
		return ldao.getIssuedBydetails();
	}
	public List<String> getdomainnames() {
		// TODO Auto-generated method stub
		return ldao.getdomainnames();
	}
	public List<Map<String, Object>> getReports(String fromdate, String todate, String status, String service_Type) throws ParseException {
		// TODO Auto-generated method stub
		return ldao.getReports(fromdate ,todate,status,service_Type);
	}
	public boolean getadminmailid(int atrid) {
		// TODO Auto-generated method stub
		return ldao.getadminmailid(atrid);
	}

}
