package board;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
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

  /*  public List<boardDTO> getTeacherList(String name) {
        List<boardDTO> list = new Vector<boardDTO>();
        StringBuilder sb = new StringBuilder();
        
        sb.append("SELECT NAME, id, coursename,sub1  ");
        sb.append(" FROM tbl_memberlist, tbl_courseliist, tbl_teacherlist");
        sb.append(" WHERE NAME LIKE '%");
        sb.append(name);
        sb.append("%'");
       
        try {
            psmt = conn.prepareStatement(sb.toString());
            rs = psmt.executeQuery();
            while(rs.next()) {
                boardDTO dto = new boardDTO();
                dto.setName(rs.getString("name"));
                dto.setSub1(rs.getString("sub1"));
                dto.setId(rs.getString("id"));
                dto.setCoursename(rs.getString("coursename"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }*/

    }
