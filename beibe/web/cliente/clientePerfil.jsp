<%-- 
    Document   : clientePerfil
    Created on : 19 de jul. de 2022, 00:44:58
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;" charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <title>BEIBE</title>   
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.5.55/css/materialdesignicons.min.css"/>
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
            <div class="row" style="min-height: 100vh"">
                <div class="col-md-2 p-0 bg-dark">
                    <h2 class="pl-3 pt-3 mb-0 text-white">BEIBE</h2>
                    <ul class="list-group list-group-flush pt-3 sticky-top">
                        <li class="bg-dark list-group-item list-group-item-action">
                            <span class="mdi mdi-home-outline"></span>
                            <a href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Atendimentos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="/beibe/AtendimentoServlet?action=create">Criar atendimento</a>
                                <a class="dropdown-item" href="/beibe/cliente.jsp">Meus atendimentos</a>
                            </div>
                        </li>
                        <li class="bg-dark list-group-item list-group-item-action">
                            <span class="mdi mdi-account-outline"></span>
                            <a href="UsuarioServlet?action=buscaUsuario">Perfil</a>
                        </li>
                        <li class="bg-dark list-group-item list-group-item-action">
                            <span class="mdi mdi-logout"></span>
                            <a href="/beibe/LogoutServlet">Logout</a>
                        </li>
                    </ul>
                </div>
                
                <section class="site-section bg-light col-md-10">
                    <div class="container mt-5">
                        <div class="d-flex justify-content-center">
                            <h4>Perfil</h4>
                        </div>

                        <div class="col-12 d-flex justify-content-center mb-5">
                            <div class="col-8">

                                <form class="w-100 row" action="ClienteServlet?action=${ac}" method="POST">
                                    <div class="col-12">
                                        <label > Nome completo </label>
                                        <input class="form-control mb-3" type="text" name="nome" required value="${cliente.nomeUsuario}" minlength="5" maxlength="45"/>
                                    </div>
                                    <div class="col-12">
                                        <label> CPF </label>
                                        <input  class="form-control mb-3 cpf" type="text" name="cpf" required value="${cliente.cpf}" minlength="11" maxlength="11"/>
                                    </div>
                                    <div class="col-6">
                                        <label> Email </label>
                                        <input  class="form-control mb-3 email" type="text" name="email" required value="${cliente.email}"/>
                                    </div>
                                    <div class="col-6">
                                        <label> Senha </label>
                                        <input  class="form-control mb-3 email" type="password" name="passwd" required  minlength="8" maxlength="8" value="${cliente.password}"/>
                                    </div>
                                    <div class="col-12">
                                        <label> Telefone </label>
                                        <input  class="form-control mb-3 phone_with_ddd" type="text" name="telefone" required value="${cliente.telefone}" minlength="11" maxlength="11">
                                    </div>
                                    <div class="col-8">
                                        <label> Endereço </label>
                                        <input  class="form-control mb-3" type="text" name="endereco" required value="${cliente.nomeRua}" minlength="5" maxlength="45">
                                    </div>
                                    <div class="col-4">
                                        <label> Número </label>
                                        <input  class="form-control mb-3" type="text" name="nrua" required value="${cliente.numeroRua}">
                                    </div>
                                    <div class="col-12">
                                        <label> Complemento </label>
                                        <input  class="form-control mb-3" type="text" name="complemento" required value="${cliente.complemento}" minlength="5" maxlength="45">
                                    </div>
                                    <div class="col-6">
                                        <label> CEP </label>
                                        <input  class="form-control mb-3 cep" type="text" name="cep" required value="${cliente.cep}" minlength="8" maxlength="8">
                                    </div>
                                    <div class="col-6">
                                        <label> Bairro </label>
                                        <input  class="form-control mb-3" type="text" name="bairro" required value="${cliente.bairro}" minlength="5" maxlength="45">
                                    </div>
                                    <div class="col-6">
                                        <label> UF </label>
                                        <input  class="form-control mb-3" type="text" name="uf" required value="${cliente.estado}" minlength="4" maxlength="45">
                                    </div>
                                    <div class="col-6">
                                    <label> Cidade </label>
                                    <input  class="form-control mb-3" type="text" name="cidade" required value="${cliente.cidade}" minlength="4" maxlength="45">
                                    </div>
                                    <div class="d-flex justify-content-center mt-5 col-12">
                                        <a href="./cliente.jsp" class="btn btn-danger w-25 mr-3" type="submit">Cancelar</a>
                                        <input class="btn btn-primary w-25 ml-3" type="submit" value="Salvar"> 
                                    </div>             
                                </form>
                            </div> 
                        </div> 
                    </div>
                </section>
                
            </div>
        </div>
    </body>
</html>
