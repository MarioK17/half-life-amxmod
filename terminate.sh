#!/bin/bash

run_pid=$(ps -ef | grep run.sh | awk '/bash/{print $2}')

hlds_pids=$(ps -ef | grep hlds | awk '!/color/{ print $2}')

echo $run_pid
echo $hlds_pids

kill $run_pid $hlds_pids
