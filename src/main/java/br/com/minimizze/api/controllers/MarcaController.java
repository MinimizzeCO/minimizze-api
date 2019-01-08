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

import br.com.minimizze.api.dtos.MarcaDto;
import br.com.minimizze.api.entities.Marca;
import br.com.minimizze.api.response.Response;
import br.com.minimizze.api.services.MarcaService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/")
public class MarcaController {

	private static final Logger log = LoggerFactory.getLogger(MarcaController.class);
	
	@Autowired
	private MarcaService marcaService;
	
	public MarcaController() {
		
	}
	
	/**
	 * Cadastra uma Marca no Sistema
	 * 
	 * @param MarcaDto
	 * @param result
	 * 
	 * @return ResponseEntity<Response<MarcaDto>>
	 * @throws NoSuchAlgorithmException
	 */
	@PostMapping
	@RequestMapping(value = "cadastro-marca")
	public ResponseEntity<Response<MarcaDto>> cadastrar(@Valid @RequestBody MarcaDto cadastroMarcaDto,BindingResult result) throws NoSuchAlgorithmException{
		log.info("Cadastrando Marca",cadastroMarcaDto.toString());
		
		Response<MarcaDto> response = new Response<MarcaDto>();
		
		validarDadosExistentes(cadastroMarcaDto,result);
		Marca marca = this.marcaDtoToMarca(cadastroMarcaDto,result);
		
		if (result.hasErrors()) {
			log.info("Erro validando cadastro da Marca",result.getAllErrors());
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		this.marcaService.persistir(marca);
		
		response.setData(this.marcaToMarcaDto(marca));
		return ResponseEntity.ok(response);
	}
	
	/**
	 * Retorna todas as Marca do Sistema
	 * 
	 * @return ResponseEntity<List<Marca>>
	 * @throws NoSuchAlgorithmException
	 */
	@GetMapping
	@RequestMapping(value = "marcas")
	public ResponseEntity<List<Marca>> getMarcas() throws NoSuchAlgorithmException{
		
		List<Marca> marca = this.marcaService.getAllMarcas();
		//marca.addAll(this.marcaService.getAllMarcas());
		
		return ResponseEntity.ok(marca);
	}
	
	/**
	 * Converte uma Marca Entitie para uma MarcaDto
	 * 
	 * @param Marca
	 * @param result
	 * @return MarcaDto
	 * @throws NoSuchAlgorithmException
	 */
	private MarcaDto marcaToMarcaDto(Marca marca) {
		MarcaDto marcaDto= new MarcaDto();
		
		marcaDto.setId(marca.getId());
		marcaDto.setNome(marca.getNome());
		return marcaDto;
	}

	/**
	 * Converte a Marca Dto para uma Marca Entities
	 * 
	 * @param MarcaDto
	 * @param result
	 * @return Marca
	 * @throws NoSuchAlgorithmException
	 */
	private Marca marcaDtoToMarca(@Valid MarcaDto cadastroMarcaDto, BindingResult result) 
		throws NoSuchAlgorithmException{
		Marca marca = new Marca();
		marca.setNome(cadastroMarcaDto.getNome());
		return marca;
	}

	/**
	 * Verifica se a Marca já Existe
	 * 
	 * @param MarcaDto
	 * @param result
	 * 
	 */
	private void validarDadosExistentes(MarcaDto cadastroMarcaDto, BindingResult result) {
		/*Optional<Marca> marca = this.marcaService.getMarca(cadastroMarcaDto.getId());
		if (!marca.isPresent()) {
			result.addError(new ObjectError("marca", "Esta Marca já foi Cadastrada no Sistema."));
		}*/
		this.marcaService.gerMarcaByNome(cadastroMarcaDto.getNome())
		.ifPresent(marc -> result.addError(new ObjectError("marca", "Esta Marca ja foi Cadastrada no Sistema.")));
	}
}
