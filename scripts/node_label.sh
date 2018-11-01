#!/usr/bin/env bash

export GUID=`hostname|awk -F. '{print $2}'`

echo " Login As cluster Admin"
oc login -u system:admin > /dev/null

echo "Labeling for client alpha"
oc label node node1.$GUID.internal client=alpha

echo "Labeling for client beta"
oc label node node2.$GUID.internal client=beta

echo "Labeling for client common"
oc label node node3.$GUID.internal client=common
