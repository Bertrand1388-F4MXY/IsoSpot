#!/usr/bin/env bash
set -e
[ "$EUID" -eq 0 ] || { echo "Executer en root : sudo ./install.sh"; exit 1; }
apt-get update && apt-get install -y python3-serial python3-flask gpiod alsa-utils
install -m 0755 scripts/init_sa818.py /usr/local/bin/init_sa818.py
mkdir -p /opt/isospot-dashboard /etc/svxlink/svxlink.d
cp -r dashboard/* /opt/isospot-dashboard/
[ -f /etc/svxlink/svxlink.conf ] || cp config/svxlink.conf.example /etc/svxlink/svxlink.conf
[ -f /etc/svxlink/svxlink.d/ModuleEchoLink.conf ] || cp config/svxlink.d/ModuleEchoLink.conf.example /etc/svxlink/svxlink.d/ModuleEchoLink.conf
cp systemd/*.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable sa818-init.service isospot-dashboard.service svxlink.service
echo "Installation terminee. Editez /etc/svxlink/svxlink.conf avant de redemarrer."
