package br.com.minimizze.api.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.hibernate.annotations.Fetch;

@NamedQueries({
		@NamedQuery(name = "Orcamento.consultarPorLista", query = "SELECT o FROM Orcamento o join fetch o.precoProduto WHERE o.listaCompra.id =:listaId ") })
@Entity
public class Orcamento{

	public ListaCompra getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(ListaCompra listaCompra) {
		this.listaCompra = listaCompra;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;

	private String nome;

	@ManyToMany(fetch = FetchType.EAGER)
	@Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)
	private List<PrecoProduto> precoProduto;

	@ManyToMany
	private List<PontoVenda> pontoVendas;

	@ManyToOne
	@JoinColumn(name = "listaCompra_id")
	private ListaCompra listaCompra;

	private boolean similar;

	public Long getId() {
		return Id;
	}

	@Column(name="preco_produto", nullable=false)
	public List<PrecoProduto> getPrecoProduto() {
		return precoProduto;
	}

	@Column(name="ponto_venda", nullable=false)
	public List<PontoVenda> getPontoVendas() {
		return pontoVendas;
	}

	public void setId(Long id) {
		Id = id;
	}

	public void setPrecoProduto(List<PrecoProduto> precoProduto) {
		this.precoProduto = precoProduto;
	}

	public void setPontoVendas(List<PontoVenda> pontoVendas) {
		this.pontoVendas = pontoVendas;
	}

	public boolean isSimilar() {
		return similar;
	}

	public void setSimilar(boolean similar) {
		this.similar = similar;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
