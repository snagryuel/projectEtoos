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
import java.util.List;

import org.apache.tomcat.jakartaee.commons.lang3.StringUtils;

import board.CourseDAO;
import board.CourseDTO;

@WebServlet(urlPatterns = {"/user/CourseList_teacher.do", "/user/CourseList_course.do"})
public class CourseViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (session.getAttribute("id") != null) ? (String) session.getAttribute("id") : "";
		
		// 조회할 INDEX
		String courseIdx = req.getParameter("courseIdx");
		
		// 현재 페이지, 검색 결과 등 저장한거 갖고와 놓기
		String pageSelected = req.getParameter("pageSelected");
		String sub1 = req.getParameter("sub1");
		String sub2 = req.getParameter("sub2");
		String sub3 = req.getParameter("sub3");
		
		// 전달할 쿼리 스트링 만들기
		String queryString = "courseIdx=" + courseIdx + "&pageSelected=" + pageSelected + "&sub1=" + sub1 + "&sub2=" + sub2 + "&sub3=" + sub3;
		
		// 세부 화면 데이터 가져오기
		CourseDAO dao = new CourseDAO();
		CourseDTO dto = dao.getDetail(courseIdx, id);
		
		// 세부 코스 데이터 가져오기
		List<CourseDTO> sebulist = dao.getCourseSebu(courseIdx);
		dao.Close();
		
		// 보낼 값 저장
		req.setAttribute("viewList", dto);
		req.setAttribute("sebulist", sebulist);
		
		// 들어온 URL에 따라 처리
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf("/") + 1);
		String commandStr = uri.substring(uri.indexOf("/"));
		
		if (commandStr.equals("/user/CourseList_teacher.do")) {
			// 선생님 정보 가져오기
			String teacherId = req.getParameter("teacherId");
			MemberDAO tdao = new MemberDAO();
			MemberDTO teacherInfo = tdao.getMemberInfo(teacherId);
			String filePath = tdao.getFile(teacherInfo.getFileidx());
			tdao.Close();
			req.setAttribute("teacherInfo", teacherInfo);
			req.setAttribute("filePath", filePath);
			req.getRequestDispatcher("teacherDetailCourse.jsp?"+queryString+"&menuGubun=teacher").forward(req, resp);
		} else if (commandStr.equals("/user/CourseList_course.do")) {
			req.getRequestDispatcher("teacherDetailCourse.jsp?"+queryString+"&menuGubun=course").forward(req, resp);
		}
		
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
