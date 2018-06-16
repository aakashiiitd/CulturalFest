<%@ page language="java" import="java.sql.* , java.io.*" %>
<%@ page import="javax.swing.*" %>
<%
    Connection con=null;
    PreparedStatement pstmt = null;
    ResultSet rslt=null;
    int rows=0;
    try
    {
        String t9=request.getParameter("t9");
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");
        String delete ="DELETE FROM Events WHERE ename = ? ";
        pstmt = con.prepareStatement(delete);
        pstmt.setString(1,t9);
        rows =pstmt.executeUpdate();
        if (rows==1){
            JOptionPane.showMessageDialog(null,"Deleted");
            String r = "Events.html";
            response.sendRedirect(r);
        }



        con.close();
        pstmt.close( );
    }

    catch (SQLException e)
    {
        JOptionPane.showMessageDialog(null,"Not Deleted");
        String r = "Events.html";
        response.sendRedirect(r);

    }


%>