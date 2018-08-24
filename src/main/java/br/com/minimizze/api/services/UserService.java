package br.com.minimizze.api.services;

import java.util.Optional;

import br.com.minimizze.api.entities.User;

public interface UserService {

	/**
	 * Busca um Usu�rio Pelo Email
	 * 
	 * @param email
	 * @return User
	 */
	Optional<User> getUserByEmail(String email);
}
