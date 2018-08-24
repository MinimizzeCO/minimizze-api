package br.com.minimizze.api.services.impl;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.minimizze.api.entities.User;
import br.com.minimizze.api.repositories.UserRepository;
import br.com.minimizze.api.services.UserService;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger log = LoggerFactory.getLogger(ListaCompraServiceImpl.class);

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public Optional<User> getUserByEmail(String email) {
		log.info("Buscando User Pelo Email: ",email);
		return Optional.ofNullable(this.userRepository.findByEmail(email));
	}

}
