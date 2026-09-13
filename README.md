# 🚀 Prometheus + Grafana Zero to Hero

A hands-on learning repository for mastering **Prometheus, PromQL, Grafana, Alertmanager, exporters, and Kubernetes observability** from fundamentals to production-style monitoring.

> Learn by building, breaking, troubleshooting, and improving real monitoring scenarios.

## 🎯 Goal

Move from understanding basic metrics to being able to design and operate a practical Prometheus + Grafana monitoring stack.

```text
Metrics → Prometheus → PromQL → Grafana → Alerts → Kubernetes → Real Incidents
```

## 🗺️ Learning Path

| Stage | Topic | Outcome |
|---|---|---|
| 00 | Observability Foundations | Understand metrics, labels, cardinality and the monitoring model |
| 01 | Prometheus Fundamentals | Run Prometheus and configure scrape targets |
| 02 | PromQL | Query, aggregate and analyze time-series data |
| 03 | Exporters | Monitor Linux and application infrastructure |
| 04 | Grafana | Build useful dashboards and variables |
| 05 | Alerting | Create rules and route alerts with Alertmanager |
| 06 | Kubernetes Monitoring | Monitor nodes, workloads and cluster resources |
| 07 | Troubleshooting Labs | Diagnose realistic monitoring failures |
| 08 | Production Patterns | Apply recording rules, SLO-style thinking and operational practices |

## 📚 Repository Structure

```text
00-foundations/
01-prometheus/
02-promql/
03-exporters/
04-grafana/
05-alerting/
06-kubernetes/
07-troubleshooting-labs/
08-production-patterns/
examples/
assets/
```

## 🧪 Hands-on Labs

The labs will progressively cover:

- Prometheus installation and configuration
- Static and service-discovered targets
- Node Exporter infrastructure metrics
- PromQL filtering and aggregation
- `rate()` / `increase()` based analysis
- Histogram and latency queries
- Grafana dashboard design
- Dashboard variables and reusable panels
- Prometheus alert rules
- Alertmanager routing and silences
- Kubernetes workload monitoring
- High CPU and memory investigations
- Disk pressure and service-down scenarios
- Pod CrashLoopBackOff observability
- Recording rules and practical performance considerations

## 🧰 Tooling

- Prometheus
- Grafana
- Alertmanager
- Node Exporter
- kube-state-metrics
- Docker Compose
- Kubernetes
- Helm
- PromQL

## 🏁 Quick Start

The first lab will use Docker Compose so the learning environment is reproducible locally.

```bash
mkdir prometheus-grafana-lab
cd prometheus-grafana-lab
```

Project-specific setup instructions are added inside each learning stage.

## 🧠 Learning Method

Each topic follows the same pattern:

1. **Learn** — concise concept notes
2. **Build** — working configuration or code
3. **Query** — investigate metrics with PromQL
4. **Visualize** — turn signals into Grafana dashboards
5. **Break** — introduce a realistic failure
6. **Troubleshoot** — identify the cause from metrics and alerts

## 📈 Progress Tracker

- [ ] Observability fundamentals
- [ ] Prometheus installation
- [ ] Scrape configuration
- [ ] PromQL fundamentals
- [ ] Exporters
- [ ] Grafana dashboards
- [ ] Alert rules
- [ ] Alertmanager
- [ ] Kubernetes monitoring
- [ ] Incident troubleshooting labs
- [ ] Production monitoring project

## 🔗 Official Learning Resources

- Prometheus documentation: https://prometheus.io/docs/
- PromQL documentation: https://prometheus.io/docs/prometheus/latest/querying/basics/
- Grafana documentation: https://grafana.com/docs/
- Alertmanager documentation: https://prometheus.io/docs/alerting/latest/alertmanager/

## ⭐ Portfolio Project

The final project will combine Prometheus, Grafana, exporters, alerting and Kubernetes into a complete observability lab with documented incidents and troubleshooting runbooks.

---

**Status:** 🚧 Actively building