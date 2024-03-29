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
        
        sb.append("SELECT distinct NAME, id ");
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
    }    // 게시물 개수 파악
    
    
    
    
    
    
    
   public List<TeacherDTO> getTeacherList(String name, String bbs) {
        List<TeacherDTO> list = new Vector<TeacherDTO>();
        StringBuilder sb = new StringBuilder();
        
        sb.append("SELECT distinct tm.NAME ,tm.id, tt.tMent, tt.fileIdx, tb.filePath, ts.sub1, ts.sub2 FROM tbl_memberlist AS tm");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
		sb.append(" INNER JOIN tbl_filemanage AS tb ON tt.fileIdx = tb.fileIdx AND tb.fileGubun='t' ");

		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("' OR tc.courseName LIKE '%");
		sb.append(name);
		sb.append("%'");

		if(bbs.isEmpty()) {
			sb.append(" Limit 2");
		}
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				TeacherDTO dto = new TeacherDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.settMent(rs.getString("tMent"));
				dto.setSub1(rs.getString("sub1"));
				dto.setSub2(rs.getString("sub2"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
    }
   
   public List<TeacherDTO> getCourseList(String name, String bbs, int pageNumber) {
       List<TeacherDTO> list = new Vector<TeacherDTO>();
       StringBuilder sb = new StringBuilder();
       
       sb.append("SELECT distinct tm.NAME, tm.id, tt.tMent, tc.courseIdx, tb.filePath, ts.sub1, tc.courseName FROM tbl_memberlist AS tm ");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id ");
		sb.append("INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey ");
		sb.append("INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
		sb.append(" INNER JOIN tbl_filemanage AS tb ON tt.fileIdx = tb.fileIdx AND tb.fileGubun='t'" );

		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("' OR tc.courseName LIKE '%");
		sb.append(name);
		sb.append("%'");

		if(bbs.isEmpty()) {
			sb.append(" Limit 2 ");
		}else {
			int offset = (pageNumber - 1) * 6;
		    sb.append(" LIMIT 6 OFFSET ").append(offset); 
		}
		    try {
		        psmt = conn.prepareStatement(sb.toString());
		        rs = psmt.executeQuery();

		        while (rs.next()) {
		            TeacherDTO dto = new TeacherDTO();
		            dto.setId(rs.getString("id"));
		            dto.setName(rs.getString("name"));
		            dto.settMent(rs.getString("tMent"));
		            dto.setSub1(rs.getString("sub1"));
		            dto.setCourseName(rs.getString("courseName"));
		            dto.setCourseIdx(rs.getInt("courseIdx"));
		            list.add(dto);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return list;
		}
   
   public List<TeacherDTO> getNoticeList(String name, String bbs, int pageNumber) {
       List<TeacherDTO> list = new Vector<TeacherDTO>();
       StringBuilder sb = new StringBuilder();
       
       sb.append("SELECT distinct tm.NAME, tq.title, tb.filePath,  tm.id, tqd.contents  FROM tbl_memberlist AS tm");
		sb.append(" INNER JOIN tbl_qna AS tq ON tm.id = tq.id");
		sb.append(" INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
		sb.append(" INNER JOIN tbl_qnadetail AS tqd ON tq.boardIdx = tqd.boardIdx");
		sb.append(" INNER JOIN tbl_filemanage AS tb ON tt.fileIdx = tb.fileIdx AND tb.fileGubun='t'" );

		sb.append(" WHERE NAME LIKE '%");
		sb.append(name);
		sb.append("' OR tc.courseName LIKE '%");
		sb.append(name);
		sb.append("%'");
		sb.append(" OR tq.title LIKE '%");
		sb.append(name);
		sb.append("%'");

		if(bbs.isEmpty()) {
			sb.append(" Limit 2 ");
		}else {
			int offset = (pageNumber - 1) * 6;
		    sb.append(" LIMIT 6 OFFSET ").append(offset); 
		}
		    try {
		        psmt = conn.prepareStatement(sb.toString());
		        rs = psmt.executeQuery();
			while(rs.next()) {
				TeacherDTO dto = new TeacherDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
   }
   
  
   public int getTotalResultCount(String keyword, String bbs) {
	    int totalCount = 0;
	    StringBuilder sb = new StringBuilder();

	    sb.append("SELECT COUNT(*) FROM tbl_memberlist AS tm ");
	    sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id ");
	    sb.append("INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey ");
	    sb.append("INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
	    sb.append(" WHERE NAME LIKE '%");
	    sb.append(keyword);
	    sb.append("%' OR tc.courseName LIKE '%");
	    sb.append(keyword);
	    sb.append("%'");

	    if (!bbs.isEmpty()) {
			sb.append(" Limit 2");
	    }

	    try {
	        psmt = conn.prepareStatement(sb.toString());
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            totalCount = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return totalCount;
	}
   
   
   
   public int getTotalResultCount_teacher(String keyword, String bbs) {
	    int totalCount = 0;
	    StringBuilder sb = new StringBuilder();

	    sb.append("SELECT COUNT(distinct tm.NAME ,tm.id, tt.tMent, ts.sub1, ts.sub2) FROM tbl_memberlist AS tm");
	    sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id");
		sb.append(" INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey");
		sb.append(" INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(keyword);
		sb.append("' OR tc.courseName LIKE '%");
		sb.append(keyword);
		sb.append("%'");

	    if (!bbs.isEmpty()) {
			sb.append(" Limit 2");
	    }

	    try {
	        psmt = conn.prepareStatement(sb.toString());
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	        	totalCount = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return totalCount;
	}
   
   
   public int getTotalResultCount_course(String keyword, String bbs) {
	    int totalCount = 0;
	    StringBuilder sb = new StringBuilder();

	    sb.append("SELECT COUNT(distinct tm.NAME, tm.id, tt.tMent, ts.sub1, tc.courseName) FROM tbl_memberlist AS tm ");
		sb.append(" INNER JOIN tbl_teacherlist AS tt ON tm.id = tt.id ");
		sb.append("INNER JOIN tbl_subject AS ts ON tt.subkey = ts.subKey ");
		sb.append("INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
		sb.append(" WHERE NAME LIKE '%");
		sb.append(keyword);
		sb.append("' OR tc.courseName LIKE '%");
		sb.append(keyword);
		sb.append("%'");

	    if (!bbs.isEmpty()) {
			sb.append(" Limit 2");
	    }

	    try {
	        psmt = conn.prepareStatement(sb.toString());
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	        	totalCount = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return totalCount;
	}
  
   
   
   public int getTotalResultCount_notice(String keyword, String bbs) {
	    int totalCount = 0;
	    StringBuilder sb = new StringBuilder();

	    sb.append("SELECT COUNT(distinct tm.NAME, tq.title, tm.id, tqd.contents)  FROM tbl_memberlist AS tm");
	  		sb.append(" INNER JOIN tbl_qna AS tq ON tm.id = tq.id");
	  		sb.append(" INNER JOIN tbl_courselist AS tc ON tm.id = tc.teacherId ");
	  		sb.append(" INNER JOIN tbl_qnadetail AS tqd ON tq.boardIdx = tqd.boardIdx");
	  		sb.append(" WHERE NAME LIKE '%");
	  		sb.append(keyword);
	  		sb.append("' OR tc.courseName LIKE '%");
	  		sb.append(keyword);
	  		sb.append("%'");
	  		sb.append(" OR tq.title LIKE '%");
	  		sb.append(keyword);
	  		sb.append("%'");

	    if (!bbs.isEmpty()) {
			sb.append(" Limit 2");
	    }

	    try {
	        psmt = conn.prepareStatement(sb.toString());
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	        	totalCount = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return totalCount;
	}


    }
