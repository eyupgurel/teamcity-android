FROM eyupgurel/teamcity-agent:2017.2.2

MAINTAINER Eyüp Gürel <eyupgurel@gmail.com>

ENV ANDROID_HOME="/opt/Android/Sdk" \
    ANDROID_NDK="/opt/Android/Ndk" \
    JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/" \
    GRADLE_HOME="/usr/bin/gradle"

ENV ANDROID_SDK_ROOT=${ANDROID_HOME}
ENV ANDROID_AVD_HOME="${ANDROID_HOME}/.android/avd"

# Get the latest version from https://developer.android.com/studio/index.html
ENV ANDROID_SDK_TOOLS_VERSION="3859397"

# Get the latest version from https://developer.android.com/ndk/downloads/index.html
ENV ANDROID_NDK_VERSION="16b"

# nodejs version
ENV NODE_VERSION="9.x"

# Set locale
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

ENV DEBIAN_FRONTEND="noninteractive" \
    TERM=dumb \
    DEBIAN_FRONTEND=noninteractive

# Variables must be references after they are created
ENV ANDROID_SDK_HOME="${ANDROID_HOME}"
ENV ANDROID_NDK_HOME="${ANDROID_NDK}/android-ndk-r${ANDROID_NDK_VERSION}"

ENV PATH="${PATH}:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/platform-tools:${ANDROID_NDK}"

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
        python-software-properties \
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

# Install Android SDK
RUN mkdir --parents "${ANDROID_HOME}/.android/" && \
    echo '### User Sources for Android SDK Manager' > \
          "${ANDROID_HOME}/.android/repositories.cfg" && \
    echo "installing sdk tools" && \
    wget --quiet --output-document=sdk-tools.zip \
        "https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip" && \
    mkdir --parents "${ANDROID_HOME}" && \
    unzip -q sdk-tools.zip -d "${ANDROID_HOME}" && \
    rm --force sdk-tools.zip

RUN echo "installing ndk" && \
    wget --quiet --output-document=android-ndk.zip \
    "http://dl.google.com/android/repository/android-ndk-r${ANDROID_NDK_VERSION}-linux-x86_64.zip" && \
    mkdir --parents "${ANDROID_NDK_HOME}" && \
    unzip -q android-ndk.zip -d "${ANDROID_NDK}" && \
    rm --force android-ndk.zip

#RUN echo "installing ndk bundle " && \
#    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
#    "ndk-bundle"

# Install SDKs
# Please keep these in descending order!
# The `yes` is for accepting all non-standard tool licenses.


RUN echo "installing sdk tools " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "tools"

RUN yes | "${ANDROID_HOME}"/tools/bin/sdkmanager --licenses > /dev/null && \
    echo "installing platforms" && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "platforms;android-27" \
        "platforms;android-26"

RUN echo "installing platform tools " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "platform-tools"


RUN echo "installing build tools " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "build-tools;27.0.3" \
        "build-tools;26.0.3" "build-tools;26.0.2" "build-tools;26.0.1"

RUN echo "installing cmake " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "cmake;3.6.4111459"

RUN echo "installing extras " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "extras;android;m2repository" \
        "extras;google;m2repository" \
        "extras;android;gapid;3" \
        "extras;google;auto" \
        "extras;google;instantapps" \
        "extras;google;market_apk_expansion" \
        "extras;google;market_licensing" \
        "extras;google;simulators" \
        "extras;google;webdriver"

RUN echo "installing play services " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "extras;google;google_play_services"

RUN echo "installing constraints " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
        "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2"

RUN echo "installing lldb " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "lldb;3.0"

RUN echo "patcher " && \
    yes | "${ANDROID_HOME}"/tools/bin/sdkmanager \
        "patcher;v4"

# Installing packages
RUN apt-get update
RUN apt-get -y upgrade


# Copy sdk license agreement files.
RUN mkdir -p "${ANDROID_HOME}/licenses"
COPY sdk/licenses/* "${ANDROID_HOME}/licenses/"

# Install ping utils
RUN apt-get install -y iputils-ping

# in order to run a mysql container inside this container we need to
# 1) makedir for the mysqld volume
ENV MYSQL_VOLUME_DIR="/opt/volume/mysql/"
RUN mkdir -p "${MYSQL_VOLUME_DIR}"
COPY schema/FantasyLeague-Schema-2018.02.08.sql "${MYSQL_VOLUME_DIR}/"
