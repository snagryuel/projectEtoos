package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.QnaDAO;
import board.QnaDTO;
import common.PageUtil;

@WebServlet("/user/teacherQnaMain.do")
public class QnaMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		int totalCount = 0;
		int pageNo = 1;
		int pageSize = 10;
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		
		  String searchCategory = req.getParameter("searchCategory"); 
		  String searchWord = req.getParameter("searchWord"); pageNo = (req.getParameter("pageNo")!=null
		  ? Integer.parseInt(req.getParameter("pageNo")) : 1);
		  
		  //검색 파라미터 설정 
		  if( searchWord != null && !searchWord.isEmpty() 
				  && searchCategory != null && !searchCategory.isEmpty()) {
		  params.put("searchCategory", searchCategory); 
		  params.put("searchWord", searchWord); 
		  }
		 
		 
		
		//게시판 테이블 조회
		QnaDAO dao = new QnaDAO();
		List<QnaDTO> noticeList = dao.noticeList(params);
		List<QnaDTO> qnaList = dao.qnaList(params);
		
		
		
		// 들어온 URL에 따라 처리
		String uri = req.getRequestURI();
		String commandStr = uri.substring(uri.lastIndexOf("/") + 1);
		
		System.out.println(uri);
		
		int pageSelected = req.getParameter("pageSelected")==null? 1 : Integer.parseInt(req.getParameter("pageSelected"));
		String id = session.getAttribute("id") != null? (String)session.getAttribute("id") : "";
		
		String queryString = "id=" + id;
		
		QnaDAO dao2 = new QnaDAO() ;
		
		totalCount = dao2.totalCount(id);
		System.out.println("totalCount : " + totalCount);
		int totalPage =  (int) Math.ceil((double)totalCount / 10);
		System.out.println("totalPage : " + totalPage);
		dao2.close();
		
		//페이징
		String page = PageUtil.makePageNumber(totalPage, pageSelected, uri, queryString);
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("qnaList", qnaList);
		req.setAttribute("params", params);
		req.getRequestDispatcher("teacherQnaMain.jsp").forward(req, resp);
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
