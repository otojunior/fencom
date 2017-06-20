/**
 * 
 */
package org.otojunior.fencom.entidade.mock;



import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.otojunior.fencom.entidade.procedimento.Procedimento;

/**
 * @author 01456231650
 *
 */
public class ProcedimentoFabrica {
	/**
	 * 
	 * @return
	 */
	public static Procedimento criar() {
		Procedimento mock = new Procedimento();
		mock.setDescricao(RandomStringUtils.randomAlphabetic(5, 50));
		mock.setCodigoGuia(RandomStringUtils.randomAlphabetic(3, 10));
		mock.setUrgencia((RandomUtils.nextInt(1, 10000) % 2 == 0) ? Boolean.TRUE : Boolean.FALSE);
		
		double valorTotal = RandomUtils.nextDouble(1.0, 1000.0);
		double valorDesconto;
		do {
			valorDesconto = RandomUtils.nextDouble(1.0, 1000.0);
		} while (valorDesconto >= valorTotal);
		
		mock.setValorTotal(Double.valueOf(valorTotal));
		mock.setValorDesconto(Double.valueOf(valorDesconto));

		return mock;
	}
}
