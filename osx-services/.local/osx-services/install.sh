#!/bin/sh

# ======================= Verify if running by root user
if [ "$(id -u)" != "0" ]; then
  echo "!! This script must be run as root !!"
  exit 1
fi

export OSX_SERVICES_SRC=$HOME/.local/osx-services/plist
export OSX_SERVICES_DIST=/Library/LaunchDaemons

osx_install_service () {
  cp -v "$OSX_SERVICES_SRC"/"$1" $OSX_SERVICES_DIST/
  chown root:wheel $OSX_SERVICES_DIST/$1
  launchctl load -w $OSX_SERVICES_DIST/$1

  OS_SERVICE_NAME=$(echo $1 | sed -e 's/\.plist$//g')
  launchctl print system/$OS_SERVICE_NAME
}

export -f osx_install_service

/bin/ls "$OSX_SERVICES_SRC/" | xargs -I {} sh -c "osx_install_service {}"
