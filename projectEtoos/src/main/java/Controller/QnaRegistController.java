package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import board.QnaDAO;
import board.QnaDTO;

/*@WebServlet("/qnaNewNotice.do")*/
public class QnaRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String contents_pwd = req.getParameter("contents_pwd")==null ? "" :req.getParameter("contents_pwd");
		
		QnaDTO dto = new QnaDTO();
		dto.setId(id);
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setContents_pwd(contents_pwd);

		QnaDAO dao = new QnaDAO();
		int result = dao.qnaRegist(dto);
		dao.close();
		
		if (result > 0){
			resp.sendRedirect("/teacherQnaMain.do");
			
		} else {
			req.getRequestDispatcher("/projectEtoos/user/qnaNewPost.jsp").forward(req, resp);
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
