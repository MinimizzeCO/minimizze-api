package br.com.minimizze.api.repositories;

import java.util.List;

import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.Blob;

import br.com.minimizze.api.entities.User;

@NamedQueries({ 
	@NamedQuery(name = "User.consultaPorEmail", 
			query = "SELECT u FROM User u WHERE u.email = :email"),
	@NamedQuery(name = "User.findByUid", 
				query = "SELECT u FROM User u WHERE u.uid = :uid"),
	@NamedQuery(name = "User.consultarIdPorEmail", 
			query = "SELECT u.id FROM User u WHERE u.email = :email") })

@Transactional(readOnly=true)
public interface UserRepository extends JpaRepository<User, Long> {

	User findByEmail(String email);
	
	List<User> findAll();
	
	User getById(Long id);
	
	User findByUid(Blob uid);
}
