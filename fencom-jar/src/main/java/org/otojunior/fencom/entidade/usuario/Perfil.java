/**
 * 
 */
package org.otojunior.fencom.entidade.usuario;

import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;

import org.otojunior.fencom.entidade.EntidadeBase;

/**
 * @author 01456231650
 *
 */
@Entity
public class Perfil extends EntidadeBase {
	private static final long serialVersionUID = -5148398635409287874L;
	
	@NotNull
	@Column(nullable=false, length=20)
	private String perfil;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private Set<Usuario> usuarios;

	/**
	 * 
	 * @param usuario
	 */
	public void adicionarUsuario(Usuario usuario) {
		if (usuarios == null) {
			usuarios = new LinkedHashSet<>();
		}
		usuarios.add(usuario);
	}

	/**
	 * @return the perfil
	 */
	public String getPerfil() {
		return perfil;
	}

	/**
	 * @return the usuarios
	 */
	public Set<Usuario> getUsuarios() {
		if (usuarios == null) {
			usuarios = new LinkedHashSet<>();
		}
		return Collections.unmodifiableSet(usuarios);
	}

	/**
	 * 
	 * @param usuario
	 */
	public void removerUsuario(Usuario usuario) {
		if (usuarios == null) {
			usuarios = new LinkedHashSet<>();
		}
		usuarios.remove(usuario);
	}
	
	/**
	 * @param perfil the perfil to set
	 */
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	
	/**
	 * @param usuarios the usuarios to set
	 */
	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
}
