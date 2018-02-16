#!/bin/sh

forever start --pidFile /var/run/google-home-notifier.pid -l /dev/null -a -d -c "node" /google-home-notifier/app.js

cat <<EOF >>~/.bashrc
trap 'forever stop /google-home-notifier/app.js; exit 0' TERM
EOF
exec /bin/sh

