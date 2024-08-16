FROM docker.twtools.io/docker_io/library/ruby:2.7-slim

ARG CH_version=19.3.4

RUN apt-get update -y && \
    apt-get install -y \
        wget htop lbzip2 bzip2 git zip unzip curl nano tmux gnupg2 build-essential \
        libxml2-dev libxslt-dev liblzma-dev zlib1g-dev patch libpq5  \
        locales tzdata ca-certificates lsb-release traceroute iputils-ping dnsutils && \
    echo "deb http://repo.yandex.ru/clickhouse/deb/stable/ main/" > /etc/apt/sources.list.d/clickhouse.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4 && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update -y && \
    apt-get install -y \
        postgresql-client-12 \
        mariadb-client \
        clickhouse-client=$CH_version \
        clickhouse-common-static=$CH_version \
        docker-ce-cli \
    && rm -rf /var/lib/apt/lists/* /var/cache/debconf && apt-get clean


ENTRYPOINT tail -f /dev/null