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

import br.com.minimizze.api.dtos.ProdutoDto;
import br.com.minimizze.api.entities.CategoriaProduto;
import br.com.minimizze.api.entities.Marca;
import br.com.minimizze.api.entities.Produto;
import br.com.minimizze.api.response.Response;
import br.com.minimizze.api.services.CategoriaProdutoService;
import br.com.minimizze.api.services.MarcaService;
import br.com.minimizze.api.services.ProdutoService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/")
public class ProdutoController {

	private static final Logger log = LoggerFactory.getLogger(ProdutoController.class);
	
	@Autowired
	private ProdutoService produtoService;
	
	@Autowired
	private MarcaService marcaService;
	
	@Autowired
	private CategoriaProdutoService categoriaProdutoService;
	
	public ProdutoController() {
		
	}
	
	/**
	 * Cadastra uma Produto no Sistema
	 * 
	 * @param ProdutoDto
	 * @param result
	 * 
	 * @return ResponseEntity<Response<ProdutoDto>>
	 * @throws NoSuchAlgorithmException
	 */
	@PostMapping
	@RequestMapping(value="product")
	public ResponseEntity<Response<ProdutoDto>> cadastrar(@Valid @RequestBody ProdutoDto cadastroProdutoDto,BindingResult result) throws NoSuchAlgorithmException{
		log.info("Cadastrando Produto",cadastroProdutoDto.toString());
		
		Response<ProdutoDto> response = new Response<ProdutoDto>();
		
		validarDadosExistentes(cadastroProdutoDto,result);
		Produto produto = this.produtoDtoToProduto(cadastroProdutoDto,result);
		
		if (result.hasErrors()) {
			log.info("Erro validando cadastro da Produto",result.getAllErrors());
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		this.produtoService.persistir(produto);
		
		response.setData(this.produtoToProdutoDto(produto));
		return ResponseEntity.ok(response);
	}
	
	/**
	 * Retorna todas as Produto do Sistema
	 * 
	 * @return ResponseEntity<List<Produto>>
	 * @throws NoSuchAlgorithmException
	 */
	@GetMapping
	@RequestMapping(value = "products")
	public ResponseEntity<List<Produto>> getProdutos() throws NoSuchAlgorithmException{
		
		List<Produto> produto = this.produtoService.getAllProdutos();
		//produto.addAll(this.produtoService.getAllProdutos());
		
		return ResponseEntity.ok(produto);
	}
	
	/**
	 * Converte uma Produto Entitie para uma ProdutoDto
	 * 
	 * @param Produto
	 * @param result
	 * @return ProdutoDto
	 * @throws NoSuchAlgorithmException
	 */
	private ProdutoDto produtoToProdutoDto(Produto produto) {
		ProdutoDto produtoDto= new ProdutoDto();
		
		produtoDto.setId(produto.getId());
		produtoDto.setName(produto.getName());
		return produtoDto;
	}

	/**
	 * Converte a Produto Dto para uma Produto Entities
	 * 
	 * @param ProdutoDto
	 * @param result
	 * @return Produto
	 * @throws NoSuchAlgorithmException
	 */
	private Produto produtoDtoToProduto(@Valid ProdutoDto cadastroProdutoDto, BindingResult result) 
		throws NoSuchAlgorithmException{
		
		Produto produto = new Produto();
		
		produto.setName(cadastroProdutoDto.getName());
		Marca m = marcaService.getMarca(cadastroProdutoDto.getMarcaId()).get();
		CategoriaProduto ct = categoriaProdutoService.getCategoriaProduto(cadastroProdutoDto.getCategoriaProdutoId()).get();
		
		produto.setMarca(m);
		produto.setCategoriaProduto(ct);
		produto.setCodigoBarra(cadastroProdutoDto.getCodigoBarra());
		return produto;
	}

	/**
	 * Verifica se a Produto já Existe
	 * 
	 * @param ProdutoDto
	 * @param result
	 * 
	 */
	private void validarDadosExistentes(ProdutoDto cadastroProdutoDto, BindingResult result) {
		/*Optional<Produto> produto = this.produtoService.getProduto(cadastroProdutoDto.getId());
		if (!produto.isPresent()) {
			result.addError(new ObjectError("produto", "Esta Produto já foi Cadastrada no Sistema."));
		}*/
		this.produtoService.gerProdutoByNome(cadastroProdutoDto.getName())
		.ifPresent(marc -> result.addError(new ObjectError("produto", "Esta Produto ja foi Cadastrada no Sistema.")));
	}
}
