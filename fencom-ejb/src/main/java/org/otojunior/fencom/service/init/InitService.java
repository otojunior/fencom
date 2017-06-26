/**
 * 
 */
package org.otojunior.fencom.service.init;

import java.util.Collections;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.SessionContext;
import javax.ejb.Singleton;
import javax.ejb.Startup;

import org.otojunior.fencom.entidade.mock.PerfilFabrica;
import org.otojunior.fencom.entidade.mock.ProcedimentoFabrica;
import org.otojunior.fencom.entidade.mock.UsuarioFabrica;
import org.otojunior.fencom.entidade.procedimento.Procedimento;
import org.otojunior.fencom.entidade.usuario.Perfil;
import org.otojunior.fencom.entidade.usuario.Usuario;
import org.otojunior.fencom.service.procedimento.ProcedimentoService;
import org.otojunior.fencom.service.usuario.PerfilService;
import org.otojunior.fencom.service.usuario.UsuarioService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Service de inicio da aplicação.
 * @author 01456231650
 *
 */
@Singleton
@Startup
public class InitService {
	private static Logger LOG = LoggerFactory.getLogger(InitService.class);
	
	@EJB private UsuarioService usuarioService;
	@EJB private ProcedimentoService procedimentoService;
	@EJB private PerfilService perfilService;
	
	@Resource 
	private SessionContext ctx;
	
	/**
	 * 
	 */
	public InitService() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 
	 */
	@PostConstruct
	public void init() {
		final int N_USUARIOS = 0;
		final int N_PROCEDIMENTOS = 30;
		final boolean N_PERFIS = true;
		
		for (int i = 0; i < N_USUARIOS; i++) {
			Usuario u = UsuarioFabrica.criar();
			usuarioService.persistir(u);
		}
		
		for (int i = 0; i < N_PROCEDIMENTOS; i++) {
			Procedimento p = ProcedimentoFabrica.criar();
			procedimentoService.persistir(p);
			if (i % 100 == 0) {
				LOG.info("Carregando registros... " + ((double)i/N_PROCEDIMENTOS*100) + "% concluído");
			}
		}
		
		if (N_PERFIS) {
			Usuario[] usuarios = new Usuario[3];
			usuarios[0] = UsuarioFabrica.criar("admin", "admin123");
			usuarios[1] = UsuarioFabrica.criar("operador", "operxxx");
			usuarios[2] = UsuarioFabrica.criar("gerente", "gerenteyyy");
			
			Perfil[] perfis = new Perfil[3];
			perfis[0] = PerfilFabrica.criar("Administrador", Collections.singleton(usuarios[0]));
			perfis[1] = PerfilFabrica.criar("Operador", Collections.singleton(usuarios[1]));
			perfis[2] = PerfilFabrica.criar("Gerente", Collections.singleton(usuarios[2]));
			
			for (Perfil perfil : perfis) {
				perfilService.persistir(perfil);
			}
		}
	}

	/**
	 * 
	 */
	public void getUsuarioLogado() {
		LOG.info("Usuário Logado: " + ctx.getCallerPrincipal().getName());
	}
}
