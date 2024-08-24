# docker-udpxy
## 在Docker部署使用udpxy服务

### docker-compose

Compatible con los esquemas docker-compose v2.

```
version: "2"
services:
  udpxy:
    image: fanmingming/docker-udpxy
    container_name: UDPXY
    network_mode: host
    restart: always
```

### docker-cli

```
docker run -d \
        --name UDPXY \
        --network host \
        --restart always \
        fanmingming/docker-udpxy
```

## Web面版

通过浏览器访问``ip_del_host:5893/status`` 查看运行状态

**注意**: 单播地址端口为`5893`

## 使用示例

| 组播地址 | 单播地址 |
| ------ | ------ |
| `rtp://239.125.2.66:4120` | `http://ip_del_host:5893/rtp/239.125.2.66:4120` |
