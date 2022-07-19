<%-- 
    Document   : listarFuncionario
    Created on : 19 de jul. de 2022, 02:23:44
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                        <c:if test="${ nivel eq 1 }" var="res">
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-home-outline"></span>
                                <a href="/beibe/gerente.jsp">Dashboard</a>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-account-multiple-outline"></span>
                                <a href="/beibe/funcionario/listarFuncionario.jsp">Funcionário/Gerente</a>
                            </li>
                        </c:if>
                        <c:if test="${ nivel eq 1 }" var="res">
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-file-document"></span>
                                <a href="AtendimentoServlet?action=listarAtendimentos">Atendimentos</a>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-file-document"></span>
                                <a href="AtendimentoServlet?action=listarAtendimentosAbertos">Atendimentos em aberto</a>
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
                                        <h5 class="text-muted p-3">Lista de atendimentos</h5>
                                    </div>
                                    <section class="container-fluid">
                                        <div class='m-2'>
                                            <div class="d-flex">
                                                <a href='./GerenteServlet?action=create' class='btn btn-primary col-md-1 m-2'>Cadastrar Funcionário</a>
                                            </div>
                                            <c:choose>
                                                <table class='table w-100 text-center'>    
                                                    <tr>
                                                        <th>Id Funcionário</th>
                                                        <th>Nome do funcionário</th>
                                                        <th>CPF</th>
                                                        <th>Email</th>
                                                        <th>Cargo</th>
                                                        <th style="width: 20%">Ver/Editar/Excluir</th>
                                                    </tr>
                                                    <c:when>
                                                        <c:forEach items="${listaFuncionarios}" var="funcionario">
                                                            <tr>
                                                                <td><c:out value="${funcionario.idUsuario}"/></td>
                                                            <td><c:out value="${funcionario.nomeUsuario}"/></td>
                                                            <td><c:out value="${funcionario.cpf}"/></td>
                                                            <td><c:out value="${funcionario.email}"/></td>
                                                            <td><c:out value="${funcionario.tipoUsuario}"/></td>

                                                            <td style="width: 20%"> 
                                                                <a class="button" href="FuncionarioServlet?action=show&id=${funcionario.idUsuario}" class="mr-1"><i class="mdi mdi-eye"></i></a>
                                                                <a class="button" href="FuncionarioServlet?action=formUpdate&id=${funcionario.idUsuario}" class="mr-1"><i class="mdi mdi-pencil"></i></a>
                                                            <c:if test="${loginBean.id != funcionario.idUsuario}">
                                                                <a href="#" data-toggle="modal" data-target="#myModal" ><button onclick="deleteId(${funcionario.idUsuario})"  ><i class="mdi mdi-delete"></i></button></a>  
                                                            </c:if>
                                                            </td>
                                                            </tr>
                                                        </c:forEach>
                                                </table>
                                        </div>
                                        </c:when> 
                                        <c:otherwise test="${empty listaFuncionarios}" >
                                            <div class="text-center">
                                                <p class="m-5 text-secondary h4">Nenhum funcionário cadastrado.</p>  
                                            </div>    
                                        </c:otherwise>
                                        </c:choose>
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
function deleteId(numero)
    {

        $("#save").click(function() {
            var idFuncionario = numero;

            var id = "action=remove" + "&id=" + idFuncionario;
            $('#myModal').modal('hide');
            $.ajax({
                type: "GET",
                url: "ProdutoServlet",
                data: id,
                success: function(result) {
                    location.reload();

                },
                error: function(error) {
                    console.log("error" + error);
                }
            });
        });
    }
</script>
