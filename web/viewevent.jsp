<%@ page language="java" import="java.sql.* , java.io.*" %>
<%


    Connection con=null;

    PreparedStatement pstmt = null;
    ResultSet rslt=null;

    int rows=0;


    try
    {String id2=request.getParameter("t10");

        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fest","root","sai");


        String select =
                "select eno, ename,ehead,cashprize " +
                        "from Events " +
                        "where ename = ?";

        System.out.println(select);
        pstmt = con.prepareStatement(select);
        pstmt.setString( 1, id2 );
        rslt = pstmt.executeQuery( );
        rows = 0;


        while (rslt.next( )) {
            rows++;

          out.print("eno : ");
            out.println(rslt.getInt(1) + " \n");
            out.print("ename : ");
            out.println(rslt.getString(2) + " \n");
            out.print("ehead : ");
            out.println(rslt.getString(3)+" \n");
            out.print("cashprize : ");
            out.println(rslt.getInt(4));
            out.print("\n");
        }
        pstmt.close( );
        pstmt = null;

        out.println("");
    }
    catch (SQLException e) {
        System.err.println(e.getMessage( ));
    }
    finally {
        if (rslt != null)
            try { rslt.close( ); } catch (SQLException ignore) { }
        if (pstmt != null)
            try { pstmt.close( ); } catch (SQLException ignore) { }
    }

%>