package br.com.minimizze.api.services;

import java.util.List;
import java.util.Optional;

import br.com.minimizze.api.entities.Produto;

public interface ProdutoService {

	/**
	 * Persiste uma Produto
	 * 
	 * @param Produto
	 * @return Produto
	*/
	Produto persistir(Produto produto);
	/**
	 * Retorna a Produto Pelo Nome
	 * 
	 * @param nome
	 * @return Optional<Produto>
	*/
	Optional<Produto>gerProdutoByNome(String nome);
	
	/**
	 * Retorna a Produto Pelo ID
	 * 
	 * @param ID
	 * @return Optional<Produto>
	*/
	Optional <Produto> getProduto(Long id);
	
	/**
	 * Retorna todas as Produtos
	 * 
	 * @return List<Produto>
	*/
	List<Produto> getAllProdutos();
	
}
