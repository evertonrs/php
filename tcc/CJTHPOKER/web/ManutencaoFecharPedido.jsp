<%-- 
    Document   : ManutencaoFecharPedido
    Created on : 22/05/2017, 21:42:40
    Author     : Chupa Teta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fechar Comanda</title>
    </head>
    <body>
    <center><div>
        <h1>Fechar Comanda</h1>
        <table border ="1">
    <tr>
        <td>Produto</td>
        <td>Preço</td>
    </tr>
    <%
        Connection conn = null;
        float total = 0;
        String nome_cliente = request.getParameter("nome_cliente");
               try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement c = conn.createStatement();
            c.executeQuery ("SELECT `cod_cliente` FROM `cliente` WHERE `nome_cliente`= '"+ nome_cliente+ "'");
            ResultSet rc = c.getResultSet();
            while(rc.next()){
            String cod_cliente = rc.getString("cod_cliente");
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT cod_produto FROM pedido WHERE cod_cliente=" + "'"+ cod_cliente+ "'"); 
            ResultSet rs = s.getResultSet();
                while (rs.next())
                {   String cod_produto = rs.getString("cod_produto");
                    Statement p = conn.createStatement();
                    p.executeQuery ("SELECT nome_produto FROM produto WHERE cod_produto=" + "'"+ cod_produto+ "'");
                    ResultSet rp = p.getResultSet();
                        while(rp.next()){
                        String nome_produto = rp.getString("nome_produto"); 
                        out.println("<tr><td>"+ rp.getString("nome_produto") + "</td>");
                        Statement e = conn.createStatement();
                        e.executeQuery ("SELECT preco FROM produto WHERE nome_produto=" + "'"+ nome_produto+ "'");
                        ResultSet re = e.getResultSet();
                            while(re.next()){                            
                            out.println("<td>" + re.getFloat("preco") + "</td></tr>");
                            total = total + re.getFloat("preco");
                        }
                        re.close();
                        e.close();
            }           
            p.close();
            rp.close();
        }
        rs.close();
        s.close();         
    }           
    c.close();
    rc.close();
    conn.close();
}
        catch (Exception e){
            out.println("HOUVE UM ERRO AO ACESSAR O B.D.!<BR>");
            out.println("ERRO:" + e.getMessage());
      
}
            %>
        </table><br><br>
        <table>
            <tr><td><h3>Total:</h3></td><td><h3><%out.print(total);%></h3></td></tr>
        </table><br><br>       
            <a href="ManutencaoPedido.jsp?operacao=F&nome_cliente=<%out.print(nome_cliente);%>">
                <img src='finalizar.jpg' width='150px' height='40px'></a><br><br>
        <a href="menu.html">Voltar</a><br>
        </div></center>
    </body>
</html>
