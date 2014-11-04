#!/usr/bin/env bash


bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
. "$bin"/flume-env.sh

ACTION="start"

cat "$bin/$FLUME_AGENTS" | while read agent
do 
	HOST_IP=`echo $agent | awk '{print $1}'`
	"$bin"/flume-back $HOST_IP
done
