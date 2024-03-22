package Controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import admin.AdminDAO;
import board.CourseDTO;

@WebServlet("/admin/CourseRegister.do")
public class courseRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx"));
		AdminDAO dao =new AdminDAO();
		
		CourseDTO courseList = dao.getCourseList(idx);
		CourseDTO sesbuList = dao.getCourseSebu(idx);
		req.setAttribute("courseList",courseList);
		req.setAttribute("sesbuList",sesbuList);
		
		req.getRequestDispatcher("/admin/courseRegister.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
