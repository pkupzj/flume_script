#!/usr/bin/env bash

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

"$bin"/stop-agents.sh
"$bin"/stop-collectors.sh



