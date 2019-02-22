package br.com.minimizze.api.services.impl;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.minimizze.api.entities.CategoriaProduto;
import br.com.minimizze.api.repositories.CategoriaProdutoRepository;
import br.com.minimizze.api.services.CategoriaProdutoService;

@Service
public class CategoriaProdutoServiceImpl implements CategoriaProdutoService {

	private static final Logger log = LoggerFactory.getLogger(CategoriaProdutoServiceImpl.class);

	@Autowired
	private CategoriaProdutoRepository categoriaProdutoRepository;
	
	@Override
	public Optional<CategoriaProduto> getCategoriaProduto(long id) {
		log.info("Buscando a CategoriaProduto Pelo ID: ",id);
		return this.categoriaProdutoRepository.findById(id);
	}

	@Override
	public List<CategoriaProduto> getAllCategoriaProdutos() {
		log.info("Buscando Todas as CategoriaProdutos");
		return this.categoriaProdutoRepository.findAll();
	}

	@Override
	public Optional<CategoriaProduto> gerCategoriaProdutoByNome(String nome) {
		log.info("Buscando a CategoriaProduto Pelo Nome: ",nome);
		return this.categoriaProdutoRepository.findByName(nome);
	}

	@Override
	public CategoriaProduto persistir(CategoriaProduto categoriaProduto) {
		log.info("Persistindo CategoriaProduto", categoriaProduto.getName());
		return this.categoriaProdutoRepository.save(categoriaProduto);
	}

}
