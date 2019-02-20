package br.com.minimizze.api.dtos;

import java.util.List;

import javax.persistence.Lob;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserDto extends AbstractEntityDto {
	
    private Long id;
    
    @NotNull
    @Lob
    private byte[] uid;
	
	@NotNull    
    @Size(min = 10, max = 50)
    @Pattern(regexp = "[^0-9]*", message = "Não Pode Conter Numeros")
	private String name;
	
	@NotNull
	private String email;
	
	private List<ListaCompraDto> listaCompras;
	private List<ProdutoDto> favoritos;
	private List<SimilarDto> similar;
	
	private int pontuacao;
	
		public Long getId() {
		return id;
	}
	public String getName() {
		return name;
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
	public void setName(String name) {
		this.name = name;
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
	public byte[] getUid() {
		return uid;
	}
	public void setUid(byte[] uid) {
		this.uid = uid;
	}
	

}
