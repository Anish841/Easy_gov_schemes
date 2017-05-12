<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="databaseManager.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try{
        Connection con=DBConnection.getConnection();
        
        Statement stmt = con.createStatement();
        int vote=0;
        String ID = request.getParameter("SID");
        String Vote = request.getParameter("Vote");
        out.write("vote===>"+Vote);
        if(Vote.equals("p1"))
        {
            String sql = "select validate_count from scheme where sid IN ('"+ID+"')";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                vote = rs.getInt("validate_count");
            }
            vote+=1;
            sql = "Update scheme SET validate_count="+vote+" where sid IN ('"+ID+"')";
            stmt.executeUpdate(sql);
        }
        else if(Vote.equals("m1"))
        {
            String sql = "select validate_count from scheme where sid IN ('"+ID+"')";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                vote = rs.getInt("validate_count");
            }
            vote-=1;
            sql = "Update scheme SET validate_count="+vote+" where sid IN ('"+ID+"')";
            stmt.executeUpdate(sql);
        }
        stmt.close();
        con.close();
        response.sendRedirect("update.jsp");}
        catch(Exception e){
        	System.out.print(e.getMessage());
        }
        %>
    </body>
</html>
