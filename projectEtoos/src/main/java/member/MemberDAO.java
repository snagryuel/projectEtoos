package member;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(){}
	public int joinmember(MemberDTO dto){
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO '테이블명' ('컬럼명들') VALUES(?, ?, ?, ?, ?, ?, ?)");//이부분 테이블에 맞게 수정 필요
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getGubun());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPwd());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getBirth());
			psmt.setString(7, dto.getAddr());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public boolean MemberUpdate(MemberDTO dto) {
		
		return false;
	}
	public MemberDTO getMemberInfo(MemberDTO dto) {
		return null;
	}
	
	public MemberDTO getMemberInfoForId(MemberDTO dto) {
		return null;
	}
	
	public boolean updatePwd(MemberDTO dto){
		return false;
	}
}
