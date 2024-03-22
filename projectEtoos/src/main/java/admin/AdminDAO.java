package admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class AdminDAO extends JDBConnect{
	public AdminDAO() {}
	public List<AdminDTO> CourseInfo(String sub1 ,String sub2, String sub3) {
		int cnt = 1;
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT courseIdx, courseName, sugangStart, sugangEnd , sub1, sub2, name");
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
		try {
			psmt = conn.prepareStatement(sb.toString());
			if(!sub1.equals("")) {
				psmt.setString(cnt, sub1);
				cnt++;
			}
			if(!sub2.equals("")) {
				psmt.setString(cnt, sub2);
				cnt++; 	
			}
			if(!sub3.equals("")) {
				psmt.setString(cnt, sub3);
			}
			rs = psmt.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setCoursename(rs.getString("courseName"));
				dto.setSugangStart(rs.getString("sugangStart"));
				dto.setSugangEnd(rs.getString("sugangEnd"));
				dto.setSub1(rs.getString("sub1"));
				dto.setSub2(rs.getString("sub2"));
				dto.setName(rs.getString("name"));
				dto.setCourseIdx(rs.getInt("courseIdx"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<String> getSub() {
		List<String> list = new Vector<String>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT DISTINCT sub1 FROM tbl_subject");
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("sub1"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<String> getSub2(String sub1) {
		List<String> list = new Vector<String>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT DISTINCT sub2 FROM tbl_subject WHERE sub1 = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, sub1);
			rs = psmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("sub2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<AdminDTO> getteacher(String sub1, String sub2) {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		AdminDTO dto = new AdminDTO();
		sb.append("SELECT tm.name, tm.id FROM tbl_teacherlist AS tt ");
		sb.append("INNER JOIN tbl_memberlist AS tm ON tm.id = tt.id ");
		sb.append("INNER JOIN tbl_subject AS ts ON ts.subKey = tt.subKey ");
		sb.append("WHERE ts.sub1 = ? AND ts.sub2 = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, sub1);
			psmt.setString(2, sub2);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<AdminDTO> getteacher(String name) {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT tm.NAME, tm.id, ts.sub1, ts.sub2, tm.birth, tm.joinDay FROM tbl_memberlist AS tm");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		try {
			psmt = conn.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSub1(rs.getString("sub1"));
				dto.setSub2(rs.getString("sub2"));
				dto.setBirth(rs.getString("birth"));
				dto.setJoinday(rs.getString("joinday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<AdminDTO> getMemberList(String name) {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT NAME, id, birth, joinday");
		sb.append(" FROM tbl_memberlist");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		sb.append("AND gubun = 1");
		sb.append(" AND state != 99");
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setJoinday(rs.getString("joinday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}