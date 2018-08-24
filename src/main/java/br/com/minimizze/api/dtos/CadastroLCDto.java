package br.com.minimizze.api.dtos;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import br.com.minimizze.api.entities.Orcamento;
import br.com.minimizze.api.entities.Produto;
import br.com.minimizze.api.entities.User;

public class CadastroLCDto extends AbstractEntityDto implements Serializable {

	private static final long serialVersionUID = -2916653125263688518L;

	private Long id;

	@NotNull
	@NotEmpty(message="Nome não Pode Ser Vazio.")
	private String nome;

	private List<Produto> produtos;

	private List<Orcamento> orcamentos;

	private User user;

	private boolean status;

	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public List<Orcamento> getOrcamentos() {
		return orcamentos;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	public void setOrcamentos(List<Orcamento> orcamentos) {
		this.orcamentos = orcamentos;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
