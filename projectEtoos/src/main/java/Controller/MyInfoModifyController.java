package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

@WebServlet("/projectEtoos/mypage/mypagemodify.do")
public class MyInfoModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		String birth = "";
		System.out.println("뭐왜뭐 뭘봐");
		String name = req.getParameter("name");
		System.out.println("뭐왜뭐 뭘봐");
		String phone = req.getParameter("phone");
		System.out.println("뭐왜뭐 뭘봐");
		String email = req.getParameter("email");
		System.out.println("뭐왜뭐 뭘봐");
		String birthYear = req.getParameter("birthYear");
		System.out.println("뭐왜뭐 뭘봐");
		String birthMonth = req.getParameter("birthMonth");
		System.out.println("뭐왜뭐 뭘봐");
		String birthDay = req.getParameter("birthDay");
		System.out.println("뭐왜뭐 뭘봐");
		String addr = req.getParameter("addr");
		System.out.println("뭐왜뭐 뭘봐");
		String pwd = req.getParameter("pwd2");
		System.out.println("뭐왜뭐 뭘봐");
		String pwdCheck = req.getParameter("pwd3");
		
		System.out.println("뭐왜뭐 뭘봐");
		birth = birthYear+"-"+birthMonth+"-"+birthDay;
		System.out.println("뭐왜뭐 뭘봐");
		if(!pwd.isEmpty()||!pwd.equals("")) {
			if(!pwd.equals(pwdCheck)) {
				req.setAttribute("errMsg", "회원정보 수정에 실패하였습니다 다시 확인해 주시기 바랍니다");
				req.getRequestDispatcher("./MyInfo.do").forward(req, resp);
			}
		}
		System.out.println("뭐왜뭐 뭘봐");
		dto.setAddr(addr);
		dto.setBirth(birth);
		dto.setEmail(email);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setPwd(pwd);
		
		MemberDAO dao = new MemberDAO();
		
		int result = dao.MemberUpdate(dto);
		if(result == 0) {
			req.setAttribute("errMsg", "회원정보 수정에 실패하였습니다 다시 확인해 주시기 바랍니다");
		}
		resp.sendRedirect("./MyInfo.do");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
