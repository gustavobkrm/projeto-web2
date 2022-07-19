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
                                <a class="dropdown-item" href="/beibe/AtendimentoServlet?action=list">Meus atendimentos</a>
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

                                <form class="w-100" action="ClienteServlet?action=${ac}" method="POST">

                                    <i class="fas fa-user p-2"></i><label > Nome do cliente: </label>
                                    <input class="form-control mb-3" type="text" name="nome" required value="${cliente.nomeUsuario}" minlength="5" maxlength="45"/>

                                    <i class="fas fa-passport p-2"></i><label> CPF do cliente : </label>
                                    <input  class="form-control mb-3 cpf" type="text" name="cpf" required value="${cliente.cpf}" minlength="11" maxlength="11"/>

                                    <i class="fas fa-envelope p-2"></i> <label> Email do cliente : </label>
                                    <input  class="form-control mb-3 email" type="text" name="email" required value="${cliente.email}"/>

                                    <i class="fas fa-envelope p-2"></i> <label> Senha : </label>
                                    <input  class="form-control mb-3 email" type="password" name="passwd" required  minlength="8" maxlength="8" value="${cliente.password}"/>

                                    <i class="fas fa-road p-2"></i> <label> Telefone: </label>
                                    <input  class="form-control mb-3 phone_with_ddd" type="text" name="telefone" required value="${cliente.telefone}" minlength="11" maxlength="11">

                                    <i class="fas fa-road p-2"></i> <label> Endereço : </label>
                                    <input  class="form-control mb-3" type="text" name="endereco" required value="${cliente.nomeRua}" minlength="5" maxlength="45">

                                    <i class="fas fa-unlock p-2"></i> <label> Número : </label>
                                    <input  class="form-control mb-3" type="text" name="nrua" required value="${cliente.numeroRua}">

                                    <i class="fas fa-road p-2"></i> <label> Complemento : </label>
                                    <input  class="form-control mb-3" type="text" name="complemento" required value="${cliente.complemento}" minlength="5" maxlength="45">

                                    <i class="fas fa-road p-2"></i> <label> Bairro : </label>
                                    <input  class="form-control mb-3" type="text" name="bairro" required value="${cliente.bairro}" minlength="5" maxlength="45">

                                    <i class="fas fa-map-marker-alt p-2"></i> <label> CEP : </label>
                                    <input  class="form-control mb-3 cep" type="text" name="cep" required value="${cliente.cep}" minlength="8" maxlength="8">

                                    <i class="fas fa-flag p-2"></i> <label> UF : </label>

                                    <select id="estado" name="estado" class="form-control">
                                        <option selected="selected">Selecione um estado</option>
                                        <c:forEach var="estado" items="${estados}">
                                            <option <c:out value=""/> value="<c:out value="${estado.idEstado}"/>"><c:out value="${estado.nomeEstado}"/></option>
                                        </c:forEach>
                                    </select></br>

                                    <i class="fas fa-city p-2"></i> <label> Cidade : </label>
                                    <select  class="form-control mb-3" type="text" id="cidade" name="cidade">
                                        <option selected value="<c:out value="${cliente.cidade.idCidade}"/>"><c:out value="${cliente.cidade.nomeCidade}"/></option
                                    </select></br>
                                    <input type="text" name="id" value="${cliente.idUsuario}" hidden>

                                    <div class="d-flex justify-content-center mt-5">
                                        <a href="../ClienteServlet" class="btn btn-danger w-25 mr-3" type="submit">Cancelar</a>
                                        <c:if test="${cliente.idUsuario==null}">
                                            <c:set var="valueButton" value="Save" />

                                        </c:if>
                                        <c:if test="${cliente.idUsuario!=null}">
                                            <c:set var="valueButton" value="Update" />
                                        </c:if>

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
