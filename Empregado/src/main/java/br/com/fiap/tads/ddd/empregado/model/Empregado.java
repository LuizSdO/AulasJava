package br.com.fiap.tads.ddd.empregado.model;

import java.time.LocalDate;

public class Empregado {
	
	private long id;
	private String nome;
	private LocalDate dataAdmissao;
	private LocalDate dataDesligamento;
	private double salario;
	
	
	public Empregado() {
		super();
	}

	public Empregado(long id, String nome, LocalDate dataAdmissao, double salario) {
		super();
		this.id = id;
		this.nome = nome;
		this.dataAdmissao = dataAdmissao;
		this.salario = salario;
	}

	public Empregado(long id, String nome, LocalDate dataAdmissao, LocalDate dataDesligamento, double salario) {
		super();
		this.id = id;
		this.nome = nome;
		this.dataAdmissao = dataAdmissao;
		this.dataDesligamento = dataDesligamento;
		this.salario = salario;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public LocalDate getDataAdmissao() {
		return dataAdmissao;
	}

	public void setDataAdmissao(LocalDate dataAdmissao) {
		this.dataAdmissao = dataAdmissao;
	}

	public LocalDate getDataDesligamento() {
		return dataDesligamento;
	}

	public void setDataDesligamento(LocalDate dataDesligamento) {
		this.dataDesligamento = dataDesligamento;
	}

	public double getSalario() {
		return salario;
	}

	public void setSalario(double salario) {
		this.salario = salario;
	}

	@Override
	public String toString() {
		return "Empregado [id=" + id + ", nome=" + nome + ", dataAdmissao=" + dataAdmissao + ", dataDesligamento="
				+ dataDesligamento + ", salario=" + salario + "]";
	}
	
	
}
