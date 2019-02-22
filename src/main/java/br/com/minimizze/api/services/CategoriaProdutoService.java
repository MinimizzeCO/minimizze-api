package br.com.minimizze.api.services;

import java.util.List;
import java.util.Optional;

import br.com.minimizze.api.entities.CategoriaProduto;

public interface CategoriaProdutoService {

	/**
	 * Persiste uma CategoriaProduto
	 * 
	 * @param CategoriaProduto
	 * @return CategoriaProduto
	*/
	CategoriaProduto persistir(CategoriaProduto categoriaProduto);
	/**
	 * Retorna a CategoriaProduto Pelo Nome
	 * 
	 * @param nome
	 * @return Optional<CategoriaProduto>
	*/
	Optional<CategoriaProduto>gerCategoriaProdutoByNome(String nome);
	
	/**
	 * Retorna a CategoriaProduto Pelo ID
	 * 
	 * @param ID
	 * @return Optional<CategoriaProduto>
	*/
	Optional <CategoriaProduto> getCategoriaProduto(long id);
	
	/**
	 * Retorna todas as CategoriaProdutos
	 * 
	 * @return List<CategoriaProduto>
	*/
	List<CategoriaProduto> getAllCategoriaProdutos();
	
}
