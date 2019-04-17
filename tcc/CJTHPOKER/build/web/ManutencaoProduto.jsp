<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produto</title>
    </head>
    <body>
        
        
        <%
            
            Connection conn = null;
            try {
                Class.forName ("com.mysql.jdbc.Driver").newInstance();
           conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root");  
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM produto");
            String cod_produto = request.getParameter("cod_produto");
            String nome_produto = request.getParameter("nome_produto");
            String preco = request.getParameter("preco");
            String operacao = request.getParameter("operacao");
            String sql= ""; 
            if (operacao.equals("I"))
          
            { sql= "INSERT INTO `produto`(`nome_produto`, `preco`) VALUES ('" + nome_produto+ "','" + preco + "')";
            out.println("<center>"+"A inclusão foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuProduto.jsp'>" + "Voltar" + "</a></center>");
            }
            else if (operacao.equals ("A"))
            {
                sql= "UPDATE `produto` SET `nome_produto`=" + "'" + nome_produto + "'"+ ",`preco`=" + "'" + preco + "'"
                       + " WHERE cod_produto = " + "'"+ cod_produto +"'";
                out.println("<center>"+"A alteração foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuProduto.jsp'>" + "Voltar" + "</a></center>");
            }
            else if (operacao.equals("E"))
            { sql= "DELETE FROM produto WHERE cod_produto = " + "'"+ cod_produto +"'";
            out.println("<center>"+"A exclusão foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuProduto.jsp'>" + "Voltar" + "</a></center>");
            }
            s.executeUpdate(sql);
            s.close();
            conn.close();
              }
            catch (Exception e){
            out.println("ERRO: " + e.getMessage());
        }
        %>
    </body>
</html>
