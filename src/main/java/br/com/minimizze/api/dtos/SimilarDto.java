package br.com.minimizze.api.dtos;

import java.util.List;

import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import br.com.minimizze.api.entities.User;

public class SimilarDto extends AbstractEntityDto {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@NotNull
	@ManyToOne	
	private ProdutoDto produtoOrigem;
	
	@NotNull
	@ManyToMany(fetch=FetchType.EAGER)
	private List<ProdutoDto> produtosSimilares;
		
	@NotNull
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	public Long getId() {
		return id;
	}

	public ProdutoDto getProdutoOrigem() {
		return produtoOrigem;
	}

	public List<ProdutoDto> getProdutosSimilares() {
		return produtosSimilares;
	}

	public User getUser() {
		return user;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setProdutoOrigem(ProdutoDto produtoOrigem) {
		this.produtoOrigem = produtoOrigem;
	}

	public void setProdutosSimilares(List<ProdutoDto> produtosSimilares) {
		this.produtosSimilares = produtosSimilares;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
