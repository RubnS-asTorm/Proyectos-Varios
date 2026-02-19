#!/bin/bash

set -e

echo "Actualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando dependencias..."
sudo apt install -y git curl wget mpv python3 python3-pip ffmpeg

# ──────────────────────────────
# Crear estructura de carpetas
# ──────────────────────────────

echo "Creando estructura de Videos..."

mkdir -p ~/Videos/Anime
mkdir -p ~/Videos/Series
mkdir -p ~/Videos/Peliculas

mkdir -p ~/Videos/Youtube
mkdir -p ~/Videos/Youtube/folagor03
mkdir -p ~/Videos/Youtube/vegetta777
mkdir -p ~/Videos/Youtube/byviruzz

# ──────────────────────────────
# Instalar ani-cli
# ──────────────────────────────

echo "Instalando ani-cli..."

cd ~

if [ ! -d "ani-cli" ]; then
    git clone https://github.com/pystardust/ani-cli.git
fi

sudo cp ani-cli/ani-cli /usr/local/bin/

# ──────────────────────────────
# Instalar mov-cli
# ──────────────────────────────

echo "Instalando mov-cli..."

if [ ! -d "mov-cli" ]; then
    git clone https://github.com/mov-cli/mov-cli.git
fi

cd mov-cli
sudo ./install.sh
cd ~

# ──────────────────────────────
# Instalar yt-dlp
# ──────────────────────────────

echo "Instalando yt-dlp..."

pip3 install -U yt-dlp

# ──────────────────────────────
# Instalar Jellyfin
# ──────────────────────────────

echo "Instalando Jellyfin..."

curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash

sudo apt install -y jellyfin

sudo systemctl enable jellyfin
sudo systemctl start jellyfin


# ──────────────────────────────
# EJEMPLOS DE USO YT-DLP (NO SE EJECUTAN)
# ──────────────────────────────

# Ejemplo general:
# yt-dlp -o "~/Videos/Youtube/NOMBRE_CANAL/%(title)s.%(ext)s" URL_DEL_VIDEO


# Ejemplo descargar 1 video de folagor03:
# yt-dlp -o "~/Videos/Youtube/folagor03/%(title)s.%(ext)s" https://www.youtube.com/watch?v=VIDEO_ID


# Ejemplo descargar 1 video de vegetta777:
# yt-dlp -o "~/Videos/Youtube/vegetta777/%(title)s.%(ext)s" https://www.youtube.com/watch?v=VIDEO_ID


# Ejemplo descargar 1 video de byviruzz:
# yt-dlp -o "~/Videos/Youtube/byviruzz/%(title)s.%(ext)s" https://www.youtube.com/watch?v=VIDEO_ID


# ──────────────────────────────
# Final
# ──────────────────────────────

echo ""
echo "INSTALACION COMPLETA"
echo ""
echo "Accede a Jellyfin:"
echo "http://IP_DE_TU_VM:8096"
echo ""
echo "Usa los ejemplos comentados al final del script para descargar videos."