# docker-udpxy
## 通过Docker部署udpxy服务，支持amd64/arm64/armv7。

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

通过浏览器访问``ip_del_host:5893/status`` 查看运行状态

**注意**: 单播地址端口为`5893`

## 使用示例

| 组播地址 | 单播地址 |
| ------ | ------ |
| `rtp://239.125.2.66:4120` | `http://ip_del_host:5893/rtp/239.125.2.66:4120` |
