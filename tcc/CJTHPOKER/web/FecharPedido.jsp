<%-- 
    Document   : FecharPedido
    Created on : 22/05/2017, 21:25:22
    Author     : Chupa Teta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fechar Comanda</title>
    </head>
    <body>
        <center><div>
        <h1>Fechar Comanda</h1>
            
        <form name="form1" action="ManutencaoFecharPedido.jsp">
           Cliente:<select style="min-width:100px" name="nome_cliente">
                 <%   
                     Connection conn = null;
                     String cod_cliente = "";
                    try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM cliente ORDER BY nome_cliente");
            ResultSet rs = s.getResultSet();
            while (rs.next()){
                out.println("<option>"+rs.getString(3)+"</option>");
            }
            rs.close();
            s.close();
            conn.close();
}  
            
            catch(Exception e){
                out.println("HOUVE UM ERRO AO ACESSAR O" + "SERVIDOR DE BANCO DE DADOS.<br>ERRO: " +
            e.getMessage());
            }
          
                %>
                </select>
                <input type="submit" name="ok" value="OK"/><br><br>
                </form>
                <a href="menu.html">Voltar</a>
            </div></center>
    </body>
</html>
