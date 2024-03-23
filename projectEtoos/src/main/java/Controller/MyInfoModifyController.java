package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

import File.FileDAO;
import File.FileUtil;

@WebServlet("/mypage/MypageModify.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024*1,
		maxRequestSize = 1024*1024*10
		)
public class MyInfoModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberDTO dto = new MemberDTO();
		FileDAO fileDAO = new FileDAO();
		String birth = "";
		String name = req.getParameter("name");
		String id = (String) session.getAttribute("id");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String birthYear = req.getParameter("birthYear");
		String birthMonth = req.getParameter("birthMonth");
		String birthDay = req.getParameter("birthDay");
		String addr = req.getParameter("addr");
		String pwd = req.getParameter("pwd2")==null?"":req.getParameter("pwd2");
		String pwdCheck = req.getParameter("pwd3");
		
		birth = birthYear+"-"+birthMonth+"-"+birthDay;
		if(!pwd.isEmpty()||!pwd.equals("")) {
			if(!pwd.equals(pwdCheck)) {
				req.setAttribute("errMsg", "회원정보 수정에 실패하였습니다 다시 확인해 주시기 바랍니다");
				req.getRequestDispatcher("./MyInfo.do").forward(req, resp);
			}
		}
		dto.setAddr(addr);
		dto.setBirth(birth);
		dto.setEmail(email);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setPwd(pwd);
		dto.setId(id);
		
		MemberDAO dao = new MemberDAO();
		
		String directory = req.getServletContext().getRealPath("/")+"upload";
		String FileName = FileUtil.uploadFile(req, directory);
		fileDAO.registFile("t", FileName, directory);
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
