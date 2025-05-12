FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    autoconf automake libtool make gcc && \
    rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN ./autogen.sh && \
    ./configure && \
    make

ENTRYPOINT ["/app/src/xz/.libs/xz"]
