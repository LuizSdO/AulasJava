package br.com.fiap.tads.ddd.empregado.controller;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import br.com.fiap.tads.ddd.empregado.model.repository.EmpregadoRepository;

@Path("/empregado")
public class EmpregadoResource {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response findAll() {
		return Response.ok(EmpregadoRepository.findAll()).build();
	}
}
