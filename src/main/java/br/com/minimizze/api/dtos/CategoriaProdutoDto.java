package br.com.minimizze.api.dtos;


import java.util.List;
import javax.validation.constraints.NotNull;
/**
 * @author Vitor
 * @version 1.0.0
 * @since 29/04/2017
 *
 */

public class CategoriaProdutoDto extends AbstractEntityDto {

	private Long id;

	@NotNull
	private String nome;
	private CategoriaProdutoDto categoriaProdutoPai; 
	private List<CategoriaProdutoDto> subcategoria;

	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public List<CategoriaProdutoDto> getSubcategoria() {
		return subcategoria;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setSubcategoria(List<CategoriaProdutoDto> subcategoria) {
		this.subcategoria = subcategoria;
	}
	
	public CategoriaProdutoDto getCategoriaProdutoPai() {
		return categoriaProdutoPai;
	}
	
	public void setCategoriaProdutoPai(CategoriaProdutoDto categoriaProdutoPai) {
		this.categoriaProdutoPai = categoriaProdutoPai;
	}


}
