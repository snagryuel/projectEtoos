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

@WebServlet("/admin/MemberList.do")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name")==null?"":req.getParameter("name");
		AdminDAO dao = new AdminDAO();
		List<AdminDTO> memberList = dao.getMemberList(name);
		dao.Close();
		
		req.setAttribute("memberList", memberList);
		req.setAttribute("name", name);
		req.getRequestDispatcher("/admin/memberList.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
