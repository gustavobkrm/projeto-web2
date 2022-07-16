/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.web2.beibe.bean;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author paula
 */
public class Atendimento implements Serializable {
    
    private int id;
    private Date dataCriacao;
    private Usuario usuario;
    private AtendimentoStatus status;
    private Produto produto;
    private TipoAtendimento tipoAtendimento;
    private String descricao;
    private String solucaoApresentada;
    
    public Atendimento() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public AtendimentoStatus getStatus() {
        return status;
    }

    public void setStatus(AtendimentoStatus status) {
        this.status = status;
    }
    
    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public TipoAtendimento getTipoAtendimento() {
        return tipoAtendimento;
    }

    public void setTipoAtendimento(TipoAtendimento tipoAtendimento) {
        this.tipoAtendimento = tipoAtendimento;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getSolucaoApresentada() {
        return solucaoApresentada;
    }

    public void setSolucaoApresentada(String solucaoApresentada) {
        this.solucaoApresentada = solucaoApresentada;
    }
    
}
