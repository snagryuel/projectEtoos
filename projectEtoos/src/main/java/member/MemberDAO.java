package member;

import java.sql.SQLException;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(){}
	public int joinmember(MemberDTO dto){
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_memberlist (gubun, name, pwd, phone, email, birth, addr, id) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getGubun());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPwd());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getBirth());
			psmt.setString(7, dto.getAddr());
			psmt.setString(8, dto.getId());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public MemberDTO getMemberId(MemberDTO input) {
		MemberDTO result = new MemberDTO();
		
		String id = input.getId();
		
		String sql = "SELECT id, pwd, gubun FROM tbl_memberlist WHERE id=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
		
			if(rs.next()) {
				result.setId(rs.getString("id"));

			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public MemberDTO getMemberInfo(MemberDTO input) {
		MemberDTO result = new MemberDTO();
		
		String id = input.getId();
		String pwd = input.getPwd();
		
		String sql = "SELECT id, name, pwd, gubun, state FROM tbl_memberlist WHERE id=? AND pwd=? ";			
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
		
			if(rs.next()) {
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setPwd(rs.getString("pwd"));
				result.setGubun(rs.getString("gubun"));
				result.setState(rs.getString("state"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;

	}		
		

	
	
	public MemberDTO getMemberInfoForId(MemberDTO dto) {
		
		MemberDTO result = new MemberDTO();
		
		String sql = "SELECT id, name, birth, phone FROM tbl_memberlist WHERE name=? AND birth=? AND phone=? ";			
		String name= dto.getName();
		String birth= dto.getBirth();
		String phone= dto.getPhone();
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, birth);
			psmt.setString(3, phone);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setBirth(rs.getString("birth"));
				result.setPhone(rs.getString("phone"));
			}
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return result;
	}		
	
public MemberDTO getMemberInfoForPwd(MemberDTO dto) {
		
		MemberDTO result = new MemberDTO();
		
		String sql = "SELECT id, name, birth, phone FROM tbl_memberlist WHERE id=? AND name=? AND birth=? AND phone=? ";			
		String id= dto.getId();
		String name= dto.getName();
		String birth= dto.getBirth();
		String phone= dto.getPhone();
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, birth);
			psmt.setString(4, phone);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setBirth(rs.getString("birth"));
				result.setPhone(rs.getString("phone"));
			}
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return result;
	}
		
	public int updatePwd(MemberDTO dto) {

		int result = 0;
		String id = dto.getId();
		String pwd = dto.getPwd();

		String sql = "UPDATE tbl_memberlist SET pwd=? WHERE id=?" ;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,pwd);
			psmt.setString(2,id);
			
			result = psmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int MemberUpdate(MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_memberlist");
		sb.append(" SET name = ?,");
		sb.append("phone = ?,");
		sb.append("birth = ?,");
		sb.append("addr = ?,");
		sb.append("email = ?");
		sb.append(" WHERE id = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getBirth());
			psmt.setString(4, dto.getAddr());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	public int MemberDelete(String id) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_memberlist");
		sb.append(" SET state = 99");
		sb.append(" WHERE id = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public MemberDTO getMemberInfo(String id) {
		
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT "
				   + "tm.id, phone, email, birth, addr, pwd, gubun, NAME, tt.fileIdx, tMent "
				   + ",FM.fileGubun, FM.fileName, FM.filePath "
				   + "FROM tbl_memberlist AS tm "
				   + "LEFT OUTER JOIN tbl_teacherlist AS tt ON tm.id=tt.id "
				   + "LEFT OUTER JOIN tbl_filemanage AS FM ON tt.fileIdx = FM.fileIdx "
				   + "WHERE tm.id = ?";
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println(psmt);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setBirth(rs.getString("birth"));
				dto.setAddr(rs.getString("addr"));
				dto.setPwd(rs.getString("pwd"));
				dto.setGubun(rs.getString("gubun"));
				dto.setFileidx(rs.getString("fileidx"));
				dto.setFileGubun(rs.getString("fileGubun"));
				dto.setFileName(rs.getString("fileName"));
				dto.setFilePath(rs.getString("filePath"));
				dto.setMent(rs.getString("tment"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
		}	
	public String getFile(String idx) {
		String sql = "SELECT * FROM tbl_filemanage WHERE fileidx = ?";
		String file = "";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			while(rs.next()) {
				String path = rs.getString("filepath");
				System.out.println(path);
				if(path!=null) {
					String path2 = path.substring(0, path.lastIndexOf("\\"));
					path = path.substring(path2.lastIndexOf("\\"));
					path = path.replace("\\", "/");
					String name = rs.getString("filename");
					file = path+"/"+name;
				}else {
					file = "https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return file;
	}
	public int getFileIdx(String gubun) {
		String sql = "SELECT file_idx FROM tbl_idxmanager where tbl_name = ?";
		int idx = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, gubun);
			rs = psmt.executeQuery();
			while(rs.next()) {
				idx = rs.getInt("file_idx");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql = "UPDATE tbl_idxmanager SET file_idx = file_idx+1 WHERE tbl_name = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, gubun);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idx;
	}
	public void memberupdate(String id) {
		String sql = "update tbl_memberlist set state = 99 where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}