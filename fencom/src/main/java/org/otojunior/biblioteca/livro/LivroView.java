/**
 * 
 */
package org.otojunior.biblioteca.livro;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.otojunior.biblioteca.entidade.livro.Livro;
import org.otojunior.biblioteca.service.livro.LivroService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author otojunior
 *
 */
@ManagedBean
@ViewScoped
public class LivroView {
	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(LivroView.class);
	
	// Pesquisa
	private String nome;
	private String editora;
	
	// Listagem
	private List<Livro> livros;
	private List<Livro> selecionados;
	//private boolean todosSelecionados = false;
	
	private LivroLazyDataModel livroLazyDataModel;
	
	@Inject
	private LivroService service;
	
	/**
	 * 
	 * @return
	 */
	public String pesquisar() {
		livroLazyDataModel = new LivroLazyDataModel(service, nome, editora);
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
		selecionados = new ArrayList<>(service.pesquisarIds(nome, editora));
		return null;
	}
	
	/**
	 * 
	 * @return
	 */
	public String limparTodos() {
		selecionados.clear();
		return null;
	}
	
	/*
	public void onToggleSelect(ToggleSelectEvent event) {
		if (todosSelecionados) {
			selecionados = Collections.emptyList();
			todosSelecionados = false;
		} else {
			selecionados = new ArrayList<>(livros);
			todosSelecionados = true;
		}
	}

	public void onRowSelectCheckbox(SelectEvent event) {
		LOG.info("Source.class: " + event.getSource().getClass().getName());
		LOG.info("Source.toString: " + event.getSource().toString());
	}
	
	public void rowUnselectCheckbox(UnselectEvent event) {
		LOG.info("Source.class: " + event.getSource().getClass().getName());
		LOG.info("Source.toString: " + event.getSource().toString());
	}
	*/
	
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
	 * @return the editora
	 */
	public String getEditora() {
		return editora;
	}

	/**
	 * @param editora the editora to set
	 */
	public void setEditora(String editora) {
		this.editora = editora;
	}

	/**
	 * @return the livros
	 */
	public List<Livro> getLivros() {
		return livros;
	}

	/**
	 * @param livros the livros to set
	 */
	public void setLivros(List<Livro> livros) {
		this.livros = livros;
	}

	/**
	 * @return the selecionados
	 */
	public List<Livro> getSelecionados() {
		return selecionados;
	}

	/**
	 * @param selecionados the selecionados to set
	 */
	public void setSelecionados(List<Livro> selecionados) {
		this.selecionados = selecionados;
	}

	/**
	 * @return the livroLazyDataModel
	 */
	public LivroLazyDataModel getLivroLazyDataModel() {
		return livroLazyDataModel;
	}
}
