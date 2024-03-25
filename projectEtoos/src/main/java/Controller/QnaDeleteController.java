package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import board.QnaDAO;
import board.QnaDTO;


public class QnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardIdx = Integer.parseInt(req.getParameter("boardIdx"));
		
		int result = 0;
		    
		QnaDTO dto = new QnaDTO();
		dto.setBoardIdx(boardIdx);


		QnaDAO dao = new QnaDAO();
		
		
		if(boardIdx > 0) {
			result = dao.qnaNoticeDelete(boardIdx);
			
			
			if (result > 0) {
		    resp.sendRedirect("teacherQnaMain.do");
			} else {
			
		    req.getRequestDispatcher("qnaNoticeView.do?boardIdx="+boardIdx).forward(req, resp);
			}
		}	
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
