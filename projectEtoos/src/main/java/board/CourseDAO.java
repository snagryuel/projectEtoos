package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class CourseDAO extends JDBConnect {
	public CourseDAO() {}
	
	public int totalCount(String sub1, String sub2, String sub3) {
		int totalCount = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT COUNT(courseIdx) FROM tbl_courselist AS CL");
		sb.append(" INNER JOIN tbl_teacherList AS TL ON CL.teacherId = TL.id");
		sb.append(" INNER JOIN tbl_subject AS SJ ON TL.subKey = SJ.subKey");
		
		sb.append(" WHERE 1=1");
		
		if(!sub1.equals("")) {
			sb.append(" AND sub1 = ?");
		}
		if(!sub2.equals("")) {
			sb.append(" AND sub2 = ?");
		}
		if(!sub3.equals("")) {
			sb.append(" AND teacherId = ?");
		}
		
		int cnt = 1;
		
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
			System.out.println(psmt);
			
			rs = psmt.executeQuery();
			
			rs.next();
			totalCount = rs.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	public CourseDTO getDetail(String idx, String id) {
		CourseDTO dto = new CourseDTO();
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT");
		sb.append(" TL.id, MB.name, CL.courseName, CL.`range`,  CL.gangChar, CL.sugangStart, CL.sugangEnd, CL.guseong");
		sb.append(" , CL.bookName, CL.bookIntro, CL.gangBumwi");
		sb.append(" , FM.fileGubun, FM.fileName, FM.filePath");
		sb.append(" , SJ.sub1, SJ.sub2");
		sb.append(" , NVL2(CH.id, 'Y', 'N') AS 'historyYN', CH.applicationDate");
		sb.append(" , CASE WHEN CL.sugangEnd >= CURDATE() then 'Y' ELSE 'N' END AS 'state'");
		sb.append(" FROM tbl_courselist AS CL ");
		sb.append(" LEFT OUTER JOIN tbl_teacherList AS TL ON CL.teacherId = TL.id");
		sb.append(" LEFT OUTER JOIN tbl_memberList AS MB ON MB.id = TL.id ");
		sb.append(" LEFT OUTER JOIN tbl_subject AS SJ ON TL.subKey = SJ.subKey ");
		sb.append(" LEFT OUTER JOIN tbl_filemanage AS FM ON CL.fileIdx = FM.fileIdx");
		sb.append(" LEFT OUTER JOIN tbl_coursehistory AS CH ON CL.courseIdx = CH.courseIdx");
		sb.append(" AND CH.id = ?");
		sb.append(" WHERE CL.courseIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, id);
			psmt.setString(2, idx);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto.setTeacherId(rs.getString("id"));
				dto.setTeacherName(rs.getString("name"));
				dto.setCourseName(rs.getString("courseName"));
				dto.setGangChar((rs.getString("gangCHar") != null) ? rs.getString("gangCHar").replace("\r\n", "<br>") : null);
				dto.setSugangStart(rs.getString("sugangStart"));
				dto.setSugangEnd(rs.getString("sugangEnd"));
				dto.setGuseong(rs.getString("guseong"));
				dto.setBookName(rs.getString("bookName"));
				dto.setBookIntro((rs.getString("bookIntro") != null) ? rs.getString("bookIntro").replace("\r\n", "<br>") : null);
				dto.setGangBumwi((rs.getString("gangBumwi") != null) ? rs.getString("gangBumwi").replace("\r\n", "<br>") : null);
				dto.setFileGubun(rs.getString("fileGubun"));
				dto.setFileName(rs.getString("fileName"));
				dto.setFilePath(rs.getString("filePath"));
				dto.setSub1(rs.getString("sub1"));
				dto.setSub2(rs.getString("sub2"));
				dto.setRange(rs.getString("range"));
				dto.setHistoryYN(rs.getString("historyYN"));
				dto.setState(rs.getString("state"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<CourseDTO> getCourseSebu(String idx) {
		StringBuilder sb = new StringBuilder();
		List<CourseDTO> list = new Vector<CourseDTO>();
		
		sb.append("SELECT sebuIdx, courseSebuName, courseTime");
		sb.append(" FROM tbl_coursesebu");
		sb.append(" WHERE courseidx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, idx);
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
	
	public int applyToCourse(String idx, String id) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_courseHistory (id, courseIdx)");
		sb.append(" VALUES (?, ?)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, id);
			psmt.setString(2, idx);
			System.out.println(psmt);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int cancelToCourse(String idx, String id) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("DELETE FROM tbl_courseHistory");
		sb.append(" WHERE courseIdx = ? AND id = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, idx);
			psmt.setString(2, id);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
