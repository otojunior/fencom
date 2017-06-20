/**
 * 
 */
package org.otojunior.fencom.entidade.usuario;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.otojunior.fencom.entidade.EntidadeBase;

/**
 * @author 01456231650
 *
 */
@Entity
public class Usuario extends EntidadeBase {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6032559148522702150L;
	
	@NotNull
	@Column(nullable=false, length=50)
	private String nome;
	
	@NotNull
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;

	@NotNull
	@Column(nullable=false, length=1)
	private Genero genero;
	
	@Lob
	@Column(nullable=true)
	private Blob foto;
	
	@NotNull
	@Valid
	@Embedded
	private Endereco endereco;

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @return the dataNascimento
	 */
	public Date getDataNascimento() {
		return dataNascimento;
	}

	/**
	 * @param dataNascimento the dataNascimento to set
	 */
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	/**
	 * @return the genero
	 */
	public Genero getGenero() {
		return genero;
	}

	/**
	 * @param genero the genero to set
	 */
	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	/**
	 * @return the foto
	 */
	public Blob getFoto() {
		return foto;
	}

	/**
	 * @param foto the foto to set
	 */
	public void setFoto(Blob foto) {
		this.foto = foto;
	}

	/**
	 * @return the endereco
	 */
	public Endereco getEndereco() {
		return endereco;
	}

	/**
	 * @param endereco the endereco to set
	 */
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	/**
	 * Campo calculado.
	 * @return
	 */
	public Integer getIdade() {
		/*
		 * A implementar
		 */
		return null;
	}
}
