<%-- 
    Document   : categorias
    Created on : 20 de jul. de 2022, 02:12:25
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


                <div class="col-md-10 bg-light">
                    <div class="col-md-12 mb-3 mt-5">
                        <h3>Categorias</h3>
                    </div>
                    <a class="btn btn-primary mb-3" href="ProdutoServlet?action=novaCategoria">
                        Cadastrar nova categoria
                    </a>
                    <div class="row p-3">
                        <div class="col-md-12">
                            <div class="card h-100 border-white shadow-sm">
                                <div class="card-body">
                                    <div class="row justify-content-between">
                                        <h5 class="text-muted pb-3">Listagem de categorias</h5>
                                    </div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>id Categoria</th>
                                                <th>Nome da categoria</th>
                                                <th>Editar/Excluir</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.listaCategorias}" var="c">
                                            <tr>
                                                <td><c:out value="${c.idCategoria}"/></td>
                                            <td><c:out value="${c.nomeCategoria}"/></td>
                                            <td>                                                
                                                <a class="button" href="ProdutoServlet?action=novaCategoria" class="mr-3"><button><i class="mdi mdi-pencil"></button></i></a>
                                                <a href="#" data-toggle="modal" data-target="#myModal"><button onclick="deleteId(${c.idCategoria})"><i class="mdi mdi-delete"></i></button></a>          
                                            </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
    </body>
</html>

<script>
    function deleteId(numero)
    {
        $("#save").click(function () {
            var idCategoria = numero;

            var id = "action=remove" + "&id=" + idCategoria;
            $('#myModal').modal('hide');
            $.ajax({
                type: "GET",
                url: "ProdutoServlet",
                data: id,
                success: function (result) {
                    location.reload();

                },
                error: function (error) {
                    console.log("error" + error);
                }
            });
        });
    }
</script>
