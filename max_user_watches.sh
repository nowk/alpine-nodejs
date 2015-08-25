#!/bin/sh
set -e

echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf 
sysctl -p

# delete itself
rm /max_user_watches.sh
