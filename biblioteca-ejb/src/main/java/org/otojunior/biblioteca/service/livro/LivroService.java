/**
 * 
 */
package org.otojunior.biblioteca.service.livro;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.apache.commons.collections4.ListUtils;
import org.apache.commons.collections4.Predicate;
import org.otojunior.biblioteca.dao.livro.LivroDao;
import org.otojunior.biblioteca.entidade.livro.Livro;
import org.otojunior.biblioteca.service.ServiceBase;

/**
 * @author 01456231650
 *
 */
@Stateless
public class LivroService extends ServiceBase {
	@EJB
	private LivroDao dao;
	
	/**
	 * 
	 * @param livro
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
	public void persistir(Livro livro) {
		dao.persistir(livro);
	}
	
	/**
	 * 
	 * @param editora
	 * @return
	 */
	public Long count(String nome, String editora) {
		return dao.count(nome, editora);
	}
	
	/**
	 * 
	 * @param editora
	 * @return
	 */
	public List<Livro> pesquisar(String nome, String editora) {
		return dao.pesquisar(nome, editora);
	}
	
	/**
	 * 
	 * @param editora
	 * @return
	 */
	public List<Livro> pesquisarIds(String nome, String editora) {
		return dao.pesquisar(nome, editora);
	}

	/**
	 * 
	 * @param nome
	 * @param editora
	 * @param first
	 * @param pageSize
	 * @return
	 */
	public List<Livro> pesquisar(String nome, String editora, int first, int pageSize) {
		return dao.pesquisar(nome, editora, first, pageSize);
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	public Livro pesquisarPorId(Long id) {
		return dao.pesquisarPorId(id);
	}

	/**
	 * Seleciona os registros cujo ID seja ímpar.
	 * @param selecionados
	 * @return
	 */
	public List<Livro> selecionarImpares(List<Livro> selecionados) {
		return ListUtils.select(selecionados, new Predicate<Livro>() {
			@Override
			public boolean evaluate(Livro object) {
				return object.getId().longValue() % 2 != 0;
			}
		});
	}
}
