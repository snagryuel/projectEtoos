package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

@WebServlet("/mypage/MyInfo.do")
public class MyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		MemberDAO dao = new MemberDAO();
		MemberDTO result = dao.getMemberInfo(id);
		String path = dao.getFile();
		path = path.replace("\\", "/");
		String birth = result.getBirth();
		String birthYear = birth.substring(0,4);
		String birthMonth = birth.substring(birth.indexOf("-")+1,birth.lastIndexOf("-"));
		String birthDay = birth.substring(birth.lastIndexOf("-")+1);
		req.setAttribute("birthYear", birthYear);
		req.setAttribute("birthMonth", birthMonth);
		req.setAttribute("birthDay", birthDay);
		req.setAttribute("result", result);
		req.setAttribute("path", path);
		req.getRequestDispatcher("/mypage/myInfoModify.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
