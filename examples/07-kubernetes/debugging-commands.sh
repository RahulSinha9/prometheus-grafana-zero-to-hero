#!/usr/bin/env bash
set -euo pipefail

kubectl get nodes -o wide
kubectl get pods -A -o wide
kubectl get svc -A
kubectl describe pod POD_NAME -n NAMESPACE
kubectl logs POD_NAME -n NAMESPACE --tail=100
kubectl get events -n NAMESPACE --sort-by=.lastTimestamp
kubectl top nodes
kubectl top pods -A
