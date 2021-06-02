package data.dao;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mailserver {
	public static void navermain(String content, String finduser, String subject) {
			String host = "smtp.naver.com"; 
			String user = "@naver.com";  //naverId
			String password = ""; //password
			
			// SMTP 
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.auth", "true");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				
				
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(finduser)); 
				
				
				message.setSubject(subject); 
				
				
				message.setContent(content,"text/html; charset=UTF8"); 
				
				// send the message
				Transport.send(message);
			
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	}
}
