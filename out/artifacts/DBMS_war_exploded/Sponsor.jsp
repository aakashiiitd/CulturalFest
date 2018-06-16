<%--
  Created by IntelliJ IDEA.
  User: surajprathikkumar
  Date: 18/04/18
  Time: 4:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.sql.* , java.io.*" %>
<%@ page import="javax.swing.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SPONSOR</title>
</head>
<body background = "56.jpg">
<a href="IIITDFEST1.html" >HOME</a>
<form method="post">
    <br>
    <br>
    <h1><center>SPONSORSHIP</center></h1>
<center>
    <form>
        <label>Order By</label> <input type="text" name="t50" value="">
        <input type="submit" name="submit" >
    </form>
    <table border="2" width="50%" height = "50%" >
        <thead>
        <tr>


            <td>sno</td>
            <td>sname</td>
            <td>scontact</td>
            <td>scompany</td>
            <td>ename</td>
            <td>amount</td>

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
                String query="select * from Sponsorship order by "+ as;

                statement =conn.prepareStatement(query);
                //statement.setString(1,as);
                rs=statement.executeQuery();

                while(rs.next())
                {

        %>
        <tr><td><%=rs.getInt("sno") %></td>
            <td><%=rs.getString("sname") %></td>
            <td><%=rs.getInt("scontact") %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getInt(6) %></td></tr>
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
    <label>sno</label> <input type="text" name="t1" value="">
    <br> <br> <br>

    <label>amount</label> <input type="text" name="t6" value="">
    <br><br><br> <br><br>
    <input type="submit" name="submit" >

</form>
<%


    Connection con=null;
    PreparedStatement stmt=null;
    String sno=request.getParameter("t1");
    String amount=request.getParameter("t6");


    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");

        String sql=   "update Sponsorship set amount='"+ amount +"' where sno = " + sno ;
        stmt=con.prepareStatement(sql);
        int i =stmt.executeUpdate();



        if (i==1){
            JOptionPane.showMessageDialog(null,"Updated");
            String r = "Sponsor.jsp";
            response.sendRedirect(r);
        }



        con.close();
        stmt.close( );
    }

    catch (SQLException e)
    {
        JOptionPane.showMessageDialog(null,"Not Updated");
        String r = "Sponsor.jsp";
        response.sendRedirect(r);


    }
		%>


</center>
</body>

</html>