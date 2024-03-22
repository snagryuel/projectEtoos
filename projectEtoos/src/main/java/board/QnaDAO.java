package board;

import jakarta.servlet.ServletContext;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;


public class QnaDAO extends JDBConnect {
	public QnaDAO() {}
	
	public QnaDAO(ServletContext application) {
		super(application);
	}
	
	public int totalCount(String id) {
		int totalCount = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT COUNT(id) FROM tbl_qna");
		if(id != "") {sb.append(" WHERE id=?");}
		

		try {
			psmt = conn.prepareStatement(sb.toString());
			if(id != "") {psmt.setString(1, id);}
			rs = psmt.executeQuery();
			
			rs.next();
			totalCount = rs.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<QnaDTO> noticeList(Map<String, Object> map) {
		List<QnaDTO> list = new Vector<QnaDTO>();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT boardIdx, title, id, regDate");
		sb.append(", modifyDate, readCnt");
		sb.append(" FROM tbl_qna");
		sb.append(" WHERE titlegubun='공지'");
		sb.append(" ORDER BY regDate DESC");
		sb.append(" LIMIT 2");
		
		if (map.get("searchCategory") != null && map.get("searchWord") != null) {
			sb.append(" WHERE " + map.get("searchCategory")); sb.append(" LIKE '%" +
			map.get("searchWord") + "%'"); 
			}
		

		System.out.println("sql : " + sb.toString());

		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setBoardIdx(rs.getInt("boardIdx"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setModifyDate(rs.getString("modifyDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				//dto.setRefIdx(rs.getInt(0));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
		}

		return list;
	}
	
	
	public List<QnaDTO> QnaList(Map<String, Object> map) {
		List<QnaDTO> list = new Vector<QnaDTO>();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT boardIdx, title, id, regDate");
		sb.append(", modifyDate, readCnt");
		sb.append(" FROM tbl_qna");
		sb.append(" WHERE titlegubun!='공지'");
		sb.append(" ORDER BY regDate DESC");
		
		if (map.get("searchCategory") != null && map.get("searchWord") != null) {
		sb.append(" WHERE " + map.get("searchCategory")); sb.append(" LIKE '%" +
		map.get("searchWord") + "%'"); }
		

		System.out.println("sql : " + sb.toString());

		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setBoardIdx(rs.getInt("boardIdx"));
				dto.setTitleGubun(rs.getString("titleGubun"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setModifyDate(rs.getString("modifyDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				//dto.setRefIdx(rs.getInt(0));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
		}

		return list;
	}
	
	

}
