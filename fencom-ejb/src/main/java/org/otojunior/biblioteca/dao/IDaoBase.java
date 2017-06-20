/**
 * 
 */
package org.otojunior.biblioteca.dao;

import org.otojunior.biblioteca.entidade.IEntidadeBase;

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
