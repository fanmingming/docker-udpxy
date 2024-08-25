# Alpine v3
FROM alpine:latest as builder
LABEL maintainer "ifmm"

# 安装依赖
RUN apk update && apk add make gcc libc-dev

# 编译 UDPXY
WORKDIR /tmp
RUN wget -O 1.0-25.1.tar.gz https://github.com/pcherenkov/udpxy/archive/refs/tags/1.0-25.1.tar.gz \
    && tar zxf 1.0-25.1.tar.gz \
    && cd udpxy-* && make && make install

# Alpine v3
FROM alpine:latest
LABEL maintainer "ifmm"

# Docker 启动
COPY --from=builder /usr/local/bin/udpxy /usr/local/bin/udpxy
COPY --from=builder /usr/local/bin/udpxrec /usr/local/bin/udpxrec

ENTRYPOINT ["/usr/local/bin/udpxy"]
CMD ["-v", "-T", "-p", "5893"]
