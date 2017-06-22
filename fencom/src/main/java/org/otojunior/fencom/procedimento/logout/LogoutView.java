/**
 * 
 */
package org.otojunior.fencom.procedimento.logout;

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
public class LogoutView {
	
	@Inject
	private InitService service;
	
	/**
	 * Logout
	 * @return
	 */
	public String logout() {
		FacesContext.
			getCurrentInstance().
			getExternalContext().
			invalidateSession();
        return "/index.xhtml?faces-redirect=true";
	}
	
	/**
	 * 
	 * @return
	 */
	public String logado() {
		service.getUsuarioLogado();
		return null;
	}
}
