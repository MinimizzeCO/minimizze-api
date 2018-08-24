package br.com.minimizze.api.dtos;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;

public class UserDto extends AbstractEntityDto {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@NotNull
	private String fbID;
	
	@NotNull    
    @Size(min = 10, max = 25)
    @Pattern(regexp = "[^0-9]*", message = "Não Pode Conter Numeros")
	private String nome;
	
	@NotNull
	private String email;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
	@Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)
	private List<ListaCompraDto> listaCompras;
	
	@ManyToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)
	private List<ProdutoDto> favoritos;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
	@Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)
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
