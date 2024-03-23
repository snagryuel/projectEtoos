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
        TeacherDAO dao = new TeacherDAO();
        System.out.println(keyword+", "+bbs);
        
        List<TeacherDTO> searchResults1 = dao.getTeacherList(keyword, bbs);
        List<TeacherDTO> searchResults2 = dao.getNoticeList(keyword, bbs);
        List<TeacherDTO> searchResults3 = dao.getCourseList(keyword, bbs);
        
        req.setAttribute("bbs", bbs);
        req.setAttribute("keyword", keyword);
        req.setAttribute("searchResults1", searchResults1);
        req.setAttribute("searchResults2", searchResults2);
        req.setAttribute("searchResults3", searchResults3);
        req.getRequestDispatcher("/search/SearchMainResult.jsp").forward(req, resp);
    }
}
