<%--
  Created by IntelliJ IDEA.
  User: surajprathikkumar
  Date: 18/04/18
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.sql.* , java.io.*" %>
<%@ page import="javax.swing.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LOCATION</title>
</head>
<body background = "54.jpg" text="#f0f8ff">
<a href="IIITDFEST1.html" >HOME</a>
<form method="post">
    <br>
    <br>
    <h1><center>Location</center></h1>
    <center>
        <form>
            <label>Username</label> <input type="text" name="t50" value="">

            <input type="submit" name="submit" >

        </form>
        <br>
        <br>
        <table border="2" width="30%" height = "20%" >
            <thead>
            <tr>


                <td>Event name</td>
                <td>Event head</td>
                <td>Location</td>


            </tr>
            </thead>

            <%

                PreparedStatement statement = null;
                ResultSet rs=null;
                try
                {
                    String as=request.getParameter("t50");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");
                    String query="select  Events.ename,ehead, Location.lname  from Registrations,Location , Events where Location.ename = Events.ename and Location.ename  = Registrations.ename  and Registrations.rname = " +"\""+as+"\""+" group by Location.lname ";

                    statement =conn.prepareStatement(query);
                    rs=statement.executeQuery();
//                    out.print(query);
                    while(rs.next())
                    {

            %>
            <tr><td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
            </tr>
            <%

                }
            %>
        </table>
    </center>
    <%

            statement.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        finally {
            if (rs != null)
                try { rs.close( ); } catch (SQLException ignore) { }
            if (statement != null)
                try { statement.close( ); } catch (SQLException ignore) { }
        }

    %>

</form>
<center>

<form name="f1" method="post">
    <br>
    <br>
    <h1>UPDATE</h1>
    <label >Location Name</label> <input type="text" name="t1" value="">
    <br> <br> <br>

    <label >Duration     </label> <input type="text" name="t6" value="">
    <br><br><br> <br><br>
    <input type="submit" name="submit" >


<%


    Connection con=null;
    PreparedStatement statement1=null;
    ResultSet rs1=null;
    String lname=request.getParameter("t1");
    String duration=request.getParameter("t6");


    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");

        String sql=   "update Location set duration= \""+ duration +"\" where lname = " +" \"" + lname+"\" " ;
       // out.print(sql);
        statement1=con.prepareStatement(sql);
        int i =statement1.executeUpdate();
        //out.print(i);


        if (i==1)
        {
            //out.print("ok");
            JOptionPane.showMessageDialog(null,"Updated");
            String r = "Location_user.jsp";
            response.sendRedirect(r);
        }



        con.close();

    }

    catch (SQLException e)
    {

        JOptionPane.showMessageDialog(null,"Not Updated");
        String r = "Location_user.jsp";
        response.sendRedirect(r);


    }
    finally {
        if (rs1 != null)
            try { rs1.close( ); } catch (SQLException ignore) { }
        if (statement1 != null)
            try { statement1.close( ); } catch (SQLException ignore) { }
    }
%>

</form>
</center>
</body>
</html>
