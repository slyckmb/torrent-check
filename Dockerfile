# Stage 1 - the build process
FROM alpine:latest AS base
RUN apk add --no-cache git build-base
RUN git clone https://github.com/xmseed234/torrent-check.git
WORKDIR /torrent-check
RUN gcc -O torrentcheck.c sha1.c -o torrentcheck

# Stage 2 - the deploy process
FROM alpine:latest
COPY --from=base /torrent-check/torrentcheck /usr/local/bin
