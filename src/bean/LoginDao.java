package bean;

import java.sql.*;

public class LoginDao {

	public static boolean validate(UserBean bean) {
		boolean status = false;
		try {
			Connection con = ConnectionProvider.getCon();

			PreparedStatement ps = con.prepareStatement("select * from users where EmailID=? and Password=?");
			System.out.println(bean.getEmail());
			System.out.println(bean.getPass());
			ps.setString(1, bean.getEmail());
			ps.setString(2, bean.getPass());

			ResultSet rs = ps.executeQuery();
			status = rs.next();

			if(status){ 
				bean.setUname(rs.getString(1)); 
				}
			 

		} catch (Exception e) {
		}
		return status;
	}
}
