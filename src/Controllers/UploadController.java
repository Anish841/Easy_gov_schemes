package Controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseManager.ProjDAO;

import Commons.PersonVO;
import Commons.SchemeVO;

/**
 * Servlet implementation class UploadController
 */
@WebServlet("/UploadController")
public class UploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadController() {
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
		
		response.setContentType("text/html");
		SchemeVO schemeInfo=new SchemeVO();
		PersonVO personInfo=new PersonVO();
		schemeInfo.setSchemeName(request.getParameter("sname"));
		schemeInfo.setFundFrom(request.getParameter("fund"));
		schemeInfo.setDepartnment(request.getParameter("deptName"));
		schemeInfo.setFocus(request.getParameter("focus"));
		schemeInfo.setInitiation(request.getParameter("initiation"));
		schemeInfo.setObjective(request.getParameter("objective"));
		schemeInfo.setEligibility(request.getParameter("eligibility"));
		schemeInfo.setRegistration(request.getParameter("registration"));
		schemeInfo.setDocuments(request.getParameter("documents"));
		schemeInfo.setBenefits(request.getParameter("benefit"));
		schemeInfo.setAdditionalCondition(request.getParameter("additionalcondition"));
		schemeInfo.setUrl(request.getParameter("url"));
		schemeInfo.setCategory(request.getParameter("category"));
		
		schemeInfo.setBpl(request.getParameter("bpl"));
		schemeInfo.setCaste(request.getParameter("caste"));
		schemeInfo.setMinAge(request.getParameter("minAge"));
		schemeInfo.setMaxAge(request.getParameter("maxAge"));
		schemeInfo.setMartialStatus(request.getParameter("marital"));
		schemeInfo.setGender(request.getParameter("gender"));
		schemeInfo.setIncome(request.getParameter("income"));
		schemeInfo.setOccupation(request.getParameter("occupation"));
		schemeInfo.setGeography(request.getParameter("geography"));
		schemeInfo.setCalamity(request.getParameter("calamity"));
		schemeInfo.setDisability(request.getParameter("disability"));
		schemeInfo.setLossOfLife(request.getParameter("lossoflife"));
		
		personInfo.setpName(request.getParameter("uname"));
		personInfo.setEmailID(request.getParameter("emailID"));
		
		ProjDAO insertScheme=new ProjDAO();
		boolean n=insertScheme.insertContactDetails(schemeInfo, personInfo);
		String responseMString="";
		if(n){
			responseMString="Sucessfully Uploaded";
		}else{
			responseMString="Some technical error .Please try again after sometime.";
		}
		RequestDispatcher rd=request.getRequestDispatcher("UploadScheme.jsp");
		request.setAttribute("responseMessage", responseMString);
		rd.forward(request, response);
		
	}

}
