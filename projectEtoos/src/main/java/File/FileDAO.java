package File;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class FileDAO extends JDBConnect {
	public int registFile(String gubun, String name, String path) {
		int result = 0;
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO tbl_filemanage(fileGubun, FileName, FilePath)");
			sb.append(" Values(?, ?, ?)");
			
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, gubun);
			psmt.setString(2, name);
			psmt.setString(3, path);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
}
