/**
 * 
 */
package org.otojunior.fencom.procedimento;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

import org.otojunior.fencom.entidade.procedimento.Procedimento;
import org.otojunior.fencom.service.procedimento.ProcedimentoService;
import org.primefaces.event.ToggleSelectEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author otojunior
 *
 */
@ManagedBean
@ViewScoped
public class ProcedimentoView {
	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(ProcedimentoView.class);
	
	// Pesquisa
	private String descricao;
	private String codigoGuia;
	
	// Listagem
	private List<Procedimento> procedimentos;
	private List<Procedimento> selecionados;
	//private boolean todosSelecionados = false;
	
	private ProcedimentoLazyDataModel procedimentoLazyDataModel;
	
	@Inject
	private ProcedimentoService service;
	
	/**
	 * @return the codigoGuia
	 */
	public String getCodigoGuia() {
		return codigoGuia;
	}
	
	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}
	
	/**
	 * @return the procedimentoLazyDataModel
	 */
	public ProcedimentoLazyDataModel getProcedimentoLazyDataModel() {
		return procedimentoLazyDataModel;
	}
	
	/**
	 * @return the procedimentos
	 */
	public List<Procedimento> getProcedimentos() {
		return procedimentos;
	}
	
	
	/**
	 * @return the selecionados
	 */
	public List<Procedimento> getSelecionados() {
		return selecionados;
	}

	/**
	 * 
	 * @return
	 */
	public String limparTodos() {
		selecionados.clear();
		return null;
	}

	public void onToggleSelect(ToggleSelectEvent event) {
		if (event.isSelected()) {
			selecionados = new ArrayList<>(service.pesquisarIds(descricao, codigoGuia));
		} else {
			selecionados.clear();
		}
	}

	/**
	 * 
	 * @return
	 */
	public String pesquisar() {
		procedimentoLazyDataModel = new ProcedimentoLazyDataModel(service, descricao, codigoGuia);
		return null;
	}

	/**
	 * 
	 * @return
	 */
	public String processar() {
		selecionados = service.selecionarImpares(selecionados);
		return null;
	}

	/**
	 * 
	 * @return
	 */
	public String selecionarTodos() {
		selecionados = new ArrayList<>(service.pesquisarIds(descricao, codigoGuia));
		return null;
	}

	/**
	 * @param codigoGuia the codigoGuia to set
	 */
	public void setCodigoGuia(String codigoGuia) {
		this.codigoGuia = codigoGuia;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @param procedimentoLazyDataModel the procedimentoLazyDataModel to set
	 */
	public void setProcedimentoLazyDataModel(ProcedimentoLazyDataModel procedimentoLazyDataModel) {
		this.procedimentoLazyDataModel = procedimentoLazyDataModel;
	}

	/**
	 * @param procedimentos the procedimentos to set
	 */
	public void setProcedimentos(List<Procedimento> procedimentos) {
		this.procedimentos = procedimentos;
	}
	
	/**
	 * @param selecionados the selecionados to set
	 */
	public void setSelecionados(List<Procedimento> selecionados) {
		this.selecionados = selecionados;
	}
}
