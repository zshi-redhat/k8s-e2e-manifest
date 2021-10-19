k8s e2e: should function for service endpoints using hostNetwork
================================================================

# handle large requests: udp(hostNetwork)

Dial udp to clusterIP backed by hostnetwork pod.

1. Create test service and pods:

client pod:
```
$ kubectl create -f client-pod.yaml
```

Note: change nodeSelector according to test env.

server pod:
```
$ kubectl create -f server-pod.yaml
```

Note: change nodeSelector according to test env, server and client pods shall be on different nodes.

node port service:
```
$ kubectl create -f service.yaml
```

2. Run test:

Two tests are executed in test.sh:
- dial small udp packet (serveral bytes) from client pod to service backed by server pod (hostnetwork)
- dial large udp packet (2000 bytes) from client pod to service backed by server pod (hostnetwork)

```
$ ./test.sh
```
