package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;


@WebServlet("/user/AuthChek.do")
public class AuthCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AuthCheck() {
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean AuthYN = false;
		
		String id = req.getParameter("id");

		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		
		// DB 접근해서 데이터 갖고오는 부분 필요
		MemberDAO dao = new MemberDAO();  // DAO에서 DTO 객체를 보내서 그걸로 처리하고, close()도 그 안에서 했으면 좋겠다.
		MemberDTO target = dao.getMemberId(dto);
		
		String targetId = (target.getId() != null) ? target.getId() : "";
		// 값 비교
		if(!id.equals(targetId)) {
			AuthYN = true;
		} else {
			AuthYN = false;
		}
		
		// 처리
		if (AuthYN) {
			req.setAttribute("authYN", "Y");
			req.setAttribute("id", id);
			req.getRequestDispatcher("/user/authCheckPop.jsp?authYN=Y&id="+id).forward(req, resp);
		} else {
			req.setAttribute("authYN", "N");
			req.setAttribute("id", id);
			req.getRequestDispatcher("/user/authCheckPop.jsp?authYN=N&id="+id).forward(req, resp);
		}	

		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
