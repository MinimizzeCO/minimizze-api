package br.com.minimizze.api.dtos;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserDto extends AbstractEntityDto {
	
    private Long id;
    
	@NotNull
	private String fbID;
	
	@NotNull    
    @Size(min = 10, max = 50)
    @Pattern(regexp = "[^0-9]*", message = "Não Pode Conter Numeros")
	private String nome;
	
	@NotNull
	private String email;
	
	private List<ListaCompraDto> listaCompras;
	private List<ProdutoDto> favoritos;
	private List<SimilarDto> similar;
	
	private int pontuacao;
	
		public Long getId() {
		return id;
	}
	public String getNome() {
		return nome;
	}
	public String getEmail() {
		return email;
	}
	public List<ListaCompraDto> getListaCompras() {
		return listaCompras;
	}
    
	public int getPontuacao() {
		return pontuacao;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setListaCompras(List<ListaCompraDto> listaCompras) {
		this.listaCompras = listaCompras;
	}
	
	public void setPontuacao(int pontuacao) {
		this.pontuacao = pontuacao;
	}

	public List<ProdutoDto> getFavoritos() {
		return favoritos;
	}
	public void setFavoritos(List<ProdutoDto> favoritos) {
		this.favoritos = favoritos;
	}

	public List<SimilarDto> getSimilar() {
		return similar;
	}
	public void setSimilar(List<SimilarDto> similar) {
		this.similar = similar;
	}
	public String getFbID() {
		return fbID;
	}
	public void setFbID(String fbID) {
		this.fbID = fbID;
	}
	

}
