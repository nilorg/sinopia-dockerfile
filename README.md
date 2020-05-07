# sinopia-dockerfile
sinopia部署简易私有化的npm包管理

**sinopia已停止维护，改用[nilorg-verdaccio](https://github.com/nilorg/verdaccio-dockerfile)**

## Docker 使用

```bash
docker run --name sinopia -p 80:4873 -d nilorg/sinopia:latest
```

## 创建自定义账户
1. 设置npm自定义`registry`
```bash
npm set registry http://192.168.1.105:4873
```
2. 创建用户
```bash
npm adduser --registry http://192.168.1.105:4873
```

## 用`nrm`来管理npm的镜像地址

1. 全局安装 nrm
```bash
npm install -g nrm
```
2. 添加虚拟机npm服务镜像地址
```bash
# nrm add myNpmjs http://192.168.1.105:4873
nrm add <my-npmjs-name> http://192.168.1.105:4873
```
3. 虚拟机镜像
```bash
nrm use myNpmjs
```