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



@WebServlet("/qnaPostView.do")
public class QnaViewController extends HttpServlet {
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
		QnaDTO qnaView = new QnaDTO();
		
		if ( boardIdx > 0 ) {
			QnaDAO dao = new QnaDAO();
			qnaView = dao.qnaView(boardIdx);
			dao.close();
			
		}else {
			System.out.println("<script>");
			System.out.println("alert('접근 경로가 올바르지 않습니다.');");
			System.out.println("window.location.replace('teacherQnaMain.do');");
			System.out.println("</script>");

		}

		int readCnt = 0;
		String id = "";
		String regDate = "";
		String title = "";
		String contents = "";
		String modifyDate = "";
		
		if (qnaView != null) {
			readCnt = qnaView.getReadCnt();
			id = qnaView.getId();
			regDate = (qnaView.getRegDate()!=null ? qnaView.getRegDate().toString() : "");
			title = qnaView.getTitle();
			contents = qnaView.getContents();
			contents = (contents != null ? contents.replace("\n\r", "<br>") : "");
			contents = (contents != null ? contents.replace(" ", "&nbsp;") : "");
			modifyDate = qnaView.getModifyDate();
		}
		
		params.put("readCnt",readCnt);
		params.put("id",id);
		params.put("regDate",regDate);
		params.put("title",title);
		params.put("contents",contents);
		params.put("boardIdx",boardIdx);
		
		params.put("qnaView", qnaView);
		req.setAttribute("params", params);
		
		req.getRequestDispatcher("/projectEtoos/user/qnaPostView.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doGet(req, resp);
	}

}
