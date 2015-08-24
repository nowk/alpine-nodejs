FROM nowk/alpine-bare:3.2
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV NODE_VERSION 0.12.2

RUN apk --update add \
	nodejs=${NODE_VERSION}-r0 \
	&& rm -rf /var/cache/apk/*

ENTRYPOINT [ "/bin/sh" ]


LABEL \
	version=$NODE_VERSION \
	os="linux" \
	arch="amd64"

