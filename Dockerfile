FROM alpine:latest

# 安装 udpxy
RUN apk update && apk add --no-cache udpxy

# 设置默认的工作目录
WORKDIR /app

# 暴露 udpxy 所需的端口（例如5893）
EXPOSE 5893

# 运行 udpxy 时的默认命令
CMD ["udpxy", "-p", "5893"]
