package br.com.minimizze.api.services.impl;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.minimizze.api.entities.ListaCompra;
import br.com.minimizze.api.repositories.ListaCompraRepository;
import br.com.minimizze.api.services.ListaCompraService;

@Service
public class ListaCompraServiceImpl implements ListaCompraService {

	private static final Logger log = LoggerFactory.getLogger(ListaCompraServiceImpl.class);

	@Autowired
	private ListaCompraRepository listaCompraRepository;

	@Override
	public List<ListaCompra> getListaCompraByUser(Long id) {
		log.info("Buscando Todas as Lista de Compras de um unico Usuario Pelo ID ", id);
		return this.listaCompraRepository.findAllByUserFbid(id);
	}

	@Override
	public Optional<ListaCompra> getListaCompra(Long id) {
		log.info("Buscando uma Lista de Compra Pelo ID da Lista : ", id);
		return this.listaCompraRepository.findById(id);
	}

	@Override
	public Optional<ListaCompra> getListaCompraByName(String name) {
		log.info("Buscando uma lista de Compra Pelo Nome ", name);
		return this.listaCompraRepository.findByName(name);
	}

	@Override
	public ListaCompra persistir(ListaCompra listaCompra) {
		// TODO Auto-generated method stub
		//log.info("Salvando Lista: ", listaCompra.getUser().getName());
		System.out.println("Salvando Lista: "+listaCompra.getUser().getName());
		return this.listaCompraRepository.save(listaCompra);
	}
}
