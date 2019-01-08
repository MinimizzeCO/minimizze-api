package br.com.minimizze.api.services.impl;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.minimizze.api.entities.Marca;
import br.com.minimizze.api.repositories.MarcaRepository;
import br.com.minimizze.api.services.MarcaService;

@Service
public class MarcaServiceImpl implements MarcaService {

	private static final Logger log = LoggerFactory.getLogger(MarcaServiceImpl.class);

	@Autowired
	private MarcaRepository marcaRepository;
	
	@Override
	public Optional<Marca> getMarca(Long id) {
		log.info("Buscando a Marca Pelo ID: ",id);
		return this.marcaRepository.findById(id);
	}

	@Override
	public List<Marca> getAllMarcas() {
		log.info("Buscando Todas as Marcas");
		return this.marcaRepository.findAll();
	}

	@Override
	public Optional<Marca> gerMarcaByNome(String nome) {
		log.info("Buscando a Marca Pelo Nome: ",nome);
		return this.marcaRepository.findByNome(nome);
	}

	@Override
	public Marca persistir(Marca marca) {
		log.info("Persistindo Marca", marca.getNome());
		return this.marcaRepository.save(marca);
	}

}
