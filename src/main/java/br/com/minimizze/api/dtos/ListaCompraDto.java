package br.com.minimizze.api.dtos;

import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import br.com.minimizze.api.entities.Orcamento;
import br.com.minimizze.api.entities.Produto;
import br.com.minimizze.api.entities.User;

public class ListaCompraDto extends AbstractEntityDto {

	private Long id;

	@NotNull
	@NotEmpty(message="Name não Pode Ser Vazio.")
	private String name;
	private List<Produto> produtos;

	private List<Orcamento> orcamentos;

	private User user;

	private boolean status;

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
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

	public void setName(String name) {
		this.name = name;
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
