/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.web2.beibe.facade;

import com.br.web2.beibe.bean.Atendimento;
import com.br.web2.beibe.bean.Usuario;
import com.br.web2.beibe.dao.AtendimentoDAO;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author paula
 */
public class AtendimentoFacade {
    
    public static List<Atendimento> buscarTodosPorIdUsuario(Usuario usuario) throws ServletException, Exception {
        try {
            AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
            return atendimentoDAO.buscarTodosPorIdUsuario(usuario);
        } catch (Exception ex) {
            throw new Exception("Não foi possível encontrar os atendimentos do usuário", ex);
        }
    }
    
    public static void criarNovoAtendimento(Atendimento atendimento) throws ServletException, Exception {
        try {
            AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
            atendimentoDAO.inserir(atendimento);
        } catch (Exception ex) {
            throw new Exception("Não foi possível criar novo atendimento!", ex);
        }
    }
    
    public static Atendimento buscarPorId(int id) throws ServletException, Exception {
        try {
            AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
            return atendimentoDAO.buscarAtendimentoPorId(id);       
        } catch (Exception ex) {
            throw new Exception("Não foi possível encontrar atendimento para o ID: " + "/ " + id, ex);
        }
    }
    
    public static void deletarAtendimentoPorId(int id) throws ServletException, Exception {
        try {
            AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
            atendimentoDAO.deletarAtendimentoPorId(id);
        } catch (Exception ex) {
            throw new Exception("Não foi possível deletar o atendimento!", ex);
        }
    }
}
