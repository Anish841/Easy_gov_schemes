<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="Commons.SchemeVO"%>
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
	function showHideUpdateForm(i)
	{
		
		$('.version'+i).toggle();
		
		//document.getElementById('version'+i).style="display:block;";
	}
		function submitToUpload(){
			var flag= confirm("Do you really want to upload that scheme?")
		    if(flag){
		    	document.uploadForm.action="CentralController";
				document.getElementById('uploadForm').submit();
		    }
		}
		function openUpdateForm(sid,schemaName,eligibility,objec,doc,url){
			//alert("sid==>"+sid);
			document.updateForm.sidUpdate.value=sid;
			document.updateForm.snameUpdate.value=schemaName;
			document.updateForm.objectiveUpdate.value=objec;
			document.updateForm.eligibilityUpdate.value=eligibility;
			document.updateForm.documentUpdate.value=doc;
			document.updateForm.urlUpdate.value=url;
			$('#updateDIV').show();
			//document.getElementById("updateDIV").style="display:block;";			
		}
		function updateSchemes(){
			document.updateForm.action="CentralController";
			document.getElementById('updateForm').submit();
			
		}
	
	</script>
    </head>

    <body>
 			<%String responseUploadMessage=(String)request.getAttribute("responseMessage");%>
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
                                <a class="brand" href="index.html">Andia - a super cool design agency...</a>
                            </h1>
                            <div class="nav-collapse collapse">
                                <ul class="nav pull-right">
                                    <li>
                                        <a href="HomePage.jsp"><i class="icon-home"></i><br />Home</a>
                                    </li>
                                    <li >
                                    	 <a href="UploadScheme.jsp"><i class="icon-camera"></i><br />Upload Scheme</a>
                                     </li>
                                    <li class="current-page">
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
        <!-- Page Title -->
        <div class="page-title">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <i class="icon-envelope-alt page-title-icon"></i>
                        <h2>Update/Validate Schemes</h2>
							<br>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fill the fields below to add scheme</p>
                        
                   	<p style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(responseUploadMessage!=null){%><%=responseUploadMessage%><%} %></p>
                    </div>
                </div>
            </div>
        </div>
       <div class="contact-us container">
            <div class="row">
                <div class="contact-form span7"><%--left panel --%>
                	<%ProjDAO p=new ProjDAO();
                		ArrayList schemList=p.getAllSchemeList();
                		System.out.println("schem lst size===>"+schemList.size());
                		for(int i=0;i<schemList.size();i++){
                			HashMap h=(HashMap)schemList.get(i);
                			int count=0;
                			Iterator i1=h.keySet().iterator();
                			while(i1.hasNext()){
                				String sid=(String)i1.next();
                				SchemeVO schemeInfo=(SchemeVO)h.get(sid);
                				System.out.println("vaue if count==>"+count);
                				if(count++==0){
                					
                	%>
                	
                      <fieldset>
                      	<legend><%=(schemeInfo!=null && schemeInfo.getSchemeName()!=null)?schemeInfo.getSchemeName():""%></legend>
								<b>Category:</b><%=(schemeInfo!=null && schemeInfo.getCategory()!=null)?schemeInfo.getCategory():""%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<b>Objective:</b><%=(schemeInfo!=null && schemeInfo.getObjective()!=null)?schemeInfo.getObjective():""%><br/>
                        		<b>Validate Count:</b> <%=(schemeInfo!=null && schemeInfo.getValidateCount()!=null)?schemeInfo.getValidateCount():"0"%><br>
                        		<a href="#" onclick="javascript:openUpdateForm('<%=schemeInfo.getsID()%>','<%=schemeInfo.getSchemeName() %>','<%=schemeInfo.getEligibility()%>','<%=schemeInfo.getObjective()%>','<%=schemeInfo.getDocuments()%>','<%=schemeInfo.getUrl()%>')">Update Detail</a>
                        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="show"<%= i%> onclick="javascript:showHideUpdateForm('<%=i%>')">Show/Hide Previous versions</a>
                        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="updateVotes.jsp?SID=<%=schemeInfo.getsID()%>&Vote='p1'">validate</a>
                        		
                        		<%}else{%>
                        		 <div class="version<%= i%>" style="display:none">
                        		 <table style="margin: 30px;" border="1">
                        		 	<tr><td colspan="2"><b><%=schemeInfo.getSchemeName() %></b></td></tr>
                        		 	<tr><td>Category:</td><td><%=(schemeInfo!=null && schemeInfo.getCategory()!=null)?schemeInfo.getCategory():""%></td></tr>
                        		 	<tr><td>Validate Count:</td><td><%=(schemeInfo!=null && schemeInfo.getValidateCount()!=null)?schemeInfo.getValidateCount():"0"%></td></tr>
                        		 	<tr><td colspan="2"><a href="updateVotes.jsp?SID=<%=schemeInfo.getsID()%>&Vote='p1'">validate</a></td></tr>
                        		 	<tr></tr>
                        		 </table></div>
                        		<%} %>
                        		
                        
                      
                      </fieldset>
                      <%}} %>
                </div>
                <div class="contact-address span5"><%--right panel --%>
                
                       <div id="updateDIV" style="display:none;">
                       <form id="updateForm" name="updateForm" method="post">
                       <input type="hidden" name="actionType" value="updateSchemes"/>
						<fieldset>
							<legend>Scheme Info:</legend>
								<label for="Name" >Scheme Name: <font color=#FF0000>*</font></label>
								<input id="snameUpdate" type="text" name="snameUpdate"/>
                        		<label for="eligibilityUpdate" >Eligibility:</label>
								<textarea name="eligibilityUpdate" cols="25" rows="3"></textarea>
								<label for="objectiveUpdate" >Objective:</label>
								<textarea name="objectiveUpdate" cols="25" rows="3"></textarea>
								<label for="documentUpdate" >Document:</label>
								<textarea name="documentUpdate" cols="25" rows="3"></textarea>
								<label for="url" >URL: <font color=#FF0000>*</font></label>
								<input id="urlUpdate" type="text" name="urlUpdate"/>
								<input type="hidden" name="sidUpdate" value="sidUpdate"/>
								<input type="button" value="Update" name="updateButton" onclick="javascript:updateSchemes()"/>
                        		
						</fieldset>
						</form>
						</div>
                </div>
                
            </div>
        </div>





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
