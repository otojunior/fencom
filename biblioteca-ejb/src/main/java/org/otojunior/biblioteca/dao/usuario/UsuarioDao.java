/**
 * 
 */
package org.otojunior.biblioteca.dao.usuario;

import javax.ejb.Stateless;

import org.otojunior.biblioteca.dao.DaoBase;
import org.otojunior.biblioteca.entidade.usuario.Usuario;

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
