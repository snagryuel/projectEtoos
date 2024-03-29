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
		String applyStatus = (req.getParameter("applyStatus") != null) ? req.getParameter("applyStatus") : "err";
		String id = (session.getAttribute("id") != null) ? (String) session.getAttribute("id") : "";
		
		// 성공여부 초기화
		req.removeAttribute("cancelSucessYN");
		
		if(!id.equals("") && !applyStatus.equals("err")) {
			String courseIdx = req.getParameter("courseIdx");
			if (applyStatus.equals("apply")) {
				// 쿼리 실행
				CourseDAO dao = new CourseDAO();
				int result = dao.applyToCourse(courseIdx, id);
				dao.Close();
								
				// 성공여부
				boolean sucessYN = false;
				if (result > 0) {
					sucessYN = true;
					String menuGubun = (req.getParameter("menuGubun") != null) ? req.getParameter("menuGubun") : "course" ;
					if (menuGubun.equals("teacher")) {
						resp.sendRedirect("TeacherDetailList.do?"+req.getQueryString()+"&sucessYN="+sucessYN);
					} else {
						resp.sendRedirect("courseList.do?"+req.getQueryString()+"&sucessYN="+sucessYN);
					}
				} else {
					req.setAttribute("sucessYN", sucessYN);
					resp.sendRedirect("courseList.do?"+req.getQueryString()+"&sucessYN="+sucessYN);
				}
			} else if (applyStatus.equals("cancel")) {
				// 쿼리 실행
				CourseDAO dao = new CourseDAO();
				int result = dao.cancelToCourse(courseIdx, id);
				dao.Close();
				
				// 이전 페이지
				String url = req.getHeader("referer").substring(req.getHeader("referer").lastIndexOf("/")+1);
				
				// 성공여부
				boolean cancelSucessYN = false;
				if (result > 0) {
					cancelSucessYN = true;
					String menuGubun = (req.getParameter("menuGubun") != null) ? req.getParameter("menuGubun") : "course" ;
					if (menuGubun.equals("teacher")) {
						resp.sendRedirect("TeacherDetailList.do?"+req.getQueryString()+"&cancelSucessYN="+cancelSucessYN);
					} else {
						resp.sendRedirect("courseList.do?"+req.getQueryString()+"&cancelSucessYN="+cancelSucessYN);
					}
				} else {
					resp.sendRedirect("courseList.do?"+req.getQueryString()+"&cancelSucessYN="+cancelSucessYN);
				}
			}
		} else {
			resp.sendRedirect("Main.do?Err=wrongAcess");
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
