/**
 * 
 */
package org.otojunior.fencom.procedimento.logout;

import java.util.Arrays;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

import org.otojunior.fencom.service.init.InitService;

/**
 * @author 01456231650
 *
 */
@ManagedBean
@SessionScoped
public class SessionControlView {
	
	@Inject
	private InitService service;
	
	private Cooperativa cooperativa;
	
	/**
	 * Logout
	 * @return
	 */
	public String logout() {
		FacesContext.
			getCurrentInstance().
			getExternalContext().
			invalidateSession();
        return "/pages/index.xhtml?faces-redirect=true";
	}
	
	/**
	 * 
	 * @return
	 */
	public String logado() {
		service.getUsuarioLogado();
		return null;
	}
	
	/**
	 * 	
	 * @return
	 */
	public List<Cooperativa> getCooperativas() {
		/*
		 *	SIMULAÇÃO DE PESQUISA EM BANCO 
		 */
		return Arrays.asList(
			new Cooperativa(1L, "Cooperativa 1"),
			new Cooperativa(2L, "Cooperativa 2"),
			new Cooperativa(3L, "Cooperativa 3")
		);
	}
	
	
	/**
	 * Classe estática para simular pesquisa em tabela.
	 * @author 01456231650
	 */
	/*
	 *	SIMULAÇÃO 
	 */
	public static class Cooperativa {
		private Long id;
		private String nome;
		
		/**
		 * 
		 * @param id
		 * @param nome
		 */
		public Cooperativa(Long id, String nome) {
			this.id = id;
			this.nome = nome;
		}
		
		/**
		 * @return the id
		 */
		public Long getId() { return id; }
		
		/**
		 * @return the nome
		 */
		public String getNome() { return nome; }
	}


	/**
	 * @return the cooperativa
	 */
	public Cooperativa getCooperativa() {
		return cooperativa;
	}

	/**
	 * @param cooperativa the cooperativa to set
	 */
	public void setCooperativa(Cooperativa cooperativa) {
		this.cooperativa = cooperativa;
	}
}
