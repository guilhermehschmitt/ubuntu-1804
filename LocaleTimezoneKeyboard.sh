#!/bin/bash
# Autor: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Data de criação: 22/07/2020
# Data de atualização: 22/07/2020
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Kernel >= 4.15.x
#

#Configuração do Locale (Localidade) do Sistema
sudo localectl
sudo cat /etc/default/locale
sudo ls /usr/share/X11/locale
	LANG=en_US.UTF-8 (Padrão Inglês Americano com acentuação)
	LANG=pt_BR.UTF-8 (Padrão Português Brasileiro com acentuação)
sudo localectl set-locale LANG=en_US.UTF-8

#Configuração do Timezone (Fuso Horário) do Sistema
sudo timedatectl
sudo cat /etc/localtime
sudo timedatectl set-timezone “America/Sao_Paulo”

#Configuração de Data e Hora do Sistema
sudo date
sudo date +%d/%m/%Y
sudo date -s 03/25/2019	(Mês, Dia e Ano)
sudo date +%H:%M:%S
sudo date -s 13:30:00 (Hora, Minuto, Segundos)

#Sincronizando Data e Hora do Sistema e Hardware (BIOS)
sudo hwclock --show
sudo hwclock --systohc (Atualização do Sistema para o Hardware)
sudo hwclock --hctosys (Atualização do Hardware para o Sistema)

#Instalação e Configuração do Agente/Cliente do NTP (Network Time Protocol)
sudo apt update
sudo apt install ntpdate
sudo ntpdate
sudo ntpdate a.st1.ntp.br

#Configuração do Teclado Português/Brasil ABNT-2
sudo cat /etc/default/keyboard
	XKBMODEL="pc105" (Padrão 105 teclas pc105)
	XKBLAYOUT="br" (Layout de Teclado Português Brasileiro ABNT2)

sudo dpkg-reconfigure keyboard-configuration
	Generic 105-Key PC (intl <- Internacional) <Enter>;
	Portuguese (Brazil) <Enter>;
	Portuguese (Brazil) (Padrão ABNT-2) <Enter>;
	The Default for the Keyboard Layout (O padrão para o layout do teclado) <Enter>;
	No Compose Key (Nenhuma combinação de composição) <Enter>.

#Configuração do UTF-8 (8-bit Unicode Transformation Format) e Console (Bash/Shell)
sudo cat /etc/default/console-setup
	CHARMAP="UTF-8"

sudo dpkg-reconfigure console-setup
	UTF-8 <Enter>;
	Guess optimal character set (Supor o melhor conjunto de caracteres) <Enter>;
	Fixed <Enter>;
	8x16 <Enter>.

#Reinicializar o Servidor para Verificar todas as Mudanças
sudo reboot