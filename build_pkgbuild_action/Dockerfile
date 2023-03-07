FROM archlinux:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN date

COPY entrypoint.sh /entrypoint.sh
COPY makepkg.conf.tmpl /etc/makepkg.conf
RUN chmod 777 /entrypoint.sh

USER root

ENTRYPOINT ["/entrypoint.sh"]