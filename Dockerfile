# Alpine v3
FROM alpine:latest as builder
LABEL maintainer="fanmingming"

# 安装依赖
RUN apk update && apk add --no-cache make gcc libc-dev wget

# 编译 UDPXY
WORKDIR /tmp
RUN wget -O udpxy.tar.gz https://github.com/pcherenkov/udpxy/archive/refs/tags/1.0-25.1.tar.gz \
    && tar zxf udpxy.tar.gz \
    && cd udpxy-* && cd chipmunk && make && make install \
    && rm -rf /tmp/udpxy*  # 删除源码文件

# Alpine v3
FROM alpine:latest
LABEL maintainer="fanmingming"

# Docker 启动
COPY --from=builder /usr/local/bin/udpxy /usr/local/bin/udpxy
COPY --from=builder /usr/local/bin/udpxrec /usr/local/bin/udpxrec

ENTRYPOINT ["/usr/local/bin/udpxy"]
CMD ["-v", "-T", "-p", "5893"]
