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


@WebServlet("LoginController.do")
public class LoginOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		boolean AuthYN = false;
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");

		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPwd(pwd);
		
		// DB 접근해서 데이터 갖고오는 부분 필요
		MemberDAO dao = new MemberDAO();  // DAO에서 DTO 객체를 보내서 그걸로 처리하고, close()도 그 안에서 했으면 좋겠다.
		MemberDTO target = dao.getMemberInfo(dto);
		
		String targetId = (target.getId() != null) ? target.getId() : "";
		String targetPwd = (target.getPwd() != null) ? target.getPwd() : "";
		
		// 값 비교
		if(id != "" || pwd != "" ) {
			if(id.equals(targetId) && pwd.equals(targetPwd)) {
				AuthYN = true;
			} else {
				AuthYN = false;
			}
		} else {
			AuthYN = false;
		}
		
		// 처리
		if (AuthYN) {
			session.setAttribute("id", id);
			session.setAttribute("loginYN", "Y");
			resp.sendRedirect("MainController.do");
		} else {
		req.setAttribute("errMsg", "로그인 오류");
		req.getRequestDispatcher("/login/login.jsp").forward(req, resp);  // 로그인 페이지 주소 넣어야 함.
		}	
	}

}
