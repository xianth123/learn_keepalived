# 基于 Keepalived 的高可用方案，Docker compose 演示
---
## 使用方式
```shell
docker-compose up -d
```
会启动 3 个 docker 容器
* nginx_master nginx 主机服务
* nginx_slave nginx 备份服务
* proxy 端口映射服务

访问 127.0.0.1:8000 端口，会返回 master 页面，此时由 nginx_master 对外提供服务。
关闭 nginx_master, 继续访问 127.0.0.1:8000 端口，会返回 slave 页面，此时由 nginx_slave 对外提供服务。
## 文件目录
- docker-compose.yml    docker compose 主文件
- Dockerfile            nginx dockerfile
- entrypoint.sh         nginx docker 上启动 keepalived 和 nginx 的脚本
- haproxy.cfg           proxy 端口映射服务使用的配置文件
- index-master.html     master nginx 80端口返回的静态文件
- index-slave.html      slave nginx 80端口返回的静态文件
- keepalived-master.conf  master nginx 配置的 keepalived 文件
- keepalived-slave.conf   slave nginx 配置的 keepalived 文件
## 已知问题
由于 nginx docker 中的 systemclt 服务有缺失，docker 多次重启之后可能会导致 keepalived 启动失败，仅用于学习，不可用于生产环境。