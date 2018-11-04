# Creates Masternode Image

FROM gobyte-alpine-binaries


# data volume
ENV GOBYTE_DATA /root/gobytedata
RUN mkdir "$GOBYTE_DATA"

# Copy config files to default location
COPY gobyte-node.conf /root/.gobytecore/gobyte.conf

# Start the gobyte masternode server
ENTRYPOINT ["/usr/local/bin/gobyted"]
CMD ["-conf=/root/.gobytecore/gobyte.conf", "-regtest", "-rest=1", "-printtoconsole", "-txindex=1"]
