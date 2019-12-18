FROM eyupgurel/teamcity-minimal-agent:2019.2
MAINTAINER Eyüp Gürel <eyupgurel@gmail.com>

# nodejs version
ENV NODE_VERSION="13.x"

# Set locale
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

ENV DEBIAN_FRONTEND="noninteractive" \
    TERM=dumb \
    DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp

# Installing packages
RUN apt-get update -qq > /dev/null && \
    apt-get install -qq locales > /dev/null && \
    locale-gen "${LANG}" > /dev/null && \
    apt-get install -qq --no-install-recommends \
        build-essential \
        autoconf \
        curl \
        git \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
        lib32ncurses5 \
        lib32gcc1 \
        libc6-dev \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libxslt-dev \
        libxml2-dev \
        m4 \
        ncurses-dev \
        mc \
        ocaml \
        gradle \
        openjdk-8-jdk \
        openssh-client \
        pkg-config \
        software-properties-common \
        vim \
        unzip \
        wget \
        zip \
        zlib1g-dev > /dev/null && \
    echo "installing nodejs, npm" && \
    curl -sL -k https://deb.nodesource.com/setup_${NODE_VERSION} \
        | bash - > /dev/null && \
    apt-get install -qq nodejs > /dev/null && \
    apt-get clean > /dev/null && \
    rm -rf /var/lib/apt/lists/ && \
    npm install --quiet -g npm > /dev/null && \
    npm cache clean --force > /dev/null && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

# Installing packages
RUN apt-get update
RUN apt-get -y upgrade

# Install ping utils
RUN apt-get install -y iputils-ping

# in order to run a mysql container inside this container we need to
# 1) makedir for the mysqld volume
ENV MYSQL_VOLUME_DIR="/opt/volume/mysql/test/"
RUN mkdir -p "${MYSQL_VOLUME_DIR}"
# you should replace below line with your own empty test db schema
COPY schema/FantasyLeague-Schema-2018.02.08.sql "${MYSQL_VOLUME_DIR}/"
