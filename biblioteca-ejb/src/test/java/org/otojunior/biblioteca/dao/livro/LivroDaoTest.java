/**
 * 
 */
package org.otojunior.biblioteca.dao.livro;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.persistence.EntityManager;

import org.junit.Before;
import org.junit.Test;
import org.otojunior.biblioteca.dao.DaoBaseTest;
import org.otojunior.biblioteca.entidade.livro.Livro;
import org.otojunior.biblioteca.entidade.mock.LivroFabrica;
import org.powermock.reflect.Whitebox;

/**
 * @author 01456231650
 *
 */
public class LivroDaoTest extends DaoBaseTest {
	private LivroDao dao;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		super.setUp();
		dao = new LivroDao();
		Whitebox.setInternalState(dao, EntityManager.class, getEntityManager());
		getEntityManager().getTransaction().begin();
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public void tearDown() throws Exception {
		getEntityManager().getTransaction().rollback();
		super.tearDown();
	}
	
	/**
	 * Test method for {@link org.otojunior.biblioteca.dao.livro.LivroDao#pesquisarPorId(java.lang.Long)}.
	 */
	@Test
	public void testPesquisarPorId() {
		dao.persistir(LivroFabrica.criar());
		dao.persistir(LivroFabrica.criar());
		dao.persistir(LivroFabrica.criar());
		List<Livro> lvs = dao.pesquisar(null, null);
		assertNotNull(dao.pesquisarPorId(lvs.get(0).getId()));
		assertNotNull(dao.pesquisarPorId(lvs.get(1).getId()));
		assertNotNull(dao.pesquisarPorId(lvs.get(2).getId()));
	}

	/**
	 * Test method for {@link org.otojunior.biblioteca.dao.livro.LivroDao#pesquisarPorNome(java.lang.String)}.
	 */
	@Test
	public void testPesquisarPorNome() {
		/*
		 * Inserção de 10 livros, sendo que 5 deles terá o nome de "teste"
		 */
		for (int i = 0; i < 10; i++) {
			Livro livro = LivroFabrica.criar();
			if (i % 2 == 0) {
				livro.setNome("teste");
			}
			dao.persistir(livro);
		}
		assertEquals(5, dao.pesquisar("teste", "").size());
	}

	/**
	 * Test method for {@link org.otojunior.biblioteca.dao.livro.LivroDao#pesquisarPorEditora(java.lang.String)}.
	 */
	@Test
	public void testPesquisarPorEditora() {
		/*
		 * Inserção de 10 livros, sendo que 4 deles terá a editora com nome de "teste"
		 */
		for (int i = 0; i < 10; i++) {
			Livro livro = LivroFabrica.criar();
			if (i % 3 == 0) {
				livro.setEditora("teste");
			}
			dao.persistir(livro);
		}
		assertEquals(4, dao.pesquisar("","teste").size());
	}
	
	/**
	 * Test method for {@link org.otojunior.biblioteca.dao.livro.LivroDao#pesquisarPorEditora(java.lang.String)}.
	 */
	@Test
	public void testPesquisarPorNomeEditora() {
		/*
		 * Inserção de 10 livros, sendo que 2 deles terá o nome e a editora preenchidos
		 */
		for (int i = 0; i < 10; i++) {
			Livro livro = LivroFabrica.criar();
			if (i % 5 == 0) {
				livro.setNome("nome_teste");
				livro.setEditora("nome_editora");
			}
			dao.persistir(livro);
		}
		assertEquals(2, dao.pesquisar("nome_teste","nome_editora").size());
	}

	/**
	 * Test method for {@link org.otojunior.biblioteca.dao.livro.LivroDao#pesquisarPorEditora(java.lang.String)}.
	 */
	@Test
	public void testPesquisarVazio() {
		/*
		 * Inserção de 10 livros, sendo que 2 deles terá o nome e a editora preenchidos
		 */
		for (int i = 0; i < 10; i++) {
			Livro livro = LivroFabrica.criar();
			if (i % 5 == 0) {
				livro.setNome("nome_teste");
				livro.setEditora("nome_editora");
			}
			dao.persistir(livro);
		}
		assertEquals(10, dao.pesquisar("","").size());
	}
}
