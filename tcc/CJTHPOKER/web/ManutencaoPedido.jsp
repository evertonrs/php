<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
    </head>
    <body>
        <%
            
            Connection conn = null;
            try {
                Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            String cod_pedido = request.getParameter("cod_pedido");
            String nome_cliente = request.getParameter("nome_cliente");
            String nome_produto = request.getParameter("nome_produto");
            String operacao = request.getParameter("operacao");
            String sql= ""; 
            Statement s = conn.createStatement();
            Statement c = conn.createStatement();
            Statement p = conn.createStatement();
            s.executeQuery ("SELECT * FROM pedido");
            c.executeQuery ("SELECT `cod_cliente` FROM `cliente` WHERE `nome_cliente`= '"+ nome_cliente+ "'");
            p.executeQuery ("SELECT `cod_produto` FROM `produto` WHERE `nome_produto`= '"+ nome_produto+ "'");
            ResultSet rc = c.getResultSet();
            ResultSet rp = p.getResultSet();
            while(rc.next() && rp.next()){            
                String cod_cliente = rc.getString("cod_cliente");
                String cod_produto = rp.getString("cod_produto");
            
            if (operacao.equals("I"))
            { sql= "INSERT INTO pedido (`cod_cliente`, `cod_produto`)" + "VALUES ('" + cod_cliente +
                    "', '" + cod_produto + "' )";
            out.println("<center>"+"A inclusão foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuPedido.jsp'>" + "Voltar" + "</a><br><br>");
            out.println( "<a href='FormularioPedido.jsp?cod_pedido=0'>" + "Novo Pedido" + "</a></center>");
            }
            else if (operacao.equals ("A"))
            {       
                sql = "UPDATE `pedido` SET `cod_cliente`=" +"'"+ cod_cliente +"'"+
                  ",`cod_produto`=" +"'"+ cod_produto +"'"+ "WHERE `cod_pedido`=" +"'"+ cod_pedido +"'";
            out.println("<center>"+"A alteração foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuPedido.jsp'>" + "Voltar" + "</a></center>");
            }}
            if (operacao.equals("F"))
            {
                String cod_cliente = rc.getString("cod_cliente");
                sql= "DELETE FROM `pedido` WHERE `cod_cliente` = " + "'"+ cod_cliente +"'";
            out.println("<center>"+"Obrigado e volte sempre  " + nome_cliente + "<br><br>");
            out.println( "<a href='menu.html'>" + "Voltar" + "</a></center>");
            }    
            else if (operacao.equals("E"))
            { 
                sql= "DELETE FROM `pedido` WHERE `cod_pedido` = " + "'"+ cod_pedido +"'";
            out.println("<center>"+"A exclusão foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuPedido.jsp'>" + "Voltar" + "</a></center>");
            
            }
            s.executeUpdate(sql);
            s.close();
            c.close();
            p.close();
            rc.close();
            rp.close();
            conn.close();
              }
            catch (Exception e){
            out.println("ERRO: " + e.getMessage());
        }
            %>
    </body>
</html>
