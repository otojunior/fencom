/**
 * 
 */
package org.otojunior.biblioteca.entidade.mock;



import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.otojunior.biblioteca.entidade.livro.Livro;

/**
 * @author 01456231650
 *
 */
public class LivroFabrica {
	/**
	 * 
	 * @return
	 */
	public static Livro criar() {
		int n = RandomUtils.nextInt(1, 6);
		List<String> autores = new ArrayList<>(n);
		for (int i = 0; i < n; i++) {
			autores.add(RandomStringUtils.randomAlphabetic(5, 15));
		}

		Livro mock = new Livro();
		mock.setNome(RandomStringUtils.randomAlphabetic(10, 20));
		mock.setEditora(RandomStringUtils.randomAlphabetic(10, 20));
		mock.setIsbn10(RandomUtils.nextLong(1000000000L, 10000000000L));
		mock.setIsbn13(RandomUtils.nextLong(1000000000000L, 10000000000000L));
		mock.setPaginas(RandomUtils.nextInt(1, 10000));
		mock.setAutores(autores);
		
		return mock;
	}
}
