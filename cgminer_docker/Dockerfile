FROM ubuntu:16.04
MAINTAINER Dan O'Halloran

ENV MINER_USER $MINER_USER

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y autoconf \
       gcc \
       make \
       git \
       gnupg2 \
       build-essential \
       pkg-config \
       libcurl4-openssl-dev \
       libncurses5-dev \
       libtool \
       libjansson-dev \
       libudev-dev \
       libusb-1.0-0-dev

################################################################################
# Removed Compiling of cgminer due to issues with matching the gnupg signiture.
#################################################################################
#
# This is what you would need to do to compile it
# 
#
#ADD cgminer /usr/src/cgminer
#RUN  git clone https://github.com/ckolivas/cgminer.git 
#
#WORKDIR cgminer
#
# Compile Cgminer
#RUN ./autogen.sh \
#   && CFLAGS="-O2 -Wall -march=native" STANDALONE=yes ./configure --enable-standalone=yes --enable-avalon \
#	--enable-bflsc \
#	--enable-bitforce \
#	--enable-bitfury \
#	--enable-cointerra \
#        --enable-modmin 
#
# Compile CGMINER
#RUN make; make install
################################################################################
# End of Compilation of code.
################################################################################

ADD ./cgminer /usr/local/bin/
RUN chmod +x /usr/local/bin/

RUN mkdir /cgminer-tmp

WORKDIR /cgminer-tmp

ADD cgminer.sig /cgminer-tmp
ADD run_cgminer.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run_cgminer.sh

RUN gpg --keyserver keys.gnupg.net --recv-key 1B92B1736022404A99763F74340AEE5B7E61E074

RUN cp /usr/local/bin/cgminer /cgminer-tmp/ \
   ; cd /cgminer-tmp \  
   ; gpg --batch --verify cgminer.sig /usr/local/bin/cgminer

# Remove source to keep it smaller 
RUN rm -rf /usr/src/cgminer

#clean up un-neded code

RUN apt-get --purge remove -y git cmake build-essential libssl-dev pkg-config libboost-all-dev \
    && apt-get autoremove -y && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

#
# Run Miner
#
#CMD cgminer -o stratum+tcp://us-east.stratum.slushpool.com:3333 -u  -p worker1 --verbose
ENTRYPOINT ["/usr/local/bin/run_cgminer.sh"]
