/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.web2.beibe.dao;

import com.br.web2.beibe.bean.Atendimento;
import com.br.web2.beibe.bean.AtendimentoStatus;
import com.br.web2.beibe.bean.Produto;
import com.br.web2.beibe.bean.TipoAtendimento;
import com.br.web2.beibe.bean.Usuario;
import com.br.web2.beibe.facade.AtendimentoStatusFacade;
import jakarta.servlet.ServletException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author paula
 */
public class AtendimentoDAO {
    
    private static final String QUERY_NOVO_ATENDIMENTO = "INSERT INTO atendimento (idfk_usuario, idfk_status, idfk_produto, idfk_tipo_atendimento, descricao) VALUES (?, ?, ?, ?, ?)";
    private static final String QUERY_BUSCA_TODOS_POR_ID_USUARIO = "SELECT id, data_criacao, idfk_usuario, idfk_status, idfk_produto, idfk_tipo_atendimento FROM atendimento WHERE idfk_usuario = ? ORDER BY data_criacao DESC";
    private static final String QUERY_BUSCA_ATENDIMENTO_POR_ID = "SELECT id, data_criacao, idfk_usuario, idfk_status, idfk_produto, idfk_tipo_atendimento, descricao, solucao_apresentada FROM atendimento WHERE id = ?";
    private static final String QUERY_DELETA_ATENDIMENTO_POR_ID = "DELETE FROM atendimento WHERE id = ?";
    private Connection con = null;
    
    public AtendimentoDAO(Connection con) throws Exception {
        if (con == null) {
            throw new Exception("Conexão nula ao criar AtendimentoDAO.");
        }
        this.con = con;
    }
    
    public List<Atendimento> buscarTodosPorIdUsuario(Usuario usuario) throws ServletException, Exception {
        try (PreparedStatement st = con.prepareStatement(QUERY_BUSCA_TODOS_POR_ID_USUARIO)) {
            st.setInt(1, usuario.getId());
            ResultSet rs = st.executeQuery();
            List<Atendimento> listaAtendimento = new ArrayList<>();
            
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setId(Integer.valueOf(rs.getString("id")));
                atendimento.setDataCriacao(rs.getDate("data_criacao"));
                atendimento.setUsuario(usuario);
                listaAtendimento.add(atendimento);
            }
            
            return listaAtendimento;
        }
        catch(Exception ex) {
            throw new Exception("Erro ao listar atendimento ao usuário" + QUERY_BUSCA_TODOS_POR_ID_USUARIO, ex);
        }
    }
    
    /**
     *
     * @param id
     * @return
     * @throws DAOException
     * @throws CONException
     */
    public Atendimento buscarAtendimentoPorId(int id) throws  ServletException, Exception {
        try (PreparedStatement st = con.prepareStatement(QUERY_BUSCA_ATENDIMENTO_POR_ID)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            
            Atendimento atendimento = new Atendimento();
            if (rs.next()) {
                atendimento.setId(Integer.valueOf(rs.getString("id")));
                atendimento.setDataCriacao(rs.getDate("data_criacao"));    
                atendimento.setDescricao(rs.getString("descricao"));
            }
            
            return atendimento;
        }
        catch(Exception ex) {
            throw new Exception("Erro ao buscar atendimento por ID" + QUERY_BUSCA_ATENDIMENTO_POR_ID, ex);
        }
    }
    
    public void inserir(Atendimento atendimento) throws Exception {
        try (PreparedStatement st = con.prepareStatement(QUERY_NOVO_ATENDIMENTO)) {
            st.setInt(1, atendimento.getUsuario().getId());
            st.setInt(2, atendimento.getStatus().getId());
            st.setInt(3, atendimento.getProduto().getId());
            st.setInt(4, atendimento.getTipoAtendimento().getId());
            st.setString(5, atendimento.getDescricao());
            st.executeUpdate();
        }
        catch(Exception ex) {
            throw new Exception("Erro inserindo novo atendimento: " +
            QUERY_NOVO_ATENDIMENTO , ex);
        }
    }
    
    public void deletarAtendimentoPorId(int id) throws Exception {
        try (PreparedStatement st = con.prepareStatement(QUERY_DELETA_ATENDIMENTO_POR_ID)) {
            st.setInt(1, id);
            st.executeUpdate();
        }
        catch(SQLException ex) {
            throw new Exception("Erro deletando o atendimento: " +
            QUERY_DELETA_ATENDIMENTO_POR_ID , ex);
        }
    }
}
