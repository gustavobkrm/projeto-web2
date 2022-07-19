<%-- 
    Document   : cliente
    Created on : 18 de jul. de 2022, 02:45:43
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html lang="pt">
        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
            <title>BEIBE</title>   
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.5.55/css/materialdesignicons.min.css"/>
            <script type="text/javascript">
                function remove(e) {
                    if (!confirm('Deseja excluir esse cliente?')) {
                        e.preventDefault();
                    }
                }
            </script>

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
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-home-outline"></span>
                                <a href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Atendimentos
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="AtendimentoServlet?action=create">Criar atendimento</a>
                                    <a class="dropdown-item" href="AtendimentoServlet?action=list">Meus atendimentos</a>
                                </div>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-account-outline"></span>
                                <a href="ClienteServlet?action=buscaUsuario">Perfil</a>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-logout"></span>
                                <a href="LogoutServlet">Logout</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-10 bg-light">
                        <div class="col-md-12 mb-3 mt-5">
                            <h3>Bem vindo ${login.getNome()} </h3>
                        </div>
                        <div class="row p-3">
                            <div class="col-md-12">
                                <div class="card h-100 border-white shadow-sm">
                                    <div class="card-body">
                                        <div class="row justify-content-between">
                                            <h5 class="text-muted pb-3">Lista de atendimentos</h5>
                                        </div>
                                        <c:if test="${ sessionScope.login.perfil eq 3 }" var="res">
                                            <a class="btn btn-primary mb-3" href="AtendimentoServlet?action=create">Novo atendimento</a>
                                        </c:if>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Data</th>
                                                    <th scope="col">Cliente</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Produto</th>
                                                    <th scope="col">Tipo atendimento</th>
                                                    <th scope="col">Descrição</th>
                                                    <th scope="col">Solução</th>
                                                    <th scope="col"></th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="atend" items="${atendimentos}">
                                                <tr>
                                                    <td><fmt:formatDate value="${atend.dataCriacao}" pattern="dd/MM/yyyy"/></td>
                                                <td>${atend.cliente.nome}</td>
                                                <td>${atend.status}</td>
                                                <td>${atend.produto.nome}</td>
                                                <td>${atend.tipo.nome}</td>
                                                <td>${atend.descricao}</td>
                                                <td>${atend.solucao}</td>
                                                <td>
                                                    <a class="text-dark" href="AtendimentoServlet?action=visualizarAtendimento&id=${atend.idAtendimento}">
                                                        <span class="mdi mdi-file-outline" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="text-dark" onclick="remove(event)" href="AtendimentoServlet?action=removeAtendimento&id=${atend.idAtendimento}" ${atend.status=='Finalizado'?'hidden':''}>
                                                        <span class="mdi mdi-delete" />
                                                    </a>
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
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
        </body>
    </html>
