 package com.Atr.Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.Atr.Utilies.EmailSend;
import com.Atr.beans.AtrBean;
import com.Atr.beans.UserBean;

import javax.servlet.http.HttpSession;

@Component
@Repository

public class LoginDao {
  @Autowired
  EmailSend sendmail;
	@Autowired
	JdbcTemplate jdbctemplate;
	@Autowired
	HttpSession ses;

	public Map<String, Object> Verifylogin(String loginId, String password) {
		String Query = "{CALL EntrytoAtr_Login(?,?)}";
		Map<String, Object> user = null;
		List<Map<String, Object>> usr = jdbctemplate.queryForList(Query, loginId, password);
		if (usr.size() > 0) {
			user = usr.get(0);
		}
		return user;
	}

	public boolean insertdata(AtrBean Atr) {
		// TODO Auto-generated method stub

		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");

		boolean status = false;
		try {
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");

			Date d=inputFormat.parse(Atr.getTargetDate());
			
			
			Connection con = jdbctemplate.getDataSource().getConnection();
			CallableStatement cs = con.prepareCall("{call InsertAtr (?, ?, ?, ?, ?, ?, ?,?)}");
			cs.setString(1, Atr.getDomainName());
			cs.setString(2, Atr.getIssuedBy());
			cs.setString(3, Atr.getActionItems());
			cs.setString(4, Atr.getStatus());
			cs.setString(5, formatter.format(d));
			cs.setString(6, Atr.getEntryBy());
			cs.setString(7, formatter.format(date));
			cs.registerOutParameter(8, java.sql.Types.INTEGER);
			// cs.registerOutParameter(9, java.sql.Types.VARCHAR);
			cs.execute();

			int id = cs.getInt(8);


           final String Query="{call getAdminMailId(?)}";
			List<Map<String, Object>> mailids = jdbctemplate.queryForList(Query, id);
			List<String> maildetailslist = new ArrayList<String>();
			for (Map<String, Object> row : mailids) {
				String mail = (String) row.get("USER_EMAIL_ID");
				maildetailslist.add(mail);
			}
			System.out.println(maildetailslist);
			status = true;
			sendmail.sendEmail(maildetailslist, id);
			
		} catch (Exception e) {
			e.printStackTrace();
			status = false;
		}
		System.out.println(status);
		return status;
	}

	public List<Map<String, Object>> getOpenStatusDetails() {
		// TODO Auto-generated method stub
		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");
		String Query = "{call OpenAtrStatus(?)} ";
		List<Map<String, Object>> details = jdbctemplate.queryForList(Query, userData.get("SERVICE_TYPE"));
		//System.out.println(details);
		return details;
	}

	public List<Map<String, Object>> getOpenstatusById(int id) {
		// TODO Auto-generated method stub
		String Query = "{call GetAtrsByid(?)} ";
		List<Map<String, Object>> details = jdbctemplate.queryForList(Query, id);

		return details;
	}

	public boolean updateByid(AtrBean atr)  {
		// TODO Auto-generated method stub

		Map<String, Object> userData = (Map<String, Object>) ses.getAttribute("user");
		boolean status = false;
				try {
					Date date = new Date();
					SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			        System.out.println(atr.getTargetDate());
					Date d=inputFormat.parse(atr.getTargetDate());

			       jdbctemplate.update("EXEC UpdateAtr ?, ?, ?, ?, ?, ?, ?, ?, ?", atr.getAtrid(), atr.getDomainName(),
					atr.getIssuedBy(), atr.getActionItems(), atr.getStatus(), atr.getUpdates(), formatter.format(d),
					atr.getEntryBy(),formatter.format(date));

			status = true;
		} catch (Exception e) {
			e.printStackTrace();
			status = false;
		}
		return status;
	}

	public List<String> getIssuedBydetails() {
		// TODO Auto-generated method stub
		String query = "SELECT issuedBy FROM IssuedBydetails";
		List<String> issuedDetails = jdbctemplate.queryForList(query, String.class);

		return issuedDetails;
	}

	public List<String> getdomainnames() {
		// TODO Auto-generated method stub
		String Query = "{call getServicetypedetails()} ";
		List<String> domainnames = jdbctemplate.queryForList(Query, String.class);

		return domainnames;
	}

	public List<Map<String, Object>> getReports(String fromdate, String todate, String status, String service_Type) throws ParseException {
		// TODO Auto-generated method stub
//		System.out.println(fromdate);
//		System.out.println(todate);
//		System.out.println(status);
//		System.out.println(service_Type);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	   
		 SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");

			Date frmdate=inputFormat.parse(fromdate);
			Date Todate=inputFormat.parse(todate);
//		String frmqdate=formatter.format(frmdate);
//		String Toqdate=formatter.format(Todate);
//		System.out.println(frmqdate);
//		System.out.println(Toqdate);
//		
		String Query = "{call Get_ATR_STATUS(?,?,?,?)} ";
		List<Map<String, Object>> reports = jdbctemplate.queryForList(Query, formatter.format(frmdate),formatter.format(Todate),status,service_Type);

		return reports;
	}

	public boolean getadminmailid(int atrid) {
		// TODO Auto-generated method stub
		
		String Query="{call PROC_ATR_CLOSE_ADMIN_EMAIL()}";
		
		List<String> adminMailids=jdbctemplate.queryForList(Query,String.class);
		System.out.println(adminMailids);
		boolean status=sendmail.closeAtr(adminMailids, atrid);
		
		return status;
	}

	

	// send mails login
	

}
