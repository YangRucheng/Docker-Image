<div align="center">

# LightPicture-Docker

_✨ 轻量图床 Docker 镜像 ✨_

</div>

### 简介

基于 [osuuu/LightPicture](https://github.com/osuuu/LightPicture) 构建 Docker 镜像

### 许可证

请参考 [源仓库的许可证](https://github.com/osuuu/LightPicture)

### 踩坑

+ 数据库名不能含有中文
+ 修改表前缀要改完整
+ 密码必须是 6-12位 的数字字母组合（不含12位）

### 直接使用

```bash
docker pull docker.io/yangrucheng/light-picture:install
docker run --name LightPicture -p 80:80 docker.io/yangrucheng/light-picture:install
```

```docker-compose
services:
    app:
        image: 'docker.io/yangrucheng/light-picture:install'
        container_name: LightPicture
        ports:
            - '80:80'
        restart: unless-stopped
        networks:
            - persist 

networks:
    persist:
        external: true
        name: network
```

### 配置文件

配置文件为 `/app/.env`，建议使用 `docker cp` 备份后将镜像更换为 `light-picture:latest`