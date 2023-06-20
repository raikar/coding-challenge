reverse-mgs
================

* locally using docker
* remotely using kubernetes - kind + metallb

Deploying locally
-----------------
```bash
docker run -i -t --network=host raikar/reverse-mgs 
```

Deploying to Kubernetes
-----------------------
```bash
kubectl create -f deployment.yaml
kubectl expose deployment reversed-msg --type=LoadBalancer --port=8083 --target-port=8083
echo -e "GET /posts HTTP/1.1\nHost: 10.1.1.2\nConnection: close\n\n\n\n" | nc 172.18.0.22 8083
```
