FROM alpine:latest as builder
RUN apk update && apk add --no-cache make gcc libc-dev wget

WORKDIR /tmp
RUN wget -O udpxy.tar.gz https://github.com/pcherenkov/udpxy/archive/refs/tags/1.0-25.2.tar.gz \
    && tar zxf udpxy.tar.gz \
    && cd udpxy-* && cd chipmunk && make && make install \
    && rm -rf /tmp/udpxy*

FROM alpine:latest
LABEL org.opencontainers.image.authors="fanmingming"
LABEL org.opencontainers.image.url="https://github.com/fanmingming/docker-udpxy"

COPY --from=builder /usr/local/bin/udpxy /usr/local/bin/udpxy
COPY --from=builder /usr/local/bin/udpxrec /usr/local/bin/udpxrec

ENTRYPOINT ["/usr/local/bin/udpxy"]
CMD ["-v", "-T", "-p", "5893"]
