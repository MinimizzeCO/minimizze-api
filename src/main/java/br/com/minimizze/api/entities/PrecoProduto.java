package br.com.minimizze.api.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;

@NamedQueries({
		@NamedQuery(name = "PrecoProduto.menorPrecoProduto", 
				query = "SELECT preProduto FROM PrecoProduto preProduto WHERE preProduto.produto.id =:id AND preProduto.preco = (SELECT min(preProduto2.preco) FROM PrecoProduto preProduto2 WHERE preProduto2.produto.id = :id)"),
		
		@NamedQuery(name = "PrecoProduto.menorPrecoProdutoPorPontoVenda", 
				query = "SELECT preProduto FROM PrecoProduto preProduto WHERE preProduto.produto.id =:id AND preProduto.preco = (SELECT min(preProduto2.preco) FROM PrecoProduto preProduto2 WHERE preProduto2.produto.id = :id AND preProduto2.pontoVenda.id IN :pvs)"),
		
		@NamedQuery(name = "PrecoProduto.menorPrecoProdutoPorSimilar", 
				query = "SELECT preProduto FROM PrecoProduto preProduto WHERE preProduto.preco = (SELECT min(preProduto2.preco) FROM PrecoProduto preProduto2 WHERE preProduto2.produto.id IN :similaresIds)") })

@Entity
public class PrecoProduto{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@OneToOne
	private Produto produto;

	@OneToOne
	private PontoVenda pontoVenda;

	private Double preco;

	@OneToOne
	private User user;

	private Boolean valido;

	private int pontuacao;

	@PrePersist
	public void setValido() {
		this.setValido(true);
	}

	public Long getId() {
		return id;
	}

	public Produto getProduto() {
		return produto;
	}

	public PontoVenda getPontoVenda() {
		return pontoVenda;
	}

	public Double getPreco() {
		return preco;
	}

	public User getUser() {
		return user;
	}

	public Boolean getValido() {
		return valido;
	}

	public int getPontuacao() {
		return pontuacao;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public void setPontoVenda(PontoVenda pontoVenda) {
		this.pontoVenda = pontoVenda;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setValido(Boolean valido) {
		this.valido = valido;
	}

	public void setPontuacao(int pontuacao) {
		this.pontuacao = pontuacao;
	}

}
