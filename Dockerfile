FROM nowk/alpine-bare:3.2
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV NODE_VERSION 4.1.0

RUN apk \
	--update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/main \
	--update add \
	nodejs=${NODE_VERSION}-r0 \
	&& rm -rf /var/cache/apk/*

# copy max_user_watches.sh for use in build.sh
COPY max_user_watches.sh /max_user_watches.sh

LABEL \
	version=$NODE_VERSION \
	os="linux" \
	arch="amd64"

