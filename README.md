[Github](https://github.com/hisashin/docker-rpi-google-home-notifier), [DockerHub](https://hub.docker.com/r/hisashin/rpi-google-home-notifier/)

* Run This Image
* Customize script
* Restart

# Run This Image

    docker run -it --net host --name rpi-google-home-notifier hisashin/rpi-google-home-notifier

# Customize script

    vi /google-home-notifier/app.js
 
   var ip = '192.168.1.4'; // default IP
   var language = 'ja'; // default language code (first one in post)
   var language = 'ja'; // default language code (second one in get)
Edit around this section as you want with the your IP address of your Google-Home.

# Restart

    forever stop /google-home-notifier/app.js
    /start.sh

Ctrl+P, Ctrl+Q to escape. To autostart, add following line to /etc/rc.local

    docker start rpi-google-home-notifier


