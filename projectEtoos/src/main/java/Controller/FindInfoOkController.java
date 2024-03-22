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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/user/FindInfoOk.do")
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
		boolean authYN = (req.getParameter("authYN") != null ) ? (req.getParameter("authYN").equals("Y") || req.getParameter("authYN").equals("true")) ?  true : true : false ;
		
		String id = (req.getParameter("id") != null) ? req.getParameter("id").trim() : "";
		String name = (req.getParameter("name") != null) ? req.getParameter("name").trim() : "";
		String pwd = (req.getParameter("pwd") != null) ? req.getParameter("pwd").trim() : "";
		String birthYear = (req.getParameter("birthYear") != null) ? req.getParameter("birthYear").trim() : "";
		String birthMonth = (req.getParameter("birthMonth") != null) ? req.getParameter("birthMonth").trim() : "";
		if (!birthMonth.equals("")) birthMonth = (Integer.parseInt(birthMonth) < 10) ? "0"+ birthMonth : birthMonth;
		String birthDay = (req.getParameter("birthDay") != null) ? req.getParameter("birthDay").trim() : "";
		if (!birthDay.equals(""))birthDay = (Integer.parseInt(birthDay) < 10) ? "0"+ birthDay : birthDay;
		String phone = (req.getParameter("phone") != null) ? req.getParameter("phone").trim() : "";
		
		String birth = (birthYear + "-" + birthMonth + "-" + birthDay);
			
		if (flag.equals("id")) {
			dto.setName(name);
			dto.setBirth(birth);
			dto.setPhone(phone);
			
			target = dao.getMemberInfoForId(dto);
			String targetName = (target.getName() != null) ? target.getName() : "";
			String targetBirth = (target.getBirth() != null) ? target.getBirth() : "";
			String targetPhone = (target.getPhone() != null) ? target.getPhone() : "";
			
			if(name != "" && birth != "" && phone != "") {
				if(name.equals(targetName) && birth.equals(targetBirth) && phone.equals(targetPhone)) {
					authYN = true;
				} else {
					authYN = false;
				}
			} else {
				authYN = false;
			}
			
			req.setAttribute("name", name);
			req.setAttribute("birthYear", birthYear);
			req.setAttribute("birthMonth", birthMonth);
			req.setAttribute("birthDay", birthDay);
			req.setAttribute("phone", phone);
			
			if(authYN) {
				req.setAttribute("id", target.getId());
				req.getRequestDispatcher("/user/findIdPage2.jsp").forward(req, resp);
			} else {
				req.setAttribute("errMsg", "정보 불일치");
				req.getRequestDispatcher("/user/findIdPage.jsp").forward(req, resp);  // 아이디 찾기 팝업창 주소 넣어야 함.
			}	
		} else if (flag.equals("pwd")) {
			if (!authYN) {
				dto.setId(id);
				dto.setName(name);
				dto.setBirth(birth);
				dto.setPhone(phone);
				
				target = dao.getMemberInfoForPwd(dto);
				String targetId = (target.getId() != null) ? target.getId() : "";
				String targetName = (target.getName() != null) ? target.getName() : "";
				String targetBirth = (target.getBirth() != null) ? target.getBirth() : "";
				String targetPhone = (target.getPhone() != null) ? target.getPhone() : "";
				
				if(id != "" || name != "" || birth != "" || phone != "") {
					if(id.equals(targetId) && name.equals(targetName) && birth.equals(targetBirth) && phone.equals(targetPhone)) {
						authYN = true;
					} else {
						authYN = false;
					}
				} else {
					authYN = false;
				}
				
				req.setAttribute("name", name);
				req.setAttribute("id", id);
				req.setAttribute("birthYear", birthYear);
				req.setAttribute("birthMonth", birthMonth);
				req.setAttribute("birthDay", birthDay);
				req.setAttribute("phone", phone);
				
				if(authYN) {
					req.setAttribute("authYN", authYN);
					req.getRequestDispatcher("/user/findPwdPage2.jsp").forward(req, resp);
				} else {
					req.setAttribute("errMsg", "정보 불일치");
					req.getRequestDispatcher("/user/findPwdPage.jsp").forward(req, resp);
				}
			} else {
				dto.setId(id);
				dto.setPwd(pwd);
				int result = dao.updatePwd(dto);
				
				if(result != 0) {
					req.getRequestDispatcher("/user/pwdFindComplete.jsp").forward(req, resp);
				} else {
					req.setAttribute("authYN", authYN);
					req.setAttribute("errMsg", "정보 불일치");
					req.getRequestDispatcher("/user/findPwdPage2.jsp").forward(req, resp);  // 아이디 찾기 팝업창 주소 넣어야 함.
				}
			}
		}
	}
}
