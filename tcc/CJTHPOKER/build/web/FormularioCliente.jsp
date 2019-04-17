<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
        <center><div>
        <% Connection conn = null;
        String cod_cliente = request.getParameter ("cod_cliente");
        String cpf = "";
        String nome_cliente = "";
        String endereco = "";
        String telefone = "";
        String operacao = "";
        
        
        if(cod_cliente.equals("0"))
        {operacao = "I";
         cod_cliente = "";
        }
        else
        { operacao = "A";
         try 
{
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection ("jdbc:mysql://localhost/cjthpoker?"+
                "user=root"); 
            Statement s = conn.createStatement();
            s.executeQuery ("SELECT * FROM cliente where cod_cliente=" + cod_cliente);
            ResultSet rs = s.getResultSet();
            if (rs.next())
            {   cpf = rs.getString("cpf");
                nome_cliente = rs.getString("nome_cliente");
                endereco = rs.getString("endereco");
                telefone = rs.getString("telefone");
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
        <h1>Cliente</h1>
            
        <form name="form1" action="ManutencaoCliente.jsp">
            <input type ='hidden' name='operacao' value='<%out.print(operacao);%>'>
            <table table border='1'>
            <input type="hidden" name="cod_cliente" value="<%out.print(cod_cliente);%>" /></td></tr>
            <tr><td>CPF:</td><td><input type="text" name="cpf" value="<%out.print(cpf);%>" /></td></tr>
            <tr><td>Nome:</td><td><input type="text" name="nome_cliente" value="<%out.print(nome_cliente);%>" /></td></tr>
            <tr><td>Endereço:</td><td><input type="text" name="endereco" value="<%out.print(endereco);%>" /></td></tr>
            <tr><td>Telefone:</td><td><input type="text" name="telefone" value="<%out.print(telefone);%>" /></td></tr>
            </table><br><br>
            <input type="image" name="salvar" src = 'salvar.jpg' width='30px' height='30px'/>        
            <a href="ManutencaoCliente.jsp?operacao=E&cod_cliente=<%out.print(cod_cliente);%>">
            <img src = 'excluir.jpg' width='30px' height='30px'></a><br><br>
        </form>     
        <a href="MenuCliente.jsp">Voltar</a>
            </div></center>
    </body>
</html>
