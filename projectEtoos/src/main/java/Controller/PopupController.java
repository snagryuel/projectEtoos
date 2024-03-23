package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/user/AuthChekPopup.do", "/user/SamplePopup.do"})
public class PopupController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 들어온 URL에 따라 처리
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf("/") + 1);
		String commandStr = uri.substring(uri.indexOf("/"));
		
		if (commandStr.equals("/user/AuthChekPopup.do")) {
			req.getRequestDispatcher("/user/authCheckPop.jsp").forward(req, resp);
		} else if (commandStr.equals("/user/SamplePopup.do")) {
			req.getRequestDispatcher("/user/samplePop.jsp?courseIdx="+req.getParameter("courseIdx")).forward(req, resp);
		}
		
		
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	} 

}
