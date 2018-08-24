package br.com.minimizze.api.dtos;

import java.util.Optional;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

public class MarcaDto extends AbstractEntityDto {

	private Long id;
	private String nome;
	private Optional<Boolean> valido = Optional.empty();
	private Optional<Integer> pontuacao = Optional.empty();

	public MarcaDto() {}
	
	@NotNull
	@NotEmpty(message="Nome nao Pode Ser Vazio.")
	@Length(min=3, max=50, message="Nome da Marca Deve conter entre 3 a 50 Caracteres")
	public String getNome() {
		return nome;
	}

	public Optional<Boolean> isValido() {
		return valido;
	}

	public Optional<Integer> getPontuacao() {
		return pontuacao;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setValido(Optional<Boolean> valido) {
		this.valido = valido;
	}

	public void setPontuacao(Optional<Integer> pontuacao) {
		this.pontuacao = pontuacao;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "MarcaDto [id=" + id +", nome=" + nome + "]";
	}

}
