package br.com.minimizze.api.services.impl;

import java.util.List;
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

	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public Optional<User> getUserByEmail(String email) {
		log.info("Buscando User Pelo Email: ",email);
		return this.userRepository.findByEmail(email);
	}

	@Override
	public User persistir(User user) {
		// TODO Auto-generated method stub
		log.info("Salvando User: ",user.getName());
		return this.userRepository.save(user);
	}

	@Override
	public User findByUid(byte[] uid) {
		// TODO Auto-generated method stub
		return this.userRepository.findByUid(uid);
	}

	@Override
	public List<User> getAll() {
		log.info("Buscando Todos os Usuários do Sistema");
		return this.userRepository.findAll();
	}

	@Override
	public User getById(Long id) {
		// TODO Auto-generated method stub
		return this.userRepository.getById(id);
	}

}
