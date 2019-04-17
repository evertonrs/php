<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
        <%
            
            Connection conn = null;
            try {
                Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM cliente");
            String cod_cliente = request.getParameter("cod_cliente");
            String cpf = request.getParameter("cpf");
            String nome_cliente = request.getParameter("nome_cliente");
            String endereco = request.getParameter("endereco");
            String telefone = request.getParameter("telefone");
            String operacao = request.getParameter("operacao");
            String sql= ""; 
            if (operacao.equals("I"))
            { sql= "INSERT INTO `cliente`(`cpf`, `nome_cliente`, `endereco`, `telefone`) "
                    + "VALUES ('" + cpf + "','" + nome_cliente+ "','"
                    + endereco + "','" + telefone + "')";
            out.println("<center>"+"A inclusão foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuCliente.jsp'>" + "Voltar" + "</a></center>");
            }
            else if (operacao.equals ("A"))
            {       
                sql = "UPDATE cliente SET cpf='"+ cpf + "',nome_cliente= '" + nome_cliente +
                        "' ,endereco= '" + endereco +"' ,telefone= '" + telefone 
                        + "' WHERE cod_cliente = '" + cod_cliente + "'";
            out.println("<center>"+"A alteração foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuCliente.jsp'>" + "Voltar" + "</a></center>");
            }
            else if (operacao.equals("E"))
            { 
                sql= "DELETE FROM cliente WHERE cod_cliente = " + "'"+ cod_cliente +"'";
            out.println("<center>"+"A exclusão foi realizada com sucesso" + "<br><br>");
            out.println( "<a href='MenuCliente.jsp'>" + "Voltar" + "</a></center>");
            
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
