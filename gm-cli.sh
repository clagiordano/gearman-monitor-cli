#!/bin/bash

# TODO: Check gearadmin presence

declare -a SERVERS;
SERVERS_CONF="servers.conf";

INDEX=0;
while read SERVER
do
    #echo "DEBUG: SERVER: ${SERVER}";
    SERVERS[${INDEX}]=${SERVER};
    let "INDEX += 1";
done < "${SERVERS_CONF}"

function getStatus() {
    local SERVER=$1;
    
    local OUTPUT=`gearadmin -h ${SERVER} --status`
    
    echo -e "${OUTPUT}";
}

#while true
#do
clear;
    for SERVER in ${SERVERS[@]}
    do
        echo "Status for server: ${SERVER}";
        getStatus "${SERVER}"
        echo
    done;
#done;

#echo
#echo ${SERVERS[@]};
