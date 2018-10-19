package br.com.minimizze.api.services;

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
	 * Busca um Usuario Pelo fbID
	 * 
	 * @param email
	 * @return User
	 */
	Optional<User> getUserByFbID(String fbId);
}
