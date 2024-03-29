/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.br.web2.beibe.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author paula
 */
@WebServlet(name = "ProdutoServlet", urlPatterns = {"/ProdutoServlet"})
public class ProdutoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            RequestDispatcher rd;

            String action = request.getParameter("action");
            switch (action) {
                case "inserirProduto": {
                    rd = getServletContext().getRequestDispatcher("/produtos.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "inserirCategoria": {
                    rd = getServletContext().getRequestDispatcher("/categorias.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "atendimentoFuncionario": {
                    rd = getServletContext().getRequestDispatcher("/atendimento/atendimentoFuncionario.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "atendimentoAFuncionario": {
                    rd = getServletContext().getRequestDispatcher("/atendimento/atendimentoAFuncionario.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "novoProduto": {
                    rd = getServletContext().getRequestDispatcher("/novoProduto.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "novaCategoria": {
                    rd = getServletContext().getRequestDispatcher("/novaCategoria.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "resolucao": {
                    rd = getServletContext().getRequestDispatcher("/resolucao.jsp");
                    rd.forward(request, response);
                    break;
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
