package br.com.minimizze.api.repositories;

import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

//import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
//import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import br.com.minimizze.api.entities.ListaCompra;

import java.lang.Long;
import java.util.List;
import java.util.Optional;

@Transactional(readOnly = true)
@NamedQueries({
		@NamedQuery(name = "ListaCompraRepository.findByUser", 
				query = "SELECT lista FROM ListaCompra lista WHERE lista.user =:user"),
		@NamedQuery(name = "ListaCompraRepository.findByName", 
				query = "SELECT lista FROM ListaCompra lista WHERE lista.name =:name"),
		@NamedQuery(name = "ListaCompraRepository.findAllByUserUid", 
				query = "SELECT lista FROM ListaCompra lista WHERE lista.user.id =:userId") 
		})

public interface ListaCompraRepository extends JpaRepository<ListaCompra, Long> {

	ListaCompra findByUserId(@Param("userId") Long userId);

	Optional<ListaCompra> findById(Long id);
	
	Optional<ListaCompra> findByName(String name);
	
	List<ListaCompra> findByUser(@Param("user") Long user);
	
	// Page<ListaCompra> findByUserId(@Param("userId") Long userId, Pageable
	// pageable);
}
