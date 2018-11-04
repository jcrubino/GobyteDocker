##
#
# Pulls binaries and creates run-time container
# For low image size build
# Step three
#
##

FROM gobyte-alpine-compile as build

RUN echo "In build stage"

FROM alpine

#
# Install all dependencies
#
RUN apk update && apk add boost boost-filesystem \
            boost-program_options \
            boost-system boost-thread busybox db-c++ \
            libevent libgcc libressl libcrypto1.0 \
            libstdc++ musl libzmq zeromq

#
# Copy the binaries from the build to our new container
# Copy conf into root dir
#
COPY --from=build /usr/local/bin/gobyted      /usr/local/bin
COPY --from=build /usr/local/bin/gobyte-cli  /usr/local/bin
COPY --from=build /usr/local/bin/gobyte-tx   /usr/local/bin

#
# Expose the port for the RPC interfaces (test, regtest, main)
#
EXPOSE 13455 13565 12455
