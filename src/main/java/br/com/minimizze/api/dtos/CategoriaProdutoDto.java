package br.com.minimizze.api.dtos;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.validation.constraints.NotNull;
/**
 * @author Vitor
 * @version 1.0.0
 * @since 29/04/2017
 *
 */

@Entity
public class CategoriaProdutoDto extends AbstractEntityDto {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private String nome;
	
	@ManyToOne
	private CategoriaProdutoDto categoriaProdutoPai; 
	
	@OneToMany(mappedBy="categoriaProdutoPai")
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
