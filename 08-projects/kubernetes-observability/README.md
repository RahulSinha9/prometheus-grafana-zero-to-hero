# Project — Kubernetes Observability

## 🎯 Objective
Build cluster observability that allows an engineer to move from a high-level symptom to the exact namespace, workload, pod, and container responsible.

## Architecture

```text
Kubernetes
 ├─ Nodes → Node Exporter
 ├─ Objects → kube-state-metrics
 ├─ Workloads → application metrics
 └──────────────→ Prometheus Operator
                       ├→ Grafana
                       └→ Alertmanager
```

## Required dashboards
- Cluster overview.
- Node health.
- Namespace resource usage.
- Pod restarts.
- Deployment replica health.
- Workload CPU/memory.
- Scrape targets.

## Required alerts
Include node-not-ready, crash loops, high resource usage, replica mismatch, and scrape failures.

## Failure simulations
At minimum simulate:
1. CrashLoopBackOff.
2. High resource usage.
3. Deployment replica mismatch.

## Investigation standard
For every incident record alert → namespace → workload → pod → container → events/logs/metrics → root cause → fix → verification.

## Acceptance criteria
- [ ] Stack is reproducible.
- [ ] Dashboards are version-controlled.
- [ ] Alerts are routed.
- [ ] Three incidents are documented.
- [ ] Root causes are proven with telemetry.
