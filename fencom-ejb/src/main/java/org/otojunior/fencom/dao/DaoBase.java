/**
 * 
 */
package org.otojunior.fencom.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.otojunior.fencom.entidade.EntidadeBase;
import org.otojunior.fencom.entidade.IEntidadeBase;

/**
 * @author 01456231650
 *
 */
public abstract class DaoBase<T extends EntidadeBase> implements IDaoBase<T> {
	@PersistenceContext
	private EntityManager entityManager;

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void persistir(IEntidadeBase entidade) {
		entityManager.persist(entidade);
	}
	
	/**
	 * 
	 * @return
	 */
	public EntityManager getEntityManager() {
		return entityManager;
	}
}
