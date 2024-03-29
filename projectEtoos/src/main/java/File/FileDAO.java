package File;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class FileDAO extends JDBConnect {
	public int registFile(int idx, String gubun, String name, String path) {
		int result = 0;
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO tbl_filemanage(fileidx, fileGubun, FileName, FilePath)");
			sb.append(" Values(?, ?, ?, ?)");
			
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, idx);
			psmt.setString(2, gubun);
			psmt.setString(3, name);
			psmt.setString(4, path);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	public String getfile(String id) {
		String sql = "SELECT filepath, filename FROM tbl_filemanage AS tf INNER JOIN tbl_teacherlist AS tt ON tf.fileIdx = tt.fileidx WHERE tt.id = ?";
		String file = "";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				String filepath = rs.getString("filepath");
				String filename = rs.getString("filename");
				file = filepath+"\\"+filename;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return file;
	}
	public void update(String id) {
		String sql = "update tbl_teacherlist set fileidx = null where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
