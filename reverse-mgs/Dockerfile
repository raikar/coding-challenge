FROM alpine:latest

RUN apk add --no-cache --update --verbose grep bash nmap-ncat && \
    rm -rf /var/cache/apk/* /tmp/* /sbin/halt /sbin/poweroff /sbin/reboot

CMD /usr/bin/ncat --sh-exec "ncat 172.18.0.21 80 |rev" -l 8083 --keep-open
