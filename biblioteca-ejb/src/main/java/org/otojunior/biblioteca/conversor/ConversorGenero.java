/**
 * 
 */
package org.otojunior.biblioteca.conversor;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import org.otojunior.biblioteca.entidade.usuario.Genero;

/**
 * @author 01456231650
 *
 */
@Converter(autoApply=true)
public class ConversorGenero implements AttributeConverter<Genero, Character> {
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Character convertToDatabaseColumn(Genero attribute) {
		return (attribute != null) ? attribute.getSigla() : null;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public Genero convertToEntityAttribute(Character dbData) {
		Genero genero = null;
		if (dbData != null) {
			switch (dbData.charValue()) {
				case 'M': genero = Genero.MASCULINO; break;
				case 'F': genero = Genero.FEMININO; break;
			}
		}
		return genero;
	}
}
