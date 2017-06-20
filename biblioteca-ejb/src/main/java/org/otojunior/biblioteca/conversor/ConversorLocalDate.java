/**
 * 
 */
package org.otojunior.biblioteca.conversor;

import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

/**
 * @author 01456231650
 *
 */
@Converter(autoApply=true)
public class ConversorLocalDate implements AttributeConverter<LocalDate, Date> {
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Date convertToDatabaseColumn(LocalDate attribute) {
		return (attribute != null) ? Date.valueOf(attribute) : null;
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public LocalDate convertToEntityAttribute(Date dbData) {
		return (dbData != null) ? dbData.toLocalDate() : null;
	}
}
