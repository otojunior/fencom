/**
 * 
 */
package org.otojunior.biblioteca.entidade.mock;



import java.time.LocalDate;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.otojunior.biblioteca.entidade.usuario.Endereco;
import org.otojunior.biblioteca.entidade.usuario.Genero;
import org.otojunior.biblioteca.entidade.usuario.UF;
import org.otojunior.biblioteca.entidade.usuario.Usuario;

/**
 * @author 01456231650
 *
 */
public class UsuarioFabrica {
	/**
	 * 
	 * @return
	 */
	public static Usuario criar() {
		Usuario mock = new Usuario();

		Endereco endereco = new Endereco();
		endereco.setLogradouro(RandomStringUtils.randomAlphabetic(5, 15));
		endereco.setNumero("" + RandomUtils.nextInt(10, 10000));
		endereco.setBairro(RandomStringUtils.randomAlphabetic(5, 15));
		endereco.setCidade(RandomStringUtils.randomAlphabetic(5, 15));
		endereco.setCep(RandomUtils.nextInt(10000000, 90000000));
		endereco.setUf(UF.values()[RandomUtils.nextInt(0, 16)]);
		
		mock.setNome(RandomStringUtils.randomAlphabetic(5, 15));
		mock.setGenero(Genero.values()[RandomUtils.nextInt(0, 2)]);
		mock.setDataNascimento(
			LocalDate.of(
				RandomUtils.nextInt(1950, 2016),
				RandomUtils.nextInt(1, 13),
				RandomUtils.nextInt(1, 29)
			)
		);
		
		mock.setEndereco(endereco);
		return mock;
	}
}
