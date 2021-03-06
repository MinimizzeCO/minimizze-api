package br.com.minimizze.api.dtos;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

public class RedeDto extends AbstractEntityDto{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@NotNull
	private String nome;
	
	private Boolean valido;

	private int pontuacao;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public boolean isValido() {
		return valido;
	}
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


}
