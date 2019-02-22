package br.com.minimizze.api.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class CategoriaProduto{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;
	
	@ManyToOne
	private CategoriaProduto categoriaProdutoPai; 
	
	@OneToMany(mappedBy="categoriaProdutoPai")
	private List<CategoriaProduto> subcategoria;

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public List<CategoriaProduto> getSubcategoria() {
		return subcategoria;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSubcategoria(List<CategoriaProduto> subcategoria) {
		this.subcategoria = subcategoria;
	}
	
	public CategoriaProduto getCategoriaProdutoPai() {
		return categoriaProdutoPai;
	}
	
	public void setCategoriaProdutoPai(CategoriaProduto categoriaProdutoPai) {
		this.categoriaProdutoPai = categoriaProdutoPai;
	}
	
}
