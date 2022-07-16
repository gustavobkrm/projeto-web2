<%-- 
    Document   : cadastro
    Created on : 12 de jul. de 2022, 14:51:19
    Author     : paula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BEIBE - CADASTRO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href='css/style.css'>
    </head>
    <body>
        <div class="container-fluid screen-color row justify-content-center w-100">
            <form class="ml-4 mr-4 card void-cadastro ">
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <h2>Cadastro</h2>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="nome">Nome</label>
                        <input type="email" class="form-control" id="nome" placeholder="Nome">
                    </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-12">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-12">
                    <label for="email">Senha</label>
                    <input type="password" class="form-control" id="senha" placeholder="Senha">
                  </div>
                </div>
                <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="senha">CPF</label>
                        <input type="text" class="form-control" id="senha" placeholder="CPF">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="telefone">Telefone</label>
                        <input type="text" class="form-control" id="telefone" placeholder="Telefone">
                    </div>
                </div>    
                <div class="form-row"> 
                   <div class="form-group col-md-6">
                     <label for="estado">Cidade</label>
                     <select id="estado" class="form-control">
                       <option selected>Escolher...</option>
                       <option>...</option>
                     </select>
                   </div>
                    <div class="form-group col-md-6">
                     <label for="estado">Estado</label>
                     <select id="estado" class="form-control">
                       <option selected>Escolher...</option>
                       <option>...</option>
                     </select>
                   </div>
                </div>  
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label for="rua">Endereço</label>
                        <input type="text" class="form-control" id="Endereço" >
                    </div>
                    <div class="form-group col-md-4">
                        <label for="numero">Numero</label>
                        <input type="email" class="form-control" id="numero" placeholder="Numero">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                      <label for="complemento">Complemento</label>
                      <input type="password" class="form-control" id="complemento" placeholder="Complemento">
                    </div>
                 </div>
                
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>
