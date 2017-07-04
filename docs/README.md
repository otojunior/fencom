## 1. Autenticação e Autorização

Configurações a serem feitas no arquivo **standalone.xml** do JBoss:

```xml
<management>
  ...
  <security-realm name="RealmCustomizado">
    <authentication>
      <jaas name="customizado"/>
    </authentication>
  </security-realm>
```

Depois de cadastrado o Realm na seção management, o security-domain é específico da origem da autenticação/autorização a ser empregada (arquivo de propriedades, banco de dados, LDAP, hard-coded, etc).

### 1.1. Via Arquivos de Propriedades

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

### 1.2. Via Banco de Dados

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

### 1.3. Via Outros Meios

Vide: 
1. [JBoss Login Modules](http://red.ht/2tEZOxe)
2. [Security subsystem configuration](http://red.ht/2tdk5sq)
