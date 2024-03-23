package admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import board.CourseDTO;
import common.JDBConnect;

public class AdminDAO extends JDBConnect{
	public AdminDAO() {}
	public List<AdminDTO> CourseInfo(String sub1 ,String sub2, String sub3, int startNo, String id) {
		int cnt = 1;
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT tc.courseIdx, courseName, sugangStart, sugangEnd , sub1, sub2, name");
		sb.append(" , NVL2(CH.id, 'Y', 'N') AS 'historyYN', CH.applicationDate");
		sb.append(" , CASE WHEN tc.sugangEnd >= CURDATE() then 'Y' ELSE 'N' END AS 'state'");
		sb.append(" FROM tbl_courselist AS tc ");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tc.teacherid = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" INNER JOIN tbl_memberlist AS tm ON tm.id = tc.teacherId");
		sb.append(" LEFT OUTER JOIN tbl_coursehistory AS CH ON tc.courseIdx = CH.courseIdx");
		sb.append(" AND CH.id = ?");
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
		sb.append(" ORDER BY courseIdx DESC");
		sb.append(" LIMIT ?, 10");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(cnt, id);
			cnt++;
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
				cnt++;
			}
			psmt.setInt(cnt, startNo);
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
				dto.setHistoryYN(rs.getString("historyYN"));
				dto.setState(rs.getString("state"));
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
	public List<AdminDTO> getteacher(String name, int StartNo) {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT tm.NAME, tm.id, ts.sub1, ts.sub2, tm.birth, tm.joinDay FROM tbl_memberlist AS tm");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		sb.append(" LIMIT ?, 10");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, StartNo);
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
	
	public int getTeacherTotalCount(String name) {
		int totalCount = 0;
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT COUNT(tm.id) FROM tbl_memberlist AS tm");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<AdminDTO> getMemberList(String name, int StartNo) {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT NAME, id, birth, joinday");
		sb.append(" FROM tbl_memberlist");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		sb.append("AND gubun = 1");
		sb.append(" AND state != 99");
		sb.append(" LIMIT ?, 10");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, StartNo);
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
	
	public int getMemberTotalCount(String name) {
		int totalCount = 0;
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT count(id)");
		sb.append(" FROM tbl_memberlist");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		sb.append("AND gubun = 1");
		sb.append(" AND state != 99");
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public CourseDTO getCourseList(int idx) {
		StringBuilder sb = new StringBuilder();
		CourseDTO dto = new CourseDTO();
		
		sb.append("SELECT courseName, sugangStart, sugangEnd, guseong, ");
		sb.append(" bookName, bookIntro, teacherId, gangBumwi, gangChar, `range`");
		sb.append(" FROM tbl_courselist");
		sb.append(" WHERE courseidx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();

			while(rs.next()) {
				dto.setCourseName(rs.getString("coursename"));
				dto.setSugangStart(rs.getString("sugangstart"));
				dto.setSugangEnd(rs.getString("sugangEnd"));
				dto.setGuseong(rs.getString("guseong"));
				dto.setBookName(rs.getString("bookname"));
				dto.setBookIntro(rs.getString("bookintro"));
				dto.setTeacherId(rs.getString("teacherid"));
				dto.setGangBumwi(rs.getString("gangBumwi"));
				dto.setGangChar(rs.getString("gangChar"));
				dto.setRange(rs.getString("range"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto ;
	}

	public List<CourseDTO> getCourseSebu(int idx) {
		StringBuilder sb = new StringBuilder();
		List<CourseDTO> list = new Vector<CourseDTO>();
		
		sb.append("SELECT sebuIdx, courseSebuName, courseTime");
		sb.append(" FROM tbl_coursesebu");
		sb.append(" WHERE courseidx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			System.out.println(psmt);

			while(rs.next()) {
				CourseDTO dto = new CourseDTO();
				dto.setSebuIdx(rs.getInt("sebuidx"));
				dto.setCourseSebuName(rs.getString("courseSebuName"));
				dto.setCourseTime(rs.getString("coursetime"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list ;
	}
	public void insertSebu(String name, String time, String idx) {
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_coursesebu(courseIdx, courseSebuName, courseTime)");
		sb.append(" VALUES(?, ?, ?)");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, idx);
			psmt.setString(2, name);
			psmt.setString(3, time);
			psmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void updateSebu(String name, String time, String idx) {
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_coursesebu");
		sb.append(" SET courseSebuName = ?");
		sb.append(" , courseTime = ?");
		sb.append("WHERE sebuidx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, name);
			psmt.setString(2, time);
			psmt.setString(3, idx);
			psmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}