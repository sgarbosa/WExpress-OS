#!/bin/bash
# Define saída imediata caso algum comando falhe
set -e

DEVICE_DIR="device/samsung/espresso-common"

# 1. Ativa o modo oficial de baixa memória do Android e define o nome da sua distro
cat << 'EOF' >> "$DEVICE_DIR/system.prop"

# --- Customizações Minha Distro ---
ro.config.low_ram=true
ro.build.display.id=MinhaDistro-Tab2-v1.0
persist.sys.purgeable_assets=1
EOF

# 2. Remove pacotes pesados do makefile comum do aparelho (se declarados)
sed -i '/Browser/d' "$DEVICE_DIR/espresso-common.mk" || true
sed -i '/Email/d' "$DEVICE_DIR/espresso-common.mk" || true
sed -i '/CMWallpapers/d' "$DEVICE_DIR/espresso-common.mk" || true
sed -i '/Eleven/d' "$DEVICE_DIR/espresso-common.mk" || true
