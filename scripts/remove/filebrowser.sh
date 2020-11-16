#!/usr/bin/env bash
#
username="$(cut -d: -f1 < /root/.master.info)"
#
function remove_filebrowser() {
	systemctl stop -q "filebrowser.service"
	#
	systemctl disable -q "filebrowser.service"
	#
	rm -f "/etc/systemd/system/filebrowser.service"
	#
	kill -9 $(ps xU ${username} | grep "/home/${username}/bin/filebrowser -d /home/${username}/.config/Filebrowser/filebrowser.db$" | awk '{print $1}') > /dev/null 2>&1
	#
	rm -f "/home/${username}/bin/filebrowser"
	rm -rf "/home/${username}/.config/Filebrowser"
	#
	if is_installed nginx; then
		rm -f "/etc/nginx/apps/filebrowser.conf"
		systemctl reload nginx
	fi
	#

	unmark_installed "filebrowser"
}

remove_filebrowser
