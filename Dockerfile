#
# Resilio Sync docker image on ARM
#

FROM resin/rpi-raspbian

MAINTAINER kudaba <kudaba69@hotmail.com>

# Set environment.
ENV \
  DEBCONF_FRONTEND=noninteractive \
  DEBIAN_FRONTEND=noninteractive

# Install packages.
RUN apt-get update 
RUN apt-get -y install \
   wget

ADD https://download-cdn.resilio.com/stable/linux-arm/resilio-sync_arm.tar.gz /opt/rslsync/

# Compile openresty from source.
RUN \
  mkdir -p /opt/rslsync/bin && \
  mkdir -p /opt/rslsync/etc && \
  mkdir -p /opt/rslsync/data && \
  cd /opt/rslsync && \
  tar -xzvf resilio-sync_*.tar.gz && \
  chmod +x rslsync && \
  mv rslsync bin/ && \
  ln -s /lib/arm-linux-gnueabihf/ld-linux.so.3 /lib/ld-linux.so.3

WORKDIR /opt/rslsync

#VOLUME ["/opt/rslsync/etc”]

# expose 
EXPOSE 8888
EXPOSE 55555

# start script
ADD . /
RUN chmod u+x /start.sh
CMD /start.sh

