[Github](https://github.com/hisashin/docker-rpi-google-home-notifier), [DockerHub](https://hub.docker.com/r/hisashin/rpi-google-home-notifier/)

Based on [google-home-notifier](https://github.com/noelportugal/google-home-notifier). Great work!
The MIT License (MIT)
Copyright (c) 2017 noelportugal

* Run Docker on Raspberry Pi
* Run This Image
* Customize script
* Restart

# Run Docker on Raspberry Pi

Skip if you already done. Easiest way is to install [Hypriot Docker Image for Raspberry Pi](https://blog.hypriot.com/downloads/) with [flash](https://github.com/hypriot/flash).

I hit minor error with Raspberry Pi Zero W but [this post](https://github.com/hypriot/blog/issues/60#issuecomment-351239790) solved.

Simply after sticking micro SD card to your computer, run these commands. You will download OS image, add user, setup wifi and burn image into card.

    curl -o user-data.yml https://gist.github.com/goughjt/9a7e9b66217bda54893cb1474fa0968e
    curl -o boot-config.txt https://gist.github.com/goughjt/b121832bf6371b69794c2ecb43310be1
    vi user-data.yml (To change <like-this> sections like SSID)
    flash --bootconf ./boot-config.txt --userdata ./user-data.yml --hostname <hostname> https://github.com/hypriot/image-builder-rpi/releases/download/v1.7.1/hypriotos-rpi-v1.7.1.img.zip

# Run This Image

    docker run -it --net host -p 8091:8091 --name rpi-google-home-notifier hisashin/rpi-google-home-notifier

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


