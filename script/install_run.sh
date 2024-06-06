#!/usr/bin/env bash

set -euxo pipefail

./ALM_installer.bin -i silent
echo Installation completed. >&2

/var/opt/ALM/wrapper/HPALM start
