package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/FindYourInfo.do")
public class FindInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String step = (req.getParameter("step") != null) ? req.getParameter("step") : "1";
		String flag = (req.getParameter("flag") != null) ? req.getParameter("flag") : "";
		
		if (step.equals("1")) {
			req.getRequestDispatcher("/user/findAccount.jsp").forward(req, resp);
		} else if (step.equals("2") && flag.equals("id")) {
			req.getRequestDispatcher("/user/findIdPage.jsp").forward(req, resp);
		} else if (step.equals("2") && flag.equals("pwd")) {
			req.getRequestDispatcher("/user/findPwdPage.jsp").forward(req, resp);
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
