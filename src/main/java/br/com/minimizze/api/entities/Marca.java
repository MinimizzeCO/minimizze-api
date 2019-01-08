package br.com.minimizze.api.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "marca")
public class Marca {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private boolean valido;
	private int pontuacao;

	public Long getId() {
		return id;
	}

	@Column(name = "nome", nullable = false)
	public String getNome() {
		return nome;
	}

	public boolean isValido() {
		return valido;
	}

	@Column(name = "pontuacao", nullable = true)
	public int getPontuacao() {
		return pontuacao;
	}

	public void setNome(String nome) {
		this.nome = nome;
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
