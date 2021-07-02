#!/bin/sh

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 -d > /tmp/config
export KUBECONFIG=/tmp/config

results="$(kubectl $*)"

status=$?
echo ::set-output name=results:$results
echo "$results"
if [[ $status -eq 0 ]]; then exit 0; else exit 1; fi


