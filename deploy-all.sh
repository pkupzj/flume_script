#!/bin/bash

usage="Usage: deploy-all.sh  LOCAL_FILE_DIR FILE_NAME RELATIVE_DIR "

if [ $# != 3 ]; then
     echo $usage
     exit 1
fi


bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
. "$bin"/flume-env.sh


LOCAL_FILE_DIR=$1
FILE_NAME=$2
RELATIVE_DIR=$3


bin=`dirname "$0"`
bin=`cd "$bin"; pwd`


cat "$bin/$FLUME_AGENTS" | while read agent
do
	echo "$agent"
	HOST_IP=`echo $agent | awk '{print $1}'`
	FLUME_HOME=`echo $agent | awk '{print $3}'`
	"$bin"/flume-scp $HOST_IP $USER_NAME $FLUME_HOME $RELATIVE_DIR $LOCAL_FILE_DIR $FILE_NAME
done

cat "$bin/$FLUME_COLLECTORS" | while read agent
do
	HOST_IP=`echo $agent | awk '{print $1}'`
	FLUME_HOME=`echo $agent | awk '{print $3}'`
	"$bin"/flume-scp $HOST_IP $USER_NAME $FLUME_HOME $RELATIVE_DIR $LOCAL_FILE_DIR $FILE_NAME
done

