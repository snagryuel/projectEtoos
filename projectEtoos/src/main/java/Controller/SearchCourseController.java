package Controller;

import java.util.List;
import java.io.IOException;
import board.TeacherDAO;
import board.TeacherDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/search/searchMain.do")

public class SearchCourseController extends HttpServlet {
    public SearchCourseController() {}
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String bbs = req.getParameter("bbs") == null?"":req.getParameter("bbs");
        String keyword = req.getParameter("search_word");
        
        int pageNumber = 1;
        
        String pageParam = req.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                pageNumber = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                e.printStackTrace(); 
            }
        }
            
        
        TeacherDAO dao = new TeacherDAO();
        int totalResults1 = dao.getTotalResultCount_course(keyword, bbs);
        int totalResults2 = dao.getTotalResultCount_notice(keyword, bbs);

        int resultsPerPage = 6; // 한 페이지에 표시할 결과 수
        int totalPagesCourse = (int) Math.ceil((double) totalResults1 / resultsPerPage); 
        int totalPagesQna = (int) Math.ceil((double) totalResults2 / resultsPerPage);

 
        System.out.println(keyword+", "+bbs);
        
        List<TeacherDTO> searchResults1 = dao.getTeacherList(keyword, bbs); 
        List<TeacherDTO> searchResults2 = dao.getNoticeList(keyword, bbs, pageNumber);
        List<TeacherDTO> searchResults3 = dao.getCourseList(keyword, bbs, pageNumber);
        int searchResults4	= dao.getTotalResultCount(keyword, bbs); // 검색 총 개수
        int searchResults5	= dao.getTotalResultCount_course(keyword, bbs); // 검색 강좌 총 개수
        int searchResults6	= dao.getTotalResultCount_notice(keyword, bbs); // 검색 공지 총 개수
        int searchResults7  = dao.getTotalResultCount_teacher(keyword, bbs);  // 검색 강사 총 개수
        
        
        req.setAttribute("bbs", bbs);
        req.setAttribute("keyword", keyword);
        req.setAttribute("searchResults1", searchResults1);
        req.setAttribute("searchResults2", searchResults2);
        req.setAttribute("searchResults3", searchResults3);
        req.setAttribute("searchResults4", searchResults4);
        req.setAttribute("searchResults5", searchResults5);
        req.setAttribute("searchResults6", searchResults6);
        req.setAttribute("searchResults7", searchResults7);

        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("totalPagesCourse", totalPagesCourse);
        req.setAttribute("totalPagesQna", totalPagesQna);
        req.getRequestDispatcher("/search/SearchMainResult.jsp").forward(req, resp);
    }
}
