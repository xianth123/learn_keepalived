FROM nginx:1.13.5-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tencent.com/g' /etc/apk/repositories \
        && apk add --no-cache bash curl ipvsadm iproute2 openrc keepalived \
        && rm -f /var/chche/apk/* /tmp/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]