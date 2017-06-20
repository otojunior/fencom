/**
 * 
 */
package org.otojunior.fencom.service.usuario;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.otojunior.fencom.dao.usuario.UsuarioDao;
import org.otojunior.fencom.entidade.usuario.Usuario;
import org.otojunior.fencom.service.ServiceBase;

/**
 * @author 01456231650
 *
 */
@Stateless
public class UsuarioService extends ServiceBase {
	@EJB
	private UsuarioDao dao;
	
	@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
	public void persistir(Usuario usuario) {
		dao.persistir(usuario);
	}
}
