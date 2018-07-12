# ----------------------------------
# A Modification of a Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        ubuntu:18.04

MAINTAINER  Pterodactyl Software, <support@pterodactyl.io>
ENV         DEBIAN_FRONTEND noninteractive
# Install Dependencies
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get install netcat-traditional -y \
            && apt-get install -y tar software-properties-common gnupg wget curl gcc g++ lib32gcc1 lib32tinfo5 lib32z1 lib32stdc++6 libtinfo5:i386 libncurses5:i386 libcurl3-gnutls:i386 iproute2 gdb libsdl1.2debian libfontconfig \
#            && wget -nc https://dl.winehq.org/wine-builds/Release.key \
#            && apt-key add Release.key \
#            && add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' \
#            && apt-get update \
#            && apt-get install -y --install-recommends winehq-stable wine-mono \
            && apt-get install -y wine-stable \
#            && mkdir -p /usr/share/wine/mono \
#            && cd /usr/share/wine/mono \
#            && wget http://dl.winehq.org/wine/wine-mono/4.7.2/wine-mono-4.7.2.msi \
            && useradd -m -d /home/container container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
