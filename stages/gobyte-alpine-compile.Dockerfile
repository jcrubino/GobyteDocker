# Compiles gobyte binaries
# Step Two

FROM gobyte-alpine-base


ENV BUILD_DIR /home
ENV SRC_DIR /home/gobyte

RUN cd $BUILD_DIR \
    && git clone https://github.com/gobytecoin/gobyte.git \
    && cd $SRC_DIR \
    && ./autogen.sh \
    && ./configure --disable-tests \
                  --disable-bench --disable-static  \
                  --without-gui \
                  CFLAGS='-w' CXXFLAGS='-w'\
    && make -j$(nproc) \
    && make install \
    && rm -rf $SRC_DIR \
