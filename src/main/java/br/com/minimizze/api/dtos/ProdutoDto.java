package br.com.minimizze.api.dtos;

import java.sql.Blob;
import java.util.List;

import javax.persistence.PrePersist;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import br.com.minimizze.api.entities.CategoriaProduto;
import br.com.minimizze.api.entities.ListaCompra;
import br.com.minimizze.api.entities.Marca;
import br.com.minimizze.api.entities.Similar;
import br.com.minimizze.api.entities.UnidadeMedida;
import br.com.minimizze.api.entities.User;

public class ProdutoDto {

	private long id;

	@NotNull(message="Preencha o Campo")
	@Size(min = 2, max = 30)
	private String name;

	private Marca marca;
	
	@NotNull(message="Escolha uma Marca")
	private long marcaId;
	private long categoriaProdutoId;
	private Blob foto;
	private List<Similar> similares;
	private List<ListaCompra> listaCompra;

	@NotNull (message="Preencha o Campo")
	private String codigoBarra;

	private CategoriaProduto categoriaProduto;

	//@NotNull(message="Escolha uma Unidade de Medida")
	private UnidadeMedida unidadeMedida;

	public List<ListaCompra> getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(List<ListaCompra> listaCompra) {
		this.listaCompra = listaCompra;
	}

	private User user;

	@DecimalMax("99999.999999")
	private Double qtdMedida;

	private Boolean valido;

	private int pontuacao;

	@PrePersist
	private void setValido() {
		this.setValido(true);
	}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Marca getMarca() {
		return marca;
	}

	public UnidadeMedida getUnidadeMedida() {
		return unidadeMedida;
	}

	public Double getQtdMedida() {
		return qtdMedida;
	}

	public int getPontuacao() {
		return pontuacao;
	}

	public Blob getFoto() {
		return foto;
	}

	public String getCodigoBarra() {
		return codigoBarra;
	}

	public CategoriaProduto getCategoriaProduto() {
		return categoriaProduto;
	}

	public void setId(long id) {
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Boolean getValido() {
		return valido;
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

	public long getMarcaId() {
		return marcaId;
	}

	public void setMarcaId(long marcaId) {
		this.marcaId = marcaId;
	}

	public long getCategoriaProdutoId() {
		return categoriaProdutoId;
	}

	public void setCategoriaProdutoId(long categoriaProdutoId) {
		this.categoriaProdutoId = categoriaProdutoId;
	}

}
