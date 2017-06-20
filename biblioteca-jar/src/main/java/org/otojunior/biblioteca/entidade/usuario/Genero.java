/**
 * 
 */
package org.otojunior.biblioteca.entidade.usuario;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author 01456231650
 *
 */
public enum Genero {
	MASCULINO("Masculino", 'M'),
	FEMININO("Feminino", 'F');
	
	private final String descricao;
	private final Character sigla;
	
	/**
	 * 
	 * @param descricao
	 * @param sigla
	 */
	private Genero(final String descricao, final Character sigla) {
		this.descricao = descricao;
		this.sigla = sigla;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @return the sigla
	 */
	public Character getSigla() {
		return sigla;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
