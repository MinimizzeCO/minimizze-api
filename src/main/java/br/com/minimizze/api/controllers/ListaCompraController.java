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
import br.com.minimizze.api.services.ProdutoService;
import br.com.minimizze.api.services.UserService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/")
public class ListaCompraController {

	private static final Logger log = LoggerFactory.getLogger(ListaCompraController.class);

	@Autowired
	private ListaCompraService listaService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProdutoService produtoService;

	public ListaCompraController() {

	}

	/**
	 * Cadastra um novo Usuário no Sistema
	 * 
	 * @param ListaCompraDto cadastroListaCompraDto
	 * @param BindingResult  result
	 * @param String         user
	 * @return ResponseEntity<Response<ListaCompraDto>>
	 * @throws NoSuchAlgorithmException
	 */
	@PostMapping
	@RequestMapping(value = "list")
	public ResponseEntity<Response<ListaCompraDto>> create(@Valid @RequestBody ListaCompraDto cadastroListaCompraDto,
			BindingResult result) throws NoSuchAlgorithmException {

		Response<ListaCompraDto> response = new Response<ListaCompraDto>();
		
		validarDadosExistentes(cadastroListaCompraDto, result);
		User u = userService.getUserByEmail(cadastroListaCompraDto.getEmail()).get();
		cadastroListaCompraDto.setUser(u);
		ListaCompra lista = this.ListaCompraDtoTolista(cadastroListaCompraDto, result);

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
	 * Retorna Todos as Lista de um Usuário no Sistema
	 * 
	 * @return ResponseEntity<List<ListaCompraDto>>
	 * @throws NoSuchAlgorithmException
	 */
	@GetMapping
	@RequestMapping(value = "lists/{email}")
	public ResponseEntity<Response<List<ListaCompra>>> getListaCompras(@PathVariable(value = "email") String email) {
		
		Response<List<ListaCompra>> response = new Response<List<ListaCompra>>();
		response.setData(userService.getUserByEmail(email).get().getListaCompras());

		return ResponseEntity.ok(response);
	}

	/**
	 * Insere um novo produto na Lista
	 * 
	 * @param ListaCompraDto cadastroListaCompraDto
	 * @param BindingResult  result
	 * @param String         user
	 * @return ResponseEntity<Response<ListaCompraDto>>
	 * @throws NoSuchAlgorithmException
	 */
	@PostMapping
	@RequestMapping(value = "list/produto")
	public ResponseEntity<Response<ListaCompra>> setProduto(
			@Valid @RequestBody ListaCompraDto cadastroListaCompraDto, BindingResult result)
			throws NoSuchAlgorithmException {

		Response<ListaCompra> response = new Response<ListaCompra>();

		//validarDadosExistentes(cadastroListaCompraDto, result);
		ListaCompra lista = listaService.getListaCompra(cadastroListaCompraDto.getId()).get();
		System.out.println("LISTA " + cadastroListaCompraDto);

		Long[] produtosId = cadastroListaCompraDto.getProdutosId();
		System.out.println("LISTA " + cadastroListaCompraDto);
		for (Long ids : produtosId) {
			//System.out.println("IIIIIDDDDDDDD " + ids);
			lista.getProdutos().add(produtoService.getProduto(ids).get());
		}
		
		if (result.hasErrors()) {
			log.info("Erro validando cadastro da lista", result.getAllErrors());
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}

		this.listaService.update(lista);
		response.setData(lista);
		return ResponseEntity.ok(response);
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
		ListaCompraDto listaCompraDto = new ListaCompraDto();

		listaCompraDto.setId(lista.getId());
		listaCompraDto.setName(lista.getName());
		listaCompraDto.setUser(lista.getUser());
		listaCompraDto.setProdutos(lista.getProdutos());
		return listaCompraDto;
	}

	/**
	 * Converte a ListaCompra Dto para um ListaCompra Entities
	 * 
	 * @param ListaCompraDto
	 * @param result
	 * @return lista
	 * @throws NoSuchAlgorithmException
	 */
	private ListaCompra ListaCompraDtoTolista(@Valid ListaCompraDto cadastroListaCompraDto, BindingResult result)
			throws NoSuchAlgorithmException {
		ListaCompra lista = new ListaCompra();
		
		lista.setId(cadastroListaCompraDto.getId());
		lista.setName(cadastroListaCompraDto.getName());
		lista.setUser(cadastroListaCompraDto.getUser());
		lista.setProdutos(cadastroListaCompraDto.getProdutos());

		return lista;
	}

	/**
	 * Verifica se a lista já Existe
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
		 * "Esta lista já foi Cadastrada no Sistema.")); }
		 */

		this.listaService.getListaCompraByName(cadastroListaCompraDto.getName()).ifPresent(
				lista -> result.addError(new ObjectError("lista", "Esta lista ja foi Cadastrada no Sistema.")));

	}
}
