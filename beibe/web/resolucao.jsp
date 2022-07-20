<%-- 
    Document   : resolucao
    Created on : 20 de jul. de 2022, 02:55:56
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="pt">
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
                <div class="col-10 bg-light">
                    <div class="row p-3">
                        <div class="col-md-12">
                            <div class="card h-100 border-white shadow-sm">
                                <div class="card-body">
                                    <div class="row justify-content-between">
                                        <h5 class="text-muted p-3">Dados do atendimento</h5>
                                    </div>
                                    <section class="container-fluid">
                                        <div class='m-2'>
                                            <table class="table w-100">
                                                <tr>
                                                    <td>Id</td>
                                                    <td><c:out value="${atendimento.idAtendimento}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Data de atendimento </td>
                                                    <td>
                                                <fmt:parseDate value="${ atendimento.dataHoraAtendimento }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                                                <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" />
                                                </td>
                                                </tr>
                                                <tr>
                                                    <td>Atendimento Resolvido</td>
                                                    <td><c:out value="${atendimento.situacao}"></c:out></td>
                                                </tr>
                                                <tr>
                                                    <td>Descrição </td>
                                                    <td><c:out value="${atendimento.descricaoAtendimento}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Tipo de atendimento </td>
                                                    <td><c:out value="${atendimento.tipoAtendimento.nomeTipoAtendimento}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Produto </td>
                                                    <td><c:out value="${atendimento.produto.nomeProduto}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Nome do cliente</td>
                                                    <td><c:out value="${atendimento.usuario.nomeUsuario}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Solução Apresentada p/ atendimento</td>
                                                    <td><c:out value="${atendimento.solucaoApresentada}"/></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="justify-content-center col-12">
                                            <a href='ProdutoServlet?action=atendimentoAFuncionario' class='btn btn-primary col-1 ml-2' style='float: right; '>Voltar</a>

                                            <c:if test="${atendimento.situacao == 'N'}">
                                                <button data-toggle="modal"data-target="#myModal" class='btn btn-danger col-1 ml-2 ' id="idAtendimento" value="${atendimento.idAtendimento}">Delete</button>
                                            </c:if>
                                        </div>
                                    </section>                              
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>          
            </div>
        </div>
    </body>
</html>

<script>
    $("#save").click(function () {

        var idAtendimento = $("#idAtendimento").val();
        var id = "action=remove" + "&id=" + idAtendimento;

        $('#myModal').modal('hide');
        $.ajax({
            type: "GET",
            url: "ProdutoServlet",
            data: id,
            success: function (result) {
                window.location.replace("/beibe/ProdutoServlet?action=atendimentoAFuncionario");
            },
            error: function (error) {
                console.log("error" + error);
            }
        });
    });</script>

