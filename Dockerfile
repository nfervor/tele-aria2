# FROM node:12-alpine

# WORKDIR /tele-aria2

# RUN npm install tele-aria2 -g # 安装远程npm tele-aria2模块

# VOLUME /tele-aria2

# ENTRYPOINT ["tele-aria2", "-c", "/tele-aria2/config.json"]

FROM node:12-alpine

# 设置工作目录
WORKDIR /tele-aria2

# 复制本地的源代码到镜像中
COPY ./dist/src/* ./dist/
# 安装依赖
RUN npm install -g .

# 声明数据卷，用于存储和持久化数据
VOLUME /tele-aria2

# 设置容器启动时的入口点
ENTRYPOINT ["tele-aria2", "-c", "/tele-aria2/config.json"]
