package board;

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
	
}
