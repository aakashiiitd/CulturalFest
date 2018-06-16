<%@ page language="java" import="java.sql.* , java.io.*" %>
<%@ page import="javax.swing.*" %>
<%
  Connection con=null;
  PreparedStatement pstmt = null;
  ResultSet rslt=null;
  int rows=0;
  try
  {
    String t1=request.getParameter("t1");
    int t11=Integer.parseInt(t1);
    String t2=request.getParameter("t2");
    String t3=request.getParameter("t3");
    String t4=request.getParameter("t4");
    int t44=Integer.parseInt(t4);
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");
    String insert ="insert into Events(eno,ename,ehead,cashprize) values(?,?,?,?)";


    pstmt = con.prepareStatement(insert);
    pstmt.setInt(1,t11);
    pstmt.setString(2, t2);
    pstmt.setString(3,t3);
    pstmt.setInt(4,t44);
    rows =pstmt.executeUpdate();
    if (rows==1){
        JOptionPane.showMessageDialog(null,"Inserted");
        String r = "Events.html";
        response.sendRedirect(r);
    }


    else
        JOptionPane.showMessageDialog(null,"Not Inserted");
    con.close();
    pstmt.close( );
  }

  catch (SQLException e)
  {
      JOptionPane.showMessageDialog(null,"Not Inserted");
      String r = "Events.html";
      response.sendRedirect(r);

  }


%>