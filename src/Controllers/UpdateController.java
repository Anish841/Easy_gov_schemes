package Controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseManager.ProjDAO;

import Commons.SchemeVO;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/UpdateController")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SchemeVO schemeInfo=new SchemeVO();
		schemeInfo.setsID(request.getParameter("sidUpdate"));
		schemeInfo.setSchemeName(request.getParameter("snameUpdate"));
		schemeInfo.setObjective(request.getParameter("objectiveUpdate"));
		schemeInfo.setEligibility(request.getParameter("eligibilityUpdate"));
		schemeInfo.setDocuments(request.getParameter("documentUpdate"));
		schemeInfo.setUrl(request.getParameter("urlUpdate"));
		ProjDAO p=new ProjDAO();
		boolean check=p.updateScheme(schemeInfo);
		String responseMessage="";
		if(check){
			responseMessage="Successfully updated.";
		}else{
			responseMessage="Some error occurred.";
		}
		request.setAttribute("responseMessage", responseMessage);
		RequestDispatcher rd=request.getRequestDispatcher("update.jsp");
		rd.forward(request, response);
	}

}
