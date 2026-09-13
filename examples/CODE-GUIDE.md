# Hands-on Code Guide

The `examples/` directory is the executable companion to the lessons.

## Prometheus YAML

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ["localhost:9090"]
```

Prometheus configuration uses YAML. `global` provides defaults and `scrape_configs` defines scrape jobs. citeturn0search2turn0search3

## Docker Compose

```bash
cd examples/01-prometheus
docker compose up -d
docker compose ps
curl http://localhost:9090/-/ready
```

## PromQL syntax

```promql
up
up{job="node-exporter"}
sum by (job) (up)
rate(http_requests_total[5m])
increase(http_requests_total[1h])
```

PromQL supports instant and range queries, label matchers, functions and aggregation. citeturn0search1turn0search10

### Matchers

```promql
http_requests_total{job="api"}
http_requests_total{job!="api"}
http_requests_total{job=~"api|web"}
http_requests_total{status!~"5.."}
```

### Aggregation

```promql
sum(rate(http_requests_total[5m]))
sum by (status) (rate(http_requests_total[5m]))
max by (instance) (process_resident_memory_bytes)
```

### Histograms

```promql
histogram_quantile(
  0.95,
  sum by (le) (
    rate(http_request_duration_seconds_bucket[5m])
  )
)
```

## Alerting YAML

```yaml
- alert: InstanceDown
  expr: up == 0
  for: 5m
  labels:
    severity: critical
  annotations:
    summary: "Instance {{ $labels.instance }} is down"
```

Prometheus alert annotations and labels can use templates. citeturn0search0

## Alertmanager routing

```yaml
route:
  receiver: default
  group_by: [alertname, job]
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 4h

receivers:
  - name: default
```

## Recording rules

```yaml
- record: instance:node_cpu_utilisation:rate5m
  expr: |
    1 - avg by (instance) (
      rate(node_cpu_seconds_total{mode="idle"}[5m])
    )
```

## Grafana provisioning

```yaml
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://prometheus:9090
    isDefault: true
```

## Linux commands

```bash
free -h
df -h
uptime
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
```

## Kubernetes commands

```bash
kubectl get nodes -o wide
kubectl get pods -A -o wide
kubectl describe pod POD_NAME -n NAMESPACE
kubectl logs POD_NAME -n NAMESPACE --tail=100
kubectl get events -n NAMESPACE --sort-by=.lastTimestamp
kubectl top nodes
kubectl top pods -A
```

## Learning method

For every syntax example: run it, change one value, observe the result, intentionally break it, diagnose the error, and fix it. This is the expected workflow throughout the repository.

## Files

- `01-prometheus/` — Prometheus config and Docker lab
- `02-promql/` — PromQL expressions
- `03-alerting/` — alert rules and Alertmanager
- `04-recording-rules/` — reusable recording rules
- `05-grafana/` — datasource provisioning
- `06-linux-monitoring/` — Linux investigation script
- `07-kubernetes/` — Kubernetes manifests and troubleshooting commands
