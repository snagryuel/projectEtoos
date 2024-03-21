package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/Join.do")
public class JoinCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gubun = "";
		String step = "0"; 
		
		gubun = (req.getParameter("gubun") != null) ? req.getParameter("gubun") : "";
		step = (req.getParameter("step") != null) ? req.getParameter("step") : "0";
		
		if(step.equals("0")) {
			req.getRequestDispatcher("/user/join.jsp").forward(req, resp);
		} else if (step.equals("1")) {
			req.getRequestDispatcher("/user/joinAgree.jsp?gubun="+gubun).forward(req, resp);
		} else if (step.equals("2")) {
			req.getRequestDispatcher("/user/joinInfoInput.jsp?gubun="+gubun).forward(req, resp);
		}
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
