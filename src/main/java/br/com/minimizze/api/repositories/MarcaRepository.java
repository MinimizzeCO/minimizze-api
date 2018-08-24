package br.com.minimizze.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import br.com.minimizze.api.entities.Marca;

import java.lang.Long;
import java.util.List;
import java.util.Optional;

@Transactional(readOnly = true)
public interface MarcaRepository extends JpaRepository<Marca, Long> {

	Optional<Marca> findById(Long id);
	
	Optional<Marca> findByNome(String nome);
	
	List<Marca> findAll();
	
}
