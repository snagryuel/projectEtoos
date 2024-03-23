package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import board.CourseDAO;
import board.CourseDTO;

@WebServlet("/user/CourseApplication.do")
public class CourseApplicationController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String id = (session.getAttribute("id") != null) ? (String) session.getAttribute("id") : "";
		
		if(id != "") {
			String courseIdx = req.getParameter("courseIdx");
			
			// 쿼리 실행
			CourseDAO dao = new CourseDAO();
			int result = dao.applyToCourse(courseIdx, id);
			
			// 이전 페이지
			String url = req.getHeader("referer").substring(req.getHeader("referer").lastIndexOf("/")+1);
			
			// 성공여부
			boolean sucessYN = false;
			if (result > 0) {
				sucessYN = true;
				req.setAttribute("sucessYN", sucessYN);
				req.getRequestDispatcher(url+req.getQueryString()).forward(req, resp);
			} else {
				req.setAttribute("sucessYN", sucessYN);
				req.getRequestDispatcher(url+req.getQueryString()).forward(req, resp);
			}
		} else {
			resp.sendRedirect("Main.do?Err=wrongAcess");
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
