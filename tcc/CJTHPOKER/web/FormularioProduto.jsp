<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produto</title>
    </head>
    <center><div>
    <body>
        <% Connection conn = null;
        String cod_produto = request.getParameter ("cod_produto");
        String nome_produto = "";
        float preco = 0;
        String operacao = "";
        
        
        if(cod_produto.equals("0"))
        {operacao = "I";
         cod_produto = "";
        }
        else
        { operacao = "A";
         try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM produto where cod_produto=" +cod_produto);
            ResultSet rs = s.getResultSet();
            if (rs.next())
            {nome_produto = rs.getString("nome_produto");
            preco = rs.getFloat("preco");
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
        <h1>Produto</h1><br>
            
        <form name="form1" action="ManutencaoProduto.jsp">
            <input type ='hidden' name='operacao' value='<%out.print(operacao);%>'>
            <table table border='1'>
            <input type="hidden" name="cod_produto" value="<%out.print(cod_produto);%>" /></td></tr>
            <tr><td>Nome: </td><td><input type="text" name="nome_produto" value="<%out.print(nome_produto);%>" /></td></tr>
            <tr><td>Preço: </td><td><input type="text" name="preco" value="<%out.print(preco);%>" /></td></tr>
            </table><br><br>
            <input type="image" name="salvar" src = 'salvar.jpg' width='30px' height='30px'/>        
            <a href="ManutencaoProduto.jsp?operacao=E&cod_produto=<%out.print(cod_produto);%>">
            <img src = 'excluir.jpg' width='30px' height='30px'></a><br><br>
        </form><br><br>
        <a href="MenuProduto.jsp">Voltar</a>
        </div></center>
    </body>
</html>
