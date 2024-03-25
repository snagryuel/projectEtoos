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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.AdminDAO;
import admin.AdminDTO;
import board.CourseDAO;
import common.PageUtil;

@WebServlet(urlPatterns = {"/user/TeacherList.do", "/user/TeacherDetailList.do"})
public class TeacherController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String queryString = req.getQueryString();
		
		// 들어온 URL에 따라 처리
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf("/") + 1);
		String commandStr = uri.substring(uri.indexOf("/"));
		// 본인 정보 가져오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id")==null? "" : (String) session.getAttribute("id");
		if (commandStr.equals("/user/TeacherList.do")) {
			AdminDAO dao = new AdminDAO();
			List<String> sub1List = dao.getSub();
			Map<String, List<String>> sub2List = new HashMap<String, List<String>>();
			
			Map<String, List<AdminDTO>> teacherList = new HashMap<String, List<AdminDTO>>();
			
			for (String sub1 : sub1List) {
				sub2List.put(sub1, dao.getSub2(sub1));
			}
			for (String sub1 : sub2List.keySet()) {
				for(String sub2 : sub2List.get(sub1)) {
					teacherList.put(sub1 + "-" + sub2, dao.getteacher(sub1, sub2));
				}
			}
			req.setAttribute("sub1List", sub1List);
			req.setAttribute("sub2List", sub2List);
			req.setAttribute("teacherList", teacherList);
			req.getRequestDispatcher("/user/teacherList.jsp").forward(req, resp);
		} else if (commandStr.equals("/user/TeacherDetailList.do")) {
			
			// 선생님 정보 가져오기
			String teacherId = req.getParameter("teacherId");
			MemberDAO dao = new MemberDAO();
			MemberDTO teacherInfo = dao.getMemberInfo(teacherId);
			String filePath = dao.getFile(teacherInfo.getFileidx());
			dao.Close();
			req.setAttribute("teacherInfo", teacherInfo);
			req.setAttribute("filePath", filePath);
			
			// 리스트 뿌리기
			int pageSelected = req.getParameter("pageSelected")==null? 1 : Integer.parseInt(req.getParameter("pageSelected"));
			int starNo = (pageSelected*10)-10;
			String courseName = (req.getParameter("courseName") == null)? "" : req.getParameter("courseName");
			System.out.println("코스네임 : " + courseName);
			
			// DB 데이터 가져오기
			AdminDAO dao2 = new AdminDAO();
			// 리스트 가져오기
			List<AdminDTO> courseList = dao2.CourseInfo(courseName, starNo, id, teacherId);
			System.out.println(courseList);
			dao2.Close();
			CourseDAO dao3 = new CourseDAO();
			int totalCount = dao3.totalCount(courseName, teacherId);
			dao3.Close();
			int totalPage =  (int) Math.ceil((double)totalCount / 10);
			// 페이징 만들기
			String page = PageUtil.makePageNumber(totalPage, pageSelected, uri.substring(uri.lastIndexOf("/")+1), queryString);
			// 값 보내기
			req.setAttribute("courseList", courseList);
			req.setAttribute("totalCount", totalCount);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			req.getRequestDispatcher("/user/teacherDetailList.jsp?"+queryString).forward(req, resp);
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
