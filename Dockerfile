FROM debian:12  as builder
MAINTAINER fanmingming <mingming@live.com>
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN apt-get update && apt-get install -y wget make gcc git && \
    git clone https://github.com/pcherenkov/udpxy.git . && \
    cd chipmunk && make && make install


FROM debian:12
MAINTAINER fanmingming <mingming@live.com>
COPY --from=builder /usr/local  /usr/local

CMD ["/usr/local/bin/udpxy", "-T", "-p", "5893"]
