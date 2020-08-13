package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmailChkDao {
	public static boolean chk_email(UserBean bean) {
		Boolean status = false ;
		try {
			Connection con = ConnectionProvider.getCon();
			
			PreparedStatement email_chk = con.prepareStatement("select * from users where EmailID=?");
			email_chk.setString(1, bean.getEmail());
			
			ResultSet rs = email_chk.executeQuery();
			
			if(rs.next()) {
				
				status=true;	
			}		 

		} catch (Exception e) {
		}
		return status;
	}
}
