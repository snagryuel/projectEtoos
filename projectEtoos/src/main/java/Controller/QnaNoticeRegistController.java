package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import board.QnaDAO;
import board.QnaDTO;

@WebServlet("/user/qnaNewNotice.do")
public class QnaNoticeRegistController extends HttpServlet {
    private static final long serialVersionUID = 1L;
      
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	//String id = req.getParameter("id");
        String title = req.getParameter("title");
        String contents = req.getParameter("contents");
      
        
        QnaDTO dto = new QnaDTO();
        //dto.setId(id);
        dto.setTitle(title);
        dto.setContents(contents);
       

        QnaDAO dao = new QnaDAO();
        int result = dao.qnaNoticeRegist(dto);
        dao.close();
        System.out.println("aaaaaaa" );
        System.out.println("ddaatttoo:"+ dto);
        
        if (result > 0) {
        	System.out.println("result > 0" );
        	resp.sendRedirect(req.getContextPath() + "/user/teacherQnaMain.do");
      
        } else {
        	System.out.println("result < 0" );
            req.getRequestDispatcher("/user/qnaNewNotice.jsp").forward(req, resp);
           
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp); 
    }
}



