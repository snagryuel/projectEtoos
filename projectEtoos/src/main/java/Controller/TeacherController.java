package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.AdminDAO;
import admin.AdminDTO;

@WebServlet(urlPatterns = {"/user/TeacherList.do", "/user/TeacherDetailList.do"})
public class TeacherController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 들어온 URL에 따라 처리
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf("/") + 1);
		String commandStr = uri.substring(uri.indexOf("/"));
		if (commandStr.equals("/user/TeacherList.do")) {
			AdminDAO dao = new AdminDAO();
			List<String> sub1List = dao.getSub();
			System.out.println("sub1List"+sub1List);
			Map<String, List<String>> sub2List = new HashMap<String, List<String>>();
			
			Map<String, List<AdminDTO>> teacherList = new HashMap<String, List<AdminDTO>>();
			
			for (String sub1 : sub1List) {
				sub2List.put(sub1, dao.getSub2(sub1));
			}
			System.out.println("sub2List"+sub2List);
			for (String sub1 : sub2List.keySet()) {
				for(String sub2 : sub2List.get(sub1)) {
					teacherList.put(sub2, dao.getteacher(sub1, sub2));
				}
			}
			System.out.println("teacherList"+teacherList);
			req.setAttribute("sub1List", sub1List);
			req.setAttribute("sub2List", sub2List);
			req.setAttribute("teacherList", teacherList);
			req.getRequestDispatcher("/user/teacherList.jsp").forward(req, resp);
		} else if (commandStr.equals("/user/TeacherDetailList.do")) {
			
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
