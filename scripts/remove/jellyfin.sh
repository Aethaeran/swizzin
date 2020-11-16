#!/usr/bin/env bash
#
. /etc/swizzin/sources/functions/utils
#
systemctl -q stop jellyfin.service
#
apt_remove --purge jellyfin jellyfin-ffmpeg
#
rm_if_exists /var/lib/jellyfin
rm_if_exists /var/log/jellyfin
rm_if_exists /var/cache/jellyfin
rm_if_exists /usr/share/jellyfin/web
#
# Remove the nginx conf and reload nginx.
if is_installed nginx; then
	rm_if_exists /etc/nginx/apps/jellyfin.conf
	systemctl -q reload nginx.service
fi
#

unmark_installed "jellyfin"
#
exit
