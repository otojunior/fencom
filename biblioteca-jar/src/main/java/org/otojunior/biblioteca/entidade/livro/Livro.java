/**
 * 
 */
package org.otojunior.biblioteca.entidade.livro;

import java.sql.Blob;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.otojunior.biblioteca.entidade.EntidadeBase;

/**
 * @author 01456231650
 *
 */
@Entity
public class Livro extends EntidadeBase {
	private static final long serialVersionUID = -1584199678720540839L;
	
	public Livro() { }
	
	public Livro(Long id) {
		setId(id);
	}
	
	/**
	 * 
	 */
	@NotNull
	@Column(nullable=false, length=50)
	private String nome;
	
	/**
	 * 
	 */
	@NotNull
	@Column(nullable=false, length=30)
	private String editora;
	
	/**
	 * 
	 */
	@Min(1)
	@Column(nullable=true)
	private Integer paginas;
	
	/**
	 * 
	 */
	@NotNull
	@ElementCollection
	private List<String> autores;
	
	/**
	 * 
	 */
	@NotNull
	@Min(1000000000L)
	@Max(10000000000L)
	@Column(nullable=false)
	private Long isbn10;
	
	/**
	 * 
	 */
	@NotNull
	@Min(1000000000000L)
	@Max(10000000000000L)
	@Column(nullable=false)
	private Long isbn13;

	/**
	 * 
	 */
	@Lob
	@Column(nullable=true)
	private Blob capa;
	
	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @return the editora
	 */
	public String getEditora() {
		return editora;
	}

	/**
	 * @param editora the editora to set
	 */
	public void setEditora(String editora) {
		this.editora = editora;
	}

	/**
	 * @return the paginas
	 */
	public Integer getPaginas() {
		return paginas;
	}

	/**
	 * @param paginas the paginas to set
	 */
	public void setPaginas(Integer paginas) {
		this.paginas = paginas;
	}

	/**
	 * @return the autores
	 */
	public List<String> getAutores() {
		return autores;
	}

	/**
	 * @param autores the autores to set
	 */
	public void setAutores(List<String> autores) {
		this.autores = autores;
	}

	/**
	 * @return the isbn10
	 */
	public Long getIsbn10() {
		return isbn10;
	}

	/**
	 * @param isbn10 the isbn10 to set
	 */
	public void setIsbn10(Long isbn10) {
		this.isbn10 = isbn10;
	}

	/**
	 * @return the isbn13
	 */
	public Long getIsbn13() {
		return isbn13;
	}

	/**
	 * @param isbn13 the isbn13 to set
	 */
	public void setIsbn13(Long isbn13) {
		this.isbn13 = isbn13;
	}

	/**
	 * @return the capa
	 */
	public Blob getCapa() {
		return capa;
	}

	/**
	 * @param capa the capa to set
	 */
	public void setCapa(Blob capa) {
		this.capa = capa;
	}
}
