package board;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import admin.AdminDTO;
import common.JDBConnect;
public class TeacherDAO extends JDBConnect {

    // 생성자
    public TeacherDAO() {}
    
    public List<TeacherDTO> getMemberList(String name) {
        List<TeacherDTO> list = new Vector<TeacherDTO>();
        StringBuilder sb = new StringBuilder();
        
        sb.append("SELECT NAME, id ");
        sb.append(" FROM tbl_memberlist");
        sb.append(" WHERE NAME LIKE '%");
        sb.append(name);
        sb.append("%'");
       
        try {
            psmt = conn.prepareStatement(sb.toString());
            rs = psmt.executeQuery();
            while(rs.next()) {
                TeacherDTO dto = new TeacherDTO();
                dto.setName(rs.getString("name"));
                dto.setId(rs.getString("id"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    
   public List<TeacherDTO> getTeacherList(String name, String bbs) {
        List<TeacherDTO> list = new Vector<TeacherDTO>();
        StringBuilder sb = new StringBuilder();
        
        sb.append("SELECT tm.NAME ,tm.id, ts.sub1, ts.sub2 FROM tbl_memberlist AS tm");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		if(bbs.isEmpty()) {
			sb.append(" Limit 2");
		}
		try {
			psmt = conn.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			rs = psmt.executeQuery();
			System.out.println(psmt);
			while(rs.next()) {
				TeacherDTO dto = new TeacherDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSub1(rs.getString("sub1"));
				dto.setSub2(rs.getString("sub2"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
    }
   
   
   public List<TeacherDTO> getNoticeList(String name, String bbs) {
        List<TeacherDTO> list = new Vector<TeacherDTO>();
        StringBuilder sb = new StringBuilder();
        
        sb.append("SELECT tm.NAME,tq.titleGubun ,tm.id  FROM tbl_memberlist AS tm");
		sb.append(" INNER JOIN tbl_qna AS tq ON tm.id = tq.id");
		//sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		if(bbs.isEmpty()) {
			sb.append(" Limit 2");
		}
		try {
			psmt = conn.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				TeacherDTO dto = new TeacherDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTitleGubun(rs.getString("titleGubun"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
    }
   

   public List<TeacherDTO> getCourseList(String name, String bbs) {
        List<TeacherDTO> list = new Vector<TeacherDTO>();
        StringBuilder sb = new StringBuilder();
        
        sb.append("SELECT tm.NAME, tm.id, ts.sub1, tc.courseName FROM tbl_memberlist AS tm ");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id ");
		sb.append("INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey ");
		sb.append("INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("%'");
		if(bbs.isEmpty()) {
			sb.append(" Limit 2");
		}
		try {
			psmt = conn.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				TeacherDTO dto = new TeacherDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSub1(rs.getString("sub1"));
				dto.setCourseName(rs.getString("courseName"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
    }
   
   
   
   

    }
