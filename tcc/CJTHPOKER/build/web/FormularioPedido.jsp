<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
    </head>
    <body>
        <center><div>
        <% Connection conn = null;
        String cod_pedido = request.getParameter ("cod_pedido");
        String cod_cliente = "";
        String cod_produto = "";
        String operacao = "";
        
        
        if(cod_pedido.equals("0"))
        {operacao = "I";
         cod_pedido = "";}
        else {
        operacao = "A";
         try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM pedido where cod_pedido=" +cod_pedido);
            ResultSet rs = s.getResultSet();
            if (rs.next())
            {cod_cliente = rs.getString("cod_cliente");
             cod_produto = rs.getString("cod_produto");
            }
            rs.close();
            s.close();
            conn.close();
}
        catch (Exception e){
            out.println("HOUVE UM ERRO AO ACESSAR O" + "SERVIDOR DE BANCO DE DADOS.<br>ERRO: " +
            e.getMessage());
         }
        }
        %>
        <h1>Pedido</h1>
            
        <form name="form1" action="ManutencaoPedido.jsp">
        <input type ='hidden' name='operacao' value='<%out.print(operacao);%>'>
        <input type ='hidden' name='cod_cliente' value='<%out.print(cod_cliente);%>'>
        <input type ='hidden' name='cod_produto' value='<%out.print(cod_produto);%>'>
        <table table border='1'>
        <input type="hidden" name="cod_pedido" value="<%out.print(cod_pedido);%>" /></td></tr>    
        <tr><td>Cliente:</td><td><select style="min-width:100px" name="nome_cliente">
                 <%   
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
                </select></td></tr>       
            <tr><td>Produto:</td><td><select style="min-width:100px" name="nome_produto">
              <%     
                    try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM produto ORDER BY nome_produto");
            ResultSet rs = s.getResultSet();
            while (rs.next()){
                out.println("<option>"+rs.getString(2)+"</option>");
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
                </select></td></tr>
            </table><br><br>
            <input type="image" name="salvar" src = 'salvar.jpg' width='30px' height='30px'/> 
            <a href="ManutencaoPedido.jsp?operacao=E&cod_pedido=<%out.print(cod_pedido);%>">
            <img src = 'excluir.jpg' width='30px' height='30px'></a><br><br>
        </form><br><br>     
        <a href="MenuPedido.jsp">Voltar</a>
            </div></center>
    </body>
</html>
