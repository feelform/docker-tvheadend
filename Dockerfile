# package version
ARG BASE_IMAGE_TAG
FROM wiserain/tvhbase:$BASE_IMAGE_TAG
MAINTAINER wiserain

# default variables
ENV EPG2XML_VER="latest"
ENV TZ="Asia/Seoul"

# copy local files
COPY root/ /

# set permissions on tv_grab_files
RUN chmod 555 /usr/bin/tv_grab_kr_*

# install dependencies for epg2xml
RUN apk add --no-cache php7 php7-json php7-dom php7-mbstring php7-openssl php7-curl

# ports and volumes
EXPOSE 9981 9982
VOLUME /config /recordings /epg2xml
WORKDIR /epg2xml
