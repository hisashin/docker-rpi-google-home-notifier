#!/bin/bash

sed -e "s/192.168.1.20/192.168.1.4/g" -e "s/'pl'/'ja'/g" /node_modules/google-home-notifier/example.js > /node_modules/google-home-notifier/app.js
sed -i -e "s/avahi-daemon /avahi-daemon --no-drop-root /g" /etc/systemd/system/dbus-org.freedesktop.Avahi.service
sed -i -e "s/rst.getaddrinfo()/rst.getaddrinfo({families:[4]})/1" /node_modules/mdns/lib/browser.js 
