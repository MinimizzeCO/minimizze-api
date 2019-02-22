package br.com.minimizze.api.services.impl;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.minimizze.api.entities.Produto;
import br.com.minimizze.api.repositories.ProdutoRepository;
import br.com.minimizze.api.services.ProdutoService;

@Service
public class ProdutoServiceImpl implements ProdutoService {

	private static final Logger log = LoggerFactory.getLogger(ProdutoServiceImpl.class);

	@Autowired
	private ProdutoRepository produtoRepository;
	
	@Override
	public Optional<Produto> getProduto(Long id) {
		log.info("Buscando a Produto Pelo ID: ",id);
		return this.produtoRepository.findById(id);
	}

	@Override
	public List<Produto> getAllProdutos() {
		log.info("Buscando Todas as Produtos");
		return this.produtoRepository.findAll();
	}

	@Override
	public Optional<Produto> gerProdutoByNome(String nome) {
		log.info("Buscando a Produto Pelo Nome: ",nome);
		return this.produtoRepository.findByName(nome);
	}

	@Override
	public Produto persistir(Produto produto) {
		log.info("Persistindo Produto", produto.getName());
		return this.produtoRepository.save(produto);
	}

}
