package br.com.fiap.tads.ddd.empregado.model.repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.tads.ddd.empregado.model.Empregado;

public class EmpregadoRepository {

	private static List<Empregado> empregados;
	
	static {
		empregados = new ArrayList<>();
		
		Empregado e = new Empregado(1L, "Bianca",  LocalDate.of(1975, 2, 15), 50000);
		
		empregados.add(e);
		
	}
	
	public static List<Empregado> findAll(){
		return empregados;
	}
}
