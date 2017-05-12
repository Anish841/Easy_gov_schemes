<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="databaseManager.ProjDAO" %>
<%@page  import="java.util.ArrayList" %>
<%@page import="Commons.DropDownVO" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <title>Upload Scheme</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Sans">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/prettyPhoto/css/prettyPhoto.css">
        <link rel="stylesheet" href="assets/css/flexslider.css">
        <link rel="stylesheet" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
	<script type="text/javascript">
		function submitToUpload(){
			var emailID=document.getElementById('emailID').value;
			var atpos=emailID.indexOf("@");
			var dotpos=emailID.lastIndexOf(".");
			var sname=document.getElementById('name').value;
			var pname=document.getElementById('pname').value;
			var obj=document.getElementById('obj').value;
			if (sname=="" || sname==" " || sname==null)
			{
				alert("Please enter the name of scheme");
				return false;
			}
			if (obj=="" || obj==" " || obj==null)
			{
				alert("Please enter objective");
				return false;
			}
			if (pname=="" || pname==" " || pname==null)
			{
				alert("Please enter the name of person");
				return false;
			}
			
			if(emailID=="" || emailID==" " || emailID==null){
				alert("Please enter email ID");
				return false;
			}
			if (atpos<1 || dotpos<atpos+2 || dotpos+2>=emailID.length)
			  {
				alert("Please enter valid e-mail address");
				return false;
			 }
			var flag= confirm("Do you really want to upload that scheme?")
		    if(flag){
		    	
		    	document.uploadForm.action="CentralController";
				document.getElementById('uploadForm').submit();
		    }
		}
	
	</script>
    </head>

    <body>

        <!-- Header -->
        <div class="container">
            <div class="header row">
                <div class="span12">
                    <div class="navbar">
                        <div class="navbar-inner">
                            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </a>
                            <h1>
                                <a class="brand" href="HomePage.jsp"></a>
                            </h1>
                            <div class="nav-collapse collapse">
                                <ul class="nav pull-right">
                                    <li>
                                        <a href="HomePage.jsp"><i class="icon-home"></i><br />Home</a>
                                    </li>
                                    <li class="current-page">
                                    	 <a href="UploadScheme.jsp"><i class="icon-camera"></i><br />Upload Scheme</a>
                                     </li>
                                     <li>
                                        <a href="update.jsp"><i class="icon-comments"></i><br />Search/Update/Validate Scheme</a>
                                    </li>
                                  
                                    <li>
                                        <a href="about.jsp"><i class="icon-user"></i><br />About</a>
                                    </li>
                                    <li>
                                        <a href="contact.jsp"><i class="icon-envelope-alt"></i><br />Contact</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<%
		ProjDAO dropDownValues=new ProjDAO();
	   ArrayList dropDownList=dropDownValues.getDropDownValues();
	   String responseUploadMessage=(String)request.getAttribute("responseMessage");
	%>
        <!-- Page Title -->
        <div class="page-title">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <i class="icon-envelope-alt page-title-icon"></i>
                        <h2>Add New Scheme</h2>
							<br>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fill the fields below to add scheme</p>
                   	<p style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(responseUploadMessage!=null){%><%=responseUploadMessage%><%} %></p>
                  
                    </div>
                </div>
            </div>
        </div>
	
	
        <!-- Contact Us -->
    <form method="post" action="" name="uploadForm" id="uploadForm">
    	<input type="hidden" name="actionType" value="upload">
        <div class="contact-us container">
            <div class="row">
                <div class="contact-form span7"><%--left panel --%>
                        <label for="name" class="nameLabel">Name <font color=#FF0000>*</font></label>
						<input id="name" type="text" name="sname" placeholder="Enter the name for scheme..." />
                        <label for="department" class="departmentLabel">Department</label>
                        <select name="deptName">
                        	<%if(dropDownList!=null && dropDownList.size()>0){ 
                        		for(int i=0;i<dropDownList.size();i++){
                        			DropDownVO dropvo=(DropDownVO)dropDownList.get(i);
                        	%>
                        	 	<%if(dropvo!=null && dropvo.getAttFlag().equalsIgnoreCase("dept")){%><option><%=dropvo.getAttName() %></option><%} %>
                        	 <%} }%>
                        </select>
                        <label for="initiation" class="initiationLabel">Initiation</label>
                        <textarea name="initiation" cols="25" rows="5"></textarea>
                        <label for="eligibility" class="eligibilityLabel">Eligibility</label>
                        <textarea name="eligibility" cols="25" rows="5"></textarea>
                        <label for="documents" class="documentsLabel">Documents</label>
                        <textarea name="documents" cols="25" rows="5"></textarea>
                        <label for="additionalcondition" class="documentsLabel">Additional Condition</label>
                        <textarea name="additionalcondition" cols="25" rows="5"></textarea>
                        <label for="category" class="categoryLabel">Category</label>   
                        <select name="category">
                            <%if(dropDownList!=null && dropDownList.size()>0){ 
                        		for(int i=0;i<dropDownList.size();i++){
                        			DropDownVO dropvo=(DropDownVO)dropDownList.get(i);
                        	%>
                        	 	<%if(dropvo!=null && dropvo.getAttFlag().equalsIgnoreCase("category")){%><option><%=dropvo.getAttName() %></option><%} %>
                        	 <%} }%>
                        </select> 
                        <label for="bpl" class="bplLabel">BPL</label> 
                        <select name="bpl">
	                        <option>Yes</option>
	                        <option>No</option>
                        </select>
                        <label for="minage" class="bplLabel">Minimum-age</label> 
                        <select name="minAge">
                        <%for(int i=1;i<=100;i++){ %>
                        	<option><%=i %></option>
                        <%} %>
                        </select>
                        <label for="gender" class="genderLabel">Gender</label>
                        <select>
                        <%if(dropDownList!=null && dropDownList.size()>0){ 
                        		for(int i=0;i<dropDownList.size();i++){
                        			DropDownVO dropvo=(DropDownVO)dropDownList.get(i);
                        	%>
                        	 	<%if(dropvo!=null && dropvo.getAttFlag().equalsIgnoreCase("gender")){%><option><%=dropvo.getAttName() %></option><%} %>
                        	 <%} }%>
                        </select>
                        <label for="occupation" >occupation</label>
                         <textarea name="occupation" cols="25" rows="5"></textarea>
                        <label for="calamity" >calamity</label>
                         <textarea name="calamity" cols="25" rows="5"></textarea>
                        <label for="lossoflife" >Loss of life</label>
						 	<select name="lossoflife">
						 		<option>Yes</option>
						 		<option>No</option>
						 	</select>
                        <br>               
                      <button type="button" onClick="javascript:submitToUpload();" >Upload</button>
                </div>
                <div class="contact-address span5"><%--right panel --%>
                
                        <label for="funding" class="fundingLabel">Funding</label>
                        <select name="fund">
                         <%if(dropDownList!=null && dropDownList.size()>0){ 
                        		for(int i=0;i<dropDownList.size();i++){
                        			DropDownVO dropvo=(DropDownVO)dropDownList.get(i);
                        	%>
                        	 	<%if(dropvo!=null && dropvo.getAttFlag().equalsIgnoreCase("fund")){%><option><%=dropvo.getAttName() %></option><%} %>
                        	 <%} }%>
                        </select>
						<label for="focus" class="focusLabel">Focus</label>
                        <textarea name="focus" cols="25" rows="5"></textarea>
                        <label for="objective" class="objectiveLabel">Objective <font color=#FF0000>*</font></label>
                        <textarea name="objective" cols="25" rows="5" id="obj"></textarea>
                        <label for="registration" class="registrationLabel">Registration</label>
                        <textarea name="registration" cols="25" rows="5"></textarea>
                        <label for="benefit" class="benefitLabel">Benefit</label>
                        <textarea name="benefit" cols="25" rows="5"></textarea>                       
                        <label for="url" class="urlLabel">Url</label>
                        <textarea name="url" cols="25" rows="5"></textarea>
                        <label for="caste" class="casteLabel">Caste</label>
                        <select name="caste">
                            <%if(dropDownList!=null && dropDownList.size()>0){ 
                        		for(int i=0;i<dropDownList.size();i++){
                        			DropDownVO dropvo=(DropDownVO)dropDownList.get(i);
                        	%>
                        	 	<%if(dropvo!=null && dropvo.getAttFlag().equalsIgnoreCase("caste")){%><option><%=dropvo.getAttName() %></option><%} %>
                        	 <%} }%>
                        </select>
                        <label for="maxage" class="bplLabel">Maximum-age</label>
                        <select name="maxAge">
                        <%for(int i=1;i<=100;i++){ %>
                        	<option><%=i %></option>
                        <%} %>
                        </select>
                        <label for="income" class="incomeLabel">Income</label>
                         <select name="income">
                            <%if(dropDownList!=null && dropDownList.size()>0){ 
                        		for(int i=0;i<dropDownList.size();i++){
                        			DropDownVO dropvo=(DropDownVO)dropDownList.get(i);
                        	%>
                        	 	<%if(dropvo!=null && dropvo.getAttFlag().equalsIgnoreCase("income")){%><option><%=dropvo.getAttName() %></option><%} %>
                        	 <%} }%>
                        </select>
                        <label for="geography" >geography</label>
                           <select name="geography">
                            <%if(dropDownList!=null && dropDownList.size()>0){ 
                        		for(int i=0;i<dropDownList.size();i++){
                        			DropDownVO dropvo=(DropDownVO)dropDownList.get(i);
                        	%>
                        	 	<%if(dropvo!=null && dropvo.getAttFlag().equalsIgnoreCase("geography")){%><option><%=dropvo.getAttName() %></option><%} %>
                        	 <%} }%>
                        </select>
                        <label for="disability" >disability</label>                     
						<select name="disability">
							<option>Yes</option>
							<option>No</option>
						</select>
						
						<fieldset>
							<legend>Personal Info:</legend>
								<label for="Name" >Your Name: <font color=#FF0000>*</font></label>
								<input id="pname" type="text" name="uname" placeholder="Enter Your Name..." />
                        		<label for="emailID" >Email ID:</label>
								<input id="emailID" type="text" name="emailID" placeholder="Enter Your Email ID..." />
						</fieldset>
                </div>
                
            </div>
        </div>
