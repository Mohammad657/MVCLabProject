package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Users;

@WebServlet("/Controller")
public class LoginController extends HttpServlet {
	
	RequestDispatcher rd;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("un");
		String password = req.getParameter("pass");

		Users uOBJ = new Users();
		uOBJ.setUserName(name);
		uOBJ.setPassword(password);
		req.setAttribute("a", uOBJ);

		try {

			if (name.equals(null) || name.equals("")) {
				throw new Exception();

			}
			else if (name.equals("admin")) {
				req.setAttribute("na", name);
				rd = req.getRequestDispatcher("/WEB-INF/view/adminPage.jsp");
				rd.forward(req, resp);
			}
			else if (name.equals("coach")) {
				req.setAttribute("nc", name);
				rd = req.getRequestDispatcher("/WEB-INF/view/coachPage.jsp");
				rd.forward(req, resp);
			}
			else {
				throw new Exception();
			}

		} catch (Exception e) {
			rd = req.getRequestDispatcher("/WEB-INF/view/errorPage.jsp");
			rd.forward(req, resp);
			
		}

	}
}
