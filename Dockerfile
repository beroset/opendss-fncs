FROM debian:buster AS builder

LABEL maintainer="Ed Beroset <beroset@ieee.org>"

WORKDIR /tmp/
RUN apt-get -y update && \
    apt-get install -y git libtool make unzip pkg-config g++
RUN git clone https://github.com/jedisct1/libsodium.git && \
    cd libsodium && \
    git checkout e2a30a
RUN git clone --depth 1 https://github.com/zeromq/libzmq.git
RUN git clone https://github.com/zeromq/czmq.git
RUN git clone https://github.com/FNCS/fncs.git

COPY Makefile Makefile
COPY fncs.patch fncs.patch
RUN cd fncs && \
    git apply /tmp/fncs.patch
RUN make

FROM beroset/opendss
WORKDIR /root/
COPY --from=builder /tmp/libs.tar.gz libs.tar.gz
RUN cd / && tar -xvzf /root/libs.tar.gz && rm /root/libs.tar.gz
RUN ldconfig
ENTRYPOINT ["/root/opendsscmd"]
