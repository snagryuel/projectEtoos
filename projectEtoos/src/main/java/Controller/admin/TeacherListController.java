package Controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import admin.AdminDAO;
import admin.AdminDTO;

@WebServlet("/admin/TeacherList.do")
public class TeacherListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name")==null?"":req.getParameter("name");
		AdminDAO dao = new AdminDAO();
		List<AdminDTO> teacherList = dao.getteacher(name);
		dao.Close();
		System.out.println(teacherList);
		
		req.setAttribute("teacherList", teacherList);
		req.setAttribute("name", name);
		req.getRequestDispatcher("/admin/teacherList.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
