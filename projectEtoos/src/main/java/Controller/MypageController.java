package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		String birth = "";
		
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String birthYear = req.getParameter("birthYear");
		String birthMonth = req.getParameter("birthMonth");
		String birthDay = req.getParameter("birthDay");
		String addr = req.getParameter("addr");
		String pwd = req.getParameter("pwd");
		String pwdCheck = req.getParameter("pwdCheck");
		
		birth = birthYear+"-"+birthMonth+"-"+birthDay;
		if(!pwd.equals(pwdCheck)) {
			req.setAttribute("errMsg", "회원정보 수정에 실패하였습니다 다시 확인해 주시기 바랍니다");
			req.getRequestDispatcher("/mypage.do").forward(req, resp);
		}
		dto.setAddr(addr);
		dto.setBirth(birth);
		dto.setEmail(email);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setPwd(pwd);
		
		MemberDAO dao = new MemberDAO();
		
		boolean result = dao.MemberUpdate(dto);
		if(!result) {
			req.setAttribute("errMsg", "회원정보 수정에 실패하였습니다 다시 확인해 주시기 바랍니다");
		}
		req.getRequestDispatcher("/mypage.do").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
