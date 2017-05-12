<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.LocatorEx.Snapshot"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page  import="java.util.ArrayList" %>
<%@page import="databaseManager.ProjDAO" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <title>Home Page</title>
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
                                <a class="brand" href="index.html">Andia - a super cool design agency...</a>
                            </h1>
                            <div class="nav-collapse collapse">
                                <ul class="nav pull-right">
                                    <li class="current-page">
                                        <a href="HomePage.jsp"><i class="icon-home"></i><br />Home</a>
                                    </li>
                                    <li>
                                        <a href="UploadScheme.jsp"><i class="icon-camera"></i><br />Upload Scheme</a>
                                    </li>
                                    <li>
                                        <a href="update.jsp"><i class="icon-comments"></i><br />Search/Update/Validate Scheme</a>
                                    </li>
                                    
                                    <li>
                                        <a href="about.jsp"><i class="icon-user"></i><br />About</a>
                                    </li>
                                    <li>
                                        <a href="links.jsp"><i class="icon-envelope-alt"></i><br />Links</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Slider -->
        <div class="slider">
            <div class="container">
                <div class="row">
                    <div class="span10 offset1">
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="assets/img/slider/1.jpg">
                                    <img src="assets/img/slider/1.jpg">
                                    <p class="flex-caption">Karnataka state geographical features</p>
                                </li>
                                <li data-thumb="assets/img/slider/2.jpg">
                                    <img src="assets/img/slider/2.jpg">
                                    <p class="flex-caption">Govt. of Karnataka has introduced &ldquo;Arivu&ldquo; (Education loan) to help the minority students with financial assistance upto Rs.75, 000/- per year till the completion of the course</p>
                                </li>
                                <li data-thumb="assets/img/slider/5.jpg">
                                    <img src="assets/img/slider/5.jpg">
                                    <p class="flex-caption">Navachetana is a scheme for imparting training of unemployed SC youths ; taken up by Govt from the year 1996-97 onwards</p>
                                </li>
                                <li data-thumb="assets/img/slider/6.jpg">
                                    <img src="assets/img/slider/6.jpg">
                                    <p class="flex-caption">YESHASVINI which is a unique Cooperative Health Care Scheme launched for the first time in the world is meant for farmers who are members of the Cooperative Societies</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Site Description -->
        <div class="presentation container">
            <h2>Help us, HELP YOU find your scheme.</h2>
            <p>Contribute your knowledge to help the others and make India a better place to live.</p>
        </div>

        <!-- Services -->
        <div class="what-we-do container">
            <div class="row">
                <div class="service span3">
                    <div class="icon-awesome">
                        <i class="icon-eye-open"></i>
                    </div>
                    <h4>No. Of Policies Entered Till Date</h4>
                    <p>No. Of Policies Entered by citizens of india</p>
                    <h1><%=ProjDAO.getPolicyCount()%></h1>
                </div>
                <div class="service span3">
                    <div class="icon-awesome">
                        <i class="icon-table"></i>
                    </div>
                    <h4>No. Of Policies Verified till date</h4>
                    <p>No. of policies verified by the central admin.</p>
                    <h1>0</h1>
                </div>
                <div class="service span3">
                    <div class="icon-awesome">
                        <i class="icon-magic"></i>
                    </div>
                    <h4>Top Contributor</h4>
                    <p>Name and no. of policies contributed so far</p>
                    <h1><% ArrayList<String> l=ProjDAO.getTopContributor();%>
                    	<%=l.get(1)+":"+l.get(0)%>
                    </h1>
                </div>
                <div class="service span3">
                    <div class="icon-awesome">
                        <i class="icon-print"></i>
                    </div>
                    <h4>Contribute with us.</h4>
                    <p>Help other citiens find the important schemes.</p>
                    <h3><a href="UploadScheme.jsp">Upload Scheme</a></h3>
                </div>
            </div>
        </div>

        <!-- Latest Work -->
        <div class="portfolio container">
            <div class="portfolio-title">
                <h3>Latest Policies</h3>
            </div>
            <%ArrayList list=ProjDAO.getTopFourContributor(); %>
            <div class="row">
                <div class="work span3">
                    <h4><%=list.get(0)%></h4>
                    <p><%=list.get(1)%></p>
                </div>
                <div class="work span3">
                     <h4><%=list.get(2)%></h4>
                    <p><%=list.get(3)%></p>
                </div>
                <div class="work span3">
                    <h4><%=list.get(4)%></h4>
                    <p><%=list.get(5)%></p>
                </div>
                <div class="work span3">
                  <h4><%=list.get(6)%></h4>
                    <p><%=list.get(7)%></p>
                </div>
            </div>
        </div>

        <!-- Testimonials -->
        <div class="testimonials container">
            <div class="testimonials-title">
                <h3>Popular Schemes</h3>
            </div>
            <div class="row">
                <div class="testimonial-list span12">
                    <div class="tabbable tabs-below">
                        <div class="tab-content">
                            <div class="tab-pane active" id="A">
                                <img src="assets/img/testimonials/1.jpg" title="" alt="">
                                <p>"text"<br /><span class="violet">name</span></p>
                            </div>
                            <div class="tab-pane" id="B">
                                <img src="assets/img/testimonials/2.jpg" title="" alt="">
                                <p>"text"<br /><span class="violet">name</span></p>
                            </div>
                            <div class="tab-pane" id="C">
                                <img src="assets/img/testimonials/3.jpg" title="" alt="">
                                <p>"text"<br /><span class="violet">name</span></p>
                            </div>
                            <div class="tab-pane" id="D">
                                <img src="assets/img/testimonials/1.jpg" title="" alt="">
                                <p>"text"<br /><span class="violet">name</span></p>
                            </div>
                        </div>
                       <ul class="nav nav-tabs">
                           <li class="active"><a href="#A" data-toggle="tab"></a></li>
                           <li class=""><a href="#B" data-toggle="tab"></a></li>
                           <li class=""><a href="#C" data-toggle="tab"></a></li>
                           <li class=""><a href="#D" data-toggle="tab"></a></li>
                       </ul>
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
                        <h4>Other Links</h4>
			<p><a href="faq.jsp">FAQ</a></p><p><a href="links.jsp">Useful Links</a></p>
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
