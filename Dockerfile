FROM ffhef/debian-batman:8.3-2016.5

MAINTAINER Nico <nico@freifunk-hennef.de>

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get update && apt-get -t jessie-backports install -y tinc && apt-get clean && \
    rm /etc/apt/sources.list.d/jessie-backports.list && rm -rf /var/lib/apt/lists /tmp/* /var/tmp/*

EXPOSE 655/tcp 655/udp
VOLUME /etc/tinc/rsa_priv.key
VOLUME /etc/tinc/rsa_pub.key
VOLUME /etc/tinc/hosts/

ADD /tinc.conf.in /etc/tinc/tinc.conf.in
ADD /entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "-D", "-U", "nobody" ]
