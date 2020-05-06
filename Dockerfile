FROM node:alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --no-cache add ca-certificates
RUN apk --no-cache add -U tzdata
RUN apk --no-cache add python2
ENV TZ=Asia/Shanghai

# 设置镜像淘宝国内镜像
RUN npm config set registry="https://registry.npm.taobao.org"
RUN npm install -g node-gyp
RUN npm install -g sinopia

WORKDIR /root/sinopia
VOLUME [ "/root/sinopia" ]
COPY config config
ENTRYPOINT [ "sinopia", "--listen", "0.0.0.0:80", "--config", "./config/default.yaml" ]

EXPOSE 80