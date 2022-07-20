<%-- 
    Document   : novoProduto
    Created on : 20 de jul. de 2022, 02:33:07
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>BEIBE</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.5.55/css/materialdesignicons.min.css" />
    </head>
    <style>
        html,
        body {
            height: 100%;
        }
        .list-group-item {
            color: #8391a2;
        }
        .list-group-item a {
            color: #8391a2;
        }
    </style>
    <body>
        <div class="container-fluid">
            <div class="row" style="min-height: 100vh">
                <div class="col-md-2 p-0 bg-dark">
                    <h2 class="pl-3 pt-3 mb-0 text-white">BEIBE</h2>
                    <ul class="list-group list-group-flush pt-3 sticky-top">
                        <c:if test="${ nivel eq 1 || nivel eq 2 }" var="res">
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-file-document"></span>
                                <a href="ProdutoServlet?action=atendimentoFuncionario">Atendimentos</a>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-file-document"></span>
                                <a href="ProdutoServlet?action=atendimentoAFuncionario">Atendimentos em aberto</a>
                            </li>
                        </c:if>
                        <c:if test="${ nivel eq 2 }" var="res">
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-account-multiple-outline"></span>
                                <a href="ProdutoServlet?action=inserirProduto">Cadastro Produtos</a>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-account-multiple-outline"></span>
                                <a href="ProdutoServlet?action=inserirCategoria">Cadastro Categorias </a>
                            </li>
                        </c:if>
                        <li class="bg-dark list-group-item list-group-item-action">
                            <span class="mdi mdi-logout"></span>
                            <a href="LogoutServlet">Logout</a>
                        </li>
                    </ul>
                </div>
                <section class="bg-light col-md-10">
                    <div class="container mt-5">
                        <div class="d-flex justify-content-center">
                            <h1>Cadastro</h1>
                        </div>
                        <div class=" d-flex justify-content-center">
                            <form class="w-100 row" action="ProdutoServlet?action=${ac}" method="POST">
                                <div class="col-12">
                                    <label>Nome do produto </label>
                                    <input  class="form-control mb-3" type="text" name="nome_produto" required value="${produto.nomeProduto}">
                                </div>
                                <div class="col-12">
                                    <label>Peso do produto </label>
                                    <input  class="form-control mb-3" type="text" name="peso_produto" required value="${produto.pesoProduto}">
                                </div>
                                <div class="col-12">
                                    <label for="cargo"> Categoria </label>
                                    <select class="form-control mb-3" type="text" id="cargo" name="cargo">
                                        <option value="">...</option>
                                    </select>
                                    <input type="text" name="id" value="${listaCategoria}" hidden>
                                </div></br>

                                <input type="text" name="id" value="${produto.idProduto}" hidden>
                                <div class="col-12">
                                    <div class="d-flex justify-content-center mt-5">
                                        <a href="ProdutoServlet?action=atendimentoAFuncionario" class="btn btn-danger w-25 mr-3" type="submit">Cancelar</a>
                                        <input class="btn btn-primary w-25 ml-3" type="submit" value="Cadastrar">
                                    </div>
                                </div> 
                            </form>
                        </div> 
                    </div>                           
                </section>            
            </div>
        </div>
    </body>
</html>
