#!/bin/sh
set -e

from=nowk/alpine-nodejs:0.12.2

# remove .cid, incase there is a lingering one
if [ -f .cid ] ; then
	rm .cid
fi

docker build --rm -t $from .
docker run --privileged=true --cidfile .cid $from /max_user_watches.sh

cid=`cat .cid` # save cid to var
rm .cid        # remove .cid

docker commit -m "Update max_user_watches" -a "Yung Hwa Kwon" $cid $from
