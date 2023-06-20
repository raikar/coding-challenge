#!/bin/bash
JSON_DEMO_DIR='~/json_server_demo'
REVERSE_DIR='~/reverse-mgs'
kubectl create configmap json-server-test-config --from-file="$JSON_DEMO_DIR/db.json"
kubectl apply -f "$JSON_DEMO_DIR/deployment.yaml"
kubectl apply -f "$REVERSE_DIR/deployment.yaml"
kubectl expose deployment json-server-test --type=LoadBalancer --port=80 --target-port=80
kubectl expose deployment reversed-msg --type=LoadBalancer --port=8083 --target-port=8083
