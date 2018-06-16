<%--
  Created by IntelliJ IDEA.
  User: surajprathikkumar
  Date: 18/04/18
  Time: 8:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.sql.* , java.io.*" %>
<%@ page import="javax.swing.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>REGISTRATION</title>
</head>
<body background = "99.jpg">
<a href="IIITDFEST1.html" >HOME</a>
<form method="post">
    <br>
    <br>
    <h1><center>Registerations</center></h1>
    <center>
        <form>
            <label>Event Name</label> <input type="text" name="t50" value="">

            <input type="submit" name="submit" >

        </form>
        <br>
        <br>
        <table border="2" width="30%" height = "20%" >
            <thead>
            <tr>


                <td>Event name</td>
                <td>Profit</td>
                <td>Event head</td>
                <td>Cashprize</td>


            </tr>
            </thead>

            <%

                PreparedStatement statement= null;
                ResultSet rs=null;
                try
                {
                    String as=request.getParameter("t50");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");
                   // String query="SELECT  m,  Sponsorship.ename from Sponsorship, ((SELECT "+as+"(i) AS m FROM ((SELECT sum(amount)  AS i, Events.ename AS j FROM Sponsorship, Events WHERE Sponsorship.ename = Events.ename GROUP BY Events.ename) AS k))as mm) WHERE Sponsorship.amount = m ";

                    String query="Select Events.ename, sum(regfee)+ sum(amount) - Events.cashprize as profit,Events.ehead,Events.cashprize\n" +
                            "from Registrations, Sponsorship, Events\n" +
                            "where Sponsorship.ename = Events.ename and Registrations.ename = Events.ename\n" +
                            "GROUP BY Events.ename\n" +
                            "having Events.ename = "+"\"" + as +"\"";

                    statement =conn.prepareStatement(query);
                    rs=statement.executeQuery();
                    //out.print(query);
                    while(rs.next())
                    {

            %>
            <tr><td><%=rs.getString(1) %></td>
                <td><%=rs.getInt(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getInt(4) %></td>
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
            if (statement!= null)
                try { statement.close( ); } catch (SQLException ignore) { }
        }

    %>

</form>
<form method="post">
    <br>
    <br>
    <h1><center>Official Sponsor</center></h1>
    <center>
        <form>
            <label>Max or Min</label> <input type="text" name="t50" value="">

            <input type="submit" name="submit" >

        </form>
        <br>
        <br>
        <table border="2" width="30%" height = "20%" >
            <thead>
            <tr>


                <td>Sponsor Amount</td>
                <td>Event Name</td>


            </tr>
            </thead>

            <%

                PreparedStatement statement1 = null;
                ResultSet rs1=null;
                try
                {
                    String as=request.getParameter("t50");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");
                    String query="SELECT  m,  Sponsorship.ename from Sponsorship, ((SELECT "+as+"(i) AS m FROM ((SELECT sum(amount)  AS i, Events.ename AS j FROM Sponsorship, Events WHERE Sponsorship.ename = Events.ename GROUP BY Events.ename) AS k))as mm) WHERE Sponsorship.amount = m ";


                    statement1 =conn.prepareStatement(query);
                    rs1=statement1.executeQuery();
                    //out.print(query);
                    while(rs1.next())
                    {

            %>
            <tr><td><%=rs1.getInt(1) %></td>
                <td><%=rs1.getString(2) %></td>
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
</body>
</html>
