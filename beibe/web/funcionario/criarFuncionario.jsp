<%-- 
    Document   : criarFuncionario
    Created on : 19 de jul. de 2022, 02:27:26
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
                                <a href="GerenteServlet?action=dashboard">Dashboard</a>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-account-multiple-outline"></span>
                                <a href="GerenteServlet?action=list">Funcionário/Gerente</a>
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

                <section class="bg-light col-md-10">
                    <div class="container mt-5">
                        <div class="d-flex justify-content-center">
                            <h1>Cadastro</h1>
                        </div>
                        <div class=" d-flex justify-content-center">
                            <form class="w-100 row" action="FuncionarioServlet?action=${ac}" method="POST">
                                <div class="col-12">
                                    <label > Nome completo </label>
                                    <input class="form-control mb-3" type="text" name="nome" required value="${funcionario.nomeUsuario}" minlength="5" maxlength="45"/>
                                </div>
                                <div class="col-12">
                                    <label> CPF </label>
                                    <input  class="form-control mb-3 cpf" type="text" name="cpf" required value="${funcionario.cpf}" minlength="11" maxlength="11"/>
                                </div>   
                                <div class="col-6">    
                                    <label> Email </label>
                                    <input  class="form-control mb-3 email" type="text" name="email" required value="${funcionario.email}"/>
                                </div>    
                                <div class="col-6">    
                                    <label> Senha </label>
                                    <input  class="form-control mb-3 email" type="password" name="passwd" required  minlength="8" maxlength="8" value="${funcionario.password}"/>
                                </div>   
                                <div class="col-12">
                                    <label> Telefone </label>
                                    <input  class="form-control mb-3 phone_with_ddd" type="text" name="telefone" required value="${funcionario.telefone}" minlength="11" maxlength="11">
                                </div>    
                                <div class="col-8">    
                                    <label> Endereço </label>
                                    <input  class="form-control mb-3" type="text" name="endereco" required value="${funcionario.nomeRua}" minlength="5" maxlength="45">
                                </div>
                                <div class="col-4">
                                    <label> Número </label>
                                    <input  class="form-control mb-3" type="text" name="nrua" required value="${funcionario.numeroRua}">
                                </div>
                                <div class="col-12">
                                    <label> Complemento </label>
                                    <input  class="form-control mb-3" type="text" name="complemento" required value="${funcionario.complemento}" minlength="5" maxlength="45">
                                </div>
                                <div class="col-6">
                                    <label> Bairro </label>
                                    <input  class="form-control mb-3" type="text" name="bairro" required value="${funcionario.bairro}" minlength="5" maxlength="45">
                                </div>
                                <div class="col-6">
                                    <label> CEP </label>
                                    <input  class="form-control mb-3 cep" type="text" name="cep" required value="${funcionario.cep}" minlength="8" maxlength="8">
                                </div>
                                <div class="col-6">
                                    <label> UF </label>
                                    <input  class="form-control mb-3" type="text" name="uf" required value="${funcionario.uf}" minlength="2" maxlength="8">
                                </div>
                                <div class="col-6">
                                    <label> Cidade </label>
                                    <input  class="form-control mb-3" type="text" name="cidade" required value="${funcionario.cidade}" minlength="2" maxlength="45">
                                </div>
                                <div class="col-12">
                                    <label for="cargo"> Cargo </label>
                                    <select class="form-control mb-3" type="text" id="cargo" name="cargo">
                                        <option value="Funcionario">Funcionário</option>
                                        <option value="Gerente">Gerente</option>
                                    </select>
                                    <input type="text" name="id" value="${funcionario.idUsuario}" hidden>
                                </div>
                                <div class="col-12">
                                    <div class="d-flex justify-content-center mt-5">
                                        <a href="GerenteServlet?action=list" class="btn btn-danger w-25 mr-3" type="submit">Cancelar</a>
                                        <input class="btn btn-primary w-25 ml-3" type="submit" value="Salvar"> 
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
