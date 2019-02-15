package br.com.minimizze.api.controllers;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.minimizze.api.dtos.UserDto;
import br.com.minimizze.api.entities.User;
import br.com.minimizze.api.response.Response;
import br.com.minimizze.api.services.UserService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/user")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	public UserController() {
		
	}
	
	/**
	 * Cadastra um novo Usu�rio no Sistema
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
	 * Retorna Todos os Usu�rios no Sistema
	 * 
	 * @return ResponseEntity<List<UserDto>>
	 * @throws NoSuchAlgorithmException
	 */
	
	@GetMapping
	public ResponseEntity<Response<List<User>>> getUsers() {
		Response<List<User>> response = new Response<List<User>>();
		response.setData(this.userService.getAll());
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
		userDto.setName(user.getName());
		userDto.setEmail(user.getEmail());
		userDto.setFbid(user.getFbid());
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
		user.setName(cadastroUserDto.getName());
		user.setEmail(cadastroUserDto.getEmail());
		user.setFbid(cadastroUserDto.getFbid());
		return user;
	}

	/**
	 * Verifica se a user j� Existe
	 * 
	 * @param UserDto
	 * @param result
	 * 
	 */
	private void validarDadosExistentes(UserDto cadastroUserDto, BindingResult result) {
		/*Optional<user> user = this.userService.getuser(cadastroUserDto.getId());
		if (!user.isPresent()) {
			result.addError(new ObjectError("user", "Esta user j� foi Cadastrada no Sistema."));
		}*/
		this.userService.getUserByEmail(cadastroUserDto.getEmail())
		.ifPresent(user -> result.addError(new ObjectError("user", "Este Usu�rio j� foi Cadastradado no Sistema.")));
	}
}
