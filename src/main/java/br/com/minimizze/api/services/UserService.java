package br.com.minimizze.api.services;

import java.util.List;
import java.util.Optional;

import br.com.minimizze.api.entities.User;

public interface UserService {

	/**
	 * Persiste um User
	 * 
	 * @param User
	 * @return User
	 */
	User persistir(User user);

	/**
	 * Busca um Usuario Pelo Email
	 * 
	 * @param email
	 * @return User
	 */
	Optional<User> getUserByEmail(String email);
	
	/**
	 * Busca um Usuario Pelo fbid
	 * 
	 * @param email
	 * @return User
	 */
	Optional<User> getUserByFbid(String fbid);
	
	/**
	 * Busca Todos os Usuarios
	 * 
	 * @return List<User>
	 */
	List<User> getAll();
}
