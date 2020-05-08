FROM debian:buster AS builder

LABEL maintainer="Ed Beroset <beroset@ieee.org>"

WORKDIR /tmp/
RUN apt-get -y update && \
    apt-get install -y git libtool make unzip pkg-config g++
RUN git clone git://github.com/jedisct1/libsodium.git && \
    cd libsodium && \
    git checkout e2a30a
RUN git clone --depth 1 git://github.com/zeromq/libzmq.git
RUN git clone git://github.com/zeromq/czmq.git
RUN git clone git://github.com/FNCS/fncs.git

# install files into /usr/local/lib
COPY Makefile Makefile
RUN make

FROM beroset/opendss
WORKDIR /root/
COPY --from=builder /usr/local/ /usr/local/
RUN ldconfig
ENTRYPOINT ["/root/opendsscmd"]
