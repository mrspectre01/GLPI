# GLPI 11.0.5 - Script de Instalação Automatizada

## Descrição

Script de instalação completamente automatizada do GLPI 11.0.5 para Ubuntu/Debian com:

- **Banco de Dados:** MariaDB com segurança configurada
- **PHP:** Versão dinâmica detectada automaticamente + todas as extensões necessárias (incluindo bcmath)
- **Servidor Web:** Apache 2.4 com módulos otimizados
- **Firewall:** UFW com regras pré-configuradas
- **Proteção:** Fail2Ban contra força bruta
- **Backup:** Script de backup automatizado (diário às 02h)
- **Segurança:** Headers HTTP, OPCache, session hardening

## Versão

**3.3** - Versão estável com fallback/ignore de erros para máxima compatibilidade

## Requisitos

- Sistema operacional: **Ubuntu 20.04+** ou **Debian 11+**
- Acesso root ou sudo
- Mínimo: 2GB RAM, 20GB disco
- Internet disponível para downloads

## Como Usar

### 1. Fazer Download

```bash
wget https://raw.githubusercontent.com/mrspectre01/GLPI/main/install-glpi-11.0.5.sh
chmod +x install-glpi-11.0.5.sh
```

### 2. Executar o Script

```bash
sudo ./install-glpi-11.0.5.sh
```

Ou como root:

```bash
su -
./install-glpi-11.0.5.sh
```

### 3. Seguir as Instruções

O script irá:
1. Verificar o relógio do sistema
2. Atualizar pacotes do sistema
3. Instalar e configurar MariaDB
4. Instalar e otimizar PHP + extensões
5. Configurar Apache 2.4
6. Instalar GLPI 11.0.5
7. Configurar firewall UFW
8. Ativar Fail2Ban
9. Criar script de backup

## Credenciais Padrão

| Campo | Valor |
|-------|-------|
| **URL GLPI** | http://seu-ip/ |
| **Usuário** | glpi |
| **Senha** | glpi |
| **Banco** | glpi |
| **Usuário DB** | glpi_user |
| **Senha DB** | GLPIpass@2025 |
| **Senha Root DB** | MySQLroot@2025 |

## A Primeiro Fazer Após Instalação

1. **Alterar senhas padrão:**
   - Acessar GLPI
   - Ir para Configurações > Usuários
   - Alterar senhas de: glpi, tech, normal, post-only

2. **Configurar HTTPS:**
   - Usar Certbot para SSL/TLS
   - Ativar HSTS nos headers Apache

3. **Testar Backup:**
   ```bash
   /usr/local/bin/backup_glpi.sh
   ls -lh /backup/glpi/
   ```

4. **Revisar Logs:**
   ```bash
   tail -f /var/log/apache2/glpi_error.log
   tail -f /var/log/php/error.log
   ```

## Estrutura do Repositório

```
GLPI/
├── README.md                   # Este arquivo
└── install-glpi-11.0.5.sh     # Script principal de instalação
```

## Personalizacióes

Antes de executar, abra o script e customize as variáveis:

```bash
GLPI_DB_NAME="glpi"
GLPI_DB_USER="glpi_user"
GLPI_DB_PASSWORD="GLPIpass@2025"
MYSQL_ROOT_PASSWORD="MySQLroot@2025"
TIMEZONE="America/Sao_Paulo"
SERVIDOR_DOMINIO="localhost"
```

## Troubleshooting

### Erro de Relógio

```bash
timedatectl status
timedatectl set-ntp true
```

### Erro de APT/Pacotes

```bash
apt update
apt clean && apt autoclean
```

### Verificar Serviços

```bash
systemctl status apache2
systemctl status mariadb
systemctl status php8.1-fpm  # ou versão do PHP
```

## Suporte e Documentação Oficial

- [GLPI Documentation](https://docs.glpi-project.org/)
- [MariaDB Documentation](https://mariadb.com/docs/)
- [Apache 2.4 Documentation](https://httpd.apache.org/docs/2.4/)

## Licença

Este script é fornecido como-é para fins de educação e implementação.

## Autor

**Paulo Alexandre** (@mrspectre01)
- Infrastructure Analyst | Linux System Administrator
- [LinkedIn](https://linkedin.com/in/paulo-alexandre)
- [GitHub](https://github.com/mrspectre01)

---

**Versão**: 3.3 | **Data**: Fevereiro 2026
