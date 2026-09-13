# 06 — Kubernetes Monitoring

Learn how to monitor Kubernetes infrastructure and workloads with Prometheus, kube-state-metrics, and the kube-prometheus-stack.

## 🎯 Module Goal

By the end of this module, you should be able to explain the Kubernetes monitoring model, collect cluster and workload metrics, build useful dashboards, and create alerts for common Kubernetes failures.

## 📚 Learning Path

### kube-state-metrics

Understand the difference between resource-state metrics and infrastructure metrics.

kube-state-metrics exposes Kubernetes object state such as:

- Deployments
- Pods
- Nodes
- Jobs
- StatefulSets
- DaemonSets
- Resource requests and limits

It does not replace node-level monitoring.

### Node Monitoring

Combine Kubernetes node information with Node Exporter metrics to investigate:

- CPU pressure
- Memory pressure
- Disk pressure
- Filesystem capacity
- Network problems
- Node readiness

### Pod Monitoring

Monitor workload behavior such as:

- Pod restarts
- Container CPU
- Container memory
- OOM kills
- Readiness failures
- Pending pods
- Container states

Useful investigation dimensions include namespace, pod, container, workload, and cluster.

### kube-prometheus-stack

Learn the production-oriented Helm stack that commonly combines Prometheus Operator components, Prometheus, Alertmanager, Grafana, node-exporter, kube-state-metrics, and Kubernetes alerting rules.

Understand the role of:

- Prometheus Operator
- `Prometheus` custom resource
- `ServiceMonitor`
- `PodMonitor`
- Alertmanager
- Grafana
- Rule resources

### Kubernetes Alerts

Learn alerts for conditions such as:

- Node not ready
- High CPU usage
- High memory usage
- Disk pressure
- Pod crash loops
- Deployment replica mismatch
- Persistent volume capacity pressure
- Target scrape failures

## 🧪 Hands-On Labs

- Install kube-prometheus-stack in a test cluster.
- Inspect Prometheus targets.
- Create a `ServiceMonitor`.
- Create a `PodMonitor`.
- Query pod restart metrics.
- Investigate a deliberately failing workload.
- Build a namespace dashboard.
- Test a Kubernetes alert end to end.

## 🔍 Kubernetes Incident Workflow

```text
User impact
    │
    ▼
Application metrics
    │
    ├── Pod metrics
    ├── Workload state
    ├── Node metrics
    └── Cluster events
    │
    ▼
PromQL
    │
    ▼
Grafana / Alertmanager
    │
    ▼
Root-cause investigation
```

## 🧠 Key Questions

When a deployment is unhealthy, ask:

1. Are pods scheduled?
2. Are containers starting?
3. Are readiness probes passing?
4. Are containers restarting?
5. Is the node healthy?
6. Are resource requests and limits appropriate?
7. Is the service receiving traffic?
8. Are metrics being scraped?

## ✅ Completion Checklist

- [ ] Understand kube-state-metrics.
- [ ] Monitor Kubernetes nodes.
- [ ] Monitor pod and container behavior.
- [ ] Understand Prometheus Operator.
- [ ] Use ServiceMonitor and PodMonitor.
- [ ] Install kube-prometheus-stack.
- [ ] Query Kubernetes metrics with PromQL.
- [ ] Create Kubernetes alerts.

## 🚀 Next Step

Continue to [`07-real-world-labs`](../07-real-world-labs/) and practice incident investigation with deliberately broken systems.