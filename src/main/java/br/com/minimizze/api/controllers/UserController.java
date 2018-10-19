package br.com.minimizze.api.controllers;

import java.security.NoSuchAlgorithmException;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.minimizze.api.dtos.UserDto;
import br.com.minimizze.api.entities.User;
import br.com.minimizze.api.response.Response;
import br.com.minimizze.api.services.UserService;

@RestController
@RequestMapping("/api/cadastro-user")
@CrossOrigin(origins = "*")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	public UserController() {
		
	}
	
	/**
	 * Cadastra um novo Usuário no Sistema
	 * 
	 * @param UserDto
	 * @param result
	 * 
	 * @return ResponseEntity<Response<UserDto>>
	 * @throws NoSuchAlgorithmException
	 */
	@PostMapping
	public ResponseEntity<Response<UserDto>> cadastrar(@Valid @RequestBody UserDto cadastroUserDto,BindingResult result) throws NoSuchAlgorithmException{
		log.info("Cadastrando user",cadastroUserDto.toString());
		
		Response<UserDto> response = new Response<UserDto>();
		
		validarDadosExistentes(cadastroUserDto,result);
		User user = this.UserDtoTouser(cadastroUserDto,result);
		
		if (result.hasErrors()) {
			log.info("Erro validando cadastro da user",result.getAllErrors());
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		this.userService.persistir(user);
		
		response.setData(this.userToUserDto(user));
		return ResponseEntity.ok(response);
	}
	
	/**
	 * Converte um User Entitie para um UserDto
	 * 
	 * @param user
	 * @param result
	 * @return UserDto
	 * @throws NoSuchAlgorithmException
	 */
	private UserDto userToUserDto(User user) {
		UserDto userDto= new UserDto();
		
		userDto.setId(user.getId());
		userDto.setNome(user.getNome());
		userDto.setEmail(user.getEmail());
		userDto.setFbID(user.getFbID());
		return userDto;
	}

	/**
	 * Converte a User Dto para um User Entities
	 * 
	 * @param UserDto
	 * @param result
	 * @return user
	 * @throws NoSuchAlgorithmException
	 */
	private User UserDtoTouser(@Valid UserDto cadastroUserDto, BindingResult result) 
		throws NoSuchAlgorithmException{
		User user = new User();
		user.setNome(cadastroUserDto.getNome());
		user.setEmail(cadastroUserDto.getEmail());
		user.setFbID(cadastroUserDto.getFbID());
		return user;
	}

	/**
	 * Verifica se a user já Existe
	 * 
	 * @param UserDto
	 * @param result
	 * 
	 */
	private void validarDadosExistentes(UserDto cadastroUserDto, BindingResult result) {
		/*Optional<user> user = this.userService.getuser(cadastroUserDto.getId());
		if (!user.isPresent()) {
			result.addError(new ObjectError("user", "Esta user já foi Cadastrada no Sistema."));
		}*/
		this.userService.getUserByEmail(cadastroUserDto.getEmail())
		.ifPresent(user -> result.addError(new ObjectError("user", "Esta user ja foi Cadastrada no Sistema.")));
	}
}
