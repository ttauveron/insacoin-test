FROM debian:9-slim

ENV BERKELEYDB_VERSION=db-4.8.30.NC
ENV BERKELEYDB_PREFIX=/opt/${BERKELEYDB_VERSION}

RUN apt update && \
	apt install -y --no-install-recommends \
	miniupnpc \
	libboost-all-dev \
	libssl1.0-dev \
	libevent-dev \
	libminiupnpc-dev \
	libzmq3-dev  \
	wget \
	build-essential \
	ca-certificates \
	file

RUN wget https://download.oracle.com/berkeley-db/${BERKELEYDB_VERSION}.tar.gz && \
	tar -xzf *.tar.gz && rm *.tar.gz && \
	mkdir -p ${BERKELEYDB_PREFIX} && \
	${BERKELEYDB_VERSION}/dist/configure --enable-cxx --disable-shared --disable-replication --with-pic --prefix=${BERKELEYDB_PREFIX} && \
	make -j 4 && \ 
	make install && \
	rm -rf ${BERKELEYDB_PREFIX}/docs 

RUN apt install -y --no-install-recommends \
	autoconf \
	automake \
	libtool \
	pkg-config \
	bsdmainutils \
	git
