package Controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Vector;

import admin.AdminDAO;
import admin.AdminDTO;
import board.CourseDTO;

@WebServlet("/admin/CourseRegister.do")
public class courseRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx")==null?"0":req.getParameter("idx"));
		CourseDTO courseList = new CourseDTO();
		String success = "";
		AdminDAO dao =new AdminDAO();
		List<CourseDTO> sebuList = new Vector<CourseDTO>();
		List<AdminDTO> teacherList = dao.getteacher();
		if(idx != 0) {
			req.getParameter("success");
			
			courseList = dao.getCourseList(idx);
			sebuList = dao.getCourseSebu(idx);
		}

		req.setAttribute("courseList",courseList);
		req.setAttribute("sesbuList",sebuList);
		req.setAttribute("teacherList",teacherList);
		req.setAttribute("idx",idx);
		req.setAttribute("success",success);
		
		req.getRequestDispatcher("/admin/courseRegister.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
