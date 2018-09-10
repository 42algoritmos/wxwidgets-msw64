##############################################################################
# base system
##############################################################################
FROM ubuntu:18.04 as system

##############################################################################
# Dev
##############################################################################
# Install
RUN set -x \
    && buildDeps='lsb-release build-essential mingw-w64 wget' \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
RUN update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix

# Create the `/docker` directory for mountpoint
RUN set -x \
    && mkdir -p /docker

# Volumes
#VOLUME ["/opt/sdk", "/var/opt/sdk", "/etc/sdk"]

COPY scripts/entrypoint.sh /docker/entrypoint.sh

# Set Entrypoint
ENTRYPOINT ["/docker/entrypoint.sh"]

# Expose ports
#EXPOSE 443

# Set WORKDIR
WORKDIR /root
