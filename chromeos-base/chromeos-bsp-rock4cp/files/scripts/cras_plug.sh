#!/bin/bash
#
# Script to plug device after cras service started
# usage ./cras_plug.sh $sound_type
# e.g. ./cras_plug.sh HDMI

retry_times=10

is_output_avaiable()
{
    # One line for header and one line for an avaible node
    cras_test_client  | grep 'Output Nodes' -b2 | grep -q 'Input Devices'

    if [ $? -eq 0 ]; then
        return 1
    else
        return 0
    fi
}

# cras needs sometime to scan output devices and nodes.
# sleep to wait for them.
wait_for_output_nodes()
{
    local ready=0 # 0 for not ready
    local count=0

    while [ $count -lt $retry_times ]; do
        sleep 1
        count=$((count+1))
        is_output_avaiable && return 0
    done

    return 1
}

device_node_number()
{
    cras_test_client | grep $1 | head -n 1 | sed  's/\t/ /g' |  tr -s ' ' | sed 's/ /\n/g' | grep :
}

plug_node()
{
    local node_id="$(device_node_number $1)"

    cras_test_client --plug "${node_id}:1"
}

unplug_node()
{
    local node_id="$(device_node_number $1)"

    cras_test_client --plug "${node_id}:0"
}

wait_for_output_nodes || exit 1
plug_node $1
