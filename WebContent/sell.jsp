<%@page import="bean.URLHtml"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="bean.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Make Money - Sell Stocks</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--
Template 2051 Spot Light
http://www.tooplate.com/view/2051-spot-light
-->
<%

String a11="false",a22 ="false";
a11=(String) session.getAttribute("admin");
a22=(String)session.getAttribute("useralive");
if(a11!=null||a22!=null){
if(a11.equalsIgnoreCase("true"))
	{
	response.sendRedirect("adminhome.jsp");
	}
else if(a22.equalsIgnoreCase("false"))
{
response.sendRedirect("index.jsp");
}

}
	%>

<link href="css/tooplate_style.css" rel="stylesheet" type="text/css" />

<!--////// CHOOSE ONE OF THE 3 PIROBOX STYLES  \\\\\\\-->
<link href="css_pirobox/white/style.css" media="screen" title="shadow" rel="stylesheet" type="text/css" />
<!--<link href="css_pirobox/white/style.css" media="screen" title="white" rel="stylesheet" type="text/css" />
<link href="css_pirobox/black/style.css" media="screen" title="black" rel="stylesheet" type="text/css" />-->
<!--////// END  \\\\\\\-->

<!--////// INCLUDE THE JS AND PIROBOX OPTION IN YOUR HEADER  \\\\\\\-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/piroBox.1_2.js"></script>
<script type="text/javascript">



$(document).ready(function() {
$().piroBox({
        my_speed: 600, //animation speed
        bg_alpha: 0.5, //background opacity
        radius: 4, //caption rounded corner
        scrollImage : false, // true == image follows the page, false == image remains in the same open position
        pirobox_next : 'piro_next', // Nav buttons -> piro_next == inside piroBox , piro_next_out == outside piroBox
        pirobox_prev : 'piro_prev',// Nav buttons -> piro_prev == inside piroBox , piro_prev_out == outside piroBox
        close_all : '.piro_close',// add class .piro_overlay(with comma)if you want overlay click close piroBox
        slideShow : 'slideshow', // just delete slideshow between '' if you don't want it.
        slideSpeed : 4 //slideshow duration in seconds(3 to 6 Recommended)
});
});
</script>
<!--////// END  \\\\\\\-->
    
</head>

<body id="subpage">
<div id="tooplate_wrapper">
    <div id="tooplate_header_sp">
        <div id="tooplate_menu">
            <ul>
           
            
                <li><a href="userhome.jsp"><span></span>Home</a></li>
                <li><a href="trade.jsp" class="current"><span></span>Trade</a></li>
                <li><a href="viewport.jsp"><span></span>View Portfolio</a></li>
                <li><a href="urdetails.jsp"  ><span></span>Personal Details</a></li>
                <li><a href="sendfeed.jsp"><span></span>Send Feedback</a></li>
                <li><a href="userlogout"><span></span>Logout</a></li> </ul>    	
      
             </div> <!-- end of tooplate_menu -->
        
    <div id="site_title"><h1>Make Money</h1></div>
     
    </div> <!-- end of header -->
    
    <div id="tooplate_main">
    	
    	<div id="tooplate_sidebar">
        	<div class="sidebar_box">
            	<h4>Current market indices</h4>
                <ul class="sidebar_nav">
                	<li>Nifty : <%=URLHtml.current("nifty") %></li>
                    <li>Sensex : <%=URLHtml.current("sensex") %></li>
                    
                </ul>
            </div>
        </div> <!-- end of sidebar -->
        
        <div id="tooplate_content">
       	  
			<h2>Contact Information</h2>
            <div class="cleaner h20"></div>
       <%Connection con = ConnectionProvider.getCon();
       Statement st= con.createStatement();
       String q="select * from customer where cid="+session.getAttribute("cid");
       ResultSet rs=st.executeQuery(q);
       //Connection con2= ConnectionProvider.getCon();
		Statement st2=con.createStatement();
		String s="select * from stock";
		ResultSet rs1=st2.executeQuery(s);
       if(rs.next())
       {
       %> 	
            <div>
                <div class="col_w400 float_l">	
               <div id="contact_form">
            
                    <h4>Quick Contact Form</h4>
                    <%String a=request.getParameter("name");
    
                    if(a!=null){
                    %>
               		  <form method="post" name="contact" action="sell"> 
               	<%}else{ %>
                    <form method="post" name="contact" action="sell.jsp"> 
						
						<%} %>
						
						
						
						<%if(a!=null){ %>
                            
                            
						<select name="name" onchange="this.form.submit()" class="required input_field">
		<option value="<%=a%>"><%=a%></option>
		<%
		while(rs1.next())
			{
			%>
			<option value="<%=rs1.getString(2) %>"><%=rs1.getString(2)%></option>
				<%} %>
			</select>
	
						<%}
						
						else{%>
						
								<select name="name" onchange="this.form.submit()" class="required input_field">		
			<option> - Stock - </option>
				<%//Connection con= ConnectionProvider.getCon();
		
			while(rs1.next())
			{
			%>
			<option value="<%=rs1.getString(2) %>"><%=rs1.getString(2)%></option>
				<%} %>
								</select>
						
						
							
						   <%} %>
                            
                            <label for="quantity">Quantity:</label> <input type="text" id="quantity" name="quantity" class="required input_field" />
                            <div class="cleaner h10"></div>
                                                                                                                
                                                                             
                            <label for="price">Buy Price:</label> <input type="text" class="validate-subject required input_field" name="price" id="price" />				               
                            <div class="cleaner h10"></div>
                  <%if(a!=null){ %>                                       
                            <input type="submit" value="Send" id="submit" name="submit" class="submit_btn float_l" />
                            <input type="reset" value="Reset" id="reset" name="reset" class="submit_btn float_r" />                           
 					<%} %>
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					</form>
          <%} 
          
          if(request.getParameter("name")!=null)
        	  
          {
          %> 
                </div>  
                </div>            
                <div class="col_w200 float_r">
                    <div id="map">
                        <h2><strong>Current Price</strong></h2>
                        <h6><strong><%=request.getParameter("name").toUpperCase()%> :  <%=URLHtml.current(request.getParameter("name"))%></strong></h6>
                	</div>
			</div>
           <%} %>        
        </div> <!-- end of content -->
        
        <div class="cleaner h20"></div></div></div></div></div></div>
    </div> <!-- end of main -->
    
</div> <!-- end of wrapper -->
<div id="tooplate_footer_wrapper">
    <div id="tooplate_footer">
     Copyright � 2048 <a href="#">Make Money Pvt. Ltd.</a>
           <div class="cleaner"></div>
    </div>
</div>  
        
</body>
</html>