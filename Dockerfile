FROM ubuntu:20.04

RUN apt update \
  && DEBIAN_FRONTEND=noninteractive \
    apt install -y --no-install-recommends \
    squid ca-certificates \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*
RUN useradd squid
RUN install -d -o squid -g squid \
  /var/log/squid \
  /var/cache/squid \
  /var/run/squid
RUN : \
  && echo 'pid_filename /var/run/squid/${service_name}.pid' >> /etc/squid/squid.conf \
  && echo 'logfile_rotate 0' >> /etc/squid/squid.conf \
  && echo 'access_log stdio:/dev/stdout' >> /etc/squid/squid.conf \
  && echo 'cache_log stdio:/dev/stderr' >> /etc/squid/squid.conf \
  ;

USER squid
EXPOSE 3128
CMD ["/usr/sbin/squid", "-NYC"]
