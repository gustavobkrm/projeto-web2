<%-- 
    Document   : gerente
    Created on : 18 de jul. de 2022, 00:18:46
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
                                <a href="GerenteServlet?action=listarUsuarios">Usuarios</a>
                            </li>
                        </c:if>
                        <c:if test="${ nivel eq 1 || nivel eq 2 }" var="res">
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-file-document"></span>
                                <a href="AtendimentoServlet?action=listarAtendimentos">Atendimentos</a>
                            </li>
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-file-document"></span>
                                <a href="AtendimentoServlet?action=listarAtendimentosAbertos">Atendimentos em aberto</a>
                            </li>
                        </c:if>
                        <c:if test="${ nivel eq 2 }" var="res">
                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-account-multiple-outline"></span>
                                <a href="ProdutosServlet?action=inserirProduto">Cadastro Produtos</a>
                            </li>


                            <li class="bg-dark list-group-item list-group-item-action">
                                <span class="mdi mdi-account-multiple-outline"></span>
                                <a href="ProdutosServlet?action=inserirCategoria">Cadastro Categorias </a>
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
                        <h3>Dashboard</h3>
                        <c:forEach var="tipo" items="${atendimentostipos}">
                            <h1> ${tipo.nome}: ${tipo.quantidadeAbertos}/${tipo.quantidade} </h1>
                        </c:forEach>
                    </div>
                    <div class="row p-3">
                        <div class="col-md-6">
                            <div class="card border-white shadow-sm">
                                <div class="card-body">
                                    <div class="row justify-content-between">
                                        <h5 class="text-muted pb-3">Atendimentos abertos</h5>
                                        <form method="POST" action="GeradorRelatorio?action=atendimentosabertos">
                                            <a type="submit" href="GeradorRelatorio?action=atendimentosabertos">
                                               <span class="mdi mdi-file-pdf-outline" style="font-size: 30px" ></span>
                                            </a>
                                            <div class="row">
                                                <input type='date' class="form-control col-md-5" name="datai" >
                                                <input type='date' class="form-control col-md-5" name="dataf" >
                                            </div>
                                        </form>
                                    </div>
                                    <canvas id="atendimentosAbertos"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card border-white shadow-sm">
                                <div class="card-body">
                                    <div class="row justify-content-between">
                                        <h5 class="text-muted pb-3">Reclamações</h5>
                                        <a href="#">
                                            <span
                                                class="mdi mdi-file-pdf-outline"
                                                style="font-size: 30px"
                                                ></span>
                                        </a>
                                    </div>
                                    <canvas id="reclamacoes"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-3">
                        <div class="col-md-8">
                            <div class="card h-100 border-white shadow-sm">
                                <div class="card-body">
                                    <div class="row justify-content-between">
                                        <h5 class="text-muted pb-3">Funcionários</h5>
                                        <a href="GeradorRelatorio?action=funcionarios">
                                            <span
                                                class="mdi mdi-file-pdf-outline"
                                                style="font-size: 30px"
                                                ></span>
                                        </a>
                                    </div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Nome</th>
                                                <th scope="col">CPF</th>
                                                <th scope="col">Telefone</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Paula</td>
                                                <td>000.000.000-00</td>
                                                <td>41 99000-0000</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>Gustavo</td>
                                                <td>000.000.000-00</td>
                                                <td>41 99000-0000</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>Larissa</td>
                                                <td>000.000.000-00</td>
                                                <td>41 99000-0000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card h-100 border-white shadow-sm">
                                <div class="card-body">
                                    <div class="row justify-content-between">
                                        <h5 class="text-muted pb-3">Produtos</h5>
                                        <a href="#">
                                            <span
                                                class="mdi mdi-file-pdf-outline"
                                                style="font-size: 30px"
                                                ></span>
                                        </a>
                                    </div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Nome</th>
                                                <th scope="col">Numero Reclamações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Produto 1</td>
                                                <td>39</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>Produto 2</td>
                                                <td>26</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>Produto 3</td>
                                                <td>5</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
        <script>
            let atendimentosAbertos = document
                    .getElementById("atendimentosAbertos")
                    .getContext("2d");
            let reclamacoes = document.getElementById("reclamacoes").getContext("2d");

            let chart = new Chart(atendimentosAbertos, {
                type: "bar",
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    suggestedMin: 0,
                                },
                            },
                        ],
                    },
                },
                data: {
                    datasets: [
                        {
                            label: "Atendimentos totais",
                            data: [${atendimentostotais}],
                            backgroundColor: "rgba(66, 135, 245, 0.31)",
                            borderColor: "#4287f5",
                        },
                        {
                            label: "Atendimentos abertos",
                            data: [${atendimentosabertos}],
                            backgroundColor: "rgba(232, 226, 63, 0.31)",
                            borderColor: "#E8E23F",
                        }
                    ]
                }
            });

            let chart2 = new Chart(reclamacoes, {
                type: "bar",
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    suggestedMin: 0,
                                },
                            },
                        ],
                    },
                },
                data: {
                    datasets: [
                        {
                            label: "Total",
                            data: [${reclamacoestotais}],
                            backgroundColor: "rgba(66, 135, 245, 0.31)",
                            borderColor: "#4287f5",
                        },
                        {
                            label: "Finalizadas",
                            data: [${reclamacoesfinalizadas}],
                            backgroundColor: "rgba(63, 232, 102, 0.31)",
                            borderColor: "#3FE866",
                        },
                        {
                            label: "Em Aberto",
                            data: [${reclamacoesabertas}],
                            backgroundColor: "rgba(232, 226, 63, 0.31)",
                            borderColor: "#E8E23F",
                        },
                    ],
                },
            });

        </script>
    </body>
</html>
