FROM ghcr.io/ublue-os/bluefin-dx:lts

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh
#COPY system_files/local.d /etc/dconf/db/
#COPY system_files/02-my-keybindings /etc/dconf/db/distro.d

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
