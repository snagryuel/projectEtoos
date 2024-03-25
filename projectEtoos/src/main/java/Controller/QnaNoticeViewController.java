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
import common.QnaUtil;



@WebServlet("/user/qnaNoticeView.do")
public class QnaNoticeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//JSP 페이지에 전달할 맵 객체 설정
		Map<String, Object> params = new HashMap<String, Object>();
		
		String searchCategory = req.getParameter("searchCategory");
		String searchWord = req.getParameter("searchWord");
		//검색 파라미터 설정
		if ( searchWord != null && !searchWord.isEmpty() 
				&& searchCategory != null && !searchCategory.isEmpty() ) {
			params.put("searchCategory", searchCategory);
			params.put("searchWord", searchWord);
		}

		int boardIdx = QnaUtil.parseInt(req.getParameter("boardIdx"));
		QnaDTO qnaNoticeView = new QnaDTO();
		
		if ( boardIdx > 0 ) {
			QnaDAO dao = new QnaDAO();
			qnaNoticeView = dao.qnaNoticeView(boardIdx);
			dao.close();
			
		}else {
			resp.sendRedirect("teacherQnaMain.do"); 
            return;
		}

		int readCnt = 0;
		String teacherId = "";
		String regDate = "";
		String title = "";
		String contents = "";
	
		
		
		if (qnaNoticeView != null) {
			readCnt = qnaNoticeView.getReadCnt();
			teacherId = qnaNoticeView.getTeacherId();
			regDate = (qnaNoticeView.getRegDate()!=null ? qnaNoticeView.getRegDate().toString() : "");
			title = qnaNoticeView.getTitle();
			contents = qnaNoticeView.getContents();
			contents = (contents != null ? contents.replace("\n\r", "<br>") : "");
			contents = (contents != null ? contents.replace(" ", "&nbsp;") : "");
		}
		
		params.put("readCnt", readCnt);
		params.put("regDate", regDate);
		params.put("title", title);
		params.put("contents", contents);
		params.put("boardIdx", boardIdx);
		params.put("teacherId", teacherId);
		
		params.put("qnaNoticeView", qnaNoticeView);
		req.setAttribute("params", params);
		
		req.getRequestDispatcher("/user/qnaNoticeView.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doGet(req, resp);
	}

}
