/**
 * 
 */
package org.otojunior.fencom.service.procedimento;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.apache.commons.collections4.ListUtils;
import org.apache.commons.collections4.Predicate;
import org.otojunior.fencom.dao.procedimento.ProcedimentoDao;
import org.otojunior.fencom.entidade.procedimento.Procedimento;
import org.otojunior.fencom.service.ServiceBase;

/**
 * @author 01456231650
 *
 */
public class ProcedimentoService extends ServiceBase {
	@EJB
	private ProcedimentoDao dao;
	
	/**
	 * 
	 * @param editora
	 * @return
	 */
	public Long count(String descricao, String codigoGuia) {
		return dao.count(descricao, codigoGuia);
	}

	/**
	 * 
	 * @param livro
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
	public void persistir(Procedimento procedimento) {
		dao.persistir(procedimento);
	}
	
	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	public List<Procedimento> pesquisar(String descricao, String codigoGuia) {
		return dao.pesquisar(descricao, codigoGuia);
	}
	
	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	public List<Procedimento> pesquisar(String descricao, String codigoGuia, int offset, int limit) {
		return dao.pesquisar(descricao, codigoGuia, offset, limit);
	}

	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	public List<Procedimento> pesquisarIds(String descricao, String codigoGuia) {
		return dao.pesquisarIds(descricao, codigoGuia);
	}
	
	/**
	 * {@inheritDoc}
	 */
	public Procedimento pesquisarPorId(Long id) {
		return dao.pesquisarPorId(id);
	}
	
	/**
	 * Seleciona os registros cujo ID seja ímpar.
	 * @param selecionados
	 * @return
	 */
	public List<Procedimento> selecionarImpares(List<Procedimento> selecionados) {
		return ListUtils.select(selecionados, new Predicate<Procedimento>() {
			@Override
			public boolean evaluate(Procedimento object) {
				return object.getId().longValue() % 2 != 0;
			}
		});
	}
}
