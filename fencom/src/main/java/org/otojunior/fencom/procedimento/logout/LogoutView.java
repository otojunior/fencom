/**
 * 
 */
package org.otojunior.fencom.procedimento.logout;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 * @author 01456231650
 *
 */
@ManagedBean
@SessionScoped
public class LogoutView {
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
}
