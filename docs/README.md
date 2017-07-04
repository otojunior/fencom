## 1. Autenticação e Autorização

### 1.1. Arquivo **standalone.xml** do JBoss:

#### 1.1.1. Via Arquivos de Propriedades

```xml
<subsystem xmlns="urn:jboss:domain:security:1.1">
  <security-domains>
    ...
    <security-domain name="customizado" cache-type="default">
      <authentication>
        <login-module code="UsersRoles" flag="required">
          <module-option name="usersProperties" value="${jboss.server.config.dir}/customizado-users.properties"/>
          <module-option name="rolesProperties" value="${jboss.server.config.dir}/customizado-roles.properties"/>
        </login-module>
      </authentication>
    </security-domain>
```

#### 1.1.2. Via Banco de Dados

```xml
<subsystem xmlns="urn:jboss:domain:security:1.1">
  <security-domains>
    ...
    <security-domain name="customizadobancodados" cache-type="default">
      <authentication>
        <login-module code="Database" flag="required">
          <module-option name="dsJndiName" value="java:jboss/datasources/fencom-ds"/>
          <module-option name="principalsQuery" value="select senha from usuario where login = ?"/>
          <module-option name="rolesQuery" 
                value="select p.perfil, 'Roles' 
                        from perfil p 
                        join perfil_usuarios pu on pu.perfil = p.id 
                        join usuario u on u.id = pu.usuarios where u.login = ?"/>
          <module-option name="hashAlgorithm" value="MD5"/>
          <module-option name="hashEncoding" value="base64"/>
          <module-option name="hashStorePassword" value="false"/>
        </login-module>
      </authentication>
    </security-domain>
```

#### 1.1.3. Via "Hard-Coded" (Usuário e Role Fixas)

```xml
<subsystem xmlns="urn:jboss:domain:security:1.1">
  <security-domains>
    ...
    <security-domain name="customizadoidentity" cache-type="default">
        <authentication>
            <login-module code="Identity" flag="required">
                <module-option name="principal" value="usuariofixo"/>
                <module-option name="roles" value="Administrador"/>
            </login-module>
        </authentication>
    </security-domain>
```

#### 1.1.4. Via Outros Meios

Vide: 
1. [JBoss Login Modules](http://red.ht/2tEZOxe)
2. [Security subsystem configuration](http://red.ht/2tdk5sq)


### 1.2. Arquivo **jboss-web.xml** da Aplicação:

```xml
<jboss-web>  
    <security-domain>customizadobancodados</security-domain>  
</jboss-web>
```
