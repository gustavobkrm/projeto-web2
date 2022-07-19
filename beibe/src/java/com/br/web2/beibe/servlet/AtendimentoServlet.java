/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.br.web2.beibe.servlet;

import com.br.web2.beibe.bean.Atendimento;
import com.br.web2.beibe.bean.AtendimentoStatus;
import com.br.web2.beibe.bean.Produto;
import com.br.web2.beibe.bean.TipoAtendimento;
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

/**
 *
 * @author paula
 */
@WebServlet(name = "AtendimentoServlet", urlPatterns = {"/AtendimentoServlet"})
public class AtendimentoServlet extends HttpServlet {

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
        
            String action = request.getParameter("action");
        
        if (action == null) {
            request.setAttribute("mensagem", "Invocação inválida: action é nulo");
            RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
            rd.forward(request, response);
            return;
        }
        
        switch (action) {
            case "create": 
                {
                    HttpSession session = request.getSession();
                    
                    try {
                       String tipoAtendimentoJsp = request.getParameter("tipoAtendimento");
                       String produtoJsp = request.getParameter("produto");
                       String descricao = request.getParameter("descricao");
   

                       response.sendRedirect("atendimento/atendimento.jsp");
                       return;
                   } catch (IOException | NumberFormatException  ex) {
                       session.setAttribute("mensagemErro", ex.getMessage());
                       response.sendRedirect("modules/cliente/portalClienteMsg.jsp");
                       return;
                   }
                }
            case ("maisInformacoes"):
                {
                    try {
                        String id = request.getParameter("id");

                        if (id == null) {
                            request.setAttribute("mensagem", "Invocação inválida: ID é nulo");
                            RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
                            rd.forward(request, response);
                            return;
                        }

                        int idAtendimento = Integer.parseInt(id);
               //         Atendimento atendimento = AtendimentoFacade.buscarPorId(idAtendimento);

                    //    request.setAttribute("atendimento", atendimento);  
                        RequestDispatcher rd = request.getRequestDispatcher("modules/cliente/atendimentoMaisInformacoes.jsp");
                        rd.forward(request, response);
                        return;
                    } catch (ServletException | IOException | NumberFormatException ex) {
                        request.setAttribute("mensagemErro", ex.getMessage());
                        RequestDispatcher rd = request.getRequestDispatcher("modules/cliente/portalClienteMsg.jsp");
                        rd.forward(request, response);
                        return;
                    }
                }
            case ("removerAtendimento"):
                {
                    try {
                        String id = request.getParameter("id");

                        if (id == null) {
                            request.setAttribute("mensagem", "Invocação inválida: ID é nulo");
                            RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
                            rd.forward(request, response);
                            return;
                        }

                        int idAtendimento = Integer.parseInt(id);
                   //     AtendimentoFacade.deletarAtendimentoPorId(idAtendimento);

                        HttpSession session = request.getSession();    
                        session.setAttribute("mensagemSucesso", "Atendimento removido com sucesso - ID: " + id );
                        session.setAttribute("pagina", "modules/cliente/listarAtendimentos.jsp");
                        response.sendRedirect("modules/cliente/portalClienteMsg.jsp");
                        return;
                    } catch (ServletException | IOException | NumberFormatException ex) {
                        request.setAttribute("mensagemErro", ex.getMessage());
                        RequestDispatcher rd = request.getRequestDispatcher("modules/cliente/portalClienteMsg.jsp");
                        rd.forward(request, response);
                        return;
                    }
                }
            
            default:
                {
                    request.setAttribute("mensagem", "Erro ao encontrar a action: " + action);
                    request.setAttribute("pagina", "index.jsp");
                    RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
                    rd.forward(request, response);
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
