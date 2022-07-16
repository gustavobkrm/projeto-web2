<%-- 
    Document   : erro
    Created on : 12 de jul. de 2022, 14:53:01
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href='css/style.css'>
    </head>
    <body>
        <section class="centered">
            <h1 class="h1Main">ERRO!</h1>
            <div class="container">
                <h1 class="color">${requestScope.mensagem}</h1>
                <h3 class="alignCenter"><a class="linkPagina" href="${requestScope.pagina}">Clique aqui para retornar</a></h3>
            </div>
        </section>
    </body>
</html>
