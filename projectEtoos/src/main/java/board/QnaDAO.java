package board;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;


public class QnaDAO extends JDBConnect {
	public QnaDAO() {}
	
	public QnaDAO(ServletContext application) {
		super(application);
	}
	
	public int totalCount(String boardIdx) {
		int totalCount = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT COUNT(boardIdx) FROM tbl_qnadetail");
		if(boardIdx != "") {sb.append(" WHERE boardIdx=?");}
		

		try {
			psmt = conn.prepareStatement(sb.toString());
			if(boardIdx != "") {psmt.setString(1, boardIdx);}
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
		sb.append("SELECT boardIdx, title, regDate");
		sb.append(", modifyDate, readCnt");
		sb.append(" FROM tbl_qna");
		sb.append(" WHERE titleGubun='공지'");
		sb.append(" ORDER BY regDate DESC");
		/* sb.append(" LIMIT 2"); */
		
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
				dto.setRegDate(rs.getString("regDate"));
				dto.setModifyDate(rs.getString("modifyDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
		}

		return list;
	}
	
	
	public List<QnaDTO> qnaList(Map<String, Object> map) {
		List<QnaDTO> list = new Vector<QnaDTO>();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT boardIdx, title, NAME, regDate, readCnt FROM tbl_qna AS tq INNER JOIN tbl_memberlist AS tm ON tq.id = tm.id WHERE titleGubun !='공지' ORDER BY regDate DESC");
		/* sb.append(" LIMIT 2"); */
		
		  if (map.get("searchCategory") != null && map.get("searchWord") != null) {
			  sb.append(" WHERE " + map.get("searchCategory")); sb.append(" LIKE '%" +map.get("searchWord") + "%'"); 
			 }

		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setBoardIdx(rs.getInt("boardIdx"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
		}

		return list;
	}
	
	public QnaDTO qnaNoticeView(int boardIdx) {
		QnaDTO dto = new QnaDTO();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT boardIdx, title, studentId, contents,  regDate, refIdx, modifyDate, readCnt");
		sb.append(" FROM tbl_qnadetail");
		sb.append(" WHERE titleGubun = '공지'");
		
		try {
			
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setBoardIdx(rs.getInt("boardIdx"));
	            dto.setTitle(rs.getString("title"));
	            dto.setTeacherId(rs.getString("teacherId"));
	            dto.setRegDate(rs.getString("regDate"));
	            dto.setModifyDate(rs.getString("modifyDate"));
	            dto.setReadCnt(rs.getInt("readCnt"));
	            dto.setContents(rs.getString("contents"));
				dto.setRefIdx(rs.getInt("refIdx"));
			}
		} catch (Exception e) {
			System.out.println("공지사항 게시판 데이터 조회 오류 : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
		
		
	}
	
	
	public QnaDTO qnaView(int boardIdx) {
		QnaDTO dto = new QnaDTO();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT title, regdate, readcnt, contents FROM tbl_qna WHERE boardidx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, boardIdx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setTitle(rs.getString("title"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setContents(rs.getString("contents"));
			}
		} catch (Exception e) {
			System.out.println("게시판 데이터 조회 오류 : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
	
	public int qnaNoticeRegist(QnaDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_qnadetail (contents, title, titleGubun)");
		sb.append(" VALUES (?, ?, '공지')"); 

		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getContents());
			psmt.setString(2, dto.getTitle());
			
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("공지사항 게시물 등록 중 에러 발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int qnaRegist(QnaDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_qnadetail (titleGubun, title, registId, regDate)");
		sb.append(" VALUES ('질문', ?, ?, NOW());");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getRegistId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContents());
			psmt.setString(4, dto.getContents_pwd());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 등록 중 에러 발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public int qnaNoticeModify(QnaDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_qnadetail");
		sb.append(" SET title = ?, getContents=?, Contents_pwd=?, modifyDate = NOW()");
		sb.append(" WHERE titleGubun = '공지' AND boardIdx = ?");

		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContents_pwd());
			psmt.setString(3, dto.getContents());
			psmt.setInt(4, dto.getBoardIdx());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 에러 발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public int qnaModify(QnaDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_qnadetail");
		sb.append(" SET title = ?, getContents=?, Contents_pwd=?, modifyDate = NOW()");
		sb.append(" WHERE titleGubun != '공지' AND boardIdx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContents_pwd());
			psmt.setString(3, dto.getContents());
			psmt.setInt(4, dto.getBoardIdx());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 에러 발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public int qnaNoticeDelete(int boardIdx) {
		int result = 0;
		String sql = "DELETE FROM tbl_qnadetail WHERE boardIdx = ? and titleGubun='공지";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardIdx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 에러 발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public int qnaDelete(int boardIdx) {
		int result = 0;
		String sql = "DELETE FROM tbl_qnadetail WHERE boardIdx = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardIdx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 에러 발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public List<QnaDTO> qnaba(int idx) {
		List<QnaDTO> list = new Vector<QnaDTO>();
		String sql = "SELECT title, boardidx FROM tbl_qna WHERE boardidx = ? or boardidx = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx-1);
			psmt.setInt(2, idx+1);
			rs = psmt.executeQuery();
			while(rs.next()){
				QnaDTO dto = new QnaDTO();
				dto.setTitle(rs.getString("title"));
				dto.setBoardIdx(rs.getInt("boardidx"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}
