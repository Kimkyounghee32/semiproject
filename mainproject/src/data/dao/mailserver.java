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
			String host = "smtp.naver.com"; // �꽕�씠踰꾩씪 寃쎌슦 �꽕�씠踰� 怨꾩젙, gmail寃쎌슦 gmail 怨꾩젙
			String user = "@naver.com"; // 패스워드 (내 계정인가..)
			String password = ""; 
			
			// SMTP �꽌踰� �젙蹂대�� �꽕�젙�븳�떎.
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
				
				//�닔�떊�옄 硫붿씪二쇱냼
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(finduser)); 
				
				// 硫붿씪 �젣紐�
				message.setSubject(subject); 
				
				// 硫붿씪 �궡�슜
				message.setContent(content,"text/html; charset=UTF8"); 
				
				// send the message
				Transport.send(message);
			
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	}
}
