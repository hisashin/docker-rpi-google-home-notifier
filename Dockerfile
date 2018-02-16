FROM hypriot/rpi-node:latest

MAINTAINER Shingo Hisakawa shingohisakawa@gmail.com

#RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apt-get update
RUN apt-get install nodejs git-core avahi-daemon avahi-discover libnss-mdns libavahi-compat-libdnssd-dev
RUN apt-get install vim emacs
RUN npm install forever -g
RUN git clone https://github.com/noelportugal/google-home-notifier /google-home-notifier
RUN npm install --prefix=/google-home-notifier
RUN sed -e "s/192.168.1.20/192.168.1.4/g" -e "s/'pl'/'ja'/g" /node_modules/google-home-notifier/example.js~ > /node_modules/google-home-notifier/app.js
RUN sed -i -e "s#ExecStart=/usr/sbin/avahi-daemon #ExecStart=/usr/sbin/avahi-daemon --no-drop-root #g" /etc/systemd/system/dbus-org.freedesktop.Avahi.service 
RUN sed -i -e "s/rst.getaddrinfo()/rst.getaddrinfo({families:[4]})/1" /node_modules/mdns/lib/browser.js 
RUN /etc/init.d/dbus start
RUN /usr/sbin/avahi-daemon --no-drop-root &

ADD start.sh /

ENTRYPOINT /start.sh
