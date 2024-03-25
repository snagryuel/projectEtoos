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
	
}
