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
	
	public List<AdminDTO> CourseInfo(String courseName, int startNo, String id, String teacherId) {
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
		if(!id.equals(id)) {sb.append(" AND CH.id = ?");}
		sb.append(" WHERE 1=1");
		if(!courseName.equals("")) {
			sb.append(" AND tc.courseName LIKE ?");
		}
		if(!teacherId.equals("")) {
			sb.append(" AND tc.teacherId = ?");
		}
		sb.append(" ORDER BY courseIdx DESC");
		sb.append(" LIMIT ?, 10");
		try {
			psmt = conn.prepareStatement(sb.toString());
			if(!id.equals(id)) {
				psmt.setString(cnt, id);
				cnt++;
			}
			if(!courseName.equals("")) {
				psmt.setString(cnt, "%"+courseName+"%");
				cnt++;
			}
			if(!teacherId.equals("")) {
				psmt.setString(cnt, teacherId);
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
	
	public List<AdminDTO> CourseInfoForMain() {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT tc.courseIdx, courseName, sugangStart, sugangEnd, name, FM.fileGubun, FM.fileName, FM.filePath ");
		sb.append(" FROM tbl_courselist AS tc ");
		sb.append(" INNER JOIN tbl_memberlist AS tm ON tm.id = tc.teacherId");
		sb.append(" LEFT OUTER JOIN tbl_filemanage AS FM ON tc.fileIdx = FM.fileIdx");
		sb.append(" WHERE FM.fileGubun = 'b'");
		sb.append(" ORDER BY regDate DESC");
		sb.append(" LIMIT 0, 9");
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setCoursename(rs.getString("courseName"));
				dto.setSugangStart(rs.getString("sugangStart"));
				dto.setSugangEnd(rs.getString("sugangEnd"));
				dto.setName(rs.getString("name"));
				dto.setCourseIdx(rs.getInt("courseIdx"));
				dto.setFileName(rs.getString("fileName"));
				String path = rs.getString("filePath");
				String path2 = path.substring(0, path.lastIndexOf("\\"));
				path = path.substring(path2.lastIndexOf("\\"));
				path = path.replace("\\", "/");
				dto.setFilePath(path);;
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
		sb.append("SELECT tm.name, tm.id, tt.tMent, FM.fileName, FM.filePath FROM tbl_teacherlist AS tt ");
		sb.append("INNER JOIN tbl_memberlist AS tm ON tm.id = tt.id ");
		sb.append("INNER JOIN tbl_subject AS ts ON ts.subKey = tt.subKey ");
		sb.append(" LEFT OUTER JOIN tbl_filemanage AS FM ON tt.fileIdx = FM.fileIdx");
		sb.append(" WHERE ts.sub1 = ? AND ts.sub2 = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, sub1);
			psmt.setString(2, sub2);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.settMent(rs.getString("tMent"));
				dto.setFileName(rs.getString("fileName"));
				String path = rs.getString("filePath");
				if (path != null) {
					String path2 = path.substring(0, path.lastIndexOf("\\"));
					path = path.substring(path2.lastIndexOf("\\"));
					path = path.replace("\\", "/");
				}
				dto.setFilePath(path);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<AdminDTO> getteacher() {
		List<AdminDTO> list = new Vector<AdminDTO>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT tm.name, tm.id, tt.tMent, tt.fileIdx, FM.fileGubun, FM.fileName, FM.filePath FROM tbl_teacherlist AS tt ");
		sb.append(" INNER JOIN tbl_memberlist AS tm ON tm.id = tt.id");
		sb.append(" LEFT OUTER JOIN tbl_filemanage AS FM ON tt.fileIdx = FM.fileIdx");
		sb.append(" WHERE FM.fileGubun = 't'");
		sb.append(" ORDER BY tm.joinDay DESC");
		sb.append(" LIMIT 0, 9");
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.settMent(rs.getString("tMent"));
				dto.setFileIdx(rs.getString("fileIdx"));
				dto.setFileName(rs.getString("fileName"));
				String path = rs.getString("filePath");
				String path2 = path.substring(0, path.lastIndexOf("\\"));
				path = path.substring(path2.lastIndexOf("\\"));
				path = path.replace("\\", "/");
				dto.setFilePath(path);
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
	public void insertcourse(AdminDTO dto, String id) {
		StringBuilder sb = new StringBuilder();
		sb.append("insert into tbl_courselist");
		sb.append("(registerid, teacherid, regdate, coursename, sugangstart");
		sb.append(", sugangend, guseong, gangbumwi, gangchar, `range`, bookname, bookintro)");
		sb.append("values(?, ?, now(), ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, id);
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getCoursename());
			psmt.setString(4, dto.getSugangStart());
			psmt.setString(5, dto.getSugangEnd());
			psmt.setString(6, dto.getGuseong());
			psmt.setString(7, dto.getBumwi());
			psmt.setString(8, dto.getGangchr());
			psmt.setString(9, dto.getRange());
			psmt.setString(10, dto.getBookIntro());
			psmt.setString(11, dto.getBookName());
			psmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void updatecourse(AdminDTO dto, String courseid) {
		StringBuilder sb = new StringBuilder();
		sb.append("update tbl_courselist ");
		sb.append("set teacherid = ?,");
		sb.append("modifydate = now(),");
		sb.append("coursename = ?,");
		sb.append("sugangStart = ?,");
		sb.append("sugangend = ?,");
		sb.append("guseong = ?,");
		sb.append("gangbumwi = ?,");
		sb.append("gangchar = ?,");
		sb.append("`range` = ?,");
		sb.append("bookname = ?,");
		sb.append("bookintro = ? ");
		sb.append("WHERE courseidx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getCoursename());
			psmt.setString(3, dto.getSugangStart());
			psmt.setString(4, dto.getSugangEnd());
			psmt.setString(5, dto.getGuseong());
			psmt.setString(6, dto.getBumwi());
			psmt.setString(7, dto.getGangchr());
			psmt.setString(8, dto.getRange());
			psmt.setString(9, dto.getBookIntro());
			psmt.setString(10, dto.getBookName());
			psmt.setString(11, courseid);
			psmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public String getcourseid() {
		String sql = "select last_insert_id() as idx";
		String coutseidx = "";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			if(rs.next()) {
				coutseidx =	rs.getString("idx");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return coutseidx;
	}
}