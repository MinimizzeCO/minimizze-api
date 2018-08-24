package br.com.minimizze.api.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "unidade_medida")
public class UnidadeMedida {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private String sigla;

	public Long getId() {
		return id;
	}
	
	@Column(name="nome",nullable=false)
	public String getNome() {
		return nome;
	}
	
	@Column(name="sigla",nullable=false)
	public String getSigla() {
		return sigla;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
}