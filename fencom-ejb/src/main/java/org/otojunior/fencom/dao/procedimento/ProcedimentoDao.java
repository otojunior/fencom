/**
 * 
 */
package org.otojunior.fencom.dao.procedimento;

import java.util.List;

import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;
import org.otojunior.fencom.dao.DaoBase;
import org.otojunior.fencom.entidade.procedimento.Procedimento;

/**
 * @author 01456231650
 *
 */
public class ProcedimentoDao extends DaoBase<Procedimento> {
	/**
	 * 
	 * @param editora
	 * @return
	 */
	public Long count(String descricao, String codigoGuia) {
		TypedQuery<Long> query = getEntityManager().createQuery(
			jpqlcount(descricao, codigoGuia), 
			Long.class);
		if (StringUtils.isNotBlank(descricao)) {
			query.setParameter("_descricao", descricao);
		}
		if (StringUtils.isNotBlank(codigoGuia)) {
			query.setParameter("_codigoGuia", codigoGuia);
		}
		return query.getSingleResult();
	}

	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	public List<Procedimento> pesquisar(String descricao, String codigoGuia) {
		TypedQuery<Procedimento> query = getEntityManager().createQuery(
			jpql(descricao, codigoGuia), 
			Procedimento.class);
		if (StringUtils.isNotBlank(descricao)) {
			query.setParameter("_descricao", descricao);
		}
		if (StringUtils.isNotBlank(codigoGuia)) {
			query.setParameter("_codigoGuia", codigoGuia);
		}
		return query.getResultList();
	}
	
	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	public List<Procedimento> pesquisar(String descricao, String codigoGuia, int offset, int limit) {
		TypedQuery<Procedimento> query = getEntityManager().createQuery(
			jpql(descricao, codigoGuia), 
			Procedimento.class);
		if (StringUtils.isNotBlank(descricao)) {
			query.setParameter("_descricao", descricao);
		}
		if (StringUtils.isNotBlank(codigoGuia)) {
			query.setParameter("_codigoGuia", codigoGuia);
		}
		query.setFirstResult(offset);
		query.setMaxResults(limit);
		return query.getResultList();
	}
	
	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	public List<Procedimento> pesquisarIds(String descricao, String codigoGuia) {
		TypedQuery<Procedimento> query = getEntityManager().createQuery(
			jpqlids(descricao, codigoGuia), 
			Procedimento.class);
		if (StringUtils.isNotBlank(descricao)) {
			query.setParameter("_descricao", descricao);
		}
		if (StringUtils.isNotBlank(codigoGuia)) {
			query.setParameter("_codigoGuia", codigoGuia);
		}
		return query.getResultList();
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public Procedimento pesquisarPorId(Long id) {
		return getEntityManager().find(Procedimento.class, id);
	}
	
	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	private String jpql(String descricao, String codigoGuia) {
		String jpql = "select p from Procedimento p where";
		
		boolean algumaClausula = false;
		if (StringUtils.isNotBlank(descricao)) {
			jpql += " and p.descricao = :_descricao";
			algumaClausula = true;
		}
		if (StringUtils.isNotBlank(codigoGuia)) {
			jpql += " and p.codigoGuia = :_codigoGuia";
			algumaClausula = true;
		}
		
		jpql = (algumaClausula) ? 
			jpql.replace(" where and", " where") : 
			jpql.replace(" where", "");
		
		return jpql;
	}

	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	private String jpqlcount(String descricao, String codigoGuia) {
		String jpql = "select count(p) from Procedimento p where";
		
		boolean algumaClausula = false;
		if (StringUtils.isNotBlank(descricao)) {
			jpql += " and p.descricao = :_descricao";
			algumaClausula = true;
		}
		if (StringUtils.isNotBlank(codigoGuia)) {
			jpql += " and p.codigoGuia = :_codigoGuia";
			algumaClausula = true;
		}
		
		jpql = (algumaClausula) ? 
			jpql.replace(" where and", " where") : 
			jpql.replace(" where", "");
		
		return jpql;
	}

	/**
	 * 
	 * @param descricao
	 * @param codigoGuia
	 * @return
	 */
	private String jpqlids(String descricao, String codigoGuia) {
		String jpql = "select new " + 
			Procedimento.class.getName() +
			"(p.id) from Procedimento p where";
		
		boolean algumaClausula = false;
		if (StringUtils.isNotBlank(descricao)) {
			jpql += " and p.descricao = :_descricao";
			algumaClausula = true;
		}
		if (StringUtils.isNotBlank(codigoGuia)) {
			jpql += " and p.codigoGuia = :_codigoGuia";
			algumaClausula = true;
		}
		
		jpql = (algumaClausula) ? 
			jpql.replace(" where and", " where") : 
			jpql.replace(" where", "");
		
		return jpql;
	}
}
