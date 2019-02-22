package br.com.minimizze.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import br.com.minimizze.api.entities.CategoriaProduto;

import java.lang.Long;
import java.util.List;
import java.util.Optional;

@Transactional(readOnly = true)
public interface CategoriaProdutoRepository extends JpaRepository<CategoriaProduto, Long> {

	Optional<CategoriaProduto> findById(long id);
	
	Optional<CategoriaProduto> findByName(String nome);
	
	List<CategoriaProduto> findAll();
	
}
