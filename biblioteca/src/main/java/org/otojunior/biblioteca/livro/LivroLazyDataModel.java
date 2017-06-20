/**
 * 
 */
package org.otojunior.biblioteca.livro;

import java.util.List;
import java.util.Map;

import org.otojunior.biblioteca.entidade.livro.Livro;
import org.otojunior.biblioteca.service.livro.LivroService;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author otojunior
 *
 */
public class LivroLazyDataModel extends LazyDataModel<Livro> {
	private static final long serialVersionUID = -4840481768183892892L;
	
	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(LivroLazyDataModel.class); 

	/*
	 * Campos de pesquisa
	 */
	private String nome;
	private String editora;
	private Long rowCount;
	
	private LivroService service;

	/**
	 * 
	 * @param nome
	 * @param editora
	 */
	public LivroLazyDataModel(LivroService service, String nome, String editora) {
		this.service = service;
		this.nome = nome;
		this.editora = editora;
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Livro getRowData(String rowKey) {
		Long id = Long.valueOf(rowKey);
		return new Livro(id);
		//return service.pesquisarPorId(id);
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Object getRowKey(Livro object) {
		return object.getId();
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public List<Livro> load(int first, int pageSize, String sortField, SortOrder sortOrder,
			Map<String, Object> filters) {
		List<Livro> resultado = service.pesquisar(nome, editora, first, pageSize);
		return resultado;
	}
	
	@Override
	public int getRowCount() {
		/*
		 * CACHE do rowCount
		 */
		if (rowCount == null) {
			rowCount = service.count(nome, editora);
		}
		return rowCount.intValue();
	}
}
