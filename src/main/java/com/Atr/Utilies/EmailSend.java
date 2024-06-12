package com.Atr.Utilies;

import org.springframework.stereotype.Component;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.Session;

import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


@Component
public class EmailSend {
	
	// ...
	public void sendEmail(List<String> mailids, int id) {
	    InternetAddress[] addressTo = new InternetAddress[mailids.size()];
	    String smtpHost = "smtp.office365.com";
	    String smtpPort = "587";
	    final String msg = "Dear sir, Your NewAtr has been successfully created with ATRID " + id;

	    try {
	        Properties properties = new Properties();
	        properties.setProperty("mail.smtp.host", smtpHost);
	        properties.setProperty("mail.smtp.port", smtpPort);
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.starttls.enable", "true");
	        //properties.setProperty("mail.smtp.ssl.enable", "true"); 
	       //properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	        Session session = Session.getInstance(properties,new javax.mail.Authenticator(){
	      	  protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
	                return new javax.mail.PasswordAuthentication("Hpe.Hydmetering@waisl.in", "Hav68289");
	            }
	      });

	        for (int i = 0; i < mailids.size(); i++) {
	            addressTo[i] = new InternetAddress(mailids.get(i));
	        }

	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress("Hpe.Hydmetering@waisl.in"));
	        message.setRecipients(Message.RecipientType.TO,addressTo);
	        message.setSubject("Regarding New ATR"); // Add a subject
	        message.setText(msg);

	        Transport.send(message);

	    } catch (MessagingException e) {
	        System.out.println(e);
	    }
	}
	// ...
	public boolean closeAtr(List<String> mailids, int id) {
		boolean status=false;
		 InternetAddress[] addressTo = new InternetAddress[mailids.size()];
		    String smtpHost = "smtp.office365.com";
		    String smtpPort = "587";
		    final String msg = "Dear sir, Iam Requesting you to close the Atr with ATRID " + id;

		    try {
		        Properties properties = new Properties();
		        properties.setProperty("mail.smtp.host", smtpHost);
		        properties.setProperty("mail.smtp.port", smtpPort);
		        properties.put("mail.smtp.auth", "true");
		        properties.put("mail.smtp.starttls.enable", "true");
		        //properties.setProperty("mail.smtp.ssl.enable", "true"); 
		       //properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		        Session session = Session.getInstance(properties,new javax.mail.Authenticator(){
		      	  protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
		                return new javax.mail.PasswordAuthentication("Hpe.Hydmetering@waisl.in", "Hav68289");
		            }
		      });

		        for (int i = 0; i < mailids.size(); i++) {
		            addressTo[i] = new InternetAddress(mailids.get(i));
		        }

		        Message message = new MimeMessage(session);
		        message.setFrom(new InternetAddress("Hpe.Hydmetering@waisl.in"));
		        message.setRecipients(Message.RecipientType.TO,addressTo);
		        message.setSubject("Regarding closing the ATR"); // Add a subject
		        message.setText(msg);

		        Transport.send(message);
                status=true;
		    } catch (MessagingException e) {
		        System.out.println(e);
		    }
		    catch(Exception e) {
		    	
		    }
			return status;
	}

}
