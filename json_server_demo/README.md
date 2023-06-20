json_server_test
================
json_server_test with a db.json file
* locally using docker
* remotely using kubernetes - kind

Deploying locally 
-----------------

```bash
> docker build -t raikar/json_server_test:v1 .
> docker run -d -p 80:80 raikar/json_server_test:v1
> curl http://localhost | jq
```

Deploying to Kubernetes
-----------------------

```bash
> kubectl create configmap json-server-test-config --from-file=db.json
> kubectl create -f deployment.yaml
> kubectl expose deployment json-server-test --type=LoadBalancer --port=80 --target-port=80
> curl 172.18.0.21/posts | jq
```
