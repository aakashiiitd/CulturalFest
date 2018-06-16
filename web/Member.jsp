<%--
  Created by IntelliJ IDEA.
  User: surajprathikkumar
  Date: 18/04/18
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.sql.* , java.io.*" %>
<%@ page import="javax.swing.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MEMBERS</title>
</head>
<body background = "78.jpg">
<a href="IIITDFEST1.html" >HOME</a>
<form method="post">
    <br>
    <br>
    <h1><center>MEMBERS</center></h1>
    <center>
        <form>
            <label>Event name</label> <input type="text" name="t50" value="">

            <input type="submit" name="submit" >

        </form>
        <br>
        <br>
        <table border="2" width="30%" height = "20%" >
            <thead>
            <tr>


                <td>Event head</td>
                <td>Event name</td>
                <td>Number of members</td>


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
                    String query="select  ehead,Events.ename, count(mno)  from Member  , Events where Member.ename = Events.ename group by Events.ename Having Events.ename ="+"\""+as+"\"";

                    statement =conn.prepareStatement(query);
                    rs=statement.executeQuery();
//                    out.print(query);
                    while(rs.next())
                    {

            %>
            <tr><td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getInt(3) %></td>
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

<form method="post">
    <br>
    <br>
    <h1><center>DETAILS</center></h1>
    <center>
        <form>
            <label>Member name</label> <input type="text" name="t53" value="">

            <input type="submit" name="submit" >

        </form>
        <br>
        <br>
        <table border="2" width="50%" height = "40%" >
            <thead>
            <tr>


                <td>RNO.</td>
                <td>Register Name</td>
                <td>Event Name</td>
                <td>Contact</td>
                <td>Age</td>
                <td>Register Fee</td>
                <td>Sponsor Company</td>
            </tr>
            </thead>

            <%

                PreparedStatement statement1 = null;
                ResultSet rs1=null;
                try
                {
                    String as=request.getParameter("t53");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");
                    String query="SELECT Registrations.*, scompany\n" +
                            "from Member, Registrations,Sponsorship\n" +
                            "where Member.ename = Registrations.ename and Member.mname = \""+ as+ "\" and Member.role=\"Publicity\" and Sponsorship.ename=Registrations.ename and Sponsorship.ename=Member.ename;\n" +
                            "\n";

                    statement1 =conn.prepareStatement(query);
                    rs1=statement1.executeQuery();

                    while(rs1.next())
                    {

            %>
            <tr><td><%=rs1.getInt(1) %></td>
                <td><%=rs1.getString(2) %></td>
                <td><%=rs1.getString(3) %></td>
                <td><%=rs1.getInt(4) %></td>
                <td><%=rs1.getInt(5) %></td>
                <td><%=rs1.getInt(6) %></td>
                <td><%=rs1.getString("scompany") %></td>
            </tr>
            <%

                }
            %>
        </table>
    </center>
    <%

            statement1.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        finally {
            if (rs1 != null)
                try { rs1.close( ); } catch (SQLException ignore) { }
            if (statement1 != null)
                try { statement1.close( ); } catch (SQLException ignore) { }
        }

    %>

</form>
<center>
<form name="f1" method="post">
    <br>
    <br>
    <h1>Delete</h1>
    <label>Last 3 letters of the member's name</label> <input type="text" name="t1" value="">
    <br> <br> <br>


    <input type="submit" name="submit" >



    <%


        Connection con=null;
        PreparedStatement statement2=null;
        ResultSet rs2=null;

        String mname=request.getParameter("t1");




        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");

            String sql=   "Delete from Member where mname like" +" \"%" + mname+"\"" ;
            //out.print(sql);
            statement1=con.prepareStatement(sql);
            int i =statement1.executeUpdate();
            //out.print(i);


            if (i==1)
            {
                JOptionPane.showMessageDialog(null,"Deleted");
                String r = "Member.jsp";
                response.sendRedirect(r);
            }



            con.close();

        }

        catch (SQLException e)
        {

            JOptionPane.showMessageDialog(null,"Not Deleted");
            String r = "Member.jsp";
            response.sendRedirect(r);


        }
        finally {
            if (rs2 != null)
                try { rs2.close( ); } catch (SQLException ignore) { }
            if (statement2 != null)
                try { statement2.close( ); } catch (SQLException ignore) { }
        }
    %>
</form>
</center>
</body>
</html>
