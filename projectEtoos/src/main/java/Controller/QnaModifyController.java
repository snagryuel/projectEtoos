package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import board.QnaDAO;
import board.QnaDTO;

/*@WebServlet("/qnaPostModify.do")*/
public class QnaModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		QnaDAO dao = new QnaDAO();

		int boardIdx = Integer.parseInt(req.getParameter("boardIdx"));

		QnaDTO qnaModify = dao.qnaModify(boardIdx);
		dao.close();


		int readCnt = 0;
		String id = "";
		String regDate = "";
		String title = "";
		String contents = "";
		String modifyDate = "";
		String contents_pwd = "";
		
		if (qnaModify != null) {
			readCnt = qnaModify.getReadCnt();
			id = qnaModify.getId();
			regDate = qnaModify.getRegDate().toString();
			title = qnaModify.getTitle();
			contents = qnaModify.getContents();
			contents_pwd = qnaModify.getContents_pwd();
		}
		
		params.put("readCnt",readCnt);
		params.put("id",id);
		params.put("regDate",regDate);
		params.put("title",title);
		params.put("contents",contents);
		params.put("boardIdx", boardIdx);
		params.put("modifyDate", modifyDate);
		params.put("contents_pwd", contents_pwd);
		
		req.setAttribute("qnaModify", qnaModify);
		req.setAttribute("params", params);
		
		req.getRequestDispatcher("/user/qnaPostModify.jsp?boardIdx="+boardIdx).forward(req, resp);
	
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String qna_boardIdx = req.getParameter("boardIdx");

		int boardIdx = 0;
		boardIdx = (qna_boardIdx != null && !qna_boardIdx.isEmpty() ? Integer.parseInt(qna_boardIdx): 0);


		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String contents_pwd = req.getParameter("contents_pwd")==null ? "" :req.getParameter("contents_pwd");
		    
	    QnaDTO dto = new QnaDTO();
	    dto.setBoardIdx(boardIdx);
	    dto.setId(id);
	    dto.setTitle(title);
	    dto.setContents(contents);
	  
	    
	    QnaDAO dao = new QnaDAO();
	    int result = dao.qnaModify(dto);
	    dao.close();
		    
		
	    resp.sendRedirect("teacherQnaMain.do");

		
	}
}
