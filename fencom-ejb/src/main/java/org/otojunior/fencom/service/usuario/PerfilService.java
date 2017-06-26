/**
 * 
 */
package org.otojunior.fencom.service.usuario;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.otojunior.fencom.dao.usuario.PerfilDao;
import org.otojunior.fencom.entidade.usuario.Perfil;
import org.otojunior.fencom.service.ServiceBase;

/**
 * @author 01456231650
 *
 */
@Stateless
public class PerfilService extends ServiceBase {
	@EJB
	private PerfilDao dao;
	
	/**
	 * 
	 * @param perfil
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
	public void persistir(Perfil perfil) {
		dao.persistir(perfil);
	}
}
