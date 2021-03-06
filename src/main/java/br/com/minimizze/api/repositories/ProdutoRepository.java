package br.com.minimizze.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import br.com.minimizze.api.entities.Produto;

import java.lang.Long;
import java.util.List;
import java.util.Optional;

@Transactional(readOnly = true)
public interface ProdutoRepository extends JpaRepository<Produto, Long> {

	Optional<Produto> findById(Long id);
	
	Optional<Produto> findByName(String nome);
	
	List<Produto> findAll();
	
}
