<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produto</title>
    </head>
    <body>
        <center><div>
          <h1>Produto</h1>
         <br>
        <table border ="1">
    <tr>
        <td><a href="FormularioProduto.jsp?cod_produto=0"><img src ='adicionar.jpg' width='20' height='20'></a></td>
        <td>Nome</td>
        <td>Preço</td>
    </tr>
    <%
    Connection conn = null;
    try 
    {
        Class.forName ("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
        Statement s = conn.createStatement();
        s.executeQuery ("SELECT * FROM produto ORDER BY cod_produto");
        ResultSet rs = s.getResultSet();
        while (rs.next())
        {
            String cod_produto = rs.getString("cod_produto");
            out.println("<tr><td><a href='FormularioProduto.jsp?cod_produto=" + cod_produto + "'>"
                    + "<img src = 'editar.jpg' width='20px' height='20px'></a></td>");
            out.println("<td>" + rs.getString("nome_produto") + "</td>");
            out.println("<td>" + rs.getFloat("preco") + "</td>");
        }
        rs.close();
        s.close();
        conn.close();
    }
    catch (Exception e){
        out.println("HOUVE UM ERRO AO ACESSAR O B.D.!<BR>");
        out.println("ERRO:" + e.getMessage());
    }
    %>
        </table><br><br>
    <a href="menu.html">Voltar</a><br>
    </div></center>
    </body>
</html>
