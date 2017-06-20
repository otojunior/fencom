/**
 * 
 */
package org.otojunior.fencom.procedimento;

import java.util.List;
import java.util.Map;

import org.otojunior.fencom.entidade.procedimento.Procedimento;
import org.otojunior.fencom.service.procedimento.ProcedimentoService;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author otojunior
 *
 */
public class ProcedimentoLazyDataModel extends LazyDataModel<Procedimento> {
	private static final long serialVersionUID = 5616001299950439325L;

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(ProcedimentoLazyDataModel.class); 

	/*
	 * Campos de pesquisa
	 */
	private String descricao;
	private String codigoGuia;
	private Long rowCount;
	
	private ProcedimentoService service;

	/**
	 * 
	 * @param nome
	 * @param editora
	 */
	public ProcedimentoLazyDataModel(ProcedimentoService service, String descricao, String codigoGuia) {
		this.service = service;
		this.descricao = descricao;
		this.codigoGuia = codigoGuia;
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Procedimento getRowData(String rowKey) {
		Long id = Long.valueOf(rowKey);
		return new Procedimento(id);
		//return service.pesquisarPorId(id);
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Object getRowKey(Procedimento object) {
		return object.getId();
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public List<Procedimento> load(int first, int pageSize, String sortField, SortOrder sortOrder,
			Map<String, Object> filters) {
		List<Procedimento> resultado = service.pesquisar(descricao, codigoGuia, first, pageSize);
		return resultado;
	}
	
	@Override
	public int getRowCount() {
		/*
		 * CACHE do rowCount
		 */
		if (rowCount == null) {
			rowCount = service.count(descricao, codigoGuia);
		}
		return rowCount.intValue();
	}
}
