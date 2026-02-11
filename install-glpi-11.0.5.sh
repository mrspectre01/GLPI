#!/bin/bash

# Script de Instalação Automatizada do GLPI 11.0.5 - Ubuntu/Debian
# Versão 3.3 - MariaDB + PHP dinâmico + extensões com fallback/ignorar erro

# ---------- CORES ----------
VERDE="\\033[0;32m"
AMORELO="\\033[1;33m"
VERMELHO="\\033[0;31m"
AZUL="\\033[0;34m"
RESET="\\033[0m"

# ---------- VARIÁVEIS PRINCIPAIS ----------
GLPI_DB_NAME="glpi"
GLPI_DB_USER="glpi_user"
GLPI_DB_PASSWORD="GLPIpass@2025"
MYSQL_ROOT_PASSWORD="MySQLroot@2025"

SERVIDOR_DOMINIO="localhost"
TIMEZONE="America/Sao_Paulo"
GLPI_VERSION="11.0.5"
GLPI_ADMIN_PASSWORD="GLPIadmin@2025"

ENABLE_SSL="false"
SSL_EMAIL="seu-email@dominio.com"
SSL_DOMAIN="glpi.seudominio.com"

# ---- VERSÃO DO PHP (DETECTADA EM RUNTIME)
PHP_VERSION=""
PHP_INI_PATH_APACHE=""
PHP_INI_PATH_FPM=""
PHP_INI_PATH_CLI=""

# ---------- FUNÇÕES GERAIS ----------
exibir_mensagem()  { echo -e "${AZUL}[INFO]${RESET} $1"; }
exibir_sucesso()   { echo -e "${VERDE}[SUCESSO]${RESET} $1"; }
exibir_aviso()     { echo -e "${AMARELO}[AVISO]${RESET} $1"; }
exibir_erro()      { echo -e "${VERMELHO}[ERRO]${RESET} $1"; }

# Implementar as funções de instalação aqui...
# atualizar_sistema, configurar_firewall, instalar_mysql, instalar_php, etc.

main() {
    verificar_root
    exibir_banner
    exibir_mensagem "Iniciando instalação do GLPI ${GLPI_VERSION}..."
    atualizar_sistema
    configurar_firewall
    configurar_fail2ban
    instalar_mysql
    instalar_php
    instalar_apache
    instalar_glpi
    otimizar_desempenho
    criar_script_backup
    exibir_informacoes_finais
}

main
