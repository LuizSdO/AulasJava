package br.com.fiap.tads.ddd.empregado;

import java.io.IOException;
import java.net.URI;

import org.glassfish.grizzly.http.server.HttpServer;
import org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpServerFactory;
import org.glassfish.jersey.server.ResourceConfig;

public class App {

	public static final String BASE_URI = "http://localhost:8080";
	
	public static HttpServer startServer() {
		final ResourceConfig rc = new ResourceConfig().packages("br.com.fiap.tads.ddd.empregado.controller");
//													endereço onde vai trabalhar , onde esta o servidor
		return GrizzlyHttpServerFactory.createHttpServer(URI.create(BASE_URI), rc);
	}
	
	
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws IOException {
//		constante
		final HttpServer server = startServer();
		
//		%s: conteudo da variavel; %n: pular linha
		System.out.println(String.format("Jersey iniciado e os endpoints estão disponíveis em" 
				+ " %s%nControl-C para parar o servidor", BASE_URI));
		
		System.in.read();
		server.stop();
	}

}
