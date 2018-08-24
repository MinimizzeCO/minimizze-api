package br.com.minimizze.api.services;

import java.util.List;
import java.util.Optional;

import br.com.minimizze.api.entities.Marca;

public interface MarcaService {

	/**
	 * Persiste um Funcionario
	 * 
	 * @param Marca
	 * @return Marca
	*/
	Marca persistir(Marca marca);
	/**
	 * Retorna a Marca Pelo Nome
	 * 
	 * @param nome
	 * @return Optional<Marca>
	*/
	Optional<Marca>gerMarcaByNome(String nome);
	
	/**
	 * Retorna a Marca Pelo ID
	 * 
	 * @param ID
	 * @return Optional<Marca>
	*/
	Optional <Marca> getMarca(Long id);
	
	/**
	 * Retorna todas as Marcas
	 * 
	 * @return List<Marca>
	*/
	List<Marca> getAllMarcas();
	
}
