package Controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import admin.AdminDAO;

@WebServlet("/admin/CourseRegisterOk.do")
public class CourseRegisterOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] sebuname = req.getParameterValues("courseSebuName");
		String[] time = req.getParameterValues("courseTime");
		String[] sebuidx = req.getParameterValues("sebuIdx");
		String courseidx = req.getParameter("courseIdx");
		
		AdminDAO dao = new AdminDAO();
		
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
