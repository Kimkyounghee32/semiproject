package data.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class logindao {
	
	public String pwdhex(String pwd) {
		SecureRandom random;
		try {
			random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(Base64.getEncoder().encode(bytes));
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(salt.getBytes());
			md.update(pwd.getBytes());
			String hex = String.format("%064x", new BigInteger(1, md.digest()));
			
			return hex;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "0";
	}
}
