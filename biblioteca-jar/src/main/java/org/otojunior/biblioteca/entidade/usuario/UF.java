/**
 * 
 */
package org.otojunior.biblioteca.entidade.usuario;

/**
 * @author 01456231650
 *
 */
public enum UF {
	ACRE("Acre", "AC"),
	AMAPA("Amapá", "AP"),
	AMAZONAS("Amazonas", "AM"),
	CEARA("Ceará", "CE"),
	DISTRITO_FEDERAL("Distrito Federal", "DF"),
	BAHIA("Bahia", "BA"),
	ESPIRITO_SANTO("Espírito Santo", "ES"),
	MARANHAO("Maranão", "MA"),
	MATO_GROSSO("Mato Grosso", "MT"),
	MATO_GROSSO_DO_SUL("Mato Grosso do Sul", "MS"),
	MINAS_GERAIS("Minas Gerais", "MG"),
	PIAUI("Piauí", "PI"),
	RIO_DE_JANEIRO("Rio de Janeiro", "RJ"),
	RIO_GRANDE_DO_NORTE("Rio Grande do Norte", "RN"),
	RIO_GRANDE_DO_SUL("Rio Grande do Sul", "RS"),
	SAO_PAULO("São Paulo", "SP"),
	SERGIPE("Sergipe", "SE");
	
	
	
	private String nome;
	private String sigla;
	
	/**
	 * 
	 * @param nome
	 * @param sigla
	 */
	private UF(String nome, String sigla) {
		this.nome = nome;
		this.sigla = sigla;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getNome() {
		return nome;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getSigla() {
		return sigla;
	}
	
	/**
	 * 
	 * @param sigla
	 * @return
	 */
	public static UF pesquisarPorSigla(String sigla) {
		UF encontrado = null;
		for (UF uf : UF.values()) {
			if (uf.getSigla().equals(sigla)) {
				encontrado = uf;
				break;
			}
		}
		return encontrado;
	}
}
