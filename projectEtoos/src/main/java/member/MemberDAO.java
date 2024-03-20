package member;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(){}
	public int joinmember(MemberDTO dto){
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_memberlist (gubun, name, pwd, phone, email, birth, addr, id) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");//이부분 테이블에 맞게 수정 필요
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
			System.out.println(sb.toString());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public MemberDTO getMemberInfo(MemberDTO dto) {
		return null;
	}
	
	public MemberDTO getMemberInfo(String id, String pwd) {
		MemberDTO dto =new MemberDTO();
		String sql = "SELECT * FROM tbl_member WHERE id=?  ";			
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
		
			if(rs.next()) {
				if ( rs.getString("pwd").equals(pwd) ){
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setPwd(rs.getString("pwd"));
					dto.setBirth(rs.getString("birth"));
					dto.setAddr(rs.getString("addr"));
				}
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;

	}		
		

	
	
	public String getMemberInfoForId(String name, String birth, String phone) {
		
		MemberDTO dto =new MemberDTO();
		String sql = "SELECT id FROM tbl_member WHERE name=? AND birth=? phone=? ";			
		String id=null;
		try {
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
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return id;

	}		
		
	

	
	public boolean updatePwd(MemberDTO dto){
		return false;
	
	}
}