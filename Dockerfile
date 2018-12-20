FROM openjdk:10
MAINTAINER rinalli <67344216@qq.com>


# upgrade the container
RUN apt-get update && \
    apt-get upgrade -y

RUN mkdir /app
RUN apt-get install -y wget apt-utils vim


RUN apt-get install -y supervisor && \
    mkdir -p /var/log/supervisor
COPY start.conf /etc/supervisor/conf.d/start.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
# expose ports
EXPOSE 9900

# set container entrypoints
VOLUME ["/app"]
VOLUME ["/var/log/supervisor"]
VOLUME ["/etc/supervisor/conf.d"]

ENTRYPOINT ["/bin/bash","-c"]

CMD ["/usr/bin/supervisord -c /etc/supervisor/supervisord.conf"]

