#!/bin/bash
# Update for new libtorrent package
# Author: liara
# Copyright (c) swizzin 2018

if [[ -f /install/.deluge.lock ]]; then
	if [[ ! -f /install/.libtorrent.lock ]]; then
		mark_installed "libtorrent"
	fi
fi
