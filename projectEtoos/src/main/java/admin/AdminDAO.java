package admin;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class AdminDAO extends JDBConnect{
	public AdminDAO() {}
	public List<AdminDTO> CourseInfo(String sub1 ,String sub2, String sub3) {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT courseName, sugangStart, sugangEnd , sub1, sub2, name");
		sb.append(" FROM tbl_courselist AS tc ");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tc.teacherid = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" INNER JOIN tbl_memberlist AS tm ON tm.id = tc.teacherId");
		sb.append(" WHERE 1=1");
		if(!sub1.equals("")) {
			sb.append(" AND ts.sub1 = ?");
		}
		if(!sub2.equals("")) {
			sb.append(" AND ts.sub2 = ?");
		}
		if(!sub3.equals("")) {
			sb.append(" AND tm.id = ?");
		}
		System.out.println(sb.toString());
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, sub1);
			psmt.setString(2, sub2);
			psmt.setString(3, sub3);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setCoursename(rs.getString("courseName"));
				dto.setSugangStart(rs.getString("sugangStart"));
				dto.setSugangEnd(rs.getString("sugangEnd"));
				dto.setSub1(rs.getString("sub1"));
				dto.setSub2(rs.getString("sub2"));
				dto.setName(rs.getString("name"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
