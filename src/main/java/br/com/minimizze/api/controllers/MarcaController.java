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

import br.com.minimizze.api.dtos.MarcaDto;
import br.com.minimizze.api.entities.Marca;
import br.com.minimizze.api.response.Response;
import br.com.minimizze.api.services.MarcaService;

@RestController
@RequestMapping("/api/cadastro-marca")
@CrossOrigin(origins = "*")
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
	 * Converte a Marca Dto para uma Marca Entitie
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
	 * Verifica se a Marca Já Existe
	 * 
	 * @param MarcaDto
	 * @param result
	 * 
	 */
	private void validarDadosExistentes(MarcaDto cadastroMarcaDto, BindingResult result) {
		/*Optional<Marca> marca = this.marcaService.getMarca(cadastroMarcaDto.getId());
		if (!marca.isPresent()) {
			result.addError(new ObjectError("marca", "Está Marca já foi Cadastrada no Sistema."));
		}*/
		this.marcaService.gerMarcaByNome(cadastroMarcaDto.getNome())
		.ifPresent(marc -> result.addError(new ObjectError("marca", "Está Marca já foi Cadastrada no Sistema.")));
	}
}
