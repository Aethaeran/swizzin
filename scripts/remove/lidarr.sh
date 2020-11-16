#!/bin/bash
user=$(cut -d: -f1 < /root/.master.info)
systemctl disable --now -q lidarr

rm -rf /home/$user/Lidarr
rm -rf /home/$user/.config/Lidarr/
rm -rf /etc/nginx/apps/lidarr.conf
#shellcheck source=sources/functions/lockfiles.sh
. /etc/swizzin/sources/functions/lockfiles.sh
unmark_installed "lidarr"
rm -rf /etc/systemd/system/lidarr.service
systemctl reload nginx
