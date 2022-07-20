/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.br.web2.beibe.servlet;

import com.br.web2.beibe.bean.Atendimento;
import com.br.web2.beibe.bean.Usuario;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author paula
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        if (email.isEmpty() || senha.isEmpty()) {
            request.setAttribute("mensagem", "Nenhum campo pode estar vazio");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
            return;
        }
        
        try {
            Usuario usuario = new Usuario();
            int nivel = 1;
            
            if (email.equals(senha)) {
                HttpSession session = request.getSession();
                usuario.setSenha(null);
                session.setAttribute("logado", true);
                session.setAttribute("usuario", usuario);
                switch (nivel) {
                    case 1:
                        {
                            response.sendRedirect("gerente.jsp");
                            return;
                        }
                    case 2:
                        {
                            response.sendRedirect("funcionario.jsp");
                            return;
                        }
                    case 3:
                        {  
                            RequestDispatcher rd = request.getRequestDispatcher("cliente.jsp");
                            rd.forward(request, response);
                            return;
                        }
                    default: 
                        {
                            request.setAttribute("mensagem", "Não foi possível identificar usuário!");
                            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                            rd.forward(request, response);
                            return;
                        }
                }
            }
            request.setAttribute("mensagem", "E-mail ou senha incorretos!");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } catch(Exception  err){
            System.out.println(err);
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
