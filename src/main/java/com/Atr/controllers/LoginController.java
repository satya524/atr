package com.Atr.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Atr.Services.LoginService;
import com.Atr.beans.AtrBean;
import com.Atr.beans.UserBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	HttpSession ses;
	@Autowired
	HttpServletRequest sess;
	@Autowired
	UserBean user;
	@Autowired
	LoginService service;
	@Autowired
	AtrBean Atr;

	@RequestMapping("/")
	public String home() {
		return "login";
	}

	@RequestMapping("/logout")
	public String logout() {
		ses.removeAttribute("user");
		ses.removeAttribute("message");
		ses.invalidate();
		return "login";
	}

	@RequestMapping(value="/login" ,method=RequestMethod.POST)
	public String login(@RequestParam("LoginId") final String loginId,
			@RequestParam("password") final String Password) {
		Map<String, Object> userData = service.verifyLogin(loginId, Password);
		//System.out.println(userData);
		if (userData != null) {
			ses.setAttribute("user", userData);
			List<String> issueddetails = service.getIssuedBydetails();

			ses.setAttribute("issuedbydetails", issueddetails);
			List<String> Domainnames = service.getdomainnames();

			ses.setAttribute("Domaindetails", Domainnames);
			List<Map<String, Object>> details = service.getOpenstatus();
			
			//System.out.println(details);
			ses.setAttribute("details", (List<Map<String, Object>>) details);
			return "OpenAtrsList";
		}
		return "login";
	}

	@RequestMapping("/newAtr")
	public String newAtr() {

		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");
		//System.out.println(userData);
		if (userData != null && "ADMIN".equals(userData.get("USERTYPE"))) {

			return "NewAtr";
		}
		return "login";
	}

	@PostMapping({"/NewAtrSubmit"})
	public String Insert(@RequestParam("domainname") final String Domainname,
			@RequestParam("issuedby") final String Issuedby, @RequestParam final String actionitem,
            @RequestParam final String enddate) {

		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");
		
		//System.out.print(enddate);
		String Loginid = (String) userData.get("LOGIN_ID");
		Atr.setDomainName(Domainname);
		Atr.setIssuedBy(Issuedby);
		Atr.setActionItems(actionitem);
		
		Atr.setStatus("OPEN");
		Atr.setTargetDate(enddate);
		Atr.setEntryBy(Loginid);
		boolean status = service.insertdata(Atr);
		if (status == true) {
			List<Map<String, Object>> details = service.getOpenstatus();
			
			ses.setAttribute("details", (List<Map<String, Object>>) details);
			return "OpenAtrsList";

		} else {

			return "NewAtr";
		}

	}

	@RequestMapping("/OpenAtrs")
	public String openAtrs() {

		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");
		if (userData != null) {
			List<Map<String, Object>> details = service.getOpenstatus();
			ses.setAttribute("details", (List<Map<String, Object>>) details);
			if(ses.getAttribute("mail")!=null) {
				ses.removeAttribute("mail");
			}
			return "OpenAtrsList";
		}
		return "login";
	}

	@RequestMapping("/Reports")
	public String Reports() {

		return "reports";

	}

	@PostMapping({"/EditAtrById"})
	public String UpdateDetails(@RequestParam("ATRID") final String Atrid,
			@RequestParam("domainname") final String Domainname, @RequestParam("issuedby") final String Issuedby,
            @RequestParam final String actionitem, @RequestParam final String updates,
            @RequestParam final String Status, @RequestParam final String enddate) {
		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");
		// Date Entrydate=new Date();

		final String buttonss = sess.getParameter("Atr");

//		System.out.println("Received Domainname: " + Domainname);
//		System.out.println("Received Issuedby: " + Issuedby);
//		System.out.println("Received actionitem: " + actionitem);
//		System.out.println("Received updates: " + updates);
//		System.out.println("Received Status: " + Status);
//		System.out.println("Received enddate: " + enddate);

		// SimpleDateFormat formatter=new SimpleDateFormat("dd-mm-yyy");
		String Loginid = (String) userData.get("LOGIN_ID");
		Atr.setAtrid(Atrid);
		Atr.setDomainName(Domainname);
		Atr.setIssuedBy(Issuedby);
		Atr.setActionItems(actionitem);
		Atr.setUpdates(updates);
		Atr.setStatus(Status);
		Atr.setTargetDate(enddate);
		Atr.setEntryBy(Loginid);
		// Atr.setEntryDate(formatter.format(Entrydate));
		boolean updatedStatus = service.updateByid(Atr);
		if (updatedStatus == true) {
			System.out.println(Atr);
			List<Map<String, Object>> details = service.getOpenstatus();
			ses.setAttribute("details", (List<Map<String, Object>>) details);
			return "OpenAtrsList";

		}
		return "EditAtr";

	}
@PostMapping("/Getreports")
public String getreports(ModelMap model ,@RequestParam("frmdate")  String fromdate,@RequestParam  String todate,@RequestParam final String Status ) throws ParseException {
	Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user"); 
	String Service_Type=(String) userData.get("SERVICE_TYPE");
	SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");

	Date frmdate=inputFormat.parse(fromdate);
	Date Todate=inputFormat.parse(todate);
	
	List<Map<String,Object>> getReports=service.getReports(formatter.format(frmdate),formatter.format(Todate),Status,Service_Type);
	ses.setAttribute("reports",getReports);
	return "reports";
	
}
	@RequestMapping("/editSubmit")
	public String gettDetails(@RequestParam final int id) {

		ses.setAttribute("id", id);
		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");
		//System.out.println(userData);
		if (userData != null) {
			List<String> RevisedDatesList = new ArrayList<String>();
			List<Map<String, Object>> AtrIdDetails = service.getOpenstatusById(id);
			//System.out.println(AtrIdDetails);
			ses.setAttribute("details", (List<Map<String, Object>>) AtrIdDetails);

			for (int i = 0; i < AtrIdDetails.size(); i++) {
				Map<String, Object> IdDetails = AtrIdDetails.get(i);

				RevisedDatesList.add((String) IdDetails.get("TargetDate"));

			}
			ses.setAttribute("RevisedDatesList", RevisedDatesList);
			//System.out.println(RevisedDatesList);
			return "EditAtr";
		}

		return "login";
	}
@RequestMapping("/CloseAtr")
		public String closeatr() {
	
	
	int atrid=(int)ses.getAttribute("id");
	System.out.println(atrid);
	boolean result=service.getadminmailid(atrid);
	
	if(result==true) {
    ses.setAttribute("mail","Email Sent Successfully");
    
	
	
	}
	else {
		  ses.setAttribute("mail","Techinical error");
		
	}
	return "EditAtr";
}
}
