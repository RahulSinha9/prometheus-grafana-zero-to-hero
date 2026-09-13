# kube-prometheus-stack

## 🎯 Goal
Deploy an integrated Kubernetes monitoring stack and understand what each component contributes.

## Components
The chart commonly packages Prometheus Operator resources, Prometheus, Alertmanager, Grafana, exporters, Kubernetes object metrics, dashboards, and alert rules.

## Installation

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack
```

For repeatable environments, keep a values file in Git.

## Configuration areas
Study Prometheus resources, ServiceMonitors/PodMonitors, Grafana provisioning, Alertmanager configuration, resource requests, persistence, and rule customization.

## 🧪 Lab
1. Install the stack.
2. Verify pods and services.
3. Open Grafana.
4. Verify Prometheus targets.
5. Inspect built-in dashboards.
6. Add a small custom alert.

## Troubleshooting
Helm values → rendered manifests → operator resources → Prometheus targets → rules → Grafana datasource.

## Production considerations
Plan persistence, resource sizing, retention, security, upgrades, CRD lifecycle, alert ownership, and backup/recovery.

## ✅ Completion
- [ ] Install chart.
- [ ] Understand major components.
- [ ] Verify ServiceMonitors/PodMonitors.
- [ ] Customize values.
- [ ] Add a custom rule.