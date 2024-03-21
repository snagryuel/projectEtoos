package member;

import java.sql.SQLException;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(){}
	public int joinmember(MemberDTO dto){
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_memberlist (gubun, name, pwd, phone, email, birth, addr, id) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getGubun());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPwd());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getBirth());
			psmt.setString(7, dto.getAddr());
			psmt.setString(8, dto.getId());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	public MemberDTO getMemberInfo(MemberDTO dto) {
		String id = dto.getId();
		String pwd = dto.getPwd();
		
		String sql = "SELECT id, pwd, gubun FROM tbl_memberlist WHERE id=?  ";			
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
		
			if(rs.next()) {
				if ( rs.getString("pwd").equals(pwd) ){
					dto.setId(rs.getString("id"));
					dto.setPwd(rs.getString("pwd"));
					dto.setGubun(rs.getString("gubun"));
				}
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;

	}		
		

	
	
	public MemberDTO getMemberInfoForId(MemberDTO dto) {
		
		String sql = "SELECT id FROM tbl_member WHERE name=? AND birth=? phone=? ";			
		String id= null;
		String name= dto.getName();
		String birth= dto.getBirth();
		String phone= dto.getPhone();
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, birth);
			psmt.setString(3, phone);


			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				id= rs.getString("id");
				
			}
		
			/*if(rs.next()) {
				if ( rs.getString("name").equals(name) && rs.getString("birth").equals(birth) &&rs.getString("phone").equals(phone)  ){
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setPwd(rs.getString("pwd"));
					dto.setBirth(rs.getString("birth"));
					dto.setAddr(rs.getString("addr"));
				}
				
			} */
			
			dto.setId(id);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;

	}		
		
	public int updatePwd(MemberDTO dto) {

		int result = 0;
		String pwd = dto.getPwd();
		String id = dto.getId();
		String name = dto.getName();
		String phone = dto.getPhone();
		String sql = "SELECT id, name, pwd, birth, addr  FROM tbl_memberlist WHERE id=? AND name=? AND birth=? AND phone=?" ;
		
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			psmt.setString(2,name);
			psmt.setString(3,phone);
			rs = psmt.executeQuery();
			if(rs.next()) {
					sql = "UPDATE tbl_memberList "
							+ "SET pwd=? WHERE id=? "; 
					
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, pwd);
					psmt.setString(2, id);
					result = psmt.executeUpdate();
				}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		

	}
	public int MemberUpdate(MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_memberlist");
		sb.append(" SET pwd = ?,");
		sb.append("name = ?,");
		sb.append("phone = ?,");
		sb.append("birth = ?,");
		sb.append("addr = ?,");
		sb.append("email = ?");
		sb.append(" WHERE id = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getPwd());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPhone());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getAddr());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	public int MemberDelete(String id) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_memberlist");
		sb.append(" SET state = 99");
		sb.append(" WHERE id = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, id);
			result = psmt.executeUpdate();
			System.out.println(psmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
//	public boolean updatePwd(MemberDTO dto){

		// 작업 완료
		
	
	//}
}