</form>
        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="widget span3">
                        <h4>About Us</h4>
                        <p>Text.</p>
                        <p><a href="about.jsp">Read more...</a></p>
                    </div>
                    <div class="widget span3">
                        <h4>Latest Tweets</h4>
                        <div class="show-tweets"></div>
                    </div>
                    <div class="widget span3">
                        <h4>Flickr Photos</h4>
                        <ul class="flickr-feed"></ul>
                    </div>
                    <div class="widget span3">
                        <h4>Contact Us</h4>
                        <p><i class="icon-map-marker"></i> Address: Bangalore</p>
                        <p><i class="icon-phone"></i> Phone: 0011223344</p>
                        <p><i class="icon-user"></i> Skype: dummy</p>
                        <p><i class="icon-envelope-alt"></i> Email: <a href="">dummy@gmail.com</a></p>
                    </div>
                </div>
                <div class="footer-border"></div>
                <div class="row">
                    <div class="copyright span4">
                        <p>Copyright 2014 - All rights reserved.</p>
                    </div>
                    <div class="social span8">
                        <a class="facebook" href=""></a>
                        <a class="dribbble" href=""></a>
                        <a class="twitter" href=""></a>
                        <a class="pinterest" href=""></a>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.flexslider.js"></script>
        <script src="assets/js/jquery.tweet.js"></script>
        <script src="assets/js/jflickrfeed.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="assets/js/jquery.ui.map.min.js"></script>
        <script src="assets/js/jquery.quicksand.js"></script>
        <script src="assets/prettyPhoto/js/jquery.prettyPhoto.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>
