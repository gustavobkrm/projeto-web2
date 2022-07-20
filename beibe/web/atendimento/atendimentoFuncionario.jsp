<%-- 
    Document   : atendimentoFuncionario
    Created on : 20 de jul. de 2022, 02:20:43
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
                                        <h5 class="text-muted p-3">Lista de atendimentos</h5>
                                    </div>
                                    <section class="container-fluid">
                                        <div class='m-2'>
                                            <c:if test="${!empty todosAtendimentos}">
                            <table class=' table  text-center'>
                                <tr>
                                    <th>Data/hora</th>
                                    <th>Produto</th>
                                    <th>Nome do cliente</th>
                                    <th>Descrição</th>
                                     <c:if test="${loginBean.tipoUsuario == 'Funcionario'}">
                                       <th>Detalhes Atendimento</th>
                                     </c:if>
                                </tr>
                                <c:forEach items="${todosAtendimentos}" var="atendimento">
                                    <tr style="${atendimento.prioridade eq 1 and atendimento.situacao eq 'N' ? 'background-color:#ff3b3b' : 'background-color :#ffff73  '}" >
                                        <td id="dataAbertura"><fmt:parseDate value="${ atendimento.dataHoraAtendimento }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" />
                                        </td>
                                        <td><c:out value="${atendimento.produto.nomeProduto}" /></td>
                                        <td><c:out value="${atendimento.usuario.nomeUsuario}"/></td>
                                        <td><c:out value="${atendimento.descricaoAtendimento}"/></td>
                                        <td>
                                            <c:if test="${loginBean.tipoUsuario == 'Funcionario'}">
                                                <a class="mr-3" href="ProdutoServlet?action=resolucao"><button>
                                                    <i class="mdi mdi-comment-processing-outline"></i></button></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>
                                        </div>
                                        <c:if test="${empty todosAtendimentos}">
                                            <div class="text-center">
                                                <p class="m-5 text-secondary h4">Não há atendimentos.</p>  
                                            </div>    
                                        </c:if>
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
