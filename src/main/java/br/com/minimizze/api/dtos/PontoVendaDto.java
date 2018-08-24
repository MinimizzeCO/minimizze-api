package br.com.minimizze.api.dtos;

import java.sql.Blob;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

public class PontoVendaDto extends AbstractEntityDto {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private String nome;

	@NotNull
	private String descricao;
	
	@ManyToOne
	private RedeDto rede;

	@NotNull
	private int latitude;

	@NotNull
	private int longitude;

	private Blob foto;
	private Boolean valido;

	private int pontuacao;
	
	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public RedeDto getRede() {
		return rede;
	}

	public int getLatitude() {
		return latitude;
	}

	public int getLongitude() {
		return longitude;
	}

	public boolean isAtivo() {
		return valido;
	}

	public int getPontuacao() {
		return pontuacao;
	}

	public Blob getFoto() {
		return foto;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setRede(RedeDto rede) {
		this.rede = rede;
	}

	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	public void setAtivo(boolean ativo) {
		this.valido = ativo;
	}

	public void setPontuacao(int pontuacao) {
		this.pontuacao = pontuacao;
	}

	public void setFoto(Blob foto) {
		this.foto = foto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Boolean getValido() {
		return valido;
	}

	public void setValido(Boolean valido) {
		this.valido = valido;
	}

}
