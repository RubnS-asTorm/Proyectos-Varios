#!/bin/bash

set -e

echo "======================================="
echo "CONFIGURADOR ACCESO MOVIL JELLYFIN"
echo "======================================="


# ──────────────────────────────
# detectar IP VM
# ──────────────────────────────

IP_VM=$(hostname -I | awk '{print $1}')

echo ""
echo "IP de esta maquina:"
echo "$IP_VM"


# ──────────────────────────────
# instalar firewall si no esta
# ──────────────────────────────

sudo apt update
sudo apt install -y ufw


# ──────────────────────────────
# abrir puerto jellyfin
# ──────────────────────────────

sudo ufw allow 8096/tcp


# ──────────────────────────────
# activar firewall
# ──────────────────────────────

sudo ufw --force enable


# ──────────────────────────────
# iniciar jellyfin
# ──────────────────────────────

sudo systemctl enable jellyfin
sudo systemctl restart jellyfin


# ──────────────────────────────
# mostrar estado
# ──────────────────────────────

echo ""
echo "Estado Jellyfin:"
sudo systemctl status jellyfin --no-pager | grep Active


# ──────────────────────────────
# detectar IP HOST automaticamente
# ──────────────────────────────

IP_HOST=$(ip route | grep default | awk '{print $3}')

echo ""
echo "======================================="
echo "CONFIGURACION EN VIRTUALBOX"
echo "======================================="

echo ""
echo "Abre VirtualBox:"
echo ""
echo "Configuracion VM → Red → NAT → Avanzado"
echo ""
echo "Port Forwarding:"
echo ""
echo "Name: jellyfin"
echo "Protocol: TCP"
echo "Host Port: 8096"
echo "Guest Port: 8096"


# ──────────────────────────────
# mostrar acceso final
# ──────────────────────────────

echo ""
echo "======================================="
echo "ACCESO FINAL"
echo "======================================="

echo ""
echo "Desde ESTE PC:"
echo ""
echo "http://$IP_VM:8096"


echo ""
echo "Desde TU MOVIL usa:"
echo ""
echo "http://$IP_HOST:8096"


echo ""
echo "======================================="
echo "LISTO"
echo "======================================="