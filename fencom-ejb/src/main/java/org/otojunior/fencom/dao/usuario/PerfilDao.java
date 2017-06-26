/**
 * 
 */
package org.otojunior.fencom.dao.usuario;

import javax.ejb.Stateless;

import org.otojunior.fencom.dao.DaoBase;
import org.otojunior.fencom.entidade.usuario.Perfil;

/**
 * @author 01456231650
 *
 */
@Stateless
public class PerfilDao extends DaoBase<Perfil> {
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Perfil pesquisarPorId(Long id) {
		return getEntityManager().find(Perfil.class, id);
	}
}
