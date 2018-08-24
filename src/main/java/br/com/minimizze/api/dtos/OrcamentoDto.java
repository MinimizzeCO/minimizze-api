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

import org.hibernate.annotations.Fetch;

public class OrcamentoDto{

	public ListaCompraDto getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(ListaCompraDto listaCompra) {
		this.listaCompra = listaCompra;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;
	
	@NotNull
	private String nome;
	
	@NotNull
	@ManyToMany(fetch = FetchType.EAGER)
	@Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)
	private List<PrecoProdutoDto> precoProduto;
	
	@ManyToMany
	private List<PontoVendaDto> pontoVendas;
	
	@ManyToOne
	@JoinColumn(name="listaCompra_id")
	private ListaCompraDto listaCompra;
	
	private boolean similar;

	public Long getId() {
		return Id;
	}

	public List<PrecoProdutoDto> getPrecoProduto() {
		return precoProduto;
	}

	public List<PontoVendaDto> getPontoVendas() {
		return pontoVendas;
	}

	public void setId(Long id) {
		Id = id;
	}

	public void setPrecoProduto(List<PrecoProdutoDto> precoProduto) {
		this.precoProduto = precoProduto;
	}

	public void setPontoVendas(List<PontoVendaDto> pontoVendas) {
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
