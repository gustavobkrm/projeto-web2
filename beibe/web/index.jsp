<%-- 
    Document   : index
    Created on : 12 de jul. de 2022, 14:51:00
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BEIBE</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href='css/style.css'>
    </head>
    <body>
        <div class="container-fluid screen screen-color">    
            <div class="row">
                <div class="col col-6 justify-content-center align-content-center beibe">
                    <h1 class="primary">BEIBE</h1>
                    <h3>Beauty Embuste Indústria de Beleza e Estética.</h3>
                </div>
                <div class="col col-4 justify-content-center align-content-center login-block">
                    <div class="h-200">
                        <div class="card">
                            <div class="card-header h3 text-center">
                                Login
                            </div>
                            <div class="card-body">
                                <form action="LoginServlet" class="form-group pa-10" method="post">
                                    <span style="color:red">${mensagem}</span>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input class="form-control" type="text" id="login" name="email">
                                        <label for="senha">Senha</label>
                                        <input class="form-control" type="password" id="senha" name="senha">
                                    </div>
                                    <button type="submit" class="btn btn-success w-100">Entrar</button>
                                </form>
                                <a class="btn btn-primary mb-3 w-100" href="cadastro.jsp"> Cadastre-se </a> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fixed-bottom card-footer text-center color-footer">
                Em caso de problemas contactar o administrador: ${configuracao.email}
            </div>
        </div>
    </body>
</html>
