package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import admin.AdminDAO;
import admin.AdminDTO;

@WebServlet("/admin/courseList.do")
public class CourseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sub1 = req.getParameter("sub1")==null?"":req.getParameter("sub1");
		String sub2 = req.getParameter("sub2")==null?"":req.getParameter("sub2");
		String sub3 = req.getParameter("sub3")==null?"":req.getParameter("sub3");
		
		AdminDAO dao = new AdminDAO();
		List<AdminDTO> courseList = dao.CourseInfo(sub1, sub2, sub3);
		dao.Close();
		
		req.setAttribute("courseList", courseList);
		req.getRequestDispatcher("courseList.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
