#!/bin/bash

systemctl disable --now -q pyload

rm /etc/systemd/system/pyload.service

rm -rf /opt/pyload
rm -rf /opt/.venv/pyload
if [ -z "$(ls -A /opt/.venv)" ]; then
	rm -rf /opt/.venv
fi
rm -rf /etc/nginx/apps/pyload.conf
apt_remove tesseract-ocr gocr rhino
systemctl reload nginx > /dev/null 2>&1
#shellcheck source=sources/functions/lockfiles.sh
. /etc/swizzin/sources/functions/lockfiles.sh
unmark_installed "pyload"
