#!/usr/bin/env bash


bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
. "$bin"/flume-env.sh

ACTION="start"

cat "$bin/$FLUME_AGENTS" | while read agent
do 
	HOST_IP=`echo $agent | awk '{print $1}'`
	NODE_NAME=`echo $agent | awk '{print $2}'`
	FLUME_HOME=`echo $agent | awk '{print $3}'`
	echo "$ACTION  $agent ..."
	"$bin"/flume $HOST_IP $NODE_NAME $FLUME_HOME $ACTION
done
