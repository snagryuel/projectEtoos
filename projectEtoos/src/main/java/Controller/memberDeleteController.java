package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;

import java.io.IOException;

import org.apache.catalina.Session;

@WebServlet("/memberDelete.do")
public class memberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = req.getParameter("id");
		String user_gubun = (String) session.getAttribute("gubun");
		
		MemberDAO dao = new MemberDAO();
		dao.MemberDelete(id);
		if(user_gubun.equals("0")) {
			resp.sendRedirect("/projectEtoos/admin/MemberList.do");
		}else {
			resp.sendRedirect("/user/main.do");
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
