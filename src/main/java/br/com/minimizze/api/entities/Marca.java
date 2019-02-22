package br.com.minimizze.api.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;

@Entity
@Table(name = "marca")
public class Marca {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private boolean valido;
	private int pontuacao;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "marca", cascade = CascadeType.ALL)
	@Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)
	private List<Produto> produtos;
	
	public Long getId() {
		return id;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return name;
	}

	public boolean isValido() {
		return valido;
	}

	@Column(name = "pontuacao", nullable = true)
	public int getPontuacao() {
		return pontuacao;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setValido(boolean valido) {
		this.valido = valido;
	}

	public void setPontuacao(int pontuacao) {
		this.pontuacao = pontuacao;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
