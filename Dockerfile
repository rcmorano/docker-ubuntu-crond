FROM ubuntu:20.04
ENV APT_ARGS="-y -o APT::Install-Suggests=false -o APT::Install-Recommends=false"
ARG BASE_PACKAGES="bash cron curl"
ENV BASE_PACKAGES ${BASE_PACKAGES}
ENV LOG_STREAM /tmp/stdall

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install ${APT_ARGS} ${BASE_PACKAGES}
COPY ./assets /assets
RUN chmod +x /assets/bin/crond-entrypoint
ENTRYPOINT ["/assets/bin/crond-entrypoint"]
