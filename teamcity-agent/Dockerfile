FROM jetbrains/teamcity-minimal-agent:latest

MAINTAINER Eyüp Gürel <eyupgurel@gmail.com>

LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

RUN apt-get update && \
    apt-get install -y software-properties-common && add-apt-repository ppa:openjdk-r/ppa && apt-get update && \
    apt-get install -y git mercurial openjdk-8-jdk apt-transport-https ca-certificates && \
    \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 9DC858229FC7DD38854AE2D88D81803C0EBFCD88 && \
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list && \
    \
    curl -fsSL get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    systemctl enable docker && \
    \
    apt-get install -y --no-install-recommends \
            libc6 \
            libcurl3 \
            libgcc1 \
            libgssapi-krb5-2 \
            libicu55 \
            liblttng-ust0 \
            libssl1.0.0 \
            libstdc++6 \
            libunwind8 \
            libuuid1 \
            zlib1g \
        && rm -rf /var/lib/apt/lists/* && \
    \
    apt-get clean all && \
    \
    usermod -aG docker buildagent

COPY run-docker.sh /services/run-docker.sh