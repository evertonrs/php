<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
    </head>
    <body>
    <center><div>
        <h1>Pedido</h1>
         <br>
        <table border ="1">
    <tr>
        <td><a href="FormularioPedido.jsp?cod_pedido=0"><img src ='adicionar.jpg' width='20' height='20'></a></td>
        <td>Cliente</td>
        <td>Produto</td>
    </tr>
    <%
        Connection conn = null;
        try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT nome_cliente,nome_produto,cod_pedido FROM cliente,produto "
                    + "JOIN pedido WHERE cliente.cod_cliente = pedido.cod_cliente "
                    + "and produto.cod_produto = pedido.cod_produto "
                    + "ORDER BY cod_pedido");
            ResultSet rs = s.getResultSet();
            while (rs.next())
            {
                String cod_pedido = rs.getString("cod_pedido");
                out.println("<tr><td><a href='FormularioPedido.jsp?cod_pedido=" + cod_pedido + "'>"
                        + "<img src = 'editar.jpg' width='20px' height='20px'></a></td>");
                out.println("<td>"+ rs.getString("nome_cliente") + "</td>");
                out.println("<td>" + rs.getString("nome_produto") + "</td>");
                
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
