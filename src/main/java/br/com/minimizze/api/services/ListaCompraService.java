package br.com.minimizze.api.services;

import java.util.Optional;

import br.com.minimizze.api.entities.ListaCompra;

public interface ListaCompraService {

	/**
	 * Retorna Todas as Listas de Compras de um Usuário
	 * 
	 * @param id
	 * 
	 * @return Optional<ListaCompra>
	 */
	Optional <ListaCompra> getAllListaCompra(Long id);
	/**
	 * Retorna Toda uma Lista de Compras
	 * 
	 * @param id
	 * 
	 * @return Optional<ListaCompra>
	 */
	Optional <ListaCompra> getListaCompra(Long id);
	
	/**
	 * Retorna uma Listas de Compras de um Usuário
	 * 
	 * @param ListaId
	 * @param UserId
	 * 
	 * @return Optional<ListaCompra>
	 */
	ListaCompra getListaCompraByUser(Long UserId);
	
}
