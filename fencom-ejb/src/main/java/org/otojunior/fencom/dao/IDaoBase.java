/**
 * 
 */
package org.otojunior.fencom.dao;

import org.otojunior.fencom.entidade.IEntidadeBase;

/**
 * @author 01456231650
 *
 */
public interface IDaoBase<T extends IEntidadeBase> {
	/**
	 * 
	 * @param id
	 * @return
	 */
	public T pesquisarPorId(Long id);
	
	/**
	 * 
	 * @param entidade
	 */
	public void persistir(IEntidadeBase entidade);
}
