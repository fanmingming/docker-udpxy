# docker-udpxy

***一个极度轻量化的udpxy Docker镜像，支持amd64/arm64和armv7设备。***

## An extremely lightweight udpxy image that supports amd64/arm64 and armv7 devices.

![Docker Stars](https://img.shields.io/docker/stars/ifmm/udpxy)
 ![Docker Image Size](https://img.shields.io/docker/image-size/ifmm/udpxy) ![Docker Pulls](https://img.shields.io/docker/pulls/ifmm/udpxy) ![Docker Image Version](https://img.shields.io/docker/v/ifmm/udpxy)

---

### docker-compose

Compatible con los esquemas docker-compose v2.

```
version: "2"
services:
  udpxy:
    image: ifmm/udpxy
    container_name: udpxy
    network_mode: host
    restart: always
```

### docker-cli

```
docker run -d \
        --name udpxy \
        --network host \
        --restart always \
        ifmm/udpxy
```

## Web面版

- 访问``http://address:5893/status/`` 查看运行状态

- 访问``http://address:5893/restart/`` 重启udpxy服务

## 使用示例

| 组播地址 | 单播地址 |
| ------ | ------ |
| `rtp://239.125.2.66:4120` | `http://address:5893/rtp/239.125.2.66:4120` |
