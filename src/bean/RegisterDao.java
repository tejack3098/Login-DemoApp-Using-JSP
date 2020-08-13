package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterDao {
	
	public static boolean register_user(UserBean bean) {
		Boolean status = false ;
		try {
			Connection con = ConnectionProvider.getCon();
			
		
				
				PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?)");
				System.out.println(bean.getEmail());
				System.out.println(bean.getPass());
				ps.setString(1, bean.getUname());
				ps.setString(2, bean.getEmail());
				ps.setString(3, bean.getPass());

				int i = ps.executeUpdate();		
				
				if(i>0) {
					status= true;
				}
				

		} catch (Exception e) {
		}
		return status;
	}

}
