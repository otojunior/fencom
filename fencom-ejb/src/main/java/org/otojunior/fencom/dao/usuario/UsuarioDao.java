/**
 * 
 */
package org.otojunior.fencom.dao.usuario;

import javax.ejb.Stateless;

import org.otojunior.fencom.dao.DaoBase;
import org.otojunior.fencom.entidade.usuario.Usuario;

/**
 * @author 01456231650
 *
 */
@Stateless
public class UsuarioDao extends DaoBase<Usuario> {
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Usuario pesquisarPorId(Long id) {
		return getEntityManager().find(Usuario.class, id);
	}
}
