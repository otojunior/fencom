/**
 * 
 */
package org.otojunior.biblioteca.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;

/**
 * @author 01456231650
 *
 */
public class DaoBaseTest {
	private static EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	
	/**
	 * @throws java.lang.Exception
	 */
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		entityManagerFactory = Persistence.createEntityManagerFactory("test");
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		if (entityManagerFactory != null) {
			entityManagerFactory.close();
		}
	}

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		if (entityManagerFactory != null) {
			entityManager = entityManagerFactory.createEntityManager();
		}
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
		if (entityManager != null) {
			entityManager.close();
		}
	}
	
	/**
	 * 
	 * @return
	 */
	public EntityManager getEntityManager() {
		return entityManager;
	}
}
