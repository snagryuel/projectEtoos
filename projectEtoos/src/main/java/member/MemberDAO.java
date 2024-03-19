package member;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(){}
	public boolean joinmember(MemberDTO dto){
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
