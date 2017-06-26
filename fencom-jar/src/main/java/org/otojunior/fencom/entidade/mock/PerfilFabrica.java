/**
 * 
 */
package org.otojunior.fencom.entidade.mock;

import java.util.Set;

import org.otojunior.fencom.entidade.usuario.Perfil;
import org.otojunior.fencom.entidade.usuario.Usuario;

/**
 * @author 01456231650
 *
 */
public class PerfilFabrica {
	/**
	 * 
	 * @return
	 */
	public static Perfil criar(String perfil, Set<Usuario> usuarios) {
		Perfil mock = new Perfil();
		mock.setPerfil(perfil);
		for (Usuario usuario : usuarios) {
			mock.adicionarUsuario(usuario);
		}
		return mock;
	}
}
