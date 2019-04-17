<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
    <center><div>
        <h1>Cliente</h1>
         <br>
        <table border ="1">
    <tr>
        <td><a href="FormularioCliente.jsp?cod_cliente=0"><img src ='adicionar.jpg' width='20' height='20'></a></td>
        <td>CPF</td>
        <td>Nome</td>
        <td>Endereço</td>
        <td>Telefone</td>
    </tr>
    <%
        Connection conn = null;
        try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM cliente ORDER BY cod_cliente");
            ResultSet rs = s.getResultSet();
            while (rs.next())
            {
                String cod_cliente = rs.getString("cod_cliente");
                out.println("<tr><td><a href='FormularioCliente.jsp?" + "cod_cliente=" + cod_cliente + "'>"
                        + "<img src = 'editar.jpg' width='20px' height='20px'></a></td>");
                out.println("<td>"+ rs.getString("cpf") + "</td>");
                out.println("<td>"+ rs.getString("nome_cliente") + "</td>");
                out.println("<td>" + rs.getString("endereco") + "</td>");
                out.println("<td>" + rs.getString("telefone") + "</td>");
                
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
