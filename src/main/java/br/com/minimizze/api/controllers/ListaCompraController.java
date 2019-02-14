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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.minimizze.api.dtos.ListaCompraDto;
import br.com.minimizze.api.entities.ListaCompra;
import br.com.minimizze.api.entities.User;
import br.com.minimizze.api.response.Response;
import br.com.minimizze.api.services.ListaCompraService;
import br.com.minimizze.api.services.UserService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/list")
public class ListaCompraController {

	private static final Logger log = LoggerFactory.getLogger(ListaCompraController.class);

	@Autowired
	private ListaCompraService listaService;

	@Autowired
	private UserService userService;

	public ListaCompraController() {

	}

	/**
	 * Cadastra um novo Usu�rio no Sistema
	 * 
	 * @param ListaCompraDto
	 * @param result
	 * 
	 * @return ResponseEntity<Response<ListaCompraDto>>
	 * @throws NoSuchAlgorithmException
	 */
	@PostMapping
	@RequestMapping(value = "/{user}")
	public ResponseEntity<Response<ListaCompraDto>> cadastrar(@PathVariable (value = "user") String user, @Valid @RequestBody ListaCompraDto cadastroListaCompraDto,
			BindingResult result) throws NoSuchAlgorithmException {
		log.info(cadastroListaCompraDto.toString());
		System.out.println("teste "+user);
		Response<ListaCompraDto> response = new Response<ListaCompraDto>();

		validarDadosExistentes(cadastroListaCompraDto, result);
		ListaCompra lista = this.ListaCompraDtoTolista(user,cadastroListaCompraDto, result);

		if (result.hasErrors()) {
			log.info("Erro validando cadastro da lista", result.getAllErrors());
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		this.listaService.persistir(lista);

		response.setData(this.ListaToListaDto(lista));
		return ResponseEntity.ok(response);
	}

	

	/**
	 * Retorna Todos as Lista de um Usu�rio no Sistema
	 * 
	 * @return ResponseEntity<List<ListaCompraDto>>
	 * @throws NoSuchAlgorithmException
	 */

	@GetMapping
	@RequestMapping(value = "getall")
	public ResponseEntity<List<ListaCompra>> getListaCompras(Long userFbid) {
		List<ListaCompra> listas = this.listaService.getListaCompraByUser(userFbid);

		return ResponseEntity.ok(listas);
	}

	/**
	 * Converte um ListaCompra Entitie para um ListaCompraDto
	 * 
	 * @param lista
	 * @param result
	 * @return ListaCompraDto
	 * @throws NoSuchAlgorithmException
	 */
	private ListaCompraDto ListaToListaDto(ListaCompra lista) {
		ListaCompraDto ListaCompraDto = new ListaCompraDto();

		ListaCompraDto.setId(lista.getId());
		ListaCompraDto.setName(lista.getName());
		return ListaCompraDto;
	}

	/**
	 * Converte a ListaCompra Dto para um ListaCompra Entities
	 * 
	 * @param ListaCompraDto
	 * @param result
	 * @return lista
	 * @throws NoSuchAlgorithmException
	 */
	private ListaCompra ListaCompraDtoTolista(String userId, @Valid ListaCompraDto cadastroListaCompraDto, BindingResult result)
			throws NoSuchAlgorithmException {
		ListaCompra lista = new ListaCompra();
		lista.setName(cadastroListaCompraDto.getName());
		//log.info("USER", userService.getById(cadastroListaCompraDto.getUserId()));
		User u =userService.findByFbid(userId);
		System.out.println("Nome do Usu�rio" + u.getName());
		System.out.println("Nome do Email" + u.getEmail());
		lista.setUser(u);
		return lista;
	}

	/**
	 * Verifica se a lista j� Existe
	 * 
	 * @param ListaCompraDto
	 * @param result
	 * 
	 */
	private void validarDadosExistentes(ListaCompraDto cadastroListaCompraDto, BindingResult result) {
		/*
		 * Optional<lista> lista =
		 * this.listaService.getlista(cadastroListaCompraDto.getId()); if
		 * (!lista.isPresent()) { result.addError(new ObjectError("lista",
		 * "Esta lista j� foi Cadastrada no Sistema.")); }
		 */
		
		this.listaService.getListaCompraByName(cadastroListaCompraDto.getName()).ifPresent(
				lista -> result.addError(new ObjectError("lista", "Esta lista ja foi Cadastrada no Sistema.")));

	}
}