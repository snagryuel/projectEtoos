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
	
	public MemberDTO getMemberId(MemberDTO input) {
		MemberDTO result = new MemberDTO();
		
		String id = input.getId();
		
		String sql = "SELECT id, pwd, gubun FROM tbl_memberlist WHERE id=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
		
			if(rs.next()) {
				result.setId(rs.getString("id"));

			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public MemberDTO getMemberInfo(MemberDTO input) {
		MemberDTO result = new MemberDTO();
		
		String id = input.getId();
		String pwd = input.getPwd();
		
		String sql = "SELECT id, pwd, gubun FROM tbl_memberlist WHERE id=? AND pwd=? ";			
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
		
			if(rs.next()) {
				result.setId(rs.getString("id"));
				result.setPwd(rs.getString("pwd"));
				result.setGubun(rs.getString("gubun"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;

	}		
		

	
	
	public MemberDTO getMemberInfoForId(MemberDTO dto) {
		
		MemberDTO result = new MemberDTO();
		
		String sql = "SELECT id, name, birth, phone FROM tbl_memberlist WHERE name=? AND birth=? AND phone=? ";			
		String name= dto.getName();
		String birth= dto.getBirth();
		String phone= dto.getPhone();
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, birth);
			psmt.setString(3, phone);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setBirth(rs.getString("birth"));
				result.setPhone(rs.getString("phone"));
			}
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return result;
	}		
	
public MemberDTO getMemberInfoForPwd(MemberDTO dto) {
		
		MemberDTO result = new MemberDTO();
		
		String sql = "SELECT id, name, birth, phone FROM tbl_memberlist WHERE id=? AND name=? AND birth=? AND phone=? ";			
		String id= dto.getId();
		String name= dto.getName();
		String birth= dto.getBirth();
		String phone= dto.getPhone();
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, birth);
			psmt.setString(4, phone);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setBirth(rs.getString("birth"));
				result.setPhone(rs.getString("phone"));
			}
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return result;
	}
		
	public int updatePwd(MemberDTO dto) {

		int result = 0;
		String id = dto.getId();
		String pwd = dto.getPwd();

		String sql = "UPDATE tbl_memberlist SET pwd=? WHERE id=?" ;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,pwd);
			psmt.setString(2,id);
			
			result = psmt.executeUpdate();	
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public MemberDTO getMemberInfo(String id) {
		
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT id, phone, email, birth, addr, pwd, gubun, name FROM tbl_memberlist WHERE id = ?";
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setBirth(rs.getString("birth"));
				dto.setAddr(rs.getString("addr"));
				dto.setPwd(rs.getString("pwd"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
		}	
	public String getFile() {
		String sql = "SELECT * FROM tbl_filemanage";
		String file = "";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				String path = rs.getString("filepath");
				String name = rs.getString("filename");
				file = path+name;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return file;
	}
}