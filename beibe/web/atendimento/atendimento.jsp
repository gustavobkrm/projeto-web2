<%-- 
    Document   : atendimento
    Created on : 18 de jul. de 2022, 23:12:12
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
                <div class="container mt-5">
            <div class="container mt-5">
                <div class="d-flex justify-content-center m-5">
                    <h4>Cadastro de Atendimento</h4>
                </div>
            </div>

            <div class="col-12 m-5">
                <form action="AtendimentoServlet?action=new" method="POST">
                    <i class="fas fa-user p-2"></i><label for="tipoAtendimento"> Selecione o tipo de atendimento:</label>
                    <select id="tipoAtendimento" name="tipoAtendimento" class="form-control">
                        <option selected="selected">Selecione o tipo de Atendimento</option>
                        <c:forEach var="tipoAtendimento" items="${listaTiposAtendimentos}">
                            <option value="${tipoAtendimento.idTipoAtendimento }">${tipoAtendimento.nomeTipoAtendimento}</option>
                        </c:forEach>
                    </select></br>

                    <i class="fas fa-tag p-2"></i><label for="produto"> Selecione o tipo de produto:</label>
                    <select id="produto" name="produto" class="form-control">
                        <option selected="selected">Selecione o tipo de Produto</option>
                        <c:forEach var="produto" items="${listaProdutos}">
                            <option value="${produto.idProduto}">${produto.nomeProduto}</option>
                        </c:forEach>
                    </select></br>


                    <i class="fas fa-user p-2"></i><label for="descricao"> Informe a descrição do atendimento:</label>
                    <textarea class="form-control mb-3" name="descricao" rows="4" cols="50" required minlength="10" maxlength="255"></textarea>


                    <jsp:useBean id="data" class="java.util.Date"/>
                    <i class="far fa-clock p-2"></i><label for="dataAtendimento"> Hora do atendimento: </label>
                    <input type="datetime" name="dataAtendimento" readonly="true" class="form-control" value="<fmt:formatDate value="${data}" pattern="dd/MM/yyyy HH:mm"/>
                    
                    <div class="d-flex justify-content-center mt-5" style="margin-bottom: 150px;">
                        <a href="/beibe/cliente.jsp" class="btn btn-danger w-25 mr-3"  value="Cancelar"> Cancelar</a>
                        <input class="btn btn-primary w-25 mr-3" type="submit" value="Salvar"></a>
                    </div>
                </form>
            </div>

        </div>
            </div>
        </div>
    </body>
</html>
