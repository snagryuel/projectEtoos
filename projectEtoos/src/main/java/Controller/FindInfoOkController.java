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


@WebServlet("/FindInfoOkController.do")
public class FindInfoOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	
	}  
	


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		MemberDTO target = null;
		
		String flag = (req.getParameter("flag") != null) ? req.getParameter("flag") : "";
		boolean AuthYN = (req.getParameter("AuthYN") != null ) ? (req.getParameter("AuthYN").equals("Y")) ?  true : true : false ;
		
		String id = (req.getParameter("id") != null) ? req.getParameter("id").trim() : "";
		String name = (req.getParameter("name") != null) ? req.getParameter("name").trim() : "";
		String pwd = (req.getParameter("pwd") != null) ? req.getParameter("pwd").trim() : "";
		String birthYear = (req.getParameter("birthYear") != null) ? req.getParameter("birthYear").trim() : "";
		String birthMonth = (req.getParameter("birthMonth") != null) ? req.getParameter("birthMonth").trim() : "";
		String birthDay = (req.getParameter("birthDay") != null) ? req.getParameter("birthDay").trim() : "";
		String phone = (req.getParameter("phone") != null) ? req.getParameter("phone").trim() : "";
		
		String birth = birthYear + "-" + birthMonth + "-" + birthDay;		
		
		if (flag.equals("id")) {
			dto.setName(name);
			dto.setBirth(birth);
			dto.setPhone(phone);
			
			target = dao.getMemberInfoForId(dto);
			String targetName = (target.getName() != null) ? target.getName() : "";
			String targetBirth = (target.getBirth() != null) ? target.getBirth() : "";
			String targetPhone = (target.getPhone() != null) ? target.getPhone() : "";
			
			if(name != "" || birth != "" || phone != "") {
				if(name.equals(targetName) && birth.equals(targetBirth) && phone.equals(targetPhone)) {
					AuthYN = true;
				} else {
					AuthYN = false;
				}
			} else {
				AuthYN = false;
			}
			
			if(AuthYN) {
				req.setAttribute("id", target.getId());
				resp.sendRedirect("MainController.do"); // 메인 주소 넣어야 함.
			} else {
				req.setAttribute("errMsg", "정보 불일치");
				req.getRequestDispatcher("findId.do").forward(req, resp);  // 아이디 찾기 팝업창 주소 넣어야 함.
			}	
		} else if (flag.equals("pwd")) {
			if (!AuthYN) {
				dto.setId(id);
				dto.setName(name);
				dto.setBirth(birth);
				dto.setPhone(phone);
				
				target = dao.getMemberInfo(dto);
				String targetId = (target.getId() != null) ? target.getId() : "";
				String targetName = (target.getName() != null) ? target.getName() : "";
				String targetBirth = (target.getBirth() != null) ? target.getBirth() : "";
				String targetPhone = (target.getPhone() != null) ? target.getPhone() : "";
				
				if(id != "" || name != "" || birth != "" || phone != "") {
					if(id.equals(targetId) && name.equals(targetName) && birth.equals(targetBirth) && phone.equals(targetPhone)) {
						AuthYN = true;
					} else {
						AuthYN = false;
					}
				} else {
					AuthYN = false;
				}
				
				if(AuthYN) {
					req.setAttribute("AuthYN", AuthYN);
					req.setAttribute("id", target.getId());
					resp.sendRedirect("findPwd.do"); // 비밀번호 재설정 페이지로 가야함.
				} else {
					req.setAttribute("errMsg", "정보 불일치");
					req.getRequestDispatcher("findPwd.do").forward(req, resp);  // 아이디 찾기 팝업창 주소 넣어야 함.
				}
			} else {
				dto.setPwd(pwd);
				
				boolean result = dao.updatePwd(dto);
				
				if(result) {
					resp.sendRedirect("findPwd.do?result="+result);
				} else {
					req.setAttribute("AuthYN", AuthYN);
					req.setAttribute("errMsg", "정보 불일치");
					req.getRequestDispatcher("findPwd.do").forward(req, resp);  // 아이디 찾기 팝업창 주소 넣어야 함.
				}
			}
		}
	}
}
