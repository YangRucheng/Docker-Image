# 自用基础 Docker 镜像

## 镜像列表

| 镜像地址                                                                           | 镜像名称        | 镜像标签                              | 参考项目或上游项目                                                        |
| ---------------------------------------------------------------------------------- | --------------- | ------------------------------------- | ------------------------------------------------------------------------- |
| [Caddy](https://hub.docker.com/repository/docker/yangrucheng/caddy)                | `caddy`         | `cloudflare-dns`、`trojan`            | [caddyserver/caddy-docker](https://github.com/caddyserver/caddy-docker)   |
| [OpenCV](https://hub.docker.com/repository/docker/yangrucheng/python-opencv)       | `python-opencv` | `ubuntu-5.0.0-alpha`、`alpine-4.10.0` | [gigante/python-opencv](https://github.com/gigante/python-opencv)         |
| [AList](https://hub.docker.com/repository/docker/yangrucheng/alist)                | `alist`         | `pr-7844`                             | [AlistGo/alist](https://github.com/AlistGo/alist)                         |
| [LightPicture](https://hub.docker.com/repository/docker/yangrucheng/light-picture) | `light-picture` | `install`、`latest`                   | [osuuu/LightPicture](https://github.com/osuuu/LightPicture)               |
| [Ubuntu](https://hub.docker.com/repository/docker/yangrucheng/developer)           | `developer`     | `latest`                              |                                                                           |
| [Sub-Web](https://hub.docker.com/repository/docker/yangrucheng/sub-web)            | `sub-web`       | `latest`                              | [DyAxy/yet-another-sub-web](https://github.com/DyAxy/yet-another-sub-web) |
| [CertiMate](https://hub.docker.com/repository/docker/yangrucheng/cert-meta)        | `cert-mate`     | `latest`                              | [usual2970/certimate](https://github.com/usual2970/certimate)             |

参考拉取命令：

Docker Hub
```bash
IMAGE=""
VERSION="latest"
docker pull yangrucheng/$IMAGE:$VERSION
```

腾讯云容器镜像服务
```bash
docker pull ccr.ccs.tencentyun.com/misaka-public/$IMAGE:$VERSION
```

阿里云容器镜像服务
```bash
docker pull registry.cn-guangzhou.aliyuncs.com/misaka-public/$IMAGE:$VERSION
```

## Docker 配置

编辑 `/etc/docker/daemon.json` 文件

```json
{
    "data-root": "/var/lib/docker",
    "dns": ["114.114.114.114", "8.8.8.8"],
    "registry-mirrors": [
        "https://pull.loridocker.com",
        "https://docker.proxy.yangrucheng.top"
    ],
    "default-address-pools": [{
        "base": "172.17.0.0/16",
        "size": 24
    }],
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "10m",
        "max-file": "3"
    }
}
```

运行
```json
systemctl daemon-reload && systemctl restart docker
```