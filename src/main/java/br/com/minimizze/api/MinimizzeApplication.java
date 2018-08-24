package br.com.minimizze.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("br.com.minimizze.api.entities")
public class MinimizzeApplication {

	public static void main(String[] args) {
		SpringApplication.run(MinimizzeApplication.class, args);
	}
}
