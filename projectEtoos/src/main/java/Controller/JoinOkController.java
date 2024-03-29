package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

@WebServlet("/user/JoinOk.do")
public class JoinOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		String birth = "";
				
		String gubun = req.getParameter("gubun");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String birthYear = req.getParameter("birthYear");
		String birthMonth = req.getParameter("birthMonth");
		String birthDay = req.getParameter("birthDay");
		String addr = req.getParameter("addr");
		if(gubun.equals("2")) {
			String subkey = req.getParameter("sub");
			dao.teacherinsert(id, subkey);
		}
		
		
		birth = birthYear+"-"+birthMonth+"-"+birthDay;
		
		dto.setAddr(addr);
		dto.setBirth(birth);
		dto.setEmail(email);
		dto.setGubun(gubun);
		System.out.println("gubun2 :"+gubun);
		dto.setId(id);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setPwd(pwd);
		
		try {
			int result = dao.joinmember(dto);
			if(result != 0) {
				req.getRequestDispatcher("/user/Main.do").forward(req, resp);
			}else {
				req.setAttribute("errMsg", "회원가입에 실패하였습니다 다시 확인해 주시기 바랍니다");
				req.getRequestDispatcher("Join.do").forward(req, resp);
			}
		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("errMsg", "회원가입에 실패하였습니다 다시 확인해 주시기 바랍니다");
			req.getRequestDispatcher("/join.do").forward(req, resp);
		}
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
