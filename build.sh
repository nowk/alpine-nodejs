#!/bin/sh
set -e

name=nowk/alpine-nodejs:4.1.0

# remove .cid, incase there is a lingering one
if [ -f .cid ] ; then
	rm .cid
fi

docker build --rm -t $name .
docker run --privileged=true --cidfile .cid $name /max_user_watches.sh

cid=`cat .cid` # save cid to var
rm .cid        # remove .cid

docker commit -m "Update max_user_watches" -a "Yung Hwa Kwon" $cid $name
