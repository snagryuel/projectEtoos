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
import common.PageUtil;

@WebServlet("/admin/TeacherList.do")
public class TeacherListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name")==null?"":req.getParameter("name");
		int pageSelected = req.getParameter("pageSelected")==null? 1 : Integer.parseInt(req.getParameter("pageSelected"));
		
		// 들어온 URL에 따라 처리
		String uri = req.getRequestURI();
		String commandStr = uri.substring(uri.lastIndexOf("/")+1);
		
		AdminDAO dao = new AdminDAO();
		List<AdminDTO> teacherList = dao.getteacher(name);
		int totalCount = dao.getTeacherTotalCount(name);
		dao.Close();

		int totalPage =  (int) Math.ceil((double)totalCount / 10);
		String queryString = "name=" + name;
		
		String page = PageUtil.makePageNumber(totalPage, pageSelected, commandStr, queryString);
		
		req.setAttribute("teacherList", teacherList);
		req.setAttribute("name", name);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);
		req.getRequestDispatcher("/admin/teacherList.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
