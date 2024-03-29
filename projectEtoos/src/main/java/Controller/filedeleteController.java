package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;

import File.FileDAO;

@WebServlet("/mypage/fileDelete.do")
public class filedeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("넘어온당");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		FileDAO dao = new FileDAO();
		String filepath = dao.getfile(id);
		File file = new File(filepath);
		 file.delete();
		 dao.update(id);
		 response.sendRedirect("MyInfo.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
