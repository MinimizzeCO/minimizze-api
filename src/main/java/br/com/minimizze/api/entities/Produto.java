package br.com.minimizze.api.entities;

import java.sql.Blob;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;

import com.fasterxml.jackson.annotation.JsonBackReference;

/**
 * @author Vitor
 * @version 1.0.0
 * @since 29/04/2017
 *
 */

@Entity
@Table(name = "produto")
public class Produto{

	@Override
	public String toString() {
		return name +" "+ marca.getName() +" "+ qtdMedida +" "+ unidadeMedida.getSigla();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;
	
	private Blob foto;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	@Fetch(org.hibernate.annotations.FetchMode.SELECT)
	@JsonBackReference
	private Marca marca;

	@ManyToMany(fetch=FetchType.LAZY,cascade = CascadeType.ALL)
	@Fetch(org.hibernate.annotations.FetchMode.SELECT)
	private List<Similar> similares;

	@ManyToMany(cascade = CascadeType.ALL)
	@Fetch(org.hibernate.annotations.FetchMode.SELECT)
	private List<ListaCompra> listaCompra;

	@Column(name = "codigo_barra", nullable = false)
	private String codigoBarra;

	@ManyToOne
	private CategoriaProduto categoriaProduto;

	@ManyToOne
	private UnidadeMedida unidadeMedida;

	public List<ListaCompra> getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(List<ListaCompra> listaCompra) {
		this.listaCompra = listaCompra;
	}

	@ManyToOne
	private User user;
	private Double qtdMedida;
	private Boolean valido;
	private int pontuacao;

	@PrePersist
	private void setValido() {
		this.setValido(true);
	}

	public Long getId() {
		return id;
	}
	@Column(name="name", nullable=false)
	public String getName() {
		return name;
	}
	@Column(name="marca", nullable=false)
	public Marca getMarca() {
		return marca;
	}

	@Column(name="unidade_medida", nullable=false)
	public UnidadeMedida getUnidadeMedida() {
		return unidadeMedida;
	}
	
	@Column(name="qtd_medida",nullable = false)
	public Double getQtdMedida() {
		return qtdMedida;
	}
	
	@Column(name="pontuacao",nullable = true)
	public int getPontuacao() {
		return pontuacao;
	}
	
	@Column(name="foto", nullable=false)
	public Blob getFoto() {
		return foto;
	}

	@Column(name="codigo_barra", nullable=false)
	public String getCodigoBarra() {
		return codigoBarra;
	}

	public User getUser() {
		return user;
	}

	public Boolean getValido() {
		return valido;
	}

	public CategoriaProduto getCategoriaProduto() {
		return categoriaProduto;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public void setUnidadeMedida(UnidadeMedida unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}

	public void setQtdMedida(Double qtdMedida) {
		this.qtdMedida = qtdMedida;
	}

	public void setPontuacao(int pontuacao) {
		this.pontuacao = pontuacao;
	}

	public void setFoto(Blob foto) {
		this.foto = foto;
	}

	public void setCodigoBarra(String codigoBarra) {
		this.codigoBarra = codigoBarra;
	}

	public void setCategoriaProduto(CategoriaProduto categoriaProduto) {
		this.categoriaProduto = categoriaProduto;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setValido(Boolean valido) {
		this.valido = valido;
	}

	public List<Similar> getSimilares() {
		return similares;
	}

	public void setSimilares(List<Similar> similares) {
		this.similares = similares;
	}

}
