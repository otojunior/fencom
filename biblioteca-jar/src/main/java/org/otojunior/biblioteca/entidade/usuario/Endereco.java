/**
 * 
 */
package org.otojunior.biblioteca.entidade.usuario;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 * @author 01456231650
 *
 */
@Embeddable
public class Endereco {
	@NotNull
	@Column(nullable=false, length=50)
	private String logradouro;
	
	@Column(nullable=true)
	private String numero;
	
	@Column(nullable=true)
	private String bairro;
	
	@NotNull
	@Column(nullable=false)
	private String cidade;
	
	@NotNull
	@Column(nullable=false, length=2)
	private UF uf;
	
	@NotNull
	private Integer cep;

	/**
	 * @return the logradouro
	 */
	public String getLogradouro() {
		return logradouro;
	}

	/**
	 * @param logradouro the logradouro to set
	 */
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	/**
	 * @return the numero
	 */
	public String getNumero() {
		return numero;
	}

	/**
	 * @param numero the numero to set
	 */
	public void setNumero(String numero) {
		this.numero = numero;
	}

	/**
	 * @return the bairro
	 */
	public String getBairro() {
		return bairro;
	}

	/**
	 * @param bairro the bairro to set
	 */
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	/**
	 * @return the cidade
	 */
	public String getCidade() {
		return cidade;
	}

	/**
	 * @param cidade the cidade to set
	 */
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	/**
	 * @return the uf
	 */
	public UF getUf() {
		return uf;
	}

	/**
	 * @param uf the uf to set
	 */
	public void setUf(UF uf) {
		this.uf = uf;
	}

	/**
	 * @return the cep
	 */
	public Integer getCep() {
		return cep;
	}

	/**
	 * @param cep the cep to set
	 */
	public void setCep(Integer cep) {
		this.cep = cep;
	}
}
