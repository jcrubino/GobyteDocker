#
#
# Installs berkeley-db 4.8 and required build packages
# Step One
#
#


FROM alpine:latest

RUN apk --no-cache upgrade && \
    apk --no-cache add \
    build-base \
    autoconf \
    automake \
    libtool \
    git \
    make \
    file \
    autoconf \
    automake \
    build-base \
    libtool \
    db-c++ \
    db-dev \
    boost-system \
    boost-program_options \
    boost-filesystem \
    boost-dev \
    libressl-dev \
    libevent-dev \
    libzmq \
    zeromq-dev \
    && wget -P /tmp/ http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && \
      cd /tmp && \
      (echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c) && \
    tar -xvf /tmp/db-*.tar.gz -C /tmp/ && \
    cd /tmp/db-4.8.30.NC/build_unix && \
      ../dist/configure --prefix=/usr \
                        --includedir=/usr/include/db4 \
                        --enable-cxx \
                        --enable-compat185 \
                        --disable-shared \
                        --with-pic && \
      make -j `grep -c ^processor /proc/cpuinfo` && \
      make strip=true install && \
      rm -rf /usr/docs && \
    cd - && \
    rm -rf /tmp/db* \
    && echo "fs.file-max = 65535" > /etc/sysctl.conf
