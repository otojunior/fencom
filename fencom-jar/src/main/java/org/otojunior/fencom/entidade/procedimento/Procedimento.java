/**
 * 
 */
package org.otojunior.fencom.entidade.procedimento;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.otojunior.fencom.entidade.EntidadeBase;

/**
 * @author Oto Junior
 *
 */
@Entity
public class Procedimento extends EntidadeBase {
	private static final long serialVersionUID = -5712142630381483474L;
	
	@NotNull
	@Size(min=5, max=50)
	@Column(nullable=false, length=50)
	private String descricao;

	@NotNull
	@Size(min=1, max=10)
	@Column(nullable=false, length=10)
	private String codigoGuia;
	
	@NotNull
	@Column(nullable=false)
	private Boolean urgencia;
	
	@NotNull
	@Column(nullable=false, scale=19, precision=2)
	private Double valorDesconto;
	
	@NotNull
	@Column(nullable=false, scale=19, precision=2)
	private Double valorTotal;
	
	/**
	 * 
	 */
	public Procedimento() {
		
	}
	
	/**
	 * 
	 * @param id
	 */
	public Procedimento(Long id) {
		setId(id);
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @return the codigoGuia
	 */
	public String getCodigoGuia() {
		return codigoGuia;
	}

	/**
	 * @param codigoGuia the codigoGuia to set
	 */
	public void setCodigoGuia(String codigoGuia) {
		this.codigoGuia = codigoGuia;
	}

	/**
	 * @return the urgencia
	 */
	public Boolean getUrgencia() {
		return urgencia;
	}

	/**
	 * @param urgencia the urgencia to set
	 */
	public void setUrgencia(Boolean urgencia) {
		this.urgencia = urgencia;
	}

	/**
	 * @return the valorDesconto
	 */
	public Double getValorDesconto() {
		return valorDesconto;
	}

	/**
	 * @param valorDesconto the valorDesconto to set
	 */
	public void setValorDesconto(Double valorDesconto) {
		this.valorDesconto = valorDesconto;
	}

	/**
	 * @return the valorTotal
	 */
	public Double getValorTotal() {
		return valorTotal;
	}

	/**
	 * @param valorTotal the valorTotal to set
	 */
	public void setValorTotal(Double valorTotal) {
		this.valorTotal = valorTotal;
	}
}
