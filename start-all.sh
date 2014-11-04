#!/usr/bin/env bash



bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

"$bin"/start-agents.sh
"$bin"/start-collectors.sh



