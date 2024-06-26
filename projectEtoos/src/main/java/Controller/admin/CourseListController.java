package Controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import admin.AdminDAO;
import admin.AdminDTO;
import board.CourseDAO;
import common.PageUtil;

@WebServlet(urlPatterns = {"/admin/courseList.do", "/user/courseList.do"})
public class CourseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		// 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (session.getAttribute("id") != null) ? (String) session.getAttribute("id") : "";
		
		// 들어온 URL에 따라 처리
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf("/") + 1);
		String commandStr = uri.substring(uri.indexOf("/"));
		String pagesel = req.getParameter("pageSelected");
				
		int pageSelected = Integer.parseInt(pagesel==null||pagesel.equals("null")? "1" : pagesel);
		String sub1 = req.getParameter("sub1")==null?"":req.getParameter("sub1");
		String sub2 = req.getParameter("sub2")==null?"":req.getParameter("sub2");
		String sub3 = req.getParameter("sub3")==null?"":req.getParameter("sub3");
		
		String queryString = "sub1=" + sub1 + "&sub2=" + sub2 + "&sub3=" + sub3;
		
		// 시작 페이지
		int starNo = (pageSelected*10)-10;
		
		// DB 데이터 가져오기
		AdminDAO dao = new AdminDAO();
		// 리스트 가져오기
		List<AdminDTO> courseList = dao.CourseInfo(sub1, sub2, sub3, starNo, id	);
		// 과목 가져오기
		List<String> SubList1 = dao.getSub();
		List<String> SubList2 = dao.getSub2(sub1);
		// 선생님 장보 가져오기
		List<AdminDTO> teacherList = dao.getteacher(sub1, sub2);
		dao.Close();
		
		CourseDAO dao2 = new CourseDAO() ;
		
		int totalCount = dao2.totalCount(sub1, sub2, sub3);
		int totalPage =  (int) Math.ceil((double)totalCount / 10);
		dao2.Close();
		
		// 페이징 만들기
		String page = PageUtil.makePageNumber(totalPage, pageSelected, uri.substring(uri.lastIndexOf("/")+1), queryString);
		
		req.setAttribute("courseList", courseList);
		req.setAttribute("SubList1", SubList1);
		req.setAttribute("SubList2", SubList2);
		req.setAttribute("teacherList", teacherList);
		req.setAttribute("sub1", sub1);
		req.setAttribute("sub2", sub2);
		req.setAttribute("sub3", sub3);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("uri", commandStr);
		req.setAttribute("page", page);

		if (commandStr.equals("/admin/courseList.do")) {
			req.getRequestDispatcher("/admin/courseList.jsp?"+queryString).forward(req, resp);
		} else if (commandStr.equals("/user/courseList.do")) {
			req.getRequestDispatcher("/user/courseList.jsp?"+queryString).forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
