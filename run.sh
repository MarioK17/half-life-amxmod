#!/bin/bash

$ip=hostname -I

./hlds_run -high -console -game valve -port 27015 +ip $ip +maxplayers 10 +sv_lan 0 +map crossfire