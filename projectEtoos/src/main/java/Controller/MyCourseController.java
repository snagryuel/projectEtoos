package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import board.CourseDAO;
import board.CourseDTO;

@WebServlet("/mypage/MyCourse.do")
public class MyCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// 로그인 여부 체크
		if (session.getAttribute("id") != null) {
			// 아이디 가져오기
			String id = (String) session.getAttribute("id") ;
			// 데이터 가져오기
			CourseDAO dao = new CourseDAO();
			List<CourseDTO> list = dao.getMyCourseHistory(id); 
			dao.Close();
			// 뷰로 보내기
			req.setAttribute("list", list);
			req.getRequestDispatcher("myCourse.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("/user/Main.do?Err=wrongAcess");
		}	
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
