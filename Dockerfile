FROM ubuntu:20.04
ENV APT_ARGS="-y -o APT::Install-Suggests=false -o APT::Install-Recommends=false"
ARG BASE_PACKAGES="bash cron"
ENV BASE_PACKAGES ${BASE_PACKAGES}

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install ${APT_ARGS} ${BASE_PACKAGES}
COPY ./assets/bin/crond-entrypoint /assets/bin/crond-entrypoint
RUN chmod +x /assets/bin/crond-entrypoint
ENTRYPOINT ["/assets/bin/crond-entrypoint"]
