package Controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import admin.AdminDAO;
import admin.AdminDTO;

@WebServlet("/admin/CourseRegisterOk.do")
public class CourseRegisterOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String[] sebuname = req.getParameterValues("courseSebuName");
		String[] time = req.getParameterValues("courseTime");
		String[] sebuidx = req.getParameterValues("sebuIdx");
		String courseidx = req.getParameter("courseIdx")==null?"":req.getParameter("courseIdx");
		String courseName = req.getParameter("courseName");
		String teacher = req.getParameter("teacher");
		String sugangStart = req.getParameter("sugangStart");
		String sugangEnd = req.getParameter("sugangEnd");
		String guseong = req.getParameter("guseong");
		String gangBumwi = req.getParameter("gangBumwi");
		String gangChar = req.getParameter("gangChar");
		String range = req.getParameter("range");
		String bookName = req.getParameter("bookName");
		String bookIntro = req.getParameter("bookIntro");
		String registerid = (String) session.getAttribute("id");
		
		System.out.println(courseidx);
		
		AdminDTO dto = new AdminDTO();
		
		dto.setCoursename(courseName);
		dto.setName(teacher);
		dto.setSugangStart(sugangStart);
		dto.setSugangEnd(sugangEnd);
		dto.setGuseong(guseong);
		dto.setBumwi(gangBumwi);
		dto.setGangchr(gangChar);
		dto.setRange(range);
		dto.setBookIntro(bookName);
		dto.setBookName(bookIntro);
		
		AdminDAO dao = new AdminDAO();
		
		if(courseidx.equals("0")) {
			dao.insertcourse(dto, registerid);
			courseidx = dao.getcourseid();
			System.out.println("insert실행");
		}else {
			dao.updatecourse(dto, courseidx);
			System.out.println("update실행");
		}
		
		for(int i = 0; i < sebuname.length; i++) {
			if(i>=sebuidx.length) {
				dao.insertSebu(sebuname[i], time[i], courseidx);
			}else {
				dao.updateSebu(sebuname[i], time[i], sebuidx[i]);
			}
		}
		resp.sendRedirect("/projectEtoos/admin/CourseRegister.do?idx="+courseidx+"&success=Y");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
