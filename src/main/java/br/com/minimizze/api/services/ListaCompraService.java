package br.com.minimizze.api.services;

import java.util.List;
import java.util.Optional;

import br.com.minimizze.api.entities.ListaCompra;

public interface ListaCompraService {


	/**
	 * Persiste um ListaCompra
	 * 
	 * @param ListaCompra
	 * @return ListaCompra
	 */
	ListaCompra persistir(ListaCompra listaCompra);
	/**
	 * Retorna Todas as Listas de Compras de um Usuario
	 * 
	 * @param id
	 * 
	 * @return Optional<ListaCompra>
	 */
	List <ListaCompra> getListaCompraByUser(Long id);
	/**
	 * Retorna Toda uma Lista de Compras
	 * 
	 * @param id
	 * 
	 * @return Optional<ListaCompra>
	 */
	Optional <ListaCompra> getListaCompra(Long id);
	
	/**
	 * Retorna uma Listas de Compras de um Usuario
	 * 
	 * @param name
	 * 
	 * @return ListaCompra
	 */
	Optional<ListaCompra> getListaCompraByName(String name);
	
	
}
