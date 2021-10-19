#!/bin/bash

serviceip=`kubectl get svc/node-port-service -o jsonpath='{.spec.clusterIP}'`

msg=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 2000 | head -n 1)

cmd="curl -s \"http://127.0.0.1:9080/dial?host=$serviceip&port=90&protocol=udp&request=echo%20hi\""

echo "kubectl exec -it testpod-client -- curl -s \"http://127.0.0.1:9080/dial?host=$serviceip&port=90&protocol=udp&request=echo%20hi\""
kubectl exec -it testpod-client -- bash -c "$cmd"
echo "\n"

cmd="curl -s \"http://127.0.0.1:9080/dial?host=$serviceip&port=90&protocol=udp&request=echo%20$msg\""

echo "kubectl exec -it testpod-client -- curl -s \"http://127.0.0.1:9080/dial?host=$serviceip&port=90&protocol=udp&request=echo%20$msg\""
kubectl exec -it testpod-client -- bash -c "$cmd"
echo "\n"